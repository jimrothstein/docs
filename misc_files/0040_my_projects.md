<!--
---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 2
        toc_float: true
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  2   
fontsize: 10pt   
geometry: margin=0.5in,top=0.25in   
TAGS:  md,R_project_list
---
-->

<!--
set cul   "cursorline
cc=+1			"colorcolumn is 1 more than tw

!pandoc % -t latex -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.5in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -t latex -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.3in -o out.pdf

For lazy:  use nvim `%` twice !
!pandoc % -t latex -o %.pdf


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
As of \today | 0040_my_projects.md

TODO:  If add Latex to this .md document, then pdf is best output choice.

USE:   To render, see 999999_render.Rmd  


1.  **MASTER PROJECT LIST**
*   update weekly/print
*   avoid retyping older projects.
*   Latex ... improve over time.
*   \textbf{USE knitr} ... until latex/pandoc/lua wiz
\noindent\rule{20cm}{0.4pt}

2.  **Misc R ToDO**
  *  PRUNE:  installed R packages
  *  knitr::purl()  .Rmd --> Rscript (and move to jimTools)
  *  Part of env() [below], best way to completely isolate code, but maintain
      access to attached libraries?  box::  callr()

2.  **Replicate/Sampling**
  *  r-bloggers, 2018/8
  *  CHEAT sheet
  *  vectorize functions 
     *  lapply vs colSums, for matrix
     *  mean (vector), but mean(list) where each e of list is num[]?
  *  lapply, vapply, sapply ... family
  *  map(vector, FUN) (purrr:: or functional)
Code: 0089 1050
\noindent\rule{20cm}{0.4pt}

2.  **Distill** ###USE Github, .pdf or .md(no latex)
\textbf{HOLD}
*  t-test
*  latex
*  YAML notes
*  envir varibables (see also Pocket, using env=new.env() in knitr:   Gotcha)
*   Purpose:  simple examples of USAGE
\noindent\rule{20cm}{0.4pt}
3.  **Ca vs Na (in foods)**
\noindent\rule{20cm}{0.4pt}
4.  **YAML/Publish**
  *  READ !
  *  Latex remains standard for typesetting?   Mathjax (html) not as precise.
  *  pdfTeX and related pdf*  CLI
  *  Knitr:: API
  *  Knitr::  Use of S3, objects, functions (vignettes)
      *  also vctrs:: Grolemund, Adv-R (ch 9, 10)
  *  Knitr::  use of child chunks, literate programming.
  *  Template - change for html/pdf
  *  Create .Rmd in code (00302_)
  *  Env and knitr:: see Pocket
  *  knitr::   debugging?
  *  Consolidate:
      -  tex_only
      -  md_tex
      -  Rmd
      -  Rmd + tex _ md
      -  YAML_fcts
      -  TAGS
\noindent\rule{20cm}{0.4pt}
5.  **Tools**
  *  R package mgmt, 
  *  Rscripts - put into jimTools/
  *  Updates working?
  *  renumber files.  

  Code: 085-/ 085B_env |  088_pkg (jimTools) | 00030 (zsh) | 071_ updateR  updateR  
\noindent\rule{20cm}{0.4pt}
6.  \textbf{Youtube api}
  * Auth code .... seems always need to rebuild, why?
  * Given all_playlists (tibble?) THINK:
    * get_total_playlist_count (vs get_count_all_playlists)
    * get_total_video_count (vs get_count_all_videos)
  * Given specific playlist
    * get_playlist_video_list
    * get_playlist_video_count
\noindent\rule{20cm}{0.4pt}
7.  \textbf{Ted}
  *  Part 1
  *  Part 5
\noindent\rule{20cm}{0.4pt}
8.  \textbf{Git}
  *  Simple use cases:   very helpful
  *  **Sandbox** (via zsh scripts)
  *  new OAUTH, Base64 encoding (subset of ASCII), read ghp, gho etc.
\noindent\rule{20cm}{0.4pt}
9.  \textbf{TAGS/DT}
  *  video - Tyson
  *  need more practice
  *  re-read various vignettes/examples
  *  CHEAT:  work through my simple examples, step-by-step
\noindent\rule{20cm}{0.4pt}
10.  \textbf{Music}
  *  gm + Musicscore
  *  tabr (2nd choice)
\noindent\rule{20cm}{0.4pt}
11.  \textbf{Cheat}
 * vector/lists/
 * lapply etc
 * S3
 * pandoc
 * YAML
 * searching !gh <>; rseek !so [r] etc
 * combine 00085/6  and 0085/6  
\noindent\rule{20cm}{0.4pt}

<!--

```{r render, eval=F, include=F}
# NOT an R or .RMD file,   do NOT expect code in YAML to run!
file <- "0040_my_projects.md"
file <- here("misc_files", file)
file


# use  999999_render.Rmd
rmarkdown::render(file,
                  #output_format = "pdf_document",
                  output_format = "md_document",
                  #output_format = "html_document",
                  output_file = "out/out")

```
-->
