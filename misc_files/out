<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
-->

===  
PDF  
===

NOTE: .tex uses a .sty which I do not have. Therefore, NO PDF files
(update May 21, 2021 … hmmmm, pandoc/pdf seems to work fine! use first
below)

-   !pandoc % -f markdown -o out/out.pdf  
-   !pandoc % -f markdown -t latex -H ../chapter\_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o
    \~/Downloads/print\_and\_delete/out.pdf
-   !pandoc % -f markdown -t latex -H ../chapter\_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o out.pdf
-   !pandoc % -f markdown –pdf-engine xelatex -H chapter\_break.tex -V
    linkcolor:blue -V fontsize=11pt -V geometry:margin=0.3in -o
    \~/Downloads/print\_and\_delete/out.pdf

====  
HTML ====

-   !pandoc % -f markdown -V linkcolor:blue -V fontsize=11pt -V
    geometry:margin=0.3in -o out/out.html

==== GITHUB: \*.md display nicely? \[ignores latex\] ====

-H header  
-V or –variable  
–pdf-engine=xelatex

<!--    this is for knitr:: ONLY

-->

PANDOC EXAMPLES:
<https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/>

MARKDOWN GUIDE: <https://www.markdownguide.org/basic-syntax/>

\\today

$\\today$

$$\\today$$

<!--   why?   latex failed to compile, wants $?  wants ]?
$$\mbox{ Render to pdf, use pdf output, use:  999999_render.Rmd}$$
-->

hello - but no box?

### LOCKER

00-09 K/Household.  
10-19 Meds/Toilet.  
20-29 Summer.  
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

$$\\noindent\\rule{20cm}{0.4pt}$$ \#\#\# TUB 29  
\* Towel/sheets (win + sum)/pillow cases/

------------------------------------------------------------------------

BOX 04 \* Office \* Misc/Green Paper/Empty Folders/LooseLeaf

------------------------------------------------------------------------

### BOX 05 (heavy)

        - Paper + Looseleaf 

------------------------------------------------------------------------

### TUB 05A (small)

-   Office: stickers/pads

### TUB 5B (check)

-   Office: pens/clips/Index cards

### BOX 55 (office)

-   Empty hanging folders/1-3 looseleafs/padding/ruler/steno/long acctg
    pad

------------------------------------------------------------------------

### BOX 06

-   Cleaning: TP/Liquid soap/sponge/spray/vinegar/baking soda/
-   Cleaning Gloves/Clean rags.

### BOX 07

-   MEDS

### BOX 08 (kitchen) ?

-   Glass/Cooking/utensils/Food Storage/can opener/

### TUB 29

-   Towel/sheets (win + sum)/pillow cases/

BLUE SUITCASE

        * Empty Duffle 

BLACK SUITCASE

        * Winter Clothes:  winter/wool/hats/sweaters/gloves/shirt

YELLOW DUFFEL \* Office: VIP/Need 1st/locks/checks/car/keys TUB 30 -
WINTER

        * shoes(good, Rockport) /1 flip-flop/
        * swim?
        * socks/pants/vest/sweats 
        * extra gloves(1 only), etc
        * Wool (dirty) 

Notes:

-   charger for China phone? (in China) use usb.

-   

## FILES and FILE BOXES

### BLUE

-   Office supplies
-   Has room

### BEIGE/WHITE (smaller box)

-   Need 1st
-   China phone/money
-   CAR (title, repair)
-   Has room

### PINK

-   Medical 2009 - 2019
-   24-hour urine
-   DDS
-   EYES
-   DDS Complaint
-   Row

### BROWN

-   Financial &lt;= 2018
-   TOW
-   ALZ
-   

### BLACK

-   Financial 2019, 2020
-   DDS 2019 -
-   ALZ
-   Supplies
-   Plastic Bags
-   

### BOX 100

-   misc office
-   tape
-   (batteries - none left)
-   

### BOX 120

-   TEA
-   MEDS AM/MISC

\`\`\`{r render} file &lt;- “0020\_contents\_storage\_locker.md” file
&lt;- here(“misc\_files”, file) file

# use 999999\_render.Rmd

rmarkdown::render(file, \#output\_format = “pdf\_document”,
output\_format = “md\_document”, \#output\_format = “html\_document”,
output\_file = “out/out”)

\`\`\`
