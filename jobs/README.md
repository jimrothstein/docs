

Experiment:

This is *.md file.
Typst chunks are embedded.

How will it appear in Github?


<hr>
```typst

= Level 1
== Level 2

Or, this one:

#set page(
paper: "us-letter",
margin: (x: 0.5cm, y: 0.5cm),
)

#set text(
font: "New Computer Modern",
size: 15pt,
fill: black   // gray is too light

)



#set heading(numbering: "1.")
#outline()
#show regex("[Mmath]"): it => emph(it)


math is fun

```
<hr>
## Concatinate (code block)
```{=typst}
#{
let a = [from]
let b = [*world*]
[hello]
a + [the] + b
}
```
## Appear like R code
```{=typst}
#let r = raw.with(lang: "r")

This can then be used like: #r("x <- c(10, 42)")
```
<hr>

## Smaller/larger font in block
````{=typst}
```py
def python():
return 5 + 5
```
// Switch to JetBrains Mono for both
// inline and block raw.
#show raw: set text(font: "JetBrains Mono")
JetBrains Mono \

// Reset raw blocks to the same size as normal text,
// but keep inline raw at the reduced size.
#show raw.where(block: true): set text(1em / 0.8)

Now using the ` ` font for raw text.
Here's some Python code. It looks larger now:

```py
def python():
return 5 + 5
```

````

<hr>
## link
```{=typst}
#show link: underline
#link("https://nytimes.com") \
#link("https//nytimes.com")[the NY Times]
#divider()    // actual function is defined near bottom
```


<hr>
## expressions (https://typst.app/docs/reference/scripting/)


```{=typst}
compact syntax (use hash) to embed a code expression into markup: / 

#emph[Hello] \   // function call
#emoji.face \    // field
#"hello".len()   // method calls
```

<hr>
### functions
```{=typst}
Call a function. \
\#list([A], [B]) \ 

#list([A], [B])

Named arguments and trailing  \
content blocks. \ 
\#enum(start: 2)[A][B]

#enum(start: 2)[A][B]

Version without parentheses.
\#list[A][B]
#list[A][B]

```

