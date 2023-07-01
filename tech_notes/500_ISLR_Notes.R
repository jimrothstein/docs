library(shiny)
    
ui = fluidPage(

h1("ISLR NOTES")
h2("Resources")
shiny::a(href="http://github.com/r4ds/bookclub-islr",
         "a")

#        "r4ds BookClub - islr (notes, videos ..)")

h3("    Bias-Variance Tradeoff")
)

server = function(input, output, session){

}

shinyApp(ui, server)
