<!--  not necessary 

--- 
title: "R Looseleaf"
author:  "jim"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 2
        toc_float: true
        mathjax: default
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  2   
    fontsize: 10pt   
geometry: margin=0.5in,top=0.25in   
TAGS:  latex,
--- 



set cul   "cursorline
cc=+1			"colorcolumn is 1 more than tw

!pandoc % -t latex -V fontsize=10pt -V geometry:margin=0.5in -V geometry:top=0.3in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -t latex -V fontsize=10pt -H 910_latex_header_for_R_looseleaf.tex -V geometry:margin=0.5in -V geometry:top=0.3in -o ~/Downloads/print_and_delete/out.pdf

file <- "910_latex_header_for_R_looseleaf.tex"

-H header
-V or --variable
--pdf-engine=xelatex

!zathura ~/Downloads/print_and_delete/out.pdf


PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

-->

as of \today  

Notes:  .md to pdf | pandoc | mixed latex + markdown | vanilla latex

## INDEX:  R CODE LOOSELEAF
\flushleft
\begin{enumerate}
\item BASE:   
\begin{itemize}
\item cat/sprintf/options()/dir cmds/etc.
\item[-] With a dash.
\end{itemize}
\item REGEX:
\begin{description}
\item[Useful REGEX examples] use in R, vim, zsh
\item[For basic GLOB - see ZSH LL] 
\end{description}
\item VECTORS  
  *  Vectors | lists | str | base types | [ [[ | loops |  unlist | flatten
\item SEARCH
   
\item GIT
\item Tools to Manage R PACKAGE updates, installation. 
\item TESTING:  TINYTEST | TESTTHAT
\item vim/lua
\item ENV
\item HTTR  

\begin{itemize}
\item[-] CURL | API | GARGLE  (Youtube - see code)
\end{itemize}
\item KNITR: 
    \begin{description}
    \item[See Cheat] Latex | Markdown | pandoc | distill.
    \end{description}


\item S3, S4
\item ERROR HANDLING 
\item 
\item
\item
\item
\item
\textbf{bold}
\end{enumerate}

vim:linebreak:nospell:nowrap:cul tw=78 fo=ntl foldcolumn=3 cc=+1
