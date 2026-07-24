---
name:  README.md
description:  Render *.qmd, *.typplast ud
last update:  7/23/2026
---

## Where is my file?

- *.qmd in qmd/ is preferred to store NOTES
- *.typ in typ/ only for MATH or FANCY, as needed


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
