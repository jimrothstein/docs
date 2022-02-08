---
title: "300_HARD_WRAP.md"
output:  pdf_document
#output:  html_document
#header-includes: 
#  - \usepackage{enumitem}
TAGS:  Hard wrap
---

as of $\today:  $ 


#### PURPOSE:   This is intended as markdown, using vim HARD wrap.
  *  Knitr - should not need.  No R code.
  *  This is a prose, markdown, writing article.
  *  Caution:  many latex packages NOT installed;  pdf will balk; html may
      just skip.


#### Unfortunately,    
  *  For HTML, I am still clueless.LATEX + markdown is still clueless to me (USE knitr).
  *  For PDX, LATEX + markdown + pandoc works great!  (but latex packages will be
      problem).

 

 <!--
!pandoc % -f markdown -o %.pdf

!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf 
!pandoc % -f markdown  --pdf-engine xelatex -H chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
-->


#### simple math (works)
$a^2 + b^2 = c^2$

$v(t) = v_0 + \frac{1}{2}at^2$

$\gamma = \frac{1}{\sqrt{1 - v^2/c^2}}$  

$\exists x \forall y (Rxy \equiv Ryx)$

####

####    Definitions/terms 

  *  Code is usually HARD wrap (meaning line ends with `\n`) 
  *  Soft wrap may be stored as 1 long line, but *displays* as wrapped.  A
      longer line. 

  *  For prose/markdown, there is debate but seems to be preference for HARD,
      but use fo=a  only insert mode.  In normal mode, use gq.

####    HELP
  *  :h fo-table
  *  :h 'fo'

 
\begin{verbatim}
augroup PROSE 
    autocmd InsertEnter * set formatoptions+=a 
    autocmd InsertLeave * set formatoptions-=a 
augroup END
\end{verbatim}



<!--
vim:linebreak:nospell:nowrap:cul tw=78 fo=ntl foldcolumn=3 cc=+1
-->
