---
Title:  003_markdown_examples (in ~docs)
Date:  14 DEC 2020
output:  
  pdf_document  
    pdf-engine:  xelatex
    number_sections:  true 
---

<!--
vim:linebreak:spell:nowrap tw=79 fo=tqlnr foldcolumn=3 
-->

<!--
!pandoc % -t latex --toc -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf

-H header
-V or --variable
--pdf-engine=xelatex

--toc for table of contents 

PANDOC EXAMPLES:
[https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/]()

MARKDOWN GUIDE:
[https://www.markdownguide.org/basic-syntax/]()

vim: to format all urls for md
s/https.*/[&]()/g

-->
*italics*

**To Run this** (block quote)

> pandoc 003_markdown_examples.md  -t latex
> ~/Downloads/print_and_delete/out.pdf
> No need for yaml.
>

Other useful pandoc commands: 

* -V geometry:margin=0.25in 
* -H 010_header.tex

[new york in color!](http://nytimes.com) <br>
Can't put text on newline?   add HTML linebreak

---


## numbering (use TABS, not spaces!)

1.  One
    1.  SubOne (`TAB` not space)
    2.  SubOne

2.  Two
    3.  Next
    4.  Last


1.  Latest Litholink (with very low dietary oxalate) suggests these paths:
    1. Is bulk of hyperoxaluria explained by  DIET?!   
    2.  For remainder, is there a hidden genetic possibility?
    3.  GI/Fat malabsorption  - where is this?
    4.  Other?
    5.  Five

2.  To verify latest Litholink:
  1.  Repeat asap with SAME diet 

3.  Dr.  Carl to obtain OHSU records ruling out genetic.
    Jim to collect prior diet records from 24-hour urines.

## lists  
list1? (- or *, same)

- one 
- two
- three

list (what's wrong with `one`)

	-	one
	- two
	- three

***
## Fenced:  3 examples
```
Code block, called fenced code block.
```
```r
Code block, called fenced code block.  Same, but r.
```

```json
Code block, called fenced code block. Same, but json.  (color?)
```

## Verbatim quote
`this is a quote`

`"this is also a quote"` (need double quotes)

<!--  
## Headers
# Title 1 
## Title 2 
### Title 3 
#### Title 4 
##### Title 5 
--> 

<!-- comment -->

<!-- horizontal line -->	

***
## Definitions (4 sp, then :)

Term One   

    :    Definition  This is definition of.  
    :    Another definition <br>
    :    Third Definition


***
## Blocks
left  
>	is this block?

>		But this should be an indented block.  

## Block blockquotes (indents)
line 4	

>	this is indfasdpfj  apsdfjasdofijsa  paijsdfp adsfpj paajfsdaplksjfs afads
	jk  a;kfjasd; f;asdf ;asdklfj a;skdjfads fs;j a;sldfkjds af; akljdsfsad
  asd;jf;lkj asfdjas;kldfj 
	
	
2 paragaphs in block

>	In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole,
filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy
hole with nothing in it to sit down on or to eat: it was a
[hobbit-hole](https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit
lifestyles"), and that means comfort.
>
>	In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole,
filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy
hole with nothing in it to sit down on or to eat: it was a
[hobbit-hole](https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit
lifestyles"), and that means comfort.

## Footnote

Here is a footnote reference,[^1] 

[^1]: Here is the footnote.

## Examples of list item + discussion: 
  - No bowel disease or bowel surgery.  
    Your NOTES are Correct.

TODO
  - (Blockquote, but blank line) High protein intake (PCR is high, 1.4g/kg/d).  
> Pt does not think high protein.   
>  Pt does not think so.  

>   Pt does not think  so.

  - (example: lazy indent)Low calcium diet.   
Pt says Not correct.   Patient believes diet rich in Calcium
  (dairy, etc) PLUS takes supplements.  Patient open to "clinical evaluation".
