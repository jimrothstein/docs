vim:linebreak:spell:nowrap tw=78 fo=tqlnr foldcolumn=3 

#	Template for .md !

<!--
!pandoc % -t latex -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.5in -o ~/Downloads/print_and_delete/out.pdf

-H header
-V or --variable
--pdf-engine=xelatex

PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

-->
**To Run this** 

> pandoc 003_markdown_examples.md  -t latex
> ~/Downloads/print_and_delete/out.pdf
> No need for yaml.
>

Other useful pandoc commands: 

* -V geometry:margin=0.25in 
* -H 010_header.tex

---

<!-- link works, but no color or highlight --> 

[new york](http://nytimes.com)
list1?

- one 
- two
- three

***

list2?

*	one 
*	two 
*	three

*** 
list3?  

-	one 
-	two 
-	three

*** 
list4?

	-	one
	- two
	- three

***

>	is this block?

***
	
```
{
Code block, called fenced code block.
}
```
### Verbatim quote

`this is a quote`

`"this is also a quote"`


This is regular text.

>		But this should be an indented block.  

	 
<!-- 
# Title 1 
## Title 2 
### Title 3 
#### Title 4 
##### Title 5 
--> 

<!-- comment -->

<!-- horizontal line -->	

### Definition
:Defintion  This is definition of.  

: Defintion  This is definition of.   

:  Defintion  This is definition of.  

: Definition 1

line 4	(**note no empty line**)	   
	this is indfasdpfj  apsdfjasdofijsa  paijsdfp adsfpj paajfsdaplksjfs afads
	jk  a;kfjasd; f;asdf ;asdklfj a;skdjfads fs;j a;sldfkjds af; akljdsfsad
	asd;jf;lkj asfdjas;kldfj 
	
line 4A	(set tw=79, forces wrap) note:  1  blank line

	this is indfasdpfj  apsdfjasdofijsa  paijsdfp adsfpj paajfsdaplksjfs afads
	jk  a;kfjasd; f;asdf ;asdklfj a;skdjfads fs;j a;sldfkjds af; akljdsfsad
	asd;jf;lkj asfdjas;kldfj 
	
line 5	(use >>) 

	new para;lkadfj as ;klj fads;fkj ;kjlaf dsa;fj afdjadskfjs ;akjf sd;fj
	ajdf;la;skdfjd fj;

line 6 (Tab)

	This is line 6 with a tab.


***
### Verbatim quote

`this is a quote`

`"this is also a quote"`

---

### Blockquotes (insert > )

> ## Blockquoted header
>
> This is blockquoted text.
>
> This is a second paragraph within the blockquoted text.

