### Cheat Sheet
Experimental:   \  
Purpose:  Simplest possible command cheat sheet.\
USAGE:  Should appear correct in github\

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
git diff HEAD~ HEAD                  # additions (green) in w. dir since last commit
git diff HEAD --unified=0            # ONLY LINES deleted, added since(?) last commit
git diff <oldest> <newest>
git diff HEAD~ HEAD -- <file>        # recent change to one file
git diff <br> origin/<br>            # 1st do git fetch; compare local to origin
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




#### python, uv
<https://docs.python.org/3/library/venv.html> \
<https://github.com/mlflow/mlflow/issues/12478#issuecomment-2517567782> \

```
uv init --package <mypackage>   # creates new dir and related files (not venv)
python3 -m venv .venv           # Install venv to .venv/
python3 -m venv <path-to-target-dir> # (9/26) use venv project-by-project for now



uv add <pkg1> <pkg2>            # adds dependencies


```


### zsh
```
diff -y file1 file2
```
