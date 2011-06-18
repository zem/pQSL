#!/bin/bash
if [ -n "$1" ] 
then 
	./adif2contacts.pl < $1 > ./contacts.tex
fi
xelatex qsl-back.tex &&
xelatex qsl-front.tex &&
xelatex printA4-front.tex &&
xelatex printA4-back.tex &&
rm *.aux *.log
