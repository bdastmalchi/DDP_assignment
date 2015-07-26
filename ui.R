library(shiny)

shinyUI(pageWithSidebar(

# Application title
headerPanel("Approximate stopping distance of a car vs its speed"),

sidebarPanel(
numericInput("degree", "Polynomial fit degree", 2, 1, 4, 1),
sliderInput("speed", "Speed [mph]:", min = 4, max = 25, value = 10),
h4("Predicted distance [ft]:"),
verbatimTextOutput("y")
),

mainPanel(
  tabsetPanel(
    tabPanel("Plot", plotOutput("distPlot")), 
   tabPanel("Help", includeMarkdown("readme.Rmd")) 
  )
)

))