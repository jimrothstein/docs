
#set page("us-letter")
#set heading(numbering: "1.")




// we can reduce the number of hashes needed here by using scripting mode
// same as above but we exchanged `[...]` for `{...}` to switch from markup
// into scripting mode
#let apply-template(body, name: "document_name") = {
  show heading.where(level: 1): emph
  set heading(numbering: "1.1")
  // ...
  body
}

// define a function that:
// - takes content
// - applies styling to it
// - returns the styled content
/*
#let apply-template(body) = [
  #show heading.where(level: 1): emph
  #set heading(numbering: "1.1")
  // ...
  #body
]
*/
