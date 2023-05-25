\footnotesize
---
as of \today  

<!--
      L A T E X VERSION of Loose Leafs

      Last Edited:   2023-05-22 

-->

<!--


      L A T E X
COMMENT
template has \small font embedded

# FaILS
!pandoc % -f markdown  --template ~/dotfiles/trivial_template.tex -V geometry:margin=0.4in --toc --toc-depth=5 -V toc-title="Control INDEX" -t pdf -o - | zathura -

# WORKS
!pandoc % -f markdown  -V geometry:margin=0.3in --toc --toc-depth=5 -V toc-title="Control INDEX" -t pdf -o - | zathura -


--template ~/dotfiles/proposed_template.latex 

--include-in-header geometry.tex
-->

```
file <- "misc_files/003_R_loose_leafs.md"

```
\newpage

<!--	
C O M M E N T

-->

##	WIP Outline	
###	Volume 1 - 8 Index

---

###	QUEUE

####	Weekly (review)
####	Active (review)

---

###	TECH NOTES (DRAFT)

---

###	FILES

####	ZSH scripts (sh, api, regex etc)
####	md (needs clean up)
####	Latex
####	Make
####	R | Rmd (TRY)
#####	base
#####	vector
#####	graphics
#####	DT

---

###	TECH READING

\newpage

##	Loose Leaf VOLUMES

####	Volume 01 - CLI Skills

-	Android (adb, fastboot)
-	CURL					(SEE:   API, R-misc)
-	GIT
-	JSON
-	LATEX					(ALSO:  WIP)
-	MAKE
-	REGEX/GREP		(SEE:  ZSH for glob)
-	SEARCH				(SEE:  INDEX CARD)
	-	Gmail | Github | DDG | ...
-	TMUX
-	YOUTUBE-DL
\begin{description}
\item[For basic GLOB - see ZSH LL] 
\end{description}

####	Volume 02 - LINUX CONFIG/HARDWARE
-	Linux Config - General
-	GRUB
-	X11
-	OS
-	Hardware
-	ChromeBox
-	ChromeBook Laptop
-	PHONES
-	Other eToys

####	Volume 03 - Neovim/Lua | nvim-R

####	Volume 04 - ZSH

####	Volume 05 - MATH, ALGEBRA
-	Linear Algebra
-	ML
(if R code, put into R LL [^1])


####	Volume 06 -	Statistics
-	Classic
-	Regression
-	Baysian

####	Volume 07 -	R:	Advanced R

####  Volume 08	-	R:	BASE and Other R skills 
\flushleft
\begin{enumerate}
\item BASE:   
\begin{itemize}

\item cat/sprintf/options()/dir cmds/etc.
\item[-] With a dash.
\end{itemize}
\item base graphics | plots
\item VECTORS  

-	Vectors | lists | str | base types | [ [[ | loops |  unlist | flatten
\item Manage R | package | updates |  installation. 
\item TESTING:  tinytest | testthat
\item ENV
\item HTTR2
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
\end{enumerate}


[^1]:		LL = Looseleaf	
vim:linebreak:nospell:nowrap:cul tw=78 fo=ntl foldcolumn=3 cc=+1
