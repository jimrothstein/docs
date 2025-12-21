
281_emacs_notes.typ

= NOTE:
in transition,
old:  280_emacs_notes.qmd
new:  281_emacs_notes.typ   

= TODO
- i3 and emacs can conflict.    SEE: https://sqrtminusone.xyz/posts/2021-10-04-emacs-i3/
- Under video, see Prot's HELP video
- Under ess-intro, see github website 

= HELP
M-x apropos-documenation eval \
M-x describe-bindings \
M-x describe-mode

#table(
  columns: (auto, auto),
  table.header(
    [keystrokes], [comment]
  ),
    [^h v  ......],[ ^h v display-line-number ( variable)], 
    [^h a  ......],[ ^h a eval   ], 
    [^h k  ......],[^h a F10      ],
    [^h f current-buffer], [] ,
    [^h f ess-eval-region], [help for emacs/ESS function)],
)

= LEARNING

// #link("url")[describe]
- #link("https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/")[Beginner])

#table(
  columns: (auto, auto),
  table.header(
    [comment], [url]
  ),
  ["comment"], ["url"],


  ["Beginner"], [#link("https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration")[Beginner-Protes basic emacs config]],
  ["Xahlee"], [#link("http://xahlee.info/emacs/how_to_read.html")[Xahlee - how to read]],
   ["comment"], [#link("https://nytimes.com")[nytimes.com]],
)

#table(
  columns: 2,
  table.header( [website], [url] ),
  // URLs extracted from the document text
  [], [#link("https://sqrtminusone.xyz/posts/2021-10-04-emacs-i3/")[https://sqrtminusone.xyz/posts/2021-10-04-emacs-i3/]],
  [], [#link("https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/")[https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/]],
  [], [#link("http://xahlee.info/emacs/how_to_read.html")[http://xahlee.info/emacs/how_to_read.html]],
  [], [#link("https://nytimes.com")[https://nytimes.com]],
  [], [#link("https://ess.r-project.org/manual")[https://ess.r-project.org/manual]],
  [], [#link("https://www.emacswiki.org/")[https://www.emacswiki.org/]],
  [], [#link("https://www2.lib.uchicago.edu/keith/tcl-course/emacs-tutorial.html")[https://www2.lib.uchicago.edu/keith/tcl-course/emacs-tutorial.html]],
  [nice elisp intro], [#link("https://github.com/chrisdone-archive/elisp-guide?tab=readme-ov-file#programming-in-emacs-lisp")[https://github.com/chrisdone-archive/elisp-guide?tab=readme-ov-file#programming-in-emacs-lisp]],
  [], [#link("https://gigamonkeys.com/book/")[https://gigamonkeys.com/book/]],
  [], [#link("https://github.com/noctuid/evil-guide")[https://github.com/noctuid/evil-guide]],
  [], [#link("https://github.com/daviwil/emacs-from-scratch/tree/8c302a79bf5700f6ef0279a3daeeb4123ae8bd59")[https://github.com/daviwil/emacs-from-scratch/tree/8c302a79bf5700f6ef0279a3daeeb4123ae8bd59]],
  [], [#link("https://protesilaos.com/")[https://protesilaos.com/]],
  [], [#link("https://protesilaos.com/codelog/")[https://protesilaos.com/codelog/]],
  [], [#link("https://stackoverflow.com/questions/2901198/useful-keyboard-shortcuts-and-tips-for-ess-r")[https://stackoverflow.com/questions/2901198/useful-keyboard-shortcuts-and-tips-for-ess-r]],
  [], [#link("https://github.com/ess-intro/ess-intro")[https://github.com/ess-intro/ess-intro]],
  [], [#link("https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-1.html")[https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-1.html]],
  [], [#link("https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html")[https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html]],
  [], [#link("http://www.cs.cmu.edu/~dst/LispBook/")[http://www.cs.cmu.edu/~dst/LispBook/]],
  [], [#link [Xahlee]("http://xahlee.info/emacs/how_to_read.html")[Xahlee]],
)


- [ESS Manual](ess.r-project.org/manual)
- [Emacs Manual]
- [emacswiki: (look for newbie | self-doc)](https://www.emacswiki.org/)
- [emacs, with explanatons!](https://www2.lib.uchicago.edu/keith/tcl-course/emacs-tutorial.html)
- [short emacs guide (1st time: omit lisp):](https://github.com/chrisdone-archive/elisp-guide?tab=readme-ov-file#programming-in-emacs-lisp)
- [practical: (REPL)- gigamonkeys](https://gigamonkeys.com/book/)
- [Evil, Read & re-read:](https://github.com/noctuid/evil-guide)
- [SFU] videos + web


= Videos
- daviwil:  emacs from scratch: videos + config
#link("
(https://github.com/daviwil/emacs-from-scratch/tree/8c302a79bf5700f6ef0279a3daeeb4123ae8bd59"),[emacs from scratch])
- Protesillaos, see HELP video
- tdhock (12 videos + R)

/*
= Blog
- #link(https://protesilaos.com/),[protesilaos] 
-  <https://protesilaos.com/codelog/>

= Shell
^x p e  for eShell \
^h i m Elisp RET (read manual) not working \

= Watch Every Command ! 

M-x global-command-log-mode \
M-x clm/open-command-log-buffer \


Create a footnote: [^1]

[^1]: This is footnote one.

= ESS / R
tips:  <https://stackoverflow.com/questions/2901198/useful-keyboard-shortcuts-and-tips-for-ess-r>
collection of ESS config/intros: <https://github.com/ess-intro/ess-intro> \
- got flycheck,  usethis::use-tidy_style working; lintr now auto works.
== table

#table(
  columns: (auto, auto),
  table.header(
    [comment], [url]
  ),
  ["comment"], ["url"],
   ["comment"], [#link("https://nytimes.com")[nytimes.com]],
)

= Quarto
M-x quarto-prese...
C-c C-c m  re-render

= LISP
Run lisp ?  or REPL:   open  ~/code/elisp_project/010_basic_elisp.el
[SICPv2](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-1.html)
- gnu elisp https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html 
- Toretzky Gentle Common Lisp http://www.cs.cmu.edu/~dst/LispBook/



quarto render <file.qmd> (uses quarto/typst cli to generate pdf)
quarto render 280_emacs_notes.qmd --to gfm --output 280_emacs_notes.md
*/