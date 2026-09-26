### Cheat Sheet
110_simple_cheat.md
Experimental:   \  
PURPOSE:  Simplest possible command cheat sheet.\
USAGE:  Should appear correct in github\
in Typst:   use read()


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

Restore file to prior state \
Edit/save/commit/push
```
- git checkout <SHA> -- <file>
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

git log (SEE SMC 2.3 REF)
```
git log [ opts ] [revision - range] [ [--] <path>]

git log -p -2                        # last 2 commits
git log --pretty=format:'%h_ %ar'    # sha, n weeks
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




### python, uv
<https://docs.python.org/3/library/venv.html> \
<https://github.com/mlflow/mlflow/issues/12478#issuecomment-2517567782> \

```
python3 -m venv .venv           # Install venv to .venv/
python3 -m venv <path-to-target-dir> # (9/26) use venv project-by-project for now


uv init --package <mypackage>   # creates new dir and related files (not venv)
uv venv                         # in target directory
uv venv && source .venv/bin/activate      # create and activate

uv add <pkg1> <pkg2>            # adds dependencies


```


### zsh
```
diff -y file1 file2
rm -i -- ^*.txt                 # careful!  deletes ALL except *.txt
l = (a,b)                       # list
for e in $l[@]; echo $e        # echo all
```
