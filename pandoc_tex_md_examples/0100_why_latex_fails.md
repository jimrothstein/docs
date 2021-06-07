

### This is a markdown file (*.md).   No R.


### Today in LaTex:

>  \today


### newpage in LaTex:

>  \newpage

### both succeed with .pdf:
>  pandoc % -f markdown -o out.pdf


### but .html, `\today` is ignored, `\newpage` succeeds 
>  pandoc % -f markdown -o out.html


\textbf{bold}

### ** WHY?**



