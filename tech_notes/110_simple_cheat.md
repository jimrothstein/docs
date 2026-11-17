### Cheat Sheet
110_simple_cheat.Mead
Experimental:   \  
PURPOSE:  Simplest possible command cheat sheet.\
USAGE:  Should appear correct in github\
in Typst:   use read()


### adb
  - use "adb -d" not "adb"
  - adb --help
  - adb shell <command>
  - adb shell df -h
  - adb shell ls /system/bin (available cmds)

  - adb -d push --sync * /sdcard/Music /
   -d to use emulator (when 2 devices), --sync only pushes newer files


### typst, markdown, documents

Render md to pdf, via pandoc
```
pandoc *.md -o main.{pdf, md} -t typst      # hmmm, error, needs fallback font
```

### yt-dlp

- 10 lines, phrase 'shiny posit'
yt-dlp ytsearch10:'shiny posit'  --get-id --get-title

### Doom emacs

Spell, use flyspell + aspell for now (10/26)
```
M-x doom/help-search-heading RET DoomModels :checker
M-x $                  # check current word
M-x ispell             # entire buffer or region
M-x flyspell-mode      # highlight misspelled works
```


### ex editor (https://users.ox.ac.uk/~martinw/unix/chap9.html)
```
ex <file>
:1,$p                   # display all lines
:.                      # display current line
:i                      # insert at current line, 1
...
...
.                       # single period to end insertion
:w
:q
:ex <another file>
:5 s/the/The/           # line 5, make change
:6,7 d                  # lines 6,7 delete
:/<search-for-..../
:h                      # now in help.txt
:1,5p                   # print lines (in help)
:q                      # return to  edit

```

#### git

git rebase (simple form)
- moves commits from `dev` branch to main,  after HEAD 
```
git rebase main
```

Show gitconfig
```
git config list
```

If pushed: CHANGE Last commit, keep same msg, must force
```
- git add
- git commit --amend -C HEAD 
- git push -f
```
If NOT pushed:
```
-
```

Restore file to prior state \
Edit/save/commit/push
```
- git checkout <SHA> -- <file>   # restores <file> to where it was at <SHA>
- git checkout <SHA>             # detached HEAD, git checkout - to return

- git show <commit>:<file>       # no detached HEAD, just prints file content

$ git checkout master             (1)    now on branch 'master'
$ git checkout master~2 Makefile  (2)    replace Makefile with version 2 commits back
$ rm -f hello.c                          accidentally delete a file
$ git checkout hello.c            (3)    recover lost file
```


List files ignored (uses .gitignore)
```
git check-ignore **/*
git check-ignore -v <path-to-file>    # lists ignored file, plus line in .gitignore
```

diff
```
git diff                             # green shows CHANGES, if you COMMIT
git diff HEAD                             # changes (green) in w dir since last commit
git diff HEAD~ HEAD                  # compare last commit with one prior; add (green) , delete (orange)
git diff HEAD --unified=0            # ONLY LINES deleted, added since(?) last commit
git diff <oldest> <newest>
git diff HEAD~ HEAD -- <file>        # recent change to one file
git diff <br> origin/<br>            # 1st do git fetch; compare local to origin
```
diff - local v remote
```
- git fetch                         # makes no changes locally, safe
- git diff main origin/main         # 
```

git pull gives errors
```
- abort
- fix, try: git diff <my-local-br> origin/<remote-br>              # my-local-br may be "main"
- pull again


```
```
git reset - NO, do not use          # use git restore
git restore                         # restore <file> as it was at <SHA>

```

git log (SEE SIC 2.3 REF)
```
git log [ opts ] [revision - range] [ [--] <path>]

git log -p -2                        # last 2 commits
git log --pretty=format:'%h_ %AM'    # sha, n weeks
git log --relative-date
git log --oneline -5                 # SHA, description, last 5 (TERSE)
git log --since=2.weeks
git log --until

NOTATION:       origin..HEAD         # after origin, before HEAD 
            HEAD ^origin         # -same-
```

.gitignore(SEE git check-ignore)
```
.gitkeep                            # git does not allowed empty dir; by convention ".gitkeep" is placeholder in empty dir
~/.gitignore                        # global, plus can have local .gitignore
git update-index --skip-worktree <file>    # (as of 2024) way to remove <file> from index (--skip-worktree: do not update)

```
#### squash
\<after-this-commit\>             This <SHA> will not change.
Run git rebase -i <after-this-commit>; except for final **pick***  change earlier picks to **s**

```
git rebase -i <after-this-commit>
```

### i3

https://devdocs.io/i3/
To find class of a window, in shell type: (WM_CLASS is literal, type as it is)

-xprop WM_CLASS

- then switch and click on browser window, or emacs, or caliber or whatever want the class
- in shell, class name will be returned, choose the 2nd string

```

```
### python, uv - pain in ...
- simplest:   use positron, do what it says, including environment
- use uv, not pip, 
- avoid "uv pip" - use uv alone

<https://docs.python.org/3/library/venv.html> \
<https://github.com/mlflow/mlflow/issues/12478#issuecomment-2517567782> \

```
USAGE: \
uv [OPTIONS] <COMMAND>
-v verbose
-V version

HELP: \
uv init -h
uv venv -h
uv run -h

<COMMAND>:  pip, venv, run, init, sync ...


NEW WAY (https://www.youtube.com/watch?v=AMdG7IjgSPM)
- uv init my_app  (creates dir, git, .toml ...)
- uv add pkgs  (pkgs, update *.toml, adds .venv, uv.lock*)
- uv add "mcp[cli]>=2.0.0"    (minimum version)
- uv tree (show depends)
- uv run main.py  ( runs code AND activates .venv )

- uv add -r <requirements.txt>   (if you have this filel)

OLD WAY
- create new dir
- python3 -m venv .venv (create vir dir named .venv)
- source .venv/bin   (activate)
- pip install pkgs
- create requirements.txt file (dependencies)

```

### zathura 
```
-f open & find str
-v version
-P open at pagenumber
F11 - full-screen


:exec rm $FILE # removes current file



```

### zsh / bash

SEE ~/code/make_project/   210...

<~/code/make_project/>
```
ll -R  code/try_things_here     # recursive dir
find ~/dotfiles  -name SKILL.md # 

diff -y file1 file2
rm -i -- ^*.txt                 # careful!  deletes ALL except *.txt
l = (a,b)                       # list
for e in $l[@]; echo $e         # echo all

```
