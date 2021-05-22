```{=html}
<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->
```
===\
PDF\
===

NOTE: .tex uses a .sty which I do not have. Therefore, NO PDF files
(update May 21, 2021 ... hmmmm, pandoc/pdf seems to work fine! use first
below)

-   !pandoc % -f markdown -o out/out.pdf\
-   !pandoc % -f markdown -t latex -H ../chapter_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o
    \~/Downloads/print_and_delete/out.pdf
-   !pandoc % -f markdown -t latex -H ../chapter_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf
-   !pandoc % -f markdown --pdf-engine xelatex -H chapter_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o
    \~/Downloads/print_and_delete/out.pdf

====\
HTML ====

-   !pandoc % -f markdown -V linkcolor:blue -V fontsize=11pt -V
    geometry:margin=0.3in -o out/out.html

==== GITHUB: \*.md display nicely? \[ignores latex\] ====

-H header\
-V or --variable\
--pdf-engine=xelatex

```{=html}
<!--    this is for knitr:: ONLY

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
---
-->
```
PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE: https://www.markdownguide.org/basic-syntax/

```{=tex}
\newpage
```
```{=tex}
\today
```
```{=html}
<!--   why?   latex failed to compile, wants $?  wants ]?
$$\mbox{ Render to pdf, use pdf output, use:  999999_render.Rmd}$$
-->
```
`\mbox{hello - but no box?}`{=tex}

### LOCKER

00-09 K/Household.\
10-19 Meds/Toilet.\
20-29 Summer.\
30-39 winter.

------------------------------------------------------------------------

### TUB 00

-   K- Tea Bags
-   Clean Plastic Bags

------------------------------------------------------------------------

### TUB 01 SUMMER

------------------------------------------------------------------------

### TUB 02 (small)

-   Toilet+DDS /Razor/Hand Soap/tooth supplies/mineral oil/skin

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### TUB 29

-   Towel/sheets (win + sum)/pillow cases/

------------------------------------------------------------------------

BOX 04 \* Office \* Misc/Green Paper/Empty Folders/LooseLeaf

------------------------------------------------------------------------

### BOX 05 (heavy)

        - Paper + Looseleaf 

------------------------------------------------------------------------

### TUB 05A (small)

-   Office: stickers/pads `\noindent`{=tex}
    ```{=tex}
    \rule{20cm}{0.4pt}
    ```

### TUB 5B (check)

-   Office: pens/clips/Index cards `\noindent`{=tex}
    ```{=tex}
    \rule{20cm}{0.4pt}
    ```

### BOX 55 (office)

-   Empty hanging folders/1-3 looseleafs/padding/ruler/steno/long acctg
    pad

------------------------------------------------------------------------

### BOX 06

-   Cleaning: TP/Liquid soap/sponge/spray/vinegar/baking soda/
-   Cleaning Gloves/Clean rags.

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BOX 07

-   MEDS `\noindent`{=tex}
    ```{=tex}
    \rule{20cm}{0.4pt}
    ```

### BOX 08 (kitchen) ?

-   Glass/Cooking/utensils/Food Storage/can opener/

### TUB 29

-   Towel/sheets (win + sum)/pillow cases/

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
BLUE SUITCASE

        * Empty Duffle 

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
BLACK SUITCASE

        * Winter Clothes:  winter/wool/hats/sweaters/gloves/shirt

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
YELLOW DUFFEL \* Office: VIP/Need 1st/locks/checks/car/keys
`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
TUB 30 - WINTER

        * shoes(good, Rockport) /1 flip-flop/
        * swim?
        * socks/pants/vest/sweats 
        * extra gloves(1 only), etc
        * Wool (dirty) 

Notes:

-   charger for China phone? (in China) use usb.

-   ```{=tex}
    \newpage
    ```

## FILES and FILE BOXES

```{=tex}
\today
```
### BLUE

-   Office supplies
-   Has room

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BEIGE/WHITE (smaller box)

-   Need 1st
-   China phone/money
-   CAR (title, repair)
-   Has room

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### PINK

-   Medical 2009 - 2019
-   24-hour urine
-   DDS
-   EYES
-   DDS Complaint
-   Row

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BROWN

-   Financial \<= 2018
-   TOW
-   ALZ
-   

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BLACK

-   Financial 2019, 2020
-   DDS 2019 -
-   ALZ
-   Supplies
-   Plastic Bags
-   

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BOX 100

-   misc office
-   tape
-   (batteries - none left)
-   

`\noindent`{=tex}
```{=tex}
\rule{20cm}{0.4pt}
```
### BOX 120

-   TEA
-   MEDS AM/MISC \`\`\`{r render} file \<-
    "\~/Downloads/print_and_delete/out" file \<-
    "00020_contents_storage_locker.md" \# use 999999_render.Rmd
    rmarkdown::render(file, output_format = "pdf_document",
    \#output_format = "html_document", output_file = "./out.pdf")

\`\`\`
