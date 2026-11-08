---
Title: Simple CLI Cheat Sheet
Topic: tools
Updated: 2026-11-08
Sources: tech_notes (in-place notes, undated)
Raw: [110_simple_cheat.md](../../tech_notes/110_simple_cheat.md)
---

# Simple CLI Cheat Sheet

The source's stated purpose: the "Simplest possible command cheat sheet"; usage — "Should appear correct in github". For Typst it is pulled in with `read()`. It gathers one-screen recipes for document rendering, media download, editors, window manager, python environment, PDF viewer, and shell — git has its own article.

## pandoc: md → pdf (via typst)

```sh
pandoc *.md -o main.{pdf, md} -t typst
```

The notes flag the result: "hmmm, error, needs fallback font".

## yt-dlp

Search the first 10 YouTube hits for a phrase (the notes used 'shiny posit') and list titles/ids:

```sh
yt-dlp ytsearch10:'shiny posit' --get-id --get-title
```

## Doom Emacs: spelling

"flyspell + aspell for now (10/26)":

```
M-x doom/help-search-heading RET DoomModels :checker
M-x $                  # check current word
M-x ispell             # entire buffer or region
M-x flyspell-mode      # highlight misspelled words
```

## ex editor

From <https://users.ox.ac.uk/~martinw/unix/chap9.html>:

```
ex <file>
:1,$p                   # display all lines
:.                      # display current line
:i                      # insert at current line, 1
.                       # single period to end insertion
:w
:q
:ex <another file>
:5 s/the/The/           # line 5, make change
:6,7 d                  # lines 6,7 delete
:/<search-for-..../     # search
:h                      # now in help.txt
:1,5p                   # print lines (in help)
:q                      # return to edit
```

## i3

Reference: <https://devdocs.io/i3/>. To find the class of a window, type `xprop WM_CLASS` in a shell (WM_CLASS is literal), then click the target window (browser, emacs, calibre, ...); the class name is returned in the shell — "choose the 2nd string".

## python: uv and venv

Simplest per the notes: "use positron, do what it says, including environment" — then `pip install XXX` inside positron.

References: <https://docs.python.org/3/library/venv.html>; <https://github.com/mlflow/mlflow/issues/12478#issuecomment-2517567782>

```sh
mkdir <target>
uv venv                            # creates .venv
source .venv/bin/activate          # create and activate
uv pip install -r requirements.txt

uv init --package <mypackage>      # creates new dir and related files (not venv)
uv add <pkg1> <pkg2>               # adds dependencies
uv add "mcp[cli]>=2.0.0"           # require minimum version

python3 -m venv .venv              # install venv to .venv/
python3 -m venv <path>             # (9/26) use venv project-by-project for now
```

Usage: `uv [OPTIONS] <COMMAND>` — `-v` verbose, `-V` version; commands include pip, venv, run, init, sync.

## zathura

```
-f                        # open & find string
-v                        # version
-P                        # open at page number
F11                       # full-screen
:exec rm $FILE            # removes current file
```

## zsh

More in `~/code/make_project/` (210...):

```zsh
diff -y file1 file2
rm -i -- ^*.txt           # careful! deletes ALL except *.txt
l = (a,b)                 # list
for e in $l[@]; echo $e   # echo all
```

## See Also

- [Git commands](../git/git-commands.md)
