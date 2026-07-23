---
name:  README.md
description:  Render *.qmd, *.typ
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

## How to rneder *.typ to pdf or html?
- At present use cli **typst**
