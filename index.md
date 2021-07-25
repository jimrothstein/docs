
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
    TAGS:  
---

!pandoc  % -f markdown --pdf-engine xelatex -H chapter_break.tex -V
linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o
~/Downloads/print_and_delete/out.pdf


 ====  
  HTML [ignores latex]  
 ====    

  *  !pandoc % -f markdown -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out/out.html 



<!--    this is for knitr:: ONLY

--> 


PANDOC EXAMPLES:  
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/  

MARKDOWN GUIDE:  
https://www.markdownguide.org/basic-syntax/  

\newpage  

[~/docs]
### Index for all docs/ files

#### medical(medical/)

#### misc (misc_files/)


#### back to code files (~/code/)
#### [back to code files](~/code/)
#### [back to code files2](/home/jim/code/)

#### back to docs (~/docs/)
#### to dotfiles(~/dotfiles/)
