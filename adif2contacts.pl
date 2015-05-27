#!/usr/bin/perl

sub fdate {
	my $date=shift; 
	return substr($date, 0, 4)."-".substr($date, 4, 2)."-".substr($date, 6);
}

sub ftime {
	my $date=shift; 
	return substr($date, 0, 2).":".substr($date, 2, 2);
}

sub get_field {
	my $data=shift; 
	my $name=shift;
	
	while (1) {
		# find next offset
		while(substr($data,0,1)ne"<") { 
			$data=substr($data, 1); 
			if ( $data !~ /\</ ) { return ""; }
		}
		$data=substr($data, 1);
		my $tname=substr($data, 0, index($data, ":"));
		$data=substr($data, index($data, ":")+1);
		my $tsize=substr($data, 0, index($data, ">"));
		$data=substr($data, index($data, ">")+1);
		
		#print "$tname $tsize \n "; 

		#if ( $tsize =~ /^\d+$/ ) { die "Size not numeric $tsize\n"; }
		$tname=uc($tname); 
		#print "$tname\n";
	
		if ( $tname eq $name ) { 
			return substr($data, 0, $tsize); 
		}else{
			$data=substr($data, $tsize);
		}
	}
	
}

my $buffer; 
while(<STDIN>){
	chomp;
	$buffer.=$_;
}

$buffer =~ s/(?i).*?\<eoh\>//g;
my @records=split(/\<(?i)eor\>/, $buffer);

foreach my $rec (@records) {
	my $qsl_sent=get_field($rec, "QSL_SENT");
	if ($qsl_sent) { 
    if ($qsl_sent !~ /(?i)^(Q)$/) { next; } 
	}
	my $call=get_field($rec, "CALL"); 
	if ( ! $call ) { next; } # this check is for empty records
	print '\qslcard['.$call.']';
	print '{'.get_field($rec, "QSL_VIA").'}';
	print '{'.fdate(get_field($rec, "QSO_DATE")).'}';
	print '{'.ftime(get_field($rec, "TIME_ON")).'}';
	my $band=get_field($rec, "BAND");
	if ( ! $band ) { $band=get_field($rec, "FREQ"); }
	print '{'.$band.'}';
	print '{'.get_field($rec, "MODE").'}';
	my $rst=get_field($rec, "RST_SENT");
	#if ( ! $rst ) { $rst=get_field($rec, "RST_RCVD"); }
	print '{'.$rst.'}';
	print "\n"; 
}
