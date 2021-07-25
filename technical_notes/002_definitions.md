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
[002_definitions.md](~/docs/technical_notes)
[code](~/code)
[docs](~/docs)
[render_output](~/technical_notes/001_render_output.md)
[skeleton](~/.config/nvim/templates)

 
```{r skeleton}

file="/home/jim/.config/nvim/templates/skeleton.Rmd"
```
## Misc R definitions:

`context`
When function returns, returns to what?  The context, meaning env, variable,
stack state etc.

```{r render, eval=FALSE, include=FALSE 	} 

# from ~/.Renviron
output_dir  <- Sys.getenv("OUTPUT_DIR")
output_dir

{
file  <- "" 
file  <- basename(file)
file  <- here("rmd", file)
file
}



rmarkdown::render(file,
    #output_format = "pdf_document",
    output_format = "html_document",
    output_dir = output_dir)

```

