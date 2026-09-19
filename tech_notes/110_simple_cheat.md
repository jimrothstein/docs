### Cheat Sheet
Experimental:   \  
Purpose:  Simplest possible command cheat sheet.\
USAGE:  Should appear correct in github\

#### git

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


#### python, uv
<https://docs.python.org/3/library/venv.html>
<https://github.com/mlflow/mlflow/issues/12478#issuecomment-2517567782>

```
uv init --package <mypackage>   # creates new dir and related files (not venv)
python3 -m venv .venv           # Install venv to .venv/
python3 -m venv <path-to-target-dir>


uv add <pkg1> <pkg2>            # adds dependencies


```


