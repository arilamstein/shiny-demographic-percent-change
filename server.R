library(shiny)

shinyServer(function(input, output) {

  output$stateMap = renderImage({

    # add a progress bar
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating map Please wait.", value = 0)
    
    filename = paste0(input$demographic, ".png")
    list(src         = filename,
         contentType = 'image/png',
         width       = 640,
         height      = 480,
         alt         = filename)
  }, deleteFile = FALSE)
  
})
