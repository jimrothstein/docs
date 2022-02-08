#!/bin/zsh


# Latest pandox version?
# pandoc -v
#
# USAGE 
#	0001_md2pdf.sh  files/sample_1.md   output/sample_1.pdf
#
pandoc "$1" \
    -f markdown \
    --include-in-header tex/chapter_break.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
		--pdf-engine=xelatex \
    -o "$2"

