---
title: Template for .Rmd
output: 
  pdf_document:
#    latex_engine:  pdflatex
    latex_engine: xelatex
    toc:  TRUE
    toc_depth:  4
# if pdflatex
#fontfamily: comfortaa 

# if xelatex:
mainfont: DejaVuSerif.ttf

# if lualatex
# mainfont: Helvetica
fontsize: 12pt
geometry: margin=0.5in,top=0.25in
---


<!--  

commments 


!pandoc % -o ~/Downloads/print_and_delete/examples.html

/home/jim/.config/nvim/templates/skeleton.Rmd

-->


list?

- one 
- two
- three

***

list?
* one
* two
* three
*

*** 

list?
* one 
*
* two
*
* three
*

***
list?
-	one 
-	two 
-	three

***
list?
	-	one
	- two
	- three
	

***

>	is this block?
***

	
` code block ` 
*** 

### Verbatim quote

`this is a quote, but does not appear so`

`"this is also a quote and appears so."`


This is regular text.

>		But this should be an indented block.  And this also should be part of the
>		indent.   Let us add one more sentence to see if three or more sentenaces
>		are also in the block.    All have '>' in first column.
>
>
>

#### Use Ascii  code to generate character (here:  |)

&#124;


#### Tables

| Syntax      |     Description|
| ----------- |       ---:     |
| Header      |    Title       |
| Paragraph   |    Text        |

```{r knit_exit()} knitr::knit_exit() ```
 
