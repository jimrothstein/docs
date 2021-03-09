<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->

<!--
set cul   "cursorline
cc=+1			"colorcolumn is 1 more than tw

!pandoc % -f markdown  -t latex -H chapter_break.tex -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf

-H header
-V or --variable
--pdf-engine=xelatex

PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

\newpage
-->

This is a markdown file (.md) and contains \LaTeX\ springled inside.
Pandoc seems to handle it just fine!


## Header - Level 2

\fbox{a box} \footnote{a footnote}
\noindent\rule{20cm}{0.4pt}
***
### TUB 00

- K- Tea Bags
- Clean Plastic Bags

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
