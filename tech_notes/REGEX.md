
# -----------------------
##	DOCUMENT REGEX  HERE
# -----------------------

##	REGEX info:  consolidate to ~/code/docs/tech_notes/
##	SOME regex:  in ~/code/zsh_project/ZSH_SH_FILES/


##	REGEX
TODO:
	-	sed, when to use?
	- emphasize goal:  use grep -P, regex to understand how REGEX works.  Tired
	of every 6 months learning all over again.
	-	greedy/not greedy  and backtrack .   Think like a regex engine!
	-	see Blue pg 29.
	-	How to aerate regex !
	-	regex can be used to:
		-	find
		-	validate
		-	replace/insert
		-	split
		-	...
		-	But GOAL know is simply HOW it works. (grep -P)
		-	2nd Goal is do in R, but suspect much, much easier.
		- When whiz, can do summersaults with CLI, zsh tools (sed, grep , cut ...)
		and regex.  Not NOW.


-	Separate learning REGEX (grep -P, regex) and using REGEX in R, which I think
	is a tad easier.

###	DEFINTIIONS - as always, crucial
	-	regex is a string;  do not forget this.
	-	META CHARACTERS - ascii (?) characters which by-default have
		non-literal meaning to engine that digests them.  **Engine** specific.
		Must ESCAPE these characters to use as literals.  Other contexts, such
		as unix shell, have similar idea:  `<`, `>' for example, refer to
		**redirect** .    In C, sprintf, `%` indicates formatting and literal
		use.
	-	**To Escape** indicate to underlying engine that this meta character
		should be handled as though literal.

	-	POSIX:
		-	backslash \
		-	[ ]
		-	{ }
		-	( )
		-	caret ^
		-	$
		-	dot .
		-	pipe |
		-	?
		-	asterisk *
		-	`+ -`
		-	``+ - ''
		-	\verbX + - X
		-	\begin{verbatim} 
			+ - 
			\end{verbatim}


###	Render REGEX Verbatim - 4 ways (latex?)

`+ -`

``+ - ''

\verb; + - ;

\verb;+ -;

\begin{verbatim} 
+ - 
\end{verbatim}


-	**Character Class**  Things like [0-9].  
Rmk:  [0-9]+ means repeat one or more of the prior **Character class**   So both 321 and 333 match this regex.


###	Specific to vim/neovim
-	magic = \v   no need to escape (wait till know what doing first) - well, um.

-	magic = `\v`   no need to escape (wait till know what doing first)

###	Specific to R
-	Before regex library (engine) sees code, the **compiler** (byte code?) gets
it first.  Must use double backslash for just one backslash to be seen by
regex engine.   Shell interpreters have no such compiler and single backslash
suffices.

#### Regex grouping:  capture & non-capture

**Perl** PCRE for lookaheads, capture (in R, perl=T)
from !so

Groups that capture you can use later on in the regex to match OR you can use
them in the replacement part of the regex. Making a non-capturing group simply
exempts that group from being used for either of these reasons.


Non-capturing groups are great if you are trying to capture many different
things and there are some groups you don't want to capture. 


<!--
vim:linebreak:nospell:nowrap:cul tw=78 fo=ntl foldcolumn=3 cc=+1
-->
