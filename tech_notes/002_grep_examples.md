#!/bin/zsh

#   PURPOSE:    EXAMPLES of Basic GREP and regex (-E = Extended)
#   USAGE:      Use as CHEAT Sheet, not interactive, not as script 
#
#
```
#	Goal: remove far right portion of prompt (for clarity)
{
echo $RPROMPT
right_prompt=$RPROMPT
echo $right_prompt

# remeber to reset!
RPROMPT=
}

#### basic setup
{
dir=/home/jim/mp3_files/
}

<https://rubular.com/r/Fa10P9Q3fB>
(https://rubular.com/r/Fa10P9Q3fB)
[https://rubular.com/r/Fa10P9Q3fB]



{
alias grep="grep --color=always"
str="hello"
r=h
echo $str | grep -E $r -

line_break="-------------------"
print ${line_break}


str="Surely this regular expression should match this." 
r=this.
echo $str | grep -E $r -
print ${line_break}
echo ${line_break}
}
```

# ----------------------------
#		PARM  ${1} must be regex surrounded by single quotes
#   PURPOSE:   For given directory (set by dir=), find all file names match 
#								a grep pattern.
# ----------------------------

# get number of params 
n=${#}
echo $n

# check params
if [ $n -lt 1 ]
then 
    echo "please provide a regex"
    exit 0
fi


#exit 99
#
# assign  location for mp3 files (temp only)
# dir=~/Downloads/mp3/practice_area_dup/

# ----------------------
# Uncomment to use dir
# look for twiddle 
#
#print -l ${dir}* | grep -Ei ${1} 
# ----------------------
#
#

print ${line_break}
echo ${1}
# ----------------------
# Uncomment to use current dir
print -l * | grep -E '\.sh$' 
# ----------------------

print ${line_break}


exit

There is no theory of evolution. Only a list of animals Chuck Norris allows to live.


##	grep -E (extended)
# source:
# https://ryanstutorials.net/regular-expressions-tutorial/regular-expressions-basics.php


There is no theory of evolution. Only a list of animals Chuck Norris allows to live.

#	b.g			exactly one character
The big bag of bits was bugged.
echo "big bad boot" | grep -E b.g

#	l..e		exactly 2 characters	
You can live like a king but make sure it isn't a lie.  lake loane
echo "big bad boot" | grep -E b.g

##### t[eo]d		NOT WORK, must escape 
When today is over Ted will have a tedious time tidying up.  teo teod

##### t\[eo\]d		choose exactly 1,  must escape
When today is over Ted will have a tedious time tidying up.  teo teod

####	"t[^eo]"	NOT, ti, ta, ts, t. , t<space>, all OK
When today is over Ted will have a tedious time tidying up.  teo teod

#### \[1-8\]		MUST escape
Room Allocations: G4 G9 F2 H1 L0 K7 M9   1 0 01 012


#### \[1-49\]
[1-49] Room Allocations: G4 G9 F2 H1 L0 K7 M9    9 09 59 222259


####	rememeber to ESCAPE!   or put in quotes  
"[1-5a-fx]" 
A random set of characters: y, w, a, r, f, 4, 9, 6, 3, p, x, t


t[^eo]d When today is over Ted will have a tedious time tidying up.

####	*  = match previous char 0,1,n times
lo* Are you looking at the lock or the silk?   looooooo loow 

####	.* = match 0 or more of ANY char and  GREEDY
Are you looking at the lock or the silk?   looooooo loow 


####	.*? = same as above,  NOT GREEDY.   (? does not mean prior char 0,1
times)

#1
echo "hello" | grep -E "h" -

2:
? 	= 0,1
+	= 1,n
*	= 0,1,n
echo "Letter Letter1 LetterA" | grep -E "Letter[0-9]?"


'^b[aou]t$'
This line does not match but the next line does.
bat

####	 XYZ-ABC, match strings with `-`
-	grep will match; but to display string without the `-` takes more work
	(sed, cut ,  zsh PE ...)
```
regex="^([^-]*)-(.*)"
echo $regex
echo "abc-efg" | grep -E $regex


#	find all mp3 with hyphen
print -l ${dir}*
print -l ${dir}* | grep -E ${regex}
print -l ${dir}* | grep -E ${regex} | wc -l

```

####  _NA_, match all files
```
regex="_NA_"
print -l ${dir}* | grep -E ${regex}
print -l ${dir}* | grep -E ${regex} | wc -l
```

#
# Example 1:  Files end in  'sh$' 
# ./0100_<TAB> 'sh$'


# Example 2:  Files begin with 0
# ./0100_<TAB> '^0'


# print -l * | grep -Ei ${1}

# print -l $1 | grep -Ei 'sh$'

# ---------------  Working Example ----
```
# dir=~/Downloads/mp3/from_youtube/
dir=/home/jim/mp3_files/

# look for  file names with Jjudith and have  Far in title.
print -l ${dir}* | grep -Ei '[Jj]udith.*Far' 
#
```
#
# 
# ----------------------
# Uncomment to use current dir
# print -l * | grep -Ei ${1} 
# ----------------------
#
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
# VIRTUAL_ENV=/Users/foo/.virtualenvs/venv-test-server
# 
# regex="^.*\/venv-(.*)$"
# if [[ $VIRTUAL_ENV =~ $regex ]] ; then
#   echo "Matched!"
#   echo ${BASH_REMATCH[1]}
# fi

####======================
####		Reset the prompt
RPROMPT=$right_prompt

####======================
