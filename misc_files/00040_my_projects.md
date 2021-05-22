<!--
vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1


-->

<!--
set cul   "cursorline
cc=+1			"colorcolumn is 1 more than tw

!pandoc % -t latex -V linkcolor:blue -V fontsize=12pt -V geometry:margin=0.5in -o ~/Downloads/print_and_delete/out.pdf

-H header
-V or --variable
--pdf-engine=xelatex

PANDOC EXAMPLES:
https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

MARKDOWN GUIDE:
https://www.markdownguide.org/basic-syntax/

vim: to format all urls for md
s/https.*/[&]()/g

\newpage
-->

TODO:  Add Latex to this .md document (then pdf is best output choice).

USE:   999999_render.Rmd   

\textbf{reason why}

1.  **MASTER PROJECT LIST**

*   update weekly/print
*   avoid retyping older projects.
*   Latex ... improve over time.
*   USE knitr ... until latex/pandoc/lua wiz
*
2.  **Replicate/Sampling**
  *  r-bloggers, 2018/8
  *  CHEAT sheet


Code: 
0089
1050



2.  **Distill**
*  proceed 
*  t-test
*  latex
*  YAML notes
*  envir varibables
*   Purpose:  simple examples of USAGE

3.  **Ca vs Na (in foods)**


4.  **YAML/Publish**
  *  Consolidate:
      -  tex_only
      -  md_tex
      -  Rmd
      -  Rmd + tex _ md
      -  YAML_fcts
      -  TAGS
  *  Template - change for html/pdf
  *


5.  ***Tools*
  *  R package mgmt, 
  *  Is 00030_   (jimTools)  updating R correctly?
  *   If YES, call this from .sh file?
    
  *  renumber files.  
  *

  Code:
  085-
  085B_env
  088_pkg
  (jimTools) 00030
  (zsh) 071_ updateR  updateR  


6.  \textbf{Youtube api}
  * Auth code .... seems always need to rebuild, why?
  * Given all_playlists (tibble?) THINK:
    * get_total_playlist_count (vs get_count_all_playlists)
    * get_total_video_count (vs get_count_all_videos)
  * Given specific playlist
    * get_playlist_video_list
    * get_playlist_video_count

