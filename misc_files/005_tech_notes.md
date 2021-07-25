   vim:linebreak:spell tw=81 fo=tqlnr foldcolumn=3

<!--
!pandoc % -t latex -V fontsize=10pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
-->

## R, install, configure, update
* Problems updating R packages.
* To install from R 4.x.y  see  cran linux bin?

## .rmd, .md, Blogdown:
-	https://bookdown.org/yihui/blogdown/)
-	(start) https://alison.rbind.io/post/up-and-running-with-blogdown/
- (hugo) [https://alison.rbind.io/]()
-	(guy with beard) https://www.znmeb.mobi/2017/05/12/getting-started-with-blogdown/
-	knitr:: https://yihui.name/knitr/options/#chunk_options
-	markdown:: https://rmarkdown.rstudio.com/lesson-1.html
-	cheatsheet (Rmd, Pandoc, YAML)
		https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf 
		
## Mara Averick - roundups 
https://maraaverick.rbind.io/tags/roundups)

## RStudio
-	Verzani (2011) but useful!
	-	https://www.cs.utexas.edu/~cannata/dataVis/Class%20Notes/Getting%20Started%20with%20RStudio.pdf
-	Rstudio Community: https://community.rstudio.com/new
-	https://community.rstudio.com/

##  jennybc
- workshop: https://github.com/jennybc/what-they-forgot) 
- slides  http://bit.ly/rstudioconf-pdx 
- github: https://github.com/smithjd/explore-libraries/blob/master/01_explore-libraries_jenny.R
- Makefile (jennybc) (http://stat545.com/automation03_make-test-drive.html)
-	[GIT:](http://happygitwithr.com/)
-	GIT: http://happygitwithr.com  (I prefer to show URL)
-	jennybc, dplyr mostly join cheatsheet http://stat545.com/bit001_dplyr-cheatsheet.html
-   STAT 545 R, Makefile http://stat545.com/block026_file-out-in.html
-   GIT: http://happygitwithr.com/

## Hadley
-	 Hadley,G&W  r4ds http://r4ds.had.co.nz
-	[Hadley's pkg book & testin:](http://r-pkgs.had.co.nz/intro.html)
-	Hadley, Advanced R http://adv-r.had.co.nz/Introduction.htm
-	 Hadley "Elegant Graphics" (http://moderngraphics11.pbworks.com/f/ggplot2-Book09hWickham.pdf
##  packages
	- usethis::   (https://cran.r-project.org/web/packages/usethis/usethis.pdf
	- here::
	- fs::
	- testtht:: (https://github.com/r-lib/testthat
	- devtools::  https://cran.r-project.org/web/packages/devtools/README.html
- Lintr https://github.com/jimhester/lintr
## test_that, pkgs, INFER	 
-	[INFER] (https://github.com/ismayc/infer)
-	[And this](https://infer-dev.netlify.com/contributing)
-	manual http://blog.runsheng.xyz/attachment/r-packages.pdf
-	[example1](https://www.r-bloggers.com/unit-testing-with-r/)
- 	Evan Kaeding - Cooladata - https://www.cooladata.com/ - talk: "Plumber: Building REST APIs in R"

## R - practical reading (more R than stats)
- https://www.rdocumentation.org/packages/base/versions/3.4.3/topics/Startup

## GIT, strategies
-  https://nvie.com/posts/a-successful-git-branching-model/


## DPLYR   
    -   excellent cheat   https://suzanbaert.netlify.com/2018/01/dplyr-tutorial-1
    - excellent dplyr examples  https://blog.gkampolis.com/post/on-dplyr-and-genocide/

## R Code style
- code style: http://style.tidyverse.org/
- Eric , excellent : http://eriqande.github.io/rep-res-web/
- Google's guide, useful: https://google.github.io/styleguide/Rguide.xml
- Bioconductor: https://www.bioconductor.org/developers/how-to/coding-style/
- Stackoverflow, discussion: https://stackoverflow.com/questions/9061016/coding-principles-in-r-looking-for-a-book-web-tutorial-for-writing-complex-pro
  - this page: https://rdrr.io/snippets/ (public code, run online)
- Hadley, based on Google R (more for pkgs) :  http://style.tidyverse.org/
- Gelman, Andrew LOTs,... this is old is still useful.. http://andrewgelman.com/2007/09/18/style_guide_for/

## SIMULATION

-   Rule of 3? https://www.r-bloggers.com/another-rule-of-three-this-one-in-statistics/
  -Hadley - Simulation! http://had.co.nz/stat480/lectures/15-simulation.pdf
  -Nolan Basic code to maniuplate simulation, reg exp: esp (not usually covered elsewhere)
  http://www.stat.berkeley.edu/~nolan/stat133/Fall05/lectures/truncNorm.R
  website: http://www.stat.berkeley.edu/~nolan/ (no free books)

## Basic R
  -fundamentals R, many examples: http://www.stats.ox.ac.uk/~evans/Rprog/LectureNotes.pdf
  (b/c I do NOT know it all)
  -good essays and intro to topics (graphs, regression ….) https://www.hackerearth.com/

## R Startup, .Rprofile
-- .Rprofile
    http://www.onthelambda.com/2014/09/17/fun-with-rprofile-and-customizing-r-startup

##GGPLOT

-G&W (Ch3: Data Visualization)
    http://r4ds.had.co.nz/data-visualisation.html#geometric-objects
-Hadley book (ggplot, 2015)
    http://ms.mcmaster.ca/~bolker/misc/ggplot2-book.pdf
-https://stackoverflow.com/questions/5208679/order-bars-in-ggplot2-bar-graph?noredirect=1&lq=1
-jesse is good:
https://medium.com/@kierisi/r4ds-week-2-data-visualization-vocabulary-fc8fa4d20d2d
-cheat sheet (many!)
    https://www.rstudio.com/wp-content/uploads/2016/11/ggplot2-cheatsheet-2.1.pdf
    
## R - odds & ends?
    - Ng, Coursera - Learning Algorithms https://www.coursera.org/learn/machine-learning/lecture/Ujm7v/what-is-machine-learning
    - Ng - Machine Learning text: https://gallery.mailchimp.com/dc3a7ef4d750c0abfc19202a3/files/704291d2-365e-45bf-a9f5-719959dfe415/Ng_MLY01.pdf

## Make & R
    - http://kbroman.org/minimal_make/
    - DRAKE - R ("igraph" - wants)  - replace make? https://github.com/ropensci/drake

## CODE STUDY -
  - https://www.r-bloggers.com/how-to-map-public-debt-data-with-ggplot2/
  - Persistence of Public -- GUN
      https://github.com/benmarwick/Persistence-of-Public-Interest-in-Gun-Control

## "INTRO" (from Core team)
  - CRAN, Seems Detailed: https://cran.r-project.org/doc/manuals/r-release/R-intro.html
  - R as language definition typeof(), class() where is comes from https://cran.r-project.org/doc/manuals/R-lang.pdf

## R  & REGRESSION
    - Ismay:  plus his INFER pkg https://ismayc.github.io/moderndiver-book/
    - Faraway - algrebaic intro Regrssion - BETTER? https://cran.r-project.org/doc/contrib/Faraway-PRA.pdf

Nice code:  tidytuesday   STUDY!
https://github.com/mjhendrickson/Tidy-Tuesday/blob/master/Week%2001%20-%20US%20Tuition/us_tuition.R

-How to start a topics (Cran Views)?
	- https://cran.r-project.org/web/views/
	
-For jimPackage: (versions, etc)
	- http://r-pkgs.had.co.nz/description.html#version
	
REPREX - do!
	- https://www.jessemaegan.com/post/so-you-ve-been-asked-to-make-a-reprex/
	
- Efficient R - online text (Csgillespie)
http://bit.ly/2fTkcVY
-pkg tutorial
http://kbroman.org/pkg_primer/

-maps:
http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html

R-exercises.
http://www.r-exercises.com/2017/07/01/hacking-statistics-exercises-part-1/

stringr
https://www.datacamp.com/courses/string-manipulation-in-r-with-stringr

shiny (Ted Laderast Guide!)
https://laderast.github.io/gradual_shiny/introduction.html

Efficient R:  http://bit.ly/2fTkcVY

-essential R pkgs
  - http://jvera.r bind.io/post/2017/07/15/some-essential-r-packages/
  'janitor': http://jvera.rbind.io/post/2017/07/27/janitor-a-good-r-package-for-data-wrangling/


##
__STATISTICS -- (MORE Stat than R)__

- NIST - handy reference (see probability distributions, for example)
http://www.itl.nist.gov/div898/handbook/eda/section3/eda36.htm


- HASTIE, ISLR
http://www-bcf.usc.edu/~gareth/ISL/ISLR%20Seventh%20Printing.pdf
- PRABAKAREN: (too terse?)
r-statistics.co/Linear-Regression.html

- LANE (easy to follow), no proofs, good questions,  but demos don't work
http://onlinestatbook.com/2/regression/regression.html
- DEVORE (my book)
- LINEAR MODELS, R:  nice overview: https://stackoverflow.com/documentation/r/801/linear-models-regression#t=20170907234540137138
- Diez, OpenIntro Statistics - PDF only  - straightforward, many examples no proofs  https://drive.google.com/file/d/0B-DHaDEbiOGkc1RycUtIcUtIelE/view
- Grinstead, ...; Snell, ... "Intro to Probability" AMS, Dartmouth.edu
(TEXT: pdf only) https://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/book.html
- 006 Lavine: Intro to Stat Thought (classic) http://people.math.umass.edu/~lavine/Book/book.pdf
- cartoonish lessons,pretty good, simple as it gets: http://www.dataanalysisclassroom.com/lesson46/
- Penn State
    Stat 414 (includes 415,discrete  CLT etc, chi2)
    (worked problems) https://onlinecourses.science.psu.edu/stat414

    Penn Stat 462 - regression, anova
    https://onlinecourses.science.psu.edu/stat462, https://onlinecourses.science.psu.edu/stat462/node/79/ 

-Taubes, Harvard, Genomics (http://www.math.harvard.edu/~knill/teaching/math19b_2011/handouts/chapters1-19.pdf)

- REGRESSION(with R)
  - ISMAY: Ismay & Kim:  http://moderndive.com/index.html
  - OpenIntro Statistics (page 331 on) https://www.openintro.org/stat/textbook.php?stat_book=os
  - Introduction to Statistical Thinking (page 247 onwards) http://pluto.huji.ac.il/~msby/StatThink/index.html

- are 2 variances the same ? (and why?)
---- http://bit.ly/2vERf5A
any good?

Contingency Tables, PCA, Correspondence Analysis
http://www.physics.csbsju.edu/stats/contingency.html

007: Stat 545 Data Wrangling Analysis; latest Tools & Tech:
Propagation of Error
PETERS (princeton), seems part Taylor, part analysis - readable! https://www.princeton.edu/~cap/AEESP_Statchap_Peters.pdf

(based on Taylor) https://faraday.physics.utoronto.ca/PVB/Harrison/ErrorAnalysis/All.pdf
(based on Taylor) https://courses.washington.edu/phys431/uncertainty_notes.pdf
(based on Taylor) https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-621-experimental-projects-i-spring-2003/lecture-notes/10_errors03.pdf
Chem 75 | Dartm | https://www.dartmouth.edu/~pchem/75/pdfs/ErrAnalysis.pdf
also based on Taylor | http://physics.unc.edu/files/2012/10/uncertainty.pdf



## R6
-	https://campus.datacamp.com/courses/object-oriented-programming-in-r-s3-and-r6/using-r6?ex=2
## S4
-	(youtube,DataCamp): https://www.youtube.com/watch?v=Kete306Oakc
-	-(youtube, Peng) https://www.youtube.com/watch?v=93N0HdoZW9g
-	(S4) https://www.youtube.com/watch?v=CeP-A__FroY
	


-	Courses & Format TEXTBOOKS
-	
-	006: MIT Probability Course, why? Book is classic (says Peng) https://courses.edx.org/courses/course-v1:MITx+6.041x_4+1T2017/courseware/Unit_1_Probability_models_and_axioms/Lec__1_Probability_models_and_axioms/
-	
-	013: QA278 .B48 Bevington, - classic on experimental measuremnt? 014: QA166 .W37 Wallis, - netoworks, very interesting ideas, code?
-	
-	
-	Videos
-	
-	jbstatitics.com : http://www.jbstatistics.com/
-	
-	100: edx | U TX | Data Analysis 2 - https://courses.edx.org/dashboard
-	
-	152:-edx | Harvard | Linear Models & Algebra | https://courses.edx.org/courses/course-v1:HarvardX+PH525.2x+2T2016/info
-	
-	153: coursera | dashboard | https://www.coursera.org/
-	
-	-- especially "Improving Your Statistical Inferences"
-	
-	Videos -- BCaffo - tons of Youtube, GitHub Ex: https://github.com/bcaffo/LittleInferenceBook (use Git)
-	
-	-- Rpubs.org - can store here; good code examles!
-	
-	-- Pf of E[X] for Binomial: https://youtu.be/PkchliW8t_8 bin pf
-	-- JH | linear models
-	
-	150: coursera: (not free) Linear Reg | Business https://www.coursera.org/learn/linear-regression-business-statistics
-	
-	151: coursera: Duke | Statistics & R | https://www.coursera.org/specializations/statistics: U
-	
-	
-	2.R-exercises, variety of articles: http://r-exercises.com/2017/01/29/data-science-for-doctors-part-1-data-display/
-	
-	3.Nice SF maps: http://urbanspatialanalysis.com/dataviz-tutorial-mapping-san-francisco-home-prices-using-r/
-	
-	
-	
## R (from 002_) 
-	(19) ggplot & MAPS
-	http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html
-	https://www.r-bloggers.com/simple-practice-basic-maps-with-the-tidyverse/

### Nvim-R-plugin
-	(best) https://medium.freecodecamp.org/turning-vim-into-an-r-ide-cd9602e8c217
-	...and his blog: https://kadekillary.work

-	() http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r
-	(detailed docs, 1 page)https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/doc/Nvim-R.txt
-	(sample .vimrc adv) http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/vim-r-plugin/.vimrc
-	(git - 1 page) https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/doc/Nvim-R.txt
-	nvim-r:  more to read: https://github.com/beigebrucewayne/Vim-IDE-4-All/blob/master/R-neovim.md

	
##Purrrr, lists, recursive

024_tidyverse_str.R
-C.Wickham, video, parts I and II (map, map2) https://channel9.msdn.com/Events/useR-international-R-User-conferences/useR-International-R-User-2017-Conference/Solving-iteration-problems-with-purrr

- https://github.com/cwickham/purrr-tutorial

-	(2) and here, purrr II
-	https://www.youtube.com/watch?v=b0ozKTUho0A&index=13&list=PLbcglKxZP5PMSKRxgVtFG2yrYhcCFgSJU
-Her CODE & SLIDES:  https://github.com/cwickham/purrr-tutorial


-	(3) Reading:  r4ds:
-iteration ch: http://r4ds.had.co.nz/iteration.html
-	many-models ch (gap-minder): http://r4ds.had.co.nz/many-models.html

-	(4) NESTING:
-	https://stackoverflow.com/questions/39228502/double-nesting-in-the-tidyverse
-	http://r4ds.had.co.nz/many-models.html#nested-data
-	(21)  use R! Brussels
-	https://ismayc.github.io/talks/useR_recap17/slide_deck.html#1
-	--apps.ankiweb.net (Anki)
-	--click on video: https://channel9.msdn.com/Events/useR-international-R-User-conferences/useR-International-R-User-2017-Conference?sort=status&direction=desc&d=0&term=


-	(22) PROPUBICA & PROJECTS?
## FIND a project
-- general
-	https://project-open-data.cio.gov/
-	https://en.wikipedia.org/wiki/Open_data
-	https://github.com/GSA/data.gov
-	
-	-- portland projects?
-	https://mobilitylab.org/2016/08/12/portland-o
-	pen-data-techies/
-	
-	-- public health
-	Oregon: https://public.health.oregon.gov/DataStatistics/Pages/index.aspx
-	Open Data Trials: https://opentrials.net/contribute/
-	
-	-- propublica
-	https://www.propublica.org/data
-	
-	
-	-- ALL of US
-	https://wire.ama-assn.org/delivering-care/wanted-1-million-or-more-people-shape-precision-medicine-s-future
-	
-	-- NIH, Precise Medicine FHIR
-	https://www.healthit.gov/buzz-blog/health-innovation/nih-and-onc-launch-the-sync-for-science-pilot/
-	
-	-- (private) Argonaut
-	http://argonautwiki.hl7.org/index.php?title=Main_Page
-	
-	-- (apps) SMART Health IT
-	https://smarthealthit.org/an-app-platform-for-healthcare/about/
-	

## 27 SEPT 2018
-	ln -s   dir/file   name_of_link
-	$TERM - apps use so know display type and codes to send
	-	ll /lib/....   has db / confused
##	Crouton vs Gallium OS?  both?
##	5 OCT 2018
-	X - gives GUI, uses low level libraries, **xlib**
-	-	X is actual server,  applications communicates with X server, which
		  notfies display (packets)
-	XFCE - many distros, suite of apps, use GTK+ toolkit
-	-	DESKTOP Mgr=Xfdesktop (colors, images, wallpaper)
-	-	FILE Mgr=Thunar (GTK+ toolkit)
		-	others: nautilus
-	-	Windows mgr=xfwm4 (max, min, focus, tiling ...)
-	-	Settings mgr=xfce4-settings-manager (appearance, style, keyboard, ....)
-	-	Terminal=xfce4-terminal (1 of many possible emulators, code that sits
	      inside bash?)
-	DISPLAY MGR (DM) = Begins X, then displays (gui) login screen.  Many types
	of DM.
-	chroot  -   Without rebooting, chroot means "change root" ie start new
	shell, change root diretory (to point to a partition)

-	X uses(?) xlib (old), xcb(newer)
-	ncurses lib -?
-	Wayland - next generation (replace?) for X
-	Stack - X at bottom, GNOME or KDE above, NAUTILUS or panels above
-	man Xorg (good)	, I have no ~/.xinitrc
-	Terminal is NOT equal to SHELL (explain?)
- 	GTK+ - C lib, widgets supports X.   Gnone, Win32, etc use GTK+ tools.
-	graphical login? kdm, gdm, xdm (basic) lightdm, sddm aka Display Mgr
-	REMOVE PLUGIN:  vimwiki - how to get rid  | .vimrc - delete references to plugin
##	13 OCT 2018
-	Working: Ranger, newsbeut , updated to Ubuntu 18.04LTS
-	TERMINALS
	-	rxvt, urxvt, terminator, st (not friendly) xfce4-terminal.
##	20 OCT 2018
-	epub format -impossible to search for this format, waste of time.

##	ANDROID BACKUP
*	use Google for most.
*	Nova - use builtin backup/restore.
*	Republic Podcast - backup config files, OPML,  also sync.

## VIM, NVIM, NEOVIM
tags (NOW) "./tags;,tags"    comma delimited string; appears to recurse
upwards.

\newpage
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

\newpage

### epub, Calibre, iPad, iCloud, eReader, pdf
-	Claim:  iPad does not support Calibre; free Readers for iPad, everyone has fav.
		No, no, no.    Download Calibre software for osx to iPad.   What  does not
		work is connecting iPad to Calibre on Laptop.
-	Goodreader for pdf ($20?) - many say best iPad reader.?
- Marvin - no pdf support, but excellent otherwise?


**knitr -> R & rmarkdown -> Bookdown (~2016) -> Blogdown -> netlify (Hugo, static)**
HUGO:   md -> html
BOOKDOWN:  Rmd        ->html (skips md)

**lua** is a lightweight language acts like "glue" ; embeds within code; useful in
textdoc .

**renv** 	Why I think I do not need (and do not want).  Re-creates tidyverse code
INSIDE each project, ie local copy of everything inside package.  Then takes
snapshots as either your code or the any of like libraries changes.   Nice
purpose:   easily re-create complete environment.   But much too much overhead
for my needs!  (at this time.)

## REST RESTful
*	originally URL linked to file or webpage.
*	more recenty, URI links to payload,  HTML/JSON/XML
*	RESTFUL provides stateless operations, architecture (vs SOAP, or others)
* VERBS include GET/POST/ etc etc
Stateless means server keeps no session information.   Each call to server is
independent.  Examples include HTTP, IP, REST.   But TCP is not stateless.

##  Thu  19 Nov 2020  Acer Batttery
  *  ACER CB3-431-C7EX 
  *  From back (tiny print on labels)
    *  SNID   8120 1450072
    *  SN NXGC7AA001812038A47200
    *  ACER CB-431 Model N16P1
Do you sell new battery for this ACER laptop?
CB3-431-C7EX  (manuf 3/22/18)
SNID:  81201450072

##  Fri  02 Apr 2021

