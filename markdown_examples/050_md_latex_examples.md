---
title:  "050_md_latex_examples.md"
mainfont: "Palatino" 
output:
  pdf_document:
    latex_engine:  xelatex
     number_sections:  true
links_as_notes:  true 
---
<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->

<!--


PURPOSE:  .md to pdf, using pandoc, vanilla packages; 

!pandoc % -f markdown  -t latex -V fontsize=10pt -N --toc -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
-V mainfont="Palatino"
-- toc
-N  (number sections)
!pandoc % -f markdown  -t latex -V fontsize=10pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -f markdown  -t latex -H chapter_break.tex -V fontsize=10pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf

--variable mainfont="Palatino" --variable sansfont="Helvetica" --variable monofont="Menlo"
-->

This is a markdown file (.md) and contains \LaTeX\ springled inside.  
Pandoc seems to handle it just fine!   
file:markdown_examples/0050_md_latex_examples.md  
\footnote{ 0050\_md\_latex\_examples.md}

\small{small}  

\large{large}  

## Header - Level 2

\fbox{a box} \footnote{a footnote}
\noindent\rule{20cm}{0.4pt}
***
### TUB 00

- K- **Tea** [**bold**] Bags \footnote{a footnote2}
- Clean *Plastic* Bags [*Italic* though vim does not display]

```
This is verbatim.  That is all.
```

  *  Bullet 1  
     Just indent.  And this is continuation of bullet1.  
     Indent again: A second new line.  

  *  But this is bullet2.  


## Inserting a \LaTeX\ Formula

To include a mathematical formula in Markdown, enclose it with **`$`** characters like this:

```` {.latex}
 $\frac{n!}{k!(n-k)!} = \binom{n}{k}$
````

The result:

$\frac{n!}{k!(n-k)!} = \binom{n}{k}$
***

### TUB 02  (small)
* Toilet+DDS /Razor/Hand Soap/tooth supplies/mineral oil/skin

\noindent\rule{20cm}{0.4pt}
### TUB03   (has room)
* Wool (dirty) / some bags/1 sheet/


## Attempt as a tree - NOPE , no good.

```
\documentclass{article}

\usepackage{amsmath,amssymb}
\usepackage{comment}
\usepackage{dirtree}

\begin{document}


\usepackage{dirtree}
\Tree[.IP [.NP [.Det \textit{the} ]
               [.N\1 [.N \textit{package} ]]]]


\end{document}
```
