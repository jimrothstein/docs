d* vim: set nospell: */ 
---
title: "002_non_R_reading"
output:
  html_document:
    toc: yes
    number_sections:  true
# comment -- in html, user can click to show/hide code 
    code_folding:  show
  pdf_document:
    toc: yes
geometry: margin=1in
editor_options: 
  chunk_output_type: console
---
### 002_non_R_reading.md  

  
**R**  {{{  

**R texts (online)**{{{  
news: https://rviews.rstudio.com/    
r4ds: https://r4ds.had.co.nz/  
dv-r2: https://adv-r.hadley.nz/index.html  
(book)	tidyeval: https://tidyeval.tidyverse.org/index.html  
handson: Grolemund https://rstudio-education.github.io/hopr/environments.html  
jhu: https://jhu-advdatasci.github.io/2018/index.html  
peng likes: https://rafalab.github.io/dsbook  
hadley: shiny: https://mastering-shiny.org/introduction.html}}}  

**No R: stats other Books/great readings:**{{{  
Grinstead, ...; Snell, ... "Intro to Probability" AMS, Dartmouth.edu  
(TEXT: pdf only) https://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/book.html  
[intuition! Cal Poly prof](https://askgoodquestions.blog)  
verygood: https://xiangzhu.github.io/stanford-stats110/index.html  
great blog: https://teachdatascience.com/  
https://livebook.datascienceheroes.com/  
Zaiontz: (ignore excel; consise stats)http://www.real-statistics.com/correlation/basic-concepts-correlation/  
Faraway: a bit over my head: geometric - work Ch2) https://cran.r-project.org/doc/contrib/Faraway-PRA.pdf  
Faraway : Extending Linear Model in R: https://englianhu.files.wordpress.com/2016/01/faraway-extending-the-linear-model-with-r-e28093-2006.pdf  
readable Stanford notes: https://web.stanford.edu/class/cs109/lectureNotes/   
free downloads: https://www.r-statistics.com/2009/10/free-statistics-e-books-for-download/  

**anova, regression, F **
anova:  http://moderndive.com/10-inference-for-regression.html#inference-for-regression	  
(various models in R articles) https://m-clark.github.io/documents.html  
[ easy into to models: ] ( https://dtkaplan.github.io/SM2-bookdown/hypothesis-testing-on-whole-models.html#the-anova-report)  
}}}


**Algebra**{{{
-	PCA | Eigenvalues : http://bit.ly/2vESbqq
-	short intro |http://bit.ly/2vEHAfb
-	extensive linear alg list: http://people.math.gatech.edu/~weiss/math-3406-f18-links.html
-	Faraway
-	Gilbert
-	Davison?  Geom of Regression (Ch 2)
-	Kazdan?  Least Sq (pg 14 exercises)
-	Kazdan (mostly alg - clear) https://www.math.upenn.edu/~kazdan/312S14/
-	(Alg & geom) Troy: https://scottroy.github.io/geometric-interpretations-of-linear-regression-and-ANOVA.html
-	(R^2 & geom) 	https://stats.stackexchange.com/questions/1447/coefficient-of-determination-r2-i-have-never-fully-grasped-the-interpretat/1448#1448
-	https://www.datasciencecentral.com }}}

**R: Intro & free**{{{
-	[OpenIntro](https://www.openintro.org/stat/index.php) (no html webpage; df in Calibre)	
-	short examples:  http://r-statistics.co/Linear-Regression.html
-	models, step-by-step(hadley likes) http://mosaic-web.org/go/SM2-technique/
-	[paper)]( https://journal.r-project.org/archive/2017/RJ-2017-024/RJ-2017-024.pdf)
-	[genomics](https://genomicsclass.github.io/book/) - a bit more math, linear alg; R
-   [rafalab,peng likes](https://rafalab.github.io/dsbook/regression.html)
	-	latest github: https://github.com/rafalab/dsbook
	-	info : https://simplystatistics.org/
-	[ UC course, modern!, range of topics ](https://cfss.uchicago.edu/notes/intro-to-course/)
-	Matloff: 
-	his blog: https://matloff.wordpress.com/
-	(tutorial - web only, no pdf) https://github.com/matloff/fasteR
-	http://heather.cs.ucdavis.edu/~matloff/132/PLN/probstatbook/ProbStatBook.pdf  

		> }}}

**R basics, onfig, style, tips**{{{
-	https://csgillespie.github.io/efficientR
- 	(Hadley)https://style.tidyverse.org/index.html
-	DEBUG:  https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-RStudio
-	book|pkg guide: https://devguide.ropensci.org/
-	PKGS: https://r-mageddon.netlify.com/post/writing-an-r-package-from-scratch/
-	RESOURCES: https://docs.google.com/document/d/1nQ3lqq6FttLu-92DHDlx3qwFsV7pZI-Hed3AEqNlB40/edit}}}

**JennyBC**{{{
-	https://github.com/jennybc/code-smells-and-feels
-	https://whattheyforgot.org/index.html
-	row operations: https://github.com/jennybc/row-oriented-workflows/blob/master/ex09_row-summaries.md	
-	https://happygitwithr.com/}}}

**forums**{{{
-	https://community.rstudio.com/
-	only slack with something happending: https://rfordatascience.slack.com/messages/C6VCZPGPR/
-	Twitter: https://tweetdeck.twitter.com/}}}

**tough cs problems, solve in R**{{{
see "Advent of Code"
see "Tidies of March" ??  (jennybc intern has good ones)> }}}

**TidyTuesday** {{{
(see https://fordatascience.slack.com, #TidyTuesday)	
-	main github: https://github.com/rfordatascience/tidytuesday
-	Monday - release data; Tuesday - view reponses

1.	videos: https://www.youtube.com/user/safe4democracy/videos
2.	related code: https://github.com/dgrtwo/data-screencasts
@.  nice blog: https://johaniefournier.com/category/tidytuesday/
@.  solutions? https://github.com/tomasu909/Tidy-Tuesday-Submissions/tree/master/2019
@.  https://github.com/catrwilliams/rprojects
@.  [study! gkaramanis]( https://github.com/gkaramanis/tidytuesday/tree/master/week-31)
-	tidytuesday tweets? https://nsgrantham.shinyapps.io/tidytuesdayrocks/
> }}}

**Packages** non tidyverse.org{{{
	lists,to unpack  **tidyr 1.0.0 tools** 
	-	https://tidyr.tidyverse.org/articles/rectangle.html 
	-	https://github.com/jennybc/repurrrsive   
	-	https://jennybc.github.io/purrr-tutorial/  
	tuber:   youtube api, https://soodoku.github.io/tuber/  
	-	https://www.r-bloggers.com/using-the-tuber-package-to-analyse-a-youtube-channel/  
-	all from rstudio: https://www.rstudio.com/products/rpackages/   
-	rlang: https://github.com/r-lib/rlang
-	formatR https://yihui.name/formatr (changes code)	
-	littler:: https://github.com/eddelbuettel/littler (suggest only)
-	R Pkgs book v2 (Hadley & JennyBC)  https://r-pkgs.org/
-	devtools & PKGS :: see https://devtools.r-lib.org/
	-	https://style.tidyverse.org
-	usethis:: https://usethis.r-lib.org/index.html https://github.com/r-lib/usethis
-	testthat :: https://testthat.r-lib.org/    READ:http://r-pkgs.had.co.nz/tests.html
-	fs::	ref: https://fs.r-lib.org/articles/function-comparisons.html 
-	details: https://fs.r-lib.org/index.html
-	reprex:: https://reprex.tidyverse.org/
-	googledrive::https://googledrive.tidyverse.org/
	-	google drive api: https://developers.google.com/drive/api/v3/about-sdk
-	DRAKE 'make' 4 R; https://ropenscilabs.github.io/drake-manual/
-	forcats: clear https://peerj.com/preprints/3163/
-	ggplot 
	-	detailed examples: http://www.sthda.com/english/wiki/ggplot2-line-plot-quick-start-guide-r-software-and-data-visualization
	-	[ hadley's ggplot book: ]( https://ggplot2-book.org/ )}}}
-	  Packages{{{
-	    simple: https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
-	    tutorial:  pkg tutorial | http://kbroman.org/pkg_primer/
-	    cheat --pkg cheatsheet: https://www.rstudio.com/wp-content/uploads/2015/06/devtools-cheatsheet.pdf}}}

**Functional:**{{{
-	(eReader) Matloff, Art of R: http://heather.cs.ucdavis.edu/~matloff/132/NSPpart.pdf
-	Rodgires, Modern R w/ tidyverse, Ch8 Functional: https://b-rodrigues.github.io/modern_R/functional-programming.html
-	R-bloogers, https://www.r-bloggers.com/functional-programming-in-r/
-	(eReader) Mailund, Functional R (why here?
		http://file.allitebooks.com/20180624/Domain-Specific%20Languages%20in%20R.pdf)
-   hadley book: https://dcl-prog.stanford.edu/
> }}}
-	
> }}}

##	VIM> {{{
(chrome: keyboard shortcuts: chrome://extensions/shortcuts

-	[vim the hard way](https://learnvimscriptthehardway.stevelosh.com/)
-	[Steve Oualline](http://truth.sk/vim/vimbook-OPL.pdf)
-	https://github.com/mhinz/vim-galore#what-kind-of-vim-am-i-running
-	[BEST, wiki](http://vim.wikia.com/wiki/Category:Getting_started)
-	nice resource guide: http://www.naperwrimo.org/wiki/index.php?title=Vim_for_Writers
-	http://truth.sk/vim/vimbook-OPL.pdf
-	(enter Ex commands at cmd line)[https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes#command-line]
-	videos:
	-	[vimcasts:london]( http://vimcasts.org/blog/2013/01/vim-london-january-in-review )
	-	https://www.youtube.com/channel/UCbJrj3osfxL-U1ZtQ58EH5Q	
	-	https://www.youtube.com/watch?v=ONh95PNBW-Q&t=91s
	-	Neil: https://vimeo.com/53144573
-	manual neovim: 
	-	usr_toc:   https://neovim.io/doc/user/usr_toc.html 
	-	quickref (Contents)	https://neovim.io/doc/user/quickref.html#Contents
	- 	user manual ie (help.txt):  	https://neovim.io/doc/user  
-	manual vim 8.2
	-	https://vimhelp.org/usr_toc.txt.html  
-	manual vimdoc:  
	-	[vimdoc usr](http://vimdoc.sourceforge.net/htmldoc/usr_toc.html)
	-	[vimdoc ref](http://vimdoc.sourceforge.net/htmldoc/help.html#reference_toc)
	-	faq (note: appspot.com) https://vimhelp.appspot.com/vim_faq.txt.html
	-	starting.txt (note: appspot.com) https://vimhelp.appspot.com/starting.txt.html
-	forums:
	-	reddit: https://www.reddit.com/r/neovim/top/?t=month
-	articles:
neovim terminal vs tmux terminal 
https://www.reddit.com/r/neovim/comments/6mkvo3/builtin_terminals_or_tmux/
	-	STAY in normal mode: https://stackoverflow.com/questions/1737163/traversing-text-in-insert-mode
	-	copy, t, :5t. http://vimcasts.org/episodes/long-range-line-duplication/
	-	**VIM LISTS** https://noahfrederick.com/log/a-list-of-vims-lists
	-	cookbook http://www.oualline.com/vim-cook.html.
	cheatsheets
	-	https://www.fprintf.net/vimCheatSheet.html
	-	Obelin, nice cheat: https://www.cs.oberlin.edu/~kuperman/help/vim/mapping.html
-	spell
	-	https://petermlm.wordpress.com/2019/02/09/stuff-in-my-vimrc-04-spelling-and-natural-language/

> }}}

## VIM PLUGIN> {{{
**vimawsome.com**
https://vimawesome.com

**DEOPLETE**
https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/

**RANGER** 
https://ranger.github.io/cheatsheet.png
https://github.com/ranger/ranger/wiki 
integrate in nvim: https://github.com/francoiscabrol/ranger.vim 

**Nvim-R**{{{
https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt
(ctags+nvim+R) https://tinyheero.github.io/2017/05/13/r-vim-ctags.html
> }}}

**VIM-PLUG**
https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/> }}}

## GIT, GITHUB - STUDY{{{
-	best:https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository 
-	by topic:  https://github.com/k88hudson/git-flight-rules
-	** http://www.ftp.newartisans.com/pub/git.from.bottom.up.pdf
-	good: https://sethrobertson.github.io/
-	Git resources: https://help.github.com/en/articles/git-and-github-learning-resources
-	**Git and Rstudio  IDE**
	-	http://r-pkgs.had.co.nz/git.html#git-commit
	-	https://happygitwithr.com/

-	**Video**
	-	Mahler (https://www.youtube.com/watch?v=3dk3s4LK-Wg)
	-	common mistkes: https://youtu.be/FdZecVxzJbk

-	  CHEAT
-	 excellent ! https://github.com/suzanbaert/Resources_and_Bookmarks/blob/master/GIT_01_Basics.md
-	 git.wiki.kernel.org: https://git.wiki.kernel.org/index.php/Category:GitDocumentation

**stackoverflow**
-	https://stackoverflow.com/questions/16709404/how-to-automate-the-commit-and-push-process-git

-	**tutorials**
-	Basic Forking | tutorial | https://gist.github.com/Chaser324/ce0505fbed06b947d962

-	**fixit, insights**
-	(STUDY) his tips | http://gitolite.com/usage.html
-	update master|tutorial, code | https://gist.github.com/CristinaSolana/1885435
> }}}

## MARKDOWN & PANDOC & ePUB tools> {{{
**R, knitr, rmarkdown**
-	best organized: https://rmarkdown.rstudio.com/articles.html
Not the same!
-	https://bookdown.org/yihui/bookdown/
-	https://bookdown.org/yihui/rmarkdown
-	hadley: https://r4ds.had.co.nz/r-markdown.html
-	knitr [embeds output & code R, bash, python etc into markdown doc] book: https://yihui.name/knitr/
-	R & pandoc https://www.rdocumentation.org/packages/knitr/versions/1.20/topics/pandoc

**pandoc**
-	(pandoc docs)[http://pandoc.org/MANUAL.html]
- 	syntax: https://daringfireball.net/projects/markdown/syntax

**latex**
-	Latex: https://www.latex-project.org/

**roxygen2**  .R --> add #' --> .Rd (Latex) --> .md
	-	is for R Packages, not one off .R files
	-	https://cran.r-project.org/web/packages/roxygen2/

**stackexhange **
	-https://stackoverflow.com/editing-help#comment-formatting
	-search: https://stackoverflow.com/help/searching
**Calibre**
-	mobileread: https://www.mobileread.com/forums/forumdisplay.php?s=331aa52ae7779a6e660c2cc5d96a2f93&f=166
-	https://www.mobileread.com/forums/forumdisplay.php?f=234
-	https://www.reddit.com/r/calibre
-	KOReader: https://www.mobileread.com/forums/showthread.php?t=240617
-	k2pdfopt file.pdf      (-m 0.5 = margin 1/2  com)



> }}}

**EPUB**{{{
-	https://www.mobileread.com/forums/forumdisplay.php?f=179
-	KOREADER: https://github.com/koreader/koreader/wiki/KOReader-Gestures
-	Koreader: https://www.mobileread.com/forums/showthread.php?t=315544
-	koreader (kindle): https://www.mobileread.com/forums/showthread.php?t=209276
**PDF TOOLS**
-	k2pdfopt: summary! http://willus.com/k2pdfopt/pdf_conversion.shtml
-	k2pdfopt thread: https://www.mobileread.com/forums/showthread.php?t=144711
-	k2pdfopt & tools: https://www.mobileread.com/forums/showthread.php?t=319818&highlight=mupdf

> }}}

##	BASH, SHELL, SCRIPTS ##> {{{
- BEST:
	-	https://mywiki.wooledge.org/BashGuide
	-	Mendel Cooper's adv scripting) https://www.tldp.org/LDP/abs/html/index.html
	-	http://wiki.bash-hackers.org/commands/classictest
	-	(LINT: bash, sh - not zsh) https://www.shellcheck.net/
-	docs
	- superb: http://www.faqs.org/docs/abs/HTML/index.html
	- bash | gnu | manual (good!) https://www.gnu.org/software/bash/manual/html_node/index.html#Top
-	articles
	- nice Explanations https://explainshell.com/
	- (history cmd)https://www.thegeekstuff.com/2008/08/15-examples-to-master-linux-command-line-history
	-	http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html 
-	feeds
	-	(parallel) stackoverflow https://stackoverflow.com/questions/tagged/gnu-parallel
	-	topics:	
	-	PE:  
		-	https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
		-	(PE - param expan) https://mywiki.wooledge.org/BashFAQ/073
	-	parallel tutor https://www.gnu.org/software/parallel/parallel_tutorial.html
	}}}

##	ZSH ##> {{{
-	start:(2003) http://zsh.sourceforge.net/Intro/intro_toc.html
-	http://www.bash2zsh.com/zsh_refcard/refcard.pdf
-	[emacs ref](http://www.rgrjr.com/emacs/emacs_cheat.html)
-	**dotfiles**
	-	https://github.com/tombh/dotfiles/blob/master/.zshrc
	-	.dotfiles - examples: https://www.quora.com/zsh-What-are-some-useful-zshrc-tips
-	Documentation:
	-	**Tech:shell/POSIX:** https://pubs.opengroup.org/onlinepubs/9699919799/
	-	main: http://zsh.sourceforge.net/
		-	(Good, except intertwinded with csh shell): http://zsh.sourceforge.net/Guide/zshguide.html
		-	Full Docs:  http://zsh.sourceforge.net/Doc/Release/index.html#Top .
		-	FAQ (some good, 2010):http://zsh.sourceforge.net/FAQ/ 
	-	best: https://wiki.archlinux.org/index.php/Zsh .

	**examples/practice**
	-	(terse examples) Falstad (1995): http://zsh.sourceforge.net/Intro/intro_toc.html .
	-   (zsh lover's - read) https://grml.org/zsh/zsh-lovers.html	
	-	examples: http://www.zzapper.co.uk/
	**Oh-my-zsh**
	-	https://github.com/robbyrussell/oh-my-zsh/wiki
-	Feeds
	-	reddit: https://www.reddit.com/r/zsh/top/?t=month
	-	stackoverflow: https://stackoverflow.com/questions/tagged/zsh
-	Articles:
	-	(ibm tutorial) https://www.ibm.com/developerworks/aix/library/au-unix-commandline/index.html 
	-	oh-my-zsh: https://medium.com/wearetheledger/oh-my-zsh-made-for-cli-lovers-installation-guide-3131ca5491fb
	-	(glob, declare) http://www.linux-mag.com/id/1079/
> }}}

##	LINUX> {{{{{{
** tar/find :**
-	https://www.gnu.org/software/tar/manual/tar.html#SEC37
-	find (examples): http://www.binarytides.com/linux-find-command-examples/
-	(clear docs) https://www.gnu.org/software/findutils/manual/html_mono/find.html#find-Expressions
**documentation** 
-	X, x11,https://wiki.x.org/wiki/UserDocumentation/ (oreilly book good)	
	-	excellent, clear: https://askubuntu.com/questions/872792/what-is-xdg-runtime-dir
-	OpenBSD https://man.openbsd.org
-	https://www.bsd.org
-	ArchWiki: https://wiki.archlinux.org/ 
- 	Debian Wiki: https://wiki.debian.org/WhyDebian
- 	Debian 8 Admin: https://debian-handbook.info/browse/stable/
- 	Debian Ref Manual: https://debian-handbook.info/browse/stable/
- 	Debian Admin: https://debian-administration.org/article/317
-	(systemd ver) http://www.linuxfromscratch.org/lfs/view/stable-systemd/
	-	http://www.tldp.org/HOWTO/Software-Building-HOWTO.html
	-	http://moi.vonos.net/linux/beginners-installing-from-source/
- http://langevin.univ-tln.fr/cours/UPS/extra/Linux-101-Hacks.pdf
- CLI commands: https://explainshell.com/
### ps (useful)> {{{{{{
-	https://www.binarytides.com/linux-ps-command}}}
### also:
-	cleanup tools: https://sites.google.com/site/easylinuxtipsproject/clean#TOC-Remove-old-kernels

### partioning
-	(install info - some info) https://linuxmint-installation-guide.readthedocs.io/en/latest/partitioning.html
> }}}

> }}}

## TMUX> {{{
-	Tao of TMUX : https://leanpub.com/the-tao-of-tmux/read#panes
-	Tutorials https://danielmiessler.com/study/tmux/
-	https://www.peterdebelak.com/blog/tmux-scripting/
- 	cheat: (like this style) https://wiki.deimos.fr/images/c/cc/Tmux_cheat_sheet_en.pdf
-	(also good info) https://github.com/tristanlang/tmux-cheatsheet
- 	video: 
-	-	http://bit.ly/2igo9oC (video)

> }}}}}}

##	HASKELL> {{{
-	Lye's class:
	-	https://groups.google.com/forum/#!forum/pdxfunc
	-	Logic & Proof: https://leanprover.github.io/logic_and_proof/
	-	Accelerate https://www.acceleratehs.org/
	-	Parallel & https://www.oreilly.com/library/view/parallel-and-concurrent/9781449335939/ch01.html

-	(best, resources) https://wiki.haskell.org/Haskell.
-	(excellent reading) https://acm.wustl.edu/functional/haskell.php
-	problems: https://wiki.haskell.org/99_questions/1_to_10
-	quick tutor: https://wiki.haskell.org/Hitchhikers_guide_to_Haskell.
-	easy starts:
	-	https://www.ahri.net/practical-haskell-progrms-from-scratch/.
	-	https://lexi-lambda.github.io/blog/2018/02/10/an-opinionated-guide-to-haskell-in-2018/.
**online texts:
-	http://learnyouahaskell.com/chapters (video:
	https://www.youtube.com/watch?v=x3uF7fcQwWE) 
-		text: http://book.realworldhaskell.org/read/
-		http://haskell-lang.org/documentation
-	Yorgey, cis194 https://www.cis.upenn.edu/~cis194/spring13/lectures/01-intro.html
-	good resources: https://github.com/bitemyapp/learnhaskell
-	? https://github.com/data61/fp-course
-	after Yorgey: https://github.com/bitemyapp/fp-course
-	STACK: https://docs.haskellstack.org/en/stable/GUIDE/
-	Pre-requisite??
	-	related? MIT: https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html
> }}}

## MAKE> {{{
- 	CHEAT SHEET: https://swcarpentry.github.io/make-novice/reference
- 	excellent: http://www.schacherer.de/frank/technology/tools/make.html check:
-  	https://github.com/unix-tools/tutorial-makefiles/blob/master/01-introduction.Rmd
-  	https://github.com/maskinskrift/makefile_tutorial
-	https://stackoverflow.com/questions/448910/what-is-the-difference-between-th	e-gnu-makefile-variable-assignments-a?rq=1}}}

##	MUSIC> {{{
vlc	(CLI, xiwi -T vlc, chrome plugin ....)
	-	[main doc](https://wiki.videolan.org/Documentation:Documentation/)
-	https://www.youtube.com/watch?v=EUL8u3AXBjE&t=81s}}}

## POLITICS & BETTING> {{{
-	https://www.predictit.org/
	-	https://www.predictit.org/markets/detail/3537/Will-Donald-Trump-be-impeached-in-his-first-term
	-	related: https://www.politicalalertengine.com/analytics/candidates/warren
-	https://iem.uiowa.edu/iem/Index.action?home=
-	(electoral college) https://www.270towin.com/}}}
-	G. Elliott Morris:  	R models : https://www.thecrosstab.com/project/
	- twitter, DataCamp, guys is amazing
	- https://www.thecrosstab.com/project/politicaldata-package/
-	UCLA:https://voteview.com/
-	USA map (ggplot, maps)https://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html



##	REGEX> {{{
-	grep 3.0 https://www.gnu.org/software/grep/manual/html_node/index.html
-	tutorials
	-	https://ryanstutorials.net/regular-expressions-tutorial/
	-	https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/
-	articles
	-	explains!  https://swtch.com/~rsc/regexp/regexp1.html
	-	vim - specific  http://vimregex.com/
-	forums:
	-	reddit: https://www.reddit.com/r/regex
	-	https://stackoverflow.com/tags/regex/info
	-	https://stackoverflow.com/questions/22937618/reference-what-does-this-regex-mean

-	evaluate:
	-	http://www.rexegg.com/regex-best-trick.html#simplecase
	-	http://www.rexegg.com/}}}

##	SED> {{{
-	https://stackoverflow.com/questions/12129382/add-leading-0-in-sed-substitution
-	tutorial: http://www.grymoire.com/Unix/Sed.html
-	nice examples: http://www.guyrutenberg.com/2009/01/12/batch-renaming-using-sed/
-	ex for batch filename: https://stackoverflow.com/questions/2372719/using-sed-to-mass-rename-files}}}

##	Boyue Likebook Mars, T80D, eInk> {{{
-	https://www.mobileread.com/forums/showthread.php?t=310421
-	video:
	-	(slowly) https://www.youtube.com/watch?v=Jf7LKUBXtHE}}}

-	koreader: http://koreader.rocks/{{{
-	Forums:
	-	KOReader: https://www.mobileread.com/forums/forumdisplay.php?f=276
	wiki:
	-	https://wiki.mobileread.com/wiki/KOReader
	-	koreader:https://github.com/koreader/koreader/wiki
	-	gestures: https://github.com/koreader/koreader/wiki/KOReader-Gestures
> }}}

## TMUX> {{{
-	Tao of TMUX : https://leanpub.com/the-tao-of-tmux/read#panes
-	Tutorials https://danielmiessler.com/study/tmux/
-	https://www.peterdebelak.com/blog/tmux-scripting/
- 	cheat: (like this style) https://wiki.deimos.fr/images/c/cc/Tmux_cheat_sheet_en.pdf
-	(also good info) https://github.com/tristanlang/tmux-cheatsheet
- 	video: 
-	-	http://bit.ly/2igo9oC (video)}}}

## cVim - for Chrome?{{{
-	guy who wrote it! https://www.youtube.com/watch?v=EZ0RmqRimas
-	a lot explained: https://www.reddit.com/r/vim/comments/28af5n/cvim_now_with_more_features/
- .cvimrc https://gist.github.com/zhlinh/d82bdb0be5990a43ae24}}}

## DUCKDUCKGO> {{{
-	docs: https://docs.duckduckhack.com/ (how to create Cheat Sheet)
-	video: https://vimeo.com/channels/duckduckhack}}}

**PHONE**{{{
	- Lineageos - Devices: https://wiki.lineageos.org/devices/
	- Reddit: https://www.reddit.com/r/LineageOS/
> }}}

##	Chromebook | crouton > {{{
-	https://mrchromebox.tech/#home
-	https://www.reddit.com/r/Crouton
-	https://groups.google.com/forum/m/#!forum/crouton-central}}}

##  Chrome OS developer shell (aka crosh)> {{{
-	https://chromium.googlesource.com/chromiumos/docs/+/master/developer_mode.md
-	https://chromium.googlesource.com/chromiumos/platform2/+/master/crosh/README.md
-	[Secure Shell](https://chromium.googlesource.com/apps/libapps/+/master/nassh/doc/FAQ.md#General-Questions)
> }}}

## C++ - just  a little!{{{
-	-- Rcpps
-	http://adv-r.had.co.nz/Rcpp.html#rcpp
-	https://cran.r-project.org/web/packages/Rcpp/vignettes/Rcpp-package.pdf
-	----Stroustrup, C++ (005.133CPL) - actually seems readable
-	---- clear tutorial | c++ explanation: http://www.cprogramming.com/tutorial/templates.html
-	DATA STRUCTURES
-	--- easier: https://www.youtube.com/watch?v=qH6yxkw0u78
-	--- - tutorial | basic tree | c?
-	https://www.codeproject.com/Articles/17868/Binary-Tree-Introduction}}}

## Merkle Trees> {{{
-	- (1)-(code at end) tutorial| https://www.codeproject.com/Articles/1176140/Understanding-Merkle-Trees-Why-use-them-who-uses-t
-	RSTUDIOADDINS .rdf, namespace, edit function in package:
-	(1)addins - new pkg https://rstudio.github.io/rstudioaddins}}}

## ROW> {{{
-	ROW ROWING Exercise - STUDY: https://quantifiedrowing.wordpress.com/}}}

## Republic Podcasts> {{{
-	https://groups.google.com/forum/#!forum/ipppodcastplayer}}}

## CAR RADIO, KENWOOD> {{{
http://manual.kenwood.com/files/4dd9fd2315647.pdf> }}}

## ROCKBOX manual for SanDisk Sansa Clip+{{{
https://download.rockbox.org/daily/manual/rockbox-sansaclipplus/rockbox-build.html
--useful: https://daniel.haxx.se/sansa/view.html
-	forum: http://forums.rockbox.org/index.php}}}

##	DICTIONARY ##> {{{
-	https://www.merriam-webster.com/dictionary ant/syn, shades of meaning
-	Trump words: https://www.vocabulary.com/lists/2094784 lists, but no ant/syn
> }}}

**chess**{{{
-	https://chess.stackexchange.com/tags
-	(pgn) https://www.apronus.com/chess/pgnviewer/
-	https://lichess.org}}}


links re: packages : https://github.com/karthik/rstudio2019
impeach: 	americanoversight.org
R:   Gregor:  https://stackoverflow.com/search\?q\=user:903061+\[r\]
