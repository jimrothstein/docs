<!--
only use for knit
---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 4
        toc_float: true
  pdf_document:   
    latex_engine: xelatex  
    toc: TRUE 
    toc_depth:  4   
fontsize: 10pt   
geometry: margin=0.30in,top=0.25in   
TAGS:  md,R_project_list
---

-->
<!--
this works:
!pandoc % -t pdf -s --toc --toc-depth=4 -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf


!pandoc % -s -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.html
!pandoc % -t latex --pdf-engine=xelatex -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -t latex --pdf-engine=xelatex -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.3in -o %.pdf
-->
As of \today | 0040_my_projects.md


###  **MASTER PROJECT LIST**
\noindent\rule{10cm}{0.4pt}


#### Deliverables
  *  mp3 package | finish testing.
  *  TAGS pkg
  *  youtube pkg |  Fix token
  *  R pkg mgmt tools: |  PRUNE: installed R packages |
  *  Blog
  *  envir cheat sheet/blog
  *  (longer term) merge book notes, from Advanced R, to clean examples.

#### Basics
  *  Git
      Clean repos | Sandbox | rebase
  *  vim
      fo writing | coding | reduce notes | study init.vim | TODO list | vimtips (email) 
  * lua, but slowly, minimal.
  *  regex
      Study examples; NO playing.
  *  R conditions
  *  DT
      Study examples; NO playing.
  *  S3  
      Find | study examples in base R | No playing. (Grolemund)
  *  Knit | Latex
      Fix template | Read Latex gottchas | spin ?  | No playing.
  *  R pkgs
      Read | Review structure, efficiencies, @tags, build process.
  *  Read Code | Study !so
  *  To better understand limits of R:  SEXP, .internal, hash table, "Reference
      objects" | Dirk's RCPP to construct SEXP, but in R | 
  *  Latex | learning enough to stay out of trouble, working with it | NO playing. | texfaq | more pandoc
      Ex:  forest (works, leave it alone)
  *  zsh | Read generally, wise to organize basic scripting summary.
 

#### **Misc R ToDO**
  *  microbench vs Sys.time
  *  Replicate/Sampling | r-bloggers, 2018/8
  *  Blog:  t-test, simple examples.
  *  envir variables (see also Pocket, using env=new.env() in knitr:   Gotcha)
  *  YAML/Publish | much of my code is MESS; clean up is little use | but a
      SUMMARY might be useful |  DO NOT WASTE TIME.
  *  R:  Future  **Ca vs Na (in foods)**
\noindent\rule{10cm}{0.4pt}
\noindent\rule{10cm}{0.4pt}
\noindent\rule{10cm}{0.4pt}



####  \textbf{Music}
  *  gm + Musicscore
  *  tabr (2nd choice)
\noindent\rule{10cm}{0.4pt}

### Math & Statistics
  *  Volumne I
  *  Volumne II

      Review the goals; for coding:  Things like simulation, 
      Topics:  Linear Algebra, Estimation, chi-squared, Moments, AMS

<!--

```{r render, eval=F, include=F}
# NOT an R or .RMD file,   do NOT expect code in YAML to run!
file <- "0040_my_projects.md"
file <- here("misc_files", file)
file


# use  999999_render.Rmd
rmarkdown::render(file,
                  #output_format = "pdf_document",
                  #output_format = "md_document",
                  output_format = "html_document",
                  output_dir = "~/Downloads/print_and_delete")

                  #output_format = "html_document",
                  output_file = "out/out")

```
-->
