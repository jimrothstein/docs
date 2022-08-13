\footnotesize
as of \today  

```

file <- "table_of_contents_TEST.md"

template has \small font embedded

!pandoc % -f markdown --template ~/dotfiles/proposed_template.latex -V geometry:margin=0.4in --number-sections --toc --toc-depth=5 -V toc-title="Reading" --pdf-engine=lualatex -o out.pdf ; zathura out.pdf
```
\tableofcontents

#		Leval A

##	Levle 22

###	Level 3


####	Level 4

#####	Level 5


