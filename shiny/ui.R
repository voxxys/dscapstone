# ui.R

shinyUI(fluidPage(
  titlePanel("Word Prediction"),
  
  fluidRow(
    column(3, 
           textInput("phrase", "Text input :", "a case of")),
    
    column(8,
           wellPanel(textOutput("prediction")),
           br(),
           actionButton("one", label = "Action1"),
           br(),
           actionButton("two", label = "Action2"),
           br(),
           actionButton("three", label = "Action3")
    )
  )
))