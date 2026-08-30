---
name:  README.md
description:  Render *.qmd, embed *.typ
last update:  8/30/2026
---


## Authority
- Generally, use *.qmd* for single source of truth.
- Since gfm displays better in github, then use:
- quarto render <file.qmd> --to gfm    to generate the *.md*
- *.qmd*  remains latest version

## Typst v Quarto
- (7/26) Decision made NOT to use raw typst files.
- Easiest seems to embed {=typst} chunks in *.qmd and render as quarto files
- quarto render <filename.qmd> --to typst

## Directories for tech_notes  (at 8/26) 
tech_notes/   
 docs/ specially & saved rendered files (normally render files are in same directory as source) /  
 typst-quarto/ -- typst content inside *.qmd files (as NOTES, as MATH, as something special) /  
 qmd/  --  TODO: prune, review Probably older *.qmd files,   
 typst/ -- TODO: prune:  Mostly older typst files that should be embedded in *.qmd  

## Where is my file?

- tech_notes/ Most *.qmd files (with/without) embedded typst should be 
- tech_notes/typst-quarto - for math, typst_NOTES (embedded in *.qmd)*experiments, templates...
- ALSO:  ~/code/publish-project - Not for NOTES, but "final" or "wip" workproduct

## How to render *.qmd to  pdf?
```
quarto render *.qmd --to typst
```
- *.qmd, the preferred method is:  use quarto, .qmd file, with **format: typst**
-  Why?  format: typst works better than using latex, lualatex engines
- If need to use latex engines, use **format: pdf**



## Render *.qmd to html?
```
quarto render *.qmd --to html
```
- Use **format: html**
- typst engine does not support html
- 

## How to render *.typ to pdf or html?
- At present use cli **typst**


## How to convert *.typ to markdown?
```
pandoc file.typ -t markdown -o file.md 
```
- PROBLEM:  often much cleanup; worse lingering typt command (in the file.md) may badly trip quarto render.
