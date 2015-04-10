# server.R

shinyServer(function(input, output) {
  
  inputPhrase <- reactive({input <- as.character(input$phrase)
                           return(input)})
  
  output$prediction <- renderText({ input$phrase })
  
}
)