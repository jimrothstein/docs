
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1

#	Template for .md !

<!--
set cul   "cursorline
cc=+1			"colorcolumn is 1 more than tw

!pandoc % -t latex -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.5in -o ~/Downloads/print_and_delete/out.pdf

-H header
-V or --variable
--pdf-engine=xelatex

PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

vim: to format all urls for md
s/https.*/[&]()/g

\newpage
-->


## T 13 NOV 2020 Stats & Algebra Books
<!-- [text](http://...) -->

### Basic Statistics
* PSU Course 414 | Best level for me, so far | no R
*	AMS 
    Basic, good intro CLT (but not t)

* McGrew, Lembo et al "Intro to Statistical Problems in Geography", looks nice:
last frost, distribution of snow.

* Frey, Bruce "Statistical Hacks"

* Matloff (Prob book) 
    Good, maybe too good and skips a few basics?

* Siegrist 
    CLT, stats, linear alg | aka randomservices.org |  ** best book for introducing Math

### More advanced regession/modeling books
* Shalizi 
    http://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/ADAfaEPoV.pdf

### Linear Algebra focus

#### Level 1 (start)
*	Beezer Linear Algebra
	*	0 stats, but good review for me, right level

#### Level 2 
* Herve Adbi | lin alg| no R, no stat, starts simple but gets to decomposition.
* Thomas,  Math for ML  ... good lin alg, but quickly gets advanced.
    https://gwthomas.github.io/docs/math4ml.pdf
* Deisenroth, Faiesel et al | Math4ML *book | linear alg book, regression, 2nd
    level

#### Also 
* Artin, Michael "Algebra"  - readable ?
* Bendixcarstensen.com R & matrix models (try not use api pkg)
*	Davidson (Econometric) -  Ch 1, 2
*	Friendly - R Pkg linear algebra
* Kazan |  normal equations
*	Rafael genomics - Chapter 4 matrix

### Regression, ML, modeling books
*	Boehmke, Bradley "Hands on ML"
	*	no theory, uses R but no code, an "intro" book?
*	Bysh (see Roback)
	*	Ch 1 - 1.6.2 (too advanced?)
* **Compeau - Great ideas book!**
*	CMU -	Ch 8, 9 esp collinear
* Hannay (=Rbassett) Read, but avoid code + its pkgs
	Ch 11, 12
* Ismay Modern Dive (2020)
*	Jennybc (book)
	* Ch18-20
* Kaplan (2017) Ch 6.5
*	Kuhn (2019) FES
	*	no R, not an intro. Book.
*	Kurz
*	Lane
		se(b_hat)
* Matloff (1st book)
	*	Ch3 - lot of useful prproperties of X,Y
	*	Ch 7  - Affine transformations
*	Matloff(2020) book
*	McElreath (videos)
* Navarro (Learn Statistics with R)
		review lm() and geometric R^2
* Navarro  2019 (Learn Statistics with R)
		Study output of lm()
*	Peng
	*	Art of ... (2017) Ch 6.5
	*	R4DS			 (2019)	Ch 9.5
* Rafael  			dsbook - Ch 17.4, Ch 18.3.4
*	Roback/Legler BYSH (2019) 
	*	review L I N E
*	Roback/Legler GLM (2020)
*	Siegrist (aka Random services.org) 
*	*	Random| (3)Expected Value 1..11 and 	|(5) Random Samples 1-8 (t-dist)
*	Strang - Linear Algebra
* Tidymodels.org 
	* No theory, R code + tidymodels package
*  Hannray faculty.nps.edu Chapter 12
* 	Mosaic
		Ch 5.6, Ch 24

### Good Technical Reading
Math 4 Machine Learning
https://mml-book.github.io/book/mml-book.pdf
