library(shiny)

shinyServer(function(input, output) {

  output$stateMap = renderImage({

    filename = paste0(input$demographic, ".png")
    print(filename)
    list(src         = filename,
         contentType = 'image/png',
         width       = 640,
         height      = 480,
         alt         = filename)
  }, deleteFile = FALSE)
  
})
