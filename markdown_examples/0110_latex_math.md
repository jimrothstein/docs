\documentclass{article}

\usepackage{amsmath,amssymb}

\begin{document}

\begin{verbatim}
"0110_latex_math.md"
  Your text here.
Compiled with pdflatex
Pandoc complains and says to use pdflatex.
pdflatex handles this document just fine. (?)
\end{verbatim}


% This is a comment.


\begin{equation}
x^2 + y^2 = r^2
\end{equation}

\begin{equation}
\frac{x}{y} = L
\end{equation}


%  does not work

\begin{align}
  x=2
  y=3
\end{align}

% E = mc^2/sqrt( 1 - (v/c)^2)

% \begin{align}
%   E_0 &= mc^2  \\
%   E &=\frac{mc^2}
%   {\sqrt{1 - \frac{v^2}
%   {c^2}}}
% \end{align}

\end{document}

