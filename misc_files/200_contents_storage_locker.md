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
    geometry: margin=0.4in,top=0.25in   
    TAGS:  locker, 
---
as of \today:  
    *  To mix latex and .md, must go with pdf, either pandoc or knit  
    *  I do not know how to embed latex, produce html or md (github flavor).  

 ===    
  PDF  
 ===  

  NOTE:   .tex uses a .sty which I do not have.  USE  knitr:: (with TinyTex
  to locate and install that .sty file)  


!pandoc % -f markdown -V geometry:margin=0.3in -o $OUT/%.pdf 
!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
!pandoc % -f markdown  -t latex -H ../chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf 
!pandoc % -f markdown  --pdf-engine xelatex -H chapter_break.tex -V linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/out.pdf
     


 ====  
  HTML [ignores latex]  
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
as of \today

### LOCKER      
00-09     K/Household.  
10-19     Meds/Toilet.  
20-29     Summer.  
30-39     winter.  
40-49
50-59     office.



### BOX 01
  *  Kitchen

\noindent\rule{20cm}{0.4pt}
### TUB 00

  *  Tea Bags
  *  Clean Plastic Bags

\noindent\rule{20cm}{0.4pt}
### TUB 01 SUMMER 

\noindent\rule{20cm}{0.4pt}
### TUB 02  (small)
  * Toilet+DDS /Razor/Hand Soap/tooth supplies/mineral oil/skin

\noindent\rule{20cm}{0.4pt}
### TUB 29   
  * Towel/sheets (win + sum)/pillow cases/

\noindent\rule{20cm}{0.4pt}
### BOX 04
  * Office
  * Misc/Green Paper/Empty Folders/LooseLeaf

\noindent\rule{20cm}{0.4pt}
### BOX 05 (heavy)
  *  Paper + Looseleaf 

\noindent\rule{20cm}{0.4pt}
### TUB 05A (small)

  *  Office:  stickers/pads

\noindent\rule{20cm}{0.4pt}
### TUB 5B (check)

  *  Office:  pens/clips/Index cards

\noindent\rule{20cm}{0.4pt}
### BOX 55 (office)
  *  Empty hanging folders/1-3 looseleafs/padding/ruler/steno/long acctg pad 

\noindent\rule{20cm}{0.4pt}
### BOX 06

  *  Cleaning:   TP/Liquid soap/sponge/spray/vinegar/baking soda/
  *  Cleaning Gloves/Clean rags.

\noindent\rule{20cm}{0.4pt}
### BOX 07

  *  MEDS
\noindent\rule{20cm}{0.4pt}
### BOX 08 (kitchen) ?

  * Glass/Cooking/utensils/Food Storage/can opener/

\noindent\rule{20cm}{0.4pt}
### TUB 29   
  * Towel/sheets (win + sum)/pillow cases/


\noindent\rule{20cm}{0.4pt}
### BLUE SUITCASE

 * Empty Duffle 

\noindent\rule{20cm}{0.4pt}
### BLACK SUITCASE

  *  Winter Clothes:  winter/wool/hats/sweaters/gloves/shirt

\noindent\rule{20cm}{0.4pt}
### YELLOW DUFFEL
  *  Office: VIP/Need 1st/locks/checks/car/keys

\noindent\rule{20cm}{0.4pt}
### TUB 30 - WINTER

  * shoes(good, Rockport) /1 flip-flop/
  * swim?
  * socks/pants/vest/sweats 
  * extra gloves(1 only), etc
  * Wool (dirty) 



\noindent\rule{20cm}{0.4pt}
### BOX 100
  * misc office
  * tape
  * (batteries - none left)


\noindent\rule{20cm}{0.4pt}
### BOX 120
  *  TEA
  *  MEDS AM/MISC

\noindent\rule{20cm}{0.4pt}

\newpage
## FILES and FILE BOXES
\today

### BLUE
  *  Empty (hanging folders only)
  *  Paper, looseleaf supplies (June '21) 

\noindent\rule{20cm}{0.4pt}
### BEIGE/WHITE (smaller box)
  *  Need 1st
  *  China phone/money/passport (charger for China phone? (in China)   use usb).
  *  CAR (title, repair)
  *  keys:  POB 2192 (one key)
  *  Has room
  
\noindent\rule{20cm}{0.4pt}

### PINK
  *  Medical 2009 - 2019
  *  24-hour urine
  *  (older) DDS
  *  (complaint) DDS 
  *  Row

\noindent\rule{20cm}{0.4pt}

### BROWN  
 *  Financial `<=` 2020
 *  TOW
 *  ALZ  (move to ALZ box)
 
\noindent\rule{20cm}{0.4pt}

### BLACK
  *  Financial current year 
  *  DDS 2019 - 
  *  EYES
  *  ALZ
  *  Supplies
  *  Plastic Bags


<!-- 

```{r render, eval=F, include=F}
file <- "0020_contents_storage_locker.md"
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
