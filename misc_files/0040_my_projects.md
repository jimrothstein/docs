<!--  Yaml:  only for knitr

---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
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


###  **MASTER:  ONGOING **
\noindent\rule{10cm}{0.4pt}


#### Deliverables
  *  MP3
  *  TAGS: 
  *  YOUTUBE 
  *  R PKG MGMT TOOLS: 
  *  BLOG 
  *  ENVIR 
  *  MERGE ADV_R NOTES
  *  ZSH:  
  *  LUA:  


#### Basic Skills:  Code efficiently; more Reading
  *  Git
  *  vim
  *  Lua (see Hurrell video)
  *  REGEX (use PERL)
  *  R conditions
  *  R vectors, map(.x, .f)
  *  DT, Joins
  *  S3  
  *  Knit | Latex
  *  R pkgs
  *  Read Code | Study !so
  *  R:  SEXP, .internal, hash table, "Reference objects"  
  *  Latex 
  
#### **Misc R ToDO**
  *  microbench vs Sys.time
  *  Replicate/Sampling 
  *  Blog:  t-test, simple examples.
  *  R:  Future  **Ca vs Na (in foods)**
  *  github actions - r-lib.   1st READ, then implement.
  *  omni completion in vim??


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
