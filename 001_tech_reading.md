---
date:  \today
# geometry:  margin=0.5in, top=0.25in
TAGS:  reading list
---

<!--
LINK:  [TEXT portion](URL portion)

\url{nytimes.com}

\href{nytimes.com}{NY Times}

file <- "001_R_stats_tech_reading.md"
!pandoc % -t latex -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/reading.pdf 


!pandoc -t latex -M date="`date "+%B %e, %Y"`" -o %.pdf
-H header
-V or --variable
--pdf-engine=xelatex

REF:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

vim: to format all urls for md
s/https.*/[&]()/g



-->
\footnotesize

As of \today

### R - always learn something new:
  *  Burns, R Inferno (not intro book)
  *  Peng, https://bookdown.org/rdpeng/rprogdatascience/
  *  Hadley, https://r4ds.had.co.nz/index.html
  *	 [Jennybc (book)](https://stat545.com/index.html) [wtf](https://rstats.wtf/) [git](https://happygitwithr.com/)
  *  Gillespie, Lovelace (2016) https://bookdown.org/csgillespie/efficientR/
  *  Matloff:  Art of R Programming (2011)
  *  de Jong, Intro to Data Cleaning  https://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf
  

### R - more advanced
  *  official R CRAN: https://cran.r-project.org/manuals.html
  *  design.tidyverse.org


### Basic Statistics

#### More Intuitive/Explanatory:
  *  [Rossman, know all the basics?   confident?]  ( https://askgoodquestions.blog/ )
  *  Przemyslaw Biecek and Tomasz Burzykowski | different ideas | Ch1, 2 Explanatory Model Analysis | https://ema.drwhy.ai/
  *  ML Berkeley:  https://ml.berkeley.edu/blog/posts/crash-course/part-1/
  *  Goodfellow et al: https://www.deeplearningbook.org/ ideas
  *  Guo:  Creative site and book: https://seeing-theory.brown.edu/#firstPage
  *  navarro (learn statistics with r) review lm() and geometric r^2, Ch15, 16
  *  navarro  2019 (learn statistics with r) study output of lm()
	*  Huntington https://www.theeffectbook.net/index.html (intutition?)


#### Solid, basic stats intros
  *  PSU Course begin with 414 | | no R
    *   https://online.stat.psu.edu/stat414/
    *   https://online.stat.psu.edu/stat462/
    *   https://online.stat.psu.edu/stat415/
  *	 AMS Basic, good intro CLT (but not t)
  *  Dekking, et al Modern Introduction to Probability & Statistics (2005), no R.
    *   https://cis.temple.edu/~latecki/Courses/CIS2033-Spring13/Modern_intro_probability_statistics_Dekking05.pdf
  *  Faraday, PRAR:  Practical Regression, Anova, linear algebra (mature
      approach)
  *  Frey, Bruce "Statistical Hacks"
  *  [Dalpiaz, David, Univ of IL] ( https://daviddalpiaz.github.io/appliedstats/ )
  *  Lindelov:  Concise R examples of common stat tests.
  *  Matloff (Prob book) 
    * http://heather.cs.ucdavis.edu/~matloff/132/PLN/probstatbook/ProbStatBook.pdf
    * (via pdflatex) https://github.com/matloff/probstatbook
      Good, maybe too good and skips a few basics?
  *  Siegrist 
      CLT, stats, linear alg | aka randomservices.org |  ** best book for introducing Math  
  *  Nahim,  Dueling Idiots, harder but real world stats/prob problems (pins
      falling on surfaces)

####	R and Special Topics
	-	Data Science at Command Line (book) https://datascienceatthecommandline.com/2e/chapter-2-getting-started.html
		-	videos: https://www.youtube.com/c/R4DSOnlineLearningCommunity  

####	Blogs
  -  https://towardsdatascience.com
  -  R-Blogger
	-  \url{https://rweekly.org/}{rweekly.org}

####  R, the Language: Functional, Standard and Non- Evaluation, Environments, Call Stacks:

  *  Chambers (2008) "Statistics & Computing" (much coverage of R internals)
	\url{https://files.slack.com/files-pri/T6UC1DKJQ-F016BP8QPMG/download/john-chambers-software-for-data-analysis-programming-with-r.pdf?origin_team=T6UC1DKJQ}
  *  Gaslam, Brodie - blog - several good posts
    *   NSE:  https://www.brodieg.com/2020/05/05/on-nse/
    *   HP Calculator & Reverse Polish!  https://www.brodieg.com/2019/01/11/reverse-polish-notation-parsing-in-r/
    *   Side Effects, Macros:  https://www.brodieg.com/2019/10/30/visualizing-algorithms/
  * Gupta, Suraj - How R Finds objects: https://blog.obeautifulcode.com/R/How-R-Searches-And-Finds-Stuff/
  * Rnews - Lumley, Macros in R:   https://www.r-project.org/doc/Rnews/Rnews_2001-3.pdf
  * Rnews - 2001-2008 has lot of good articles


### Other book stats/R books:

  *  Hannay (=rbassett) read, (avoid pkgs ch 11, 12) | https://faculty.nps.edu/rbassett/_book/
  *  Ismay modern dive (2020)
  *  Kaplan (2017) ch 6.5 https://dtkaplan.github.io/SM2-bookdown/  (wordy,
	but exposes nuances)
  *	 Kurz: Statistial Rethinking reCoded (Bayesian)
  *	 Lane se(b_hat)
  *	 Matloff(2020) book
  *	 Mcelreath (videos)
  *	 PENG  | 	art of ... (2017) ch 6.5 ( https://bookdown.org/rdpeng/artofdatascience/) | r4ds			 (2019)	ch 9.5
  * 	mosaic ch 5.6, ch 24

### More advanced regession/modeling books

  -  Shalizi:  excellent:
    -  (2019) http://www.stat.cmu.edu/~cshalizi/TALR/ -deeper/more explanatory. By Ch 11, use of gradient f, matrix derviatives ....
    -  Shalizi http://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/ADAfaEPoV.pdf    
    -  http://www.stat.cmu.edu/~cshalizi/mreg/15/  
  -  Davidson (Econometric) -  Ch 1, 2
  - **ISLRv2:**  (book) https://web.stanford.edu/~hastie/ISLRv2_website.pdf
		-	videos: https://www.youtube.com/c/R4DSOnlineLearningCommunity 
  -  MATLOFF (1st book) |	ch3 - lot of useful prproperties of x,y  | 	ch 7  - affine transformations
  *  Efron, Hastie "Computer Age Statistical Inference"  (advanced, but
      chapter intros put techniques into perspective), no R.
  *  Kuhn (2019): https://bookdown.org/max/FES/
  *  RAFAEL  			dsbook - ch 17.4, ch 18.3.4
  *  **Roback/Legler Beyond Multiple Linear Regression: (2021)**_ https://bookdown.org/roback/bookdown-BeyondMLR/
      (Replaces BYSH) introduces likelihood; ch6 - logistic worked problem
  *	 Siegrist (aka random services.org) 
    * random| (3)expected value 1..11 and 	|(5) random samples 1-8 (t-dist)
  * Taubes, linear alg, statistics,  http://people.math.harvard.edu/~knill/teaching/math19b_2011/handouts/chapters1-19.pdf
      Biology?  math?  probability?   Think this is really an ideas book; not
      as easy as may appear.
	*  UCLA:  Mixed Models - intro:  https://stats.oarc.ucla.edu/other/mult-pkg/introduction-to-linear-mixed-models/

####	Algorithms & ML
  -  Berkeley, excellent glossary: https://www.stat.berkeley.edu/~stark/SticiGui/Text/gloss.htm
  -  Berkeley CRASH 
  -  Compeau:
     -  great ideas book! http://compeau.cbd.cmu.edu/
     -  http://compeau.cbd.cmu.edu/programming-for-lovers/ cmu -	ch 8, 9 esp collinear.  
  -  Boehmke Hands on ML | https://bradleyboehmke.github.io/HOML/ Ch 4,5
  -  Deisenroth, Faiesel et al | Math4ML *book | linear alg book, regression, 2nd level
  -  Higgens "Practical R Info?"
	-	Huntington "The Effect Book"
	-	mcelreath: https://github.com/rmcelreath/stat_rethinking_2022 (videos)
	-	Molnar, "Interpretable ML"
	-	SciLearn
	-	Thomas,  Math for ML  ... good lin alg, but quickly gets advanced.  https://gwthomas.github.io/docs/math4ml.pdf
	-	mcelreath: https://github.com/rmcelreath/stat_rethinking_2022 (videos)
  -	https://www.tmwr.org/

#### Bayesian

	-  Downey, Allen "Thinking Bayes" https://www.greenteapress.com/thinkbayes/thinkbayes.pdf
	-	 Johnson, Ott et al:  https://www.bayesrulesbook.com/index.html
	-  paulvanderlake (many R resources) 2012 ThinkBayes


#### Shiny
	-	R, javascript + shiny https://book.javascript-for-r.com/
	-	Hadley, https://mastering-shiny.org/
	-	https://engineering-shiny.org/
	-	HTTP Testing (book) https://books.ropensci.org/http-testing/


#### Linear Algebra (as mathematics)

  *  Beezer Linear Algebra (easier?)
  *  Herve Adbi | lin alg| no R, no stat, starts simple but gets to decomposition.
  *  Strang, Linear Algebra (classic)
  *  Artin, Michael "Algebra"  - readable ?
  *	 Friendly - R Pkg linear algebra
  *  Kazan |  normal equations


#### Intro to Linear Alg & Models, 

  *  Kuiper, Shonda: simple, clear:   video: https://www.youtube.com/watch?v=jQkK0XMrAdM
  *  Race, Shaina gentle intro to lin alg:, https://shainarace.github.io/LinearAlgebra/index.html 
  *  Thomas, Garrett, Math for ML, Berkeley  https://gwthomas.github.io/docs/math4ml.pdf
  *  Bendixcarstensen.com, with R & matrix models (practical; try not use api pkg) http://www.bendixcarstensen.com/APC/linalg-notes-BxC.pdf
  *	 Rafael genomics - Chapter 4 matrix  
   

####  Latex (.tex, latex, not knitr, markdown, pandoc)

  *  [https://learnbyexample.github.io/customizing-pandoc/](Good tips)
  *  \href{https://ctan.math.illinois.edu/info/lshort/english/lshort.pdf}{Not So Short Introduction}
  *  Latex:  Latex in 24 hours (iPad)
  *  https://mirrors.rit.edu/CTAN/info/beginlatex/html/intro.html#intro
  *  wikibooks:     https://en.wikibooks.org/wiki/LaTeX/Document_Structure
  *  http://ctan.imsc.res.in/info/first-latex-doc/first-latex-doc.pdf
  *  https://texfaq.org/FAQ-man-latex
  *  LuaTex Manual:   http://www.pragma-ade.com/general/manuals/luatex.pdf 
  *  LuaTex Background Overleaf:  https://www.overleaf.com/learn/latex/Articles/An_Introduction_to_LuaTeX_(Part_1)%3A_What_is_it%E2%80%94and_what_makes_it_so_different%3F
  *  Fontspec pkg (for LuaTex) https://mirrors.rit.edu/CTAN/macros/unicodetex/latex/fontspec/fontspec.pdf
	*  Video:   Michelle ... (very clear!)
	

	Math Mode

  *  AMS math  documentation      https://www.latex-project.org/help/documentation/amsldoc.pdf
	*  https://www1.cmc.edu/pages/faculty/aaksoy/latex/latexthree.html#
	*  http://web.mit.edu/rsi/www/pdfs/math.pdf
	*  https://www.atqed.com/latex-column-vector

### Good Technical Reading
  *  Linux:  Archiwiki, Debian, FreeBSD
  *  Gross, Ash et al "Elliptical Tales" - very readable, but must think!
      (515.983 | ASH | 2012)
	*  Linux- insides: https://0xax.gitbooks.io/linux-insides/content/
  *  Seefeld, et al Biology & R | https://cran.r-project.org/doc/contrib/Seefeld_StatsRBio.pdf

#### ZSH
  *  Janssens, DS at Command Line: https://www.datascienceatthecommandline.com/2e/  
        Great way to improve zsh, CLI skills.
	*		Rothgar  Mastering ZSH: https://github.com/rothgar/mastering-zsh 


### Videos
  *   [maththebeautiful - Paul?]( https://www.youtube.com/c/MathTheBeautiful/playlists )
  *   [Bright Side of Math]( https://www.youtube.com/channel/UCdwo4k1RQHTcq_-WS7Cazqg ) 
  *   [3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)
  *   Zedstatistics
  *   [Chris Mack](http://www.lithoguru.com/scientist/statistics/course.html) -
      practical R, models
  *   [Statistics Globe](https://statisticsglobe.com/r-programming-language)
  *   [Statquest - Josh Starmer](https://statquest.org/video-index/)
	*		Edward Malthouse - is careful with assumptions.
	*		Prof Christoph Scherber -03
	*		Lorenzo
	*		Sadum
	*		Tom Raby
	*		Jazon Jiao (Alg + Regression)

<!--
================================================================================================================================
->

\newpage

\footnotesize

####  Joins (merge)
  -  https://rdatatable.gitlab.io/data.table/index.html
  -  https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right?noredirect=1&lq=1
	-  https://jozef.io/r006-merge/
	-
https://gist.github.com/nacnudus/ef3b22b79164bbf9c0ebafbf558f22a0  
https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right  
https://stackoverflow.com/questions/12773822/why-does-xy-join-of-data-tables-not-allow-a-full-outer-join-or-a-left-join  
https://github.com/LucyNjoki/R-LadiesAbuja_Data-Manipulation-with-data.table-in-R/issues/3#issuecomment-1097736781  
https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15  
https://stackoverflow.com/questions/25430986/create-nested-data-tables-by-collapsing-rows-into-new-data-tables  
https://stackoverflow.com/questions/67261777/data-table-join-is-hard-to-understand  
https://stackoverflow.com/questions/54312225/which-data-table-syntax-for-left-join-one-column-to-prefer/54313203#54313203  
https://rdatatable.gitlab.io/data.table/  
https://jozef.io/r006-merge/  
https://themockup.blog/posts/2020-09-04-10-table-rules-in-r/  
https://github.com/TysonStanley/tidyfast  
https://mkmanu.wordpress.com/2016/04/08/working-with-data-frames-in-r-joins-and-merging/  
https://stackoverflow.com/questions/34124928/can-i-use-the-r-data-table-join-capability-to-select-rows-and-perform-some-opera  
https://rpubs.com/ronasta/join_data_tables  
https://web.archive.org/web/20131114060032/http://rwiki.sciviews.org/doku.php?id=tips%3adata-frames%3amerge  
https://johnmackintosh.net/blog/2021-03-22-some-data-table-tips/  
https://rstudio-pubs-static.s3.amazonaws.com/52230_5ae0d25125b544caab32f75f0360e775.html  
https://github.com/ggrothendieck/sqldf#readme  
https://cran.r-project.org/web/packages/dplyr/vignettes/two-table.html  
https://thoughtbot.com/blog/back-to-basics-sql  
https://sqlzoo.net/wiki/The_JOIN_operation  
https://martinctc.github.io/blog/using-data.table-with-magrittr-pipes-best-of-both-worlds/  

### APIs and R


####    Longer Reading/Documentation
  *  [Gargle docs include discussion of a few Google Cloud features](https://gargle.r-lib.org/articles/get-api-credentials.html)
  *  [Mozilla MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP)
  *  [Request body](https://stackoverflow.com/questions/978061/http-get-with-request-body)
  *  https://oauth.com (Aaron Parecki)
  *   web technologies, including RESTFUL, https://www.se.rit.edu/~swen-344/expectations/
  *  [RFC Specs](https://www.rfc-editor.org/)
  *  JSON - https://json-schema.org/

\href{http://www.overleaf.com}{Something Linky} 

####    Videos

  *  \href{https://www.youtube.com/watch?v=TE66McLMMEw}{Anson, Getting Google API/Oauth2 setup.}
  *   [Griffith](https://www.youtube.com/watch?v=iLVoA1DTE60) Curl to make
        resquests.
        ggmaps  Google Maps API https://www.youtube.com/watch?v=Of_M4kcE9yM&list=PLbcglKxZP5PN07Vw-0ukcDJCxFGY2Crgc
  *   [freeCodeCamp](https://www.youtube.com/watch?v=VywxIQ2ZXw4) Postman Intro.
  *   [Oauth 2.0 - Explain like I am 5] (https://www.youtube.com/watch?v=hHRFjbGTEOk)
  *   \url{https://www.youtube.com/watch?v=rhi1eIjSbvkh} Basic Authentication: urlencode, user:pass, how browser responds, TLS
  *   Curl's Creator https://youtu.be/I6id1Y0YuNk?list=PLbcglKxZP5PN07Vw-0ukcDJCxFGY2Crgc
  *   Postman and GitHub: https://youtu.be/AfuL7AFpFmQ?list=PLbcglKxZP5PN07Vw-0ukcDJCxFGY2Crgc
  *   Plumber::,R, api https://www.youtube.com/watch?v=J0Th2QRZ7Rk
	*		R4DS all videos:  https://www.youtube.com/c/R4DSOnlineLearningCommunity

CRAN Task Views:  Web Technology & Services: https://cran.r-project.org/web/views/WebTechnologies.html
  *  (R & Dropbox) https://github.com/karthik/rdrop2 (2020)
  *  (R & Predictit) https://github.com/kiernann/predictr

Vocabulary  (also:   [https://developer.mozilla.org/en-US/docs/Glossary](https://developer.mozilla.org/en-US/docs/Glossary) )     

####    HTTP, JSON, RFC and Web Technologies

##### Curl:   
  *  [https://everything.curl.dev/](https://everything.curl.dev/)  
  *  https://stackoverflow.com/users/93747/daniel-stenberg
  *  https://daniel.haxx.se/blog/

##### HTTP
  *  Command Line book:      https://datascienceatthecommandline.com/2e/index.html
  *  JSON   https://cran.r-project.org/web/packages/jsonlite/index.html
  *  HTTP protocol MDN https://developer.mozilla.org/en-US/docs/Web/HTTP
  *  HTTP Header Fields https://en.wikipedia.org/wiki/List_of_HTTP_header_fields, Media types (MIME):   https://www.iana.org/assignments/media-types/media-types.xhtml
  *  HTTPS,  HTTP over TLS or SSL:  https://en.wikipedia.org/wiki/HTTPS 
  *  HTTP  mentioned by Hadley Wickham:
    -  https://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177
    -  https://www.jmarshall.com/easy/http/
  	*	https://docs.python-requests.org/en/master/user/quickstart/

Media Types (was MIME): https://en.wikipedia.org/wiki/Media_type   
                        https://docs.github.com/en/rest/overview/media-types
##### RFC  
  -  RFC 2616 HTTP 2.1  https://www.rfc-editor.org/rfc/rfc2616  
  -  RFC 2617 Basic Authentication https://www.rfc-editor.org/rfc/rfc2617  
  -  RFC 3986 + RFC 8820 URI/URL
  *  RFC 6749 OAUTH 2.0 https://www.rfc-editor.org/rfc/rfc6749  
  *  RFC 6750 Bearer Token: https://datatracker.ietf.org/doc/html/rfc6750  
SOAP https://en.wikipedia.org/wiki/SOAP
URI  https://en.wikipedia.org/wiki/Uniform_Resource_Identifier


#### OAUTH 2.0,  Security , Authentication

  *  Token, Service Account:  https://gargle.r-lib.org/articles/get-api-credentials.html#service-account-token
  *  OAuth 2.0 Protocol (https://datatracker.ietf.org/doc/html/rfc6749)  
  *  oob (out-of-band)  https://docs.auth3.dev/grant-types/urn-ietf-wg-oauth-2.0-oob (use their
  identity server for standard RFC methods)
  *  openSSL
  *  https://developer.okta.com/
  *  https://oauth.net
  *  microsoft/open_id:  https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-protocols-oidc
  *  auth0.com: https://auth0.com/docs/get-started
	*  openID:  https://en.wikipedia.org/wiki/OpenID

#### Popular APIs 
  *  GitHub API https://docs.github.com/en/rest
  *  GitLab API https://vulpes.cba.mit.edu/help/api/index.md
  *  Google Cloud  https://cloud.google.com/
  *  Google Cloud Platform  https://console.developers.google.com/products https://en.wikipedia.org/wiki/Google_Cloud_Platform
  *  Spotify (api + authorization): https://developer.spotify.com/documentation/general/guides/
  *  Spotify & Postman:  https://www.youtube.com/watch?v=5TNQf2gBrd8
  *  Dropbox: https://www.dropbox.com/developers
  *  Predictit.org: https://www.predictit.org/api/marketdata/all/  (xml dump,
  must write you own functions)
  *  ConstantContact: https://v3.developer.constantcontact.com/



####	Google Specific
  *  Google Cloud Platform (GCP)
  *  Google Identity (https://developers.google.com/identity)
  *  Google OAuth2.0 implementation (https://developers.google.com/identity/protocols/oauth2#installed)
  *  google people api  https://developers.google.com/people/
  *  google web fonts api
  *  For Youtube (installed apps, like R): https://developers.google.com/youtube/v3/guides/auth/installed-apps


#### R and related

  -  curl::  (based on C library used in cURL) https://jeroen.cran.dev/curl/index.html
  -  cloudyR project
  -  curlconverter:: https://github.com/hrbrmstr/curlconverter
  -  fakerapi.it fakerapi https://fakerapi.it/en
  -  gargle::   good intro (https://www.tidyverse.org/blog/2021/07/gargle-1-2-0/)
  -  httptest2:: https://enpiar.com/httptest2/index.html
  -  httpuv, libuv
    -  https://cran.r-project.org/package=httpuv
    -  https://nikhilm.github.io/uvbook/introduction.html  (low-level, C code, but good sense of what is happening)
  -  httr2::
    -  github https://github.com/r-lib/httr2
    -  cran https://cloud.r-project.org/web/packages/httr2/index.html
  -  plumber

####    RESTFUL API


  -  OpenApi (api doc rules:  openapi.json or openapi.yaml; was Swagger) https://oai.github.io/Documentation/specification.html
  -  Postman
    -  30-day tutorial: https://www.postman.com/postman/workspace/f1c6b0a9-b930-4165-9aa4-f655dd7051b5/overview
  -  https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm;
  -  https://en.wikipedia.org/wiki/Representational_state_transfer#Architectural_constraints
  -  https://restfulapi.net/
  -  http://www.cse.lehigh.edu/~spear/cse216_tutorials/tut_spark/index.html
  -  Openstack (Cloud) https://docs.openstack.org/api-quick-start/

###	NEOVIM/LUA

####	Config
  *	https://neovim.io/doc/user/quickref.html#option-list
  *	Code Ex:	| Joel | goal: understand ! |https://github.com/whatsthatsmell/dots/tree/master/public%20dots/vim-nvim  
  *	https://cj.rs/blog/my-setup/nvim-0-5/  | go to playlists | view all
	playlists | choose by length, date etc. 
  *	Statusline: https://elianiva.my.id/post/neovim-lua-statusline#active-statusline
  *	https://www.jakewiesler.com/blog/getting-started-with-vim | Jake | good
	but limited.
  *	blog + https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
  *	blog + https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
  *	Ex: 	https://gitlab.com/mcepl/vimdir/-/tree/master/plugin	
  *	Ex:	https://github.com/samuelludwig/nixrc/tree/master/modules/user/nvim/lua/dot
  *	300 line challenge: 	https://neovim.discourse.group/t/the-300-line-init-lua-challenge/227
  *	https://benfrain.com/refactor-your-neovim-init-lua-single-file-to-modules-with-packer/
  *	https://github.com/nanotee/nvim-lua-guide
  *	kickstart:  https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

####	Lua
\begin{enumerate}
  \item https://www.lua.org/manual/5.4/
  \item	http://www.lua.org/pil/contents.html (1st ed)
  \item	https://learnxinyminutes.com/docs/lua/ (learn X in Y)
  \item	http://lua-users.org/wiki/LuaDirectory (lua tutorial, wiki)
	\item Lua by example:		https://luabyexample.org/
\end{enumerate}

####	Plugins

<!--

Rscript -e "rmarkdown::render(<file>, output_format='pdf_document')"
vim:linebreak:nospell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->
