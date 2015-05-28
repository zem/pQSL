#!/bin/bash
if [ -n "$1" ] 
then
  cp $1/config.tex config.tex
  if [ -n "$2" ] 
  then 
	  ./adif2contacts.pl < $2 > ./contacts.tex
    export TEXINPUTS=.:./Layout//:
    xelatex Layout/A4_4cards/qsl.tex &&
    xelatex Layout/A4_4cards/qsl-back.tex &&
    xelatex Layout/A4_4cards/qsl-front.tex &&
    xelatex Layout/A4_4cards/printA4-front.tex &&
    xelatex Layout/A4_4cards/printA4-back.tex &&
    rm *.aux *.log contacts.tex
  fi
  rm config.tex
fi
