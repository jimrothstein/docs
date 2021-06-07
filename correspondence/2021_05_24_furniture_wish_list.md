
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
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  2   
    fontsize: 10pt   
    geometry: margin=0.5in,top=0.25in   
    TAGS:  
---
as of \today:  
    *  To mix latex and .md, must go with pdf, either pandoc or knit  
    *  I do not know how to embed latex, produce html or md (github flavor).  

 ===    
  PDF  
 ===  

  NOTE:   .tex uses a .sty which I do not have.  USE  knitr:: (with TinyTex
  to locate and install that .sty file)  


  *  !pandoc % -f markdown -o out/out.pdf  
  *  !pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
  *  !pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf 
  *  !pandoc % -f markdown  --pdf-engine xelatex -H chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf


 ====  
  HTML [ignores latex]  
 ====    

  *  !pandoc % -f markdown -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out/out.html 


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


As of \today

### Furniture Wish List for 541 Willamette

  *  Spartan is ok
  *  Thrift shops usually better than new.
  *  What put in office now, will need to come out (August 31 - if this
      experiment fails.).
  *  Smaller stuff I can deliver on my own.



1.  2 rectangle tables (no odd circles); must hold computer, monitor etc. , 6-8
    feet long.

2.  2-3 basic chairs for work, good posture.

3.  small refrigerator (vegetables and assorted human biology experiments).

4.  small fan, to supplement a/c.   Can not blow papers.

5.  2 multi-plug surge protectors (a plus if has usb connector).

6.  (optional, should one appear) small laser printer.

7.  small audio speaker to connect to computer (not a boom box).

8.  desk light  (ceiling light, should be ok)

9.  2 VGA monitors (wide?)  ;   HDMI?

7.  More as I look around, but can do this myself.







