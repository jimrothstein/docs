\documentclass{article}

\usepackage{amsmath,amssymb}
\usepackage{comment}
\usepackage{dirtree}

\begin{document}

\begin{verbatim}
"0100_latex_math.md"
  Your text here.
Compiled with pdflatex
Pandoc complains and says to use pdflatex.
pdflatex handles this document just fine.
\end{verbatim}


% This is a comment.

\begin{comment}
\Tree[.IP [.NP [.Det \textit{the} ]
               [.N\1 [.N \textit{package} ]]]]
\end{comment}

\begin{equation}
x^2 + y^2 = r^2
\end{equation}

\begin{equation}
\frac{x}{y} = L
\end{equation}

\dirtree{%
.1 debug.
.2 filename.
.2 modules.
.3 module.
.3 module.
.3 module.
.2 level.
}

\end{document}

