# 03_longest_substring.R
# TAGS: char, matching, 

##  SEE BASE 503_
match(what?, source) # returns index
match("b", c("a", "b", "c")) # [1] 2

duplicated
unique

any

Given string, find longest substring with no repeat.


# ---------------------------------------------------------------------------------------
Simpler problem, given string find position of each character that repeats earlier one.
# ---------------------------------------------------------------------------------------

a repeats at position 5
abcda


x=c(letters[1:5], "a")
x
y=unlist(strsplit(x, split=""))
y
y[y == y[1]]

pick a char, at postion 1
y[y == y[1]] # 0=error, 1=only 1, >1 yes, exists repoeat
length(y[y == y[1]])
# positions of matches
match(y, y[1])
# [1]  1 NA NA NA NA  1
match(y[1], y)
match("e", y)
# drop ist occurs, leaving remeinaer of string
y[-1]

# omits repeat
unique(y)
index of repeat?

examine characters AFTER
which(y > which(y == y[1]))
which(y == "a")
which(y == y)
y
