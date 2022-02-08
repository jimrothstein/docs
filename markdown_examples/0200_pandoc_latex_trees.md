---
header-includes:
  - \usepackage{amssymb}
  - \usepackage{bbm}
  - \usepackage{threeparttable}
  - \usepackage{forest}
fontsize: 10pt   
geometry: margin=0.5in,top=0.25in   
TAGS:  math, latex, trees, forest
---

<!--  
as of August 2021
-PDF works
-HTML does NOT work

/home/jim/docs/markdown_examples/0200_pandoc_latex_trees.md

USAGE:  
!pandoc % -f markdown -t latex -o ~/Downloads/print_and_delete/0200_pandoc_latex_trees.pdf

-->

### This is .md document, with markdown + latex packages.  No R, no knitr. Only need pandoc and YAML for `header-includes`

Seems to work Great (pdf:  may need to tlmgr to install needed latex packages )

***

#### Latex:  draw trees
\begin{forest}
  for tree={
    fit=band,% spaces the tree out a little to avoid collisions
  }
  [things
    [cabbages, tier=vegetables
      [peaches, tier=fruits]
    ]
    [kings, tier=aristocrats]
    [sealing wax
      [queens, tier=aristocrats
        [carrots, tier=vegetables]
        [pineapple, tier=fruits]
        [aubergine, tier=vegetables]
      ]
    ]
  ]
\end{forest}

***

```{r setup, include=FALSE		}
Rmd chunks will make no sense.   
However .....

```



#### Raw latex
  *  REF:  rmarkdown-cookbook, pandoc will leave as latex
```{=latex}
\begin{tabular}{ll}
A & B \\
A & B \\
\end{tabular}
```

