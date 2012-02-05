\ProvidesClass{pqsl}
\LoadClassWithOptions{article}

\pagestyle{empty}
\usepackage{graphicx}
\usepackage{amsmath}
%\usepackage{fontspec}
\usepackage[papersize={14.8cm,10.5cm}, margin=0.0cm, marginratio=1:1]{geometry}

\setlength{\parindent}{0cm}

\newcommand\MYPIC[1]{\newcommand{\@MYPIC}{#1}}
\newcommand\MYHAMORGPIC[1]{\newcommand{\@MYHAMORGPIC}{#1}}
\newcommand\MYHAMORGNAME[1]{\newcommand{\@MYHAMORGNAME}{#1}}
\newcommand\MYCALL[1]{\newcommand{\@MYCALL}{#1}}
\newcommand\MYNAME[1]{\newcommand{\@MYNAME}{#1}}
\newcommand\MYQTH[1]{\newcommand{\@MYQTH}{#1}}
\newcommand\MYMAIDEN[1]{\newcommand{\@MYMAIDEN}{#1}}


\newcommand{\@CALL}{}
\newcommand{\@VIA}{}
\newcommand{\@DATE}{}
\newcommand{\@TIME}{}
\newcommand{\@BAND}{}
\newcommand{\@MODE}{}
\newcommand{\@RST}{}

\newcommand{\@qslcardback}[7][]{
	\newpage
	\renewcommand{\@CALL}{#1}
	\renewcommand{\@VIA}{#2}
	\renewcommand{\@DATE}{#3}
	\renewcommand{\@TIME}{#4}
	\renewcommand{\@BAND}{#5}
	\renewcommand{\@MODE}{#6}
	\renewcommand{\@RST}{#7}

	%%%BEGIN left upper Minipage with MYCALL and locator
	\begin{minipage}{5.2cm}
	
	{\Huge \textbf{\@MYCALL}}

	\smallskip
	\@MYNAME \\
	\@MYQTH \\
	\@MYMAIDEN
	\end{minipage}
	%%%END left upper Minipage with MYCALL and locator
	%%% BEGIN Centered upper Minipage with hamorgpic
	\begin{minipage}{2cm}
	\centering \includegraphics[width=0.75cm]{\@MYHAMORGPIC}

	\footnotesize \@MYHAMORGNAME
	\end{minipage}
	%%% END centered upper Minipage with hamorgpic
	\hfill
	%%%BEGIN Right upper Minipage with QSO and Via Fields 
	\begin{minipage}{5.5cm} % very ugly hack with \vphantom ;)
	\framebox[5.5cm][l]{\scriptsize QSO WITH: \vphantom{$\rule[-1mm]{0mm}{6mm}$} \bf \Large{\@CALL}}
	\smallskip
	\framebox[5.5cm][l]{\scriptsize VIA:\hspace{10mm} \vphantom{$\rule[-1mm]{0mm}{6mm}$} \bf \Large{\@VIA}}
	\end{minipage}
	%%%END Right upper Minipage with QSO and Via Fields 

	\vspace{1.5cm}

	I am pleased to confirm the following QSO:
	\topsep3pt
	\begin{center}
	\begin{tabular}{|c|c|c|c|c|c|}
	\hline
	\bf\quad Date (Y-M-D) \quad & \bf\ Time (UTC)\ &\bf\quad Band\quad&\bf\ Mode\ &\bf\ RST\bf\ \\
	\hline
	\hline
	\vphantom{$\dfrac b b$}\bf \@DATE & \bf \@TIME & \bf \@BAND & \bf \@MODE & \bf \@RST \\
	\hline
	\end{tabular}

	\smallskip

	\end{center}

	\vspace{1cm}

	vy 73 de \makebox[3.5cm]{\dotfill}
}



\newcommand{\@qslcardfront}[7][]{
	\newpage
	%That Hack with the Paperwith .799 is important to get an 
	% exact number of pics, the front needs to be smaller than 
	% the paper
	\includegraphics[width=14.799cm,height=10.5cm]{\@MYPIC}
}


\newcommand\qslcard\@qslcardfront

\DeclareOption{front}{
	\renewcommand\qslcard\@qslcardfront
}
\DeclareOption{back}{
	\geometry{margin=0.5cm}
	\renewcommand\qslcard\@qslcardback
}
\ProcessOptions
