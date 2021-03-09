#!/bin/zsh

## ERROR
# ========
## angry about: can not read themes/pygments.theme
#		--highlight-style themes/pygments.theme \
## 
#
## BUT following DOES WORK.
# ===========================
# 
#
# fancier .tex

# Latest pandox version?
# pandoc -v
#
# WORKS			
# USAGE 
#	0002_md2pdf.sh  files/sample_2.md   output/sample_2.pdf
#
pandoc "$1" \
    -f markdown \
    --include-in-header tex/inline_code.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
		--pdf-engine=xelatex \
    -o "$2"

