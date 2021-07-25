<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->

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
        mathjax: default
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  2   
    fontsize: 10pt   
    geometry: margin=0.5in,top=0.25in   
    TAGS:  technical_notes
---
as of \today:  
    *  To mix latex and .md, must go with pdf, either pandoc or knit  
    *  Add r, knitr code to YAML?   then must render as .RMD file
    *  I do not know how to embed latex, produce html or md (github flavor).  

  PDF   [ignores html, css; also ignores YAML header (pandoc & ::render()]

  NOTE:   .tex uses a .sty which I do not have.  USE  knitr:: (with TinyTex
  to locate and install that .sty file)  

TODO: pandoc may think 2nd `%` is both relative directory and file name

!pandoc % -f markdown -o %.pdf

!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf 
!pandoc % -f markdown  --pdf-engine xelatex -H chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf


  HTML [ignores latex]  

  *  !pandoc % -f markdown -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out/out.html 



 GITHUB:  *.md display nicely?  [ignores latex]

-H header  

-V or --variable  
--pdf-engine=xelatex  

<!--    this is for knitr:: ONLY

--> 


PANDOC EXAMPLES:  
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/  

MARKDOWN GUIDE:  
https://www.markdownguide.org/basic-syntax/  

\newpage  

[code](~/code)
[docs](~/docs)
[render_output](~/technical_notes/001_render_output.md)
[skeleton](~/.config/nvim/templates)
 
```{r skeleton}

file="/home/jim/.config/nvim/templates/skeleton.Rmd"
```

```{r render, eval=FALSE, include=FALSE 	} 

# from ~/.Renviron
output_dir  <- Sys.getenv("OUTPUT_DIR")
output_dir
# TODO:  file is found when knitr runs (see above)

# file must be of form:
# dir/name_of_this_file    where dir is relative to project root

## In doubt?   USE  knitr and do not waste time!

## Want to embed Latex, stick to pdf output (html?   never sure!)

# NOTE:   .tex only works with PDF
# NOTE:    tex will NOT work with html
# NOTE:    md_document is considered HTML, and latex commands may fail.
# in general, pdf will look nicer


## GOOD PRACTICE:
#  Refer to files relative to project root, which should remain as working dir.
#  So why using `here` ?

{
file  <- "" 
file  <- basename(file)
file  <- here("rmd", file)
file
}


## Want github to display nicely rendered output?
##  *  include md_format
#   *  include output_dir = "out"
#   *  if .gitignore balks,  then add !out/**   to close .github

rmarkdown::render(file,
    #output_format = "pdf_document",
    #output_format = "html_document",
    output_format=c("html_document", "md_document"),
    #output_dir = "out",
    output_file = "out")

# ==========================================
#  Example 1:  pdf| same name as source file | in wd |
# ==========================================

rmarkdown::render(file,
    output_format = "pdf_document")

# ============================================================
#  Example 2:  pdf | same name as source file | in pdf/|
# ============================================================
# pdf/  will be created

if (knitr::is_latex_output())  (
rmarkdown::render(file
    output_format = c("pdf_document") ,
    output_dir = "pdf")
)

if (knitr::is_html_output()) (

rmarkdown::render(file,
    output_format = c("html_document", "md_document"), 
    output_dir = "html")

)
```

