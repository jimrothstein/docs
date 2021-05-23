---
title: "xxx_latex_md.Rmd"
date: "last updated  22 May 2021"
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
    keep_tex:  true 
    keep_md:  true  
fontsize: 10pt   
geometry: margin=0.5in,top=0.25in   
---


 ===  
  PDF  
 ===  

NOTE:   .tex uses a .sty which I do not have.  Therefore,  NO PDF files
(update May 21, 2021 ... hmmmm, pandoc/pdf  seems to work fine! use first
below)


  *  !pandoc % -f markdown -o out/out.pdf  
  *  !pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
  *  !pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf 
  *  !pandoc % -f markdown  --pdf-engine xelatex -H chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf


 ====  
  HTML
 ====  

  *  !pandoc % -f markdown                               -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out/out.html 


====
 GITHUB:  *.md display nicely?  [ignores latex]
====

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

\today

\\today

$\today$

$$\today$$

<!--   why?   latex failed to compile, wants $?  wants ]?
$$\mbox{ Render to pdf, use pdf output, use:  999999_render.Rmd}$$
-->

$$\mbox{hello - but no box?}$$

### LOCKER  
00-09     K/Household.  
10-19     Meds/Toilet.  
20-29     Summer.  
30-39     winter.  

***
### TUB 00

- K- Tea Bags
- Clean Plastic Bags

***
### TUB 01 SUMMER 

***
### TUB 02  (small)
* Toilet+DDS /Razor/Hand Soap/tooth supplies/mineral oil/skin

$$\noindent\rule{20cm}{0.4pt}$$
### TUB 29   
  * Towel/sheets (win + sum)/pillow cases/


```r
g  <- globalenv()
g
```

```
## <environment: R_GlobalEnv>
```

```r
c  <- environment()
c
```

```
## <environment: R_GlobalEnv>
```

```r
append  <- "exit now"
knitr::knit_exit(append=append)
```
exit now

