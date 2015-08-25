library(shiny)

load("state_demo_all.rdata")

shinyServer(function(input, output) {

  output$stateMap = renderImage({

    filename = paste0(input$demographic, ".png")
    if (file.exists(filename))
    {
      list(src         = filename,
           contentType = 'image/png',
           width       = 640,
           height      = 480,
           alt         = filename)
    } else {
      demo  = input$demographic
      end   = paste0(demo, ".y")
      start = paste0(demo, ".x")
      
      state_demo_all$value = (state_demo_all[, end] - state_demo_all[, start]) / state_demo_all[, start] * 100
      
      c = StateChoropleth$new(state_demo_all)
      c$set_num_colors(1)
      min = min(state_demo_all$value)
      max = max(state_demo_all$value)
      c$ggplot_scale = scale_fill_gradient2(name="Percent Change", limits=c(min, max))
      
      png(file=filename, width=640, height=480)
      p = c$render()
      print(p)
      dev.off()
      
      list(src         = filename,
           contentType = 'image/png',
           width       = 640,
           height      = 480,
           alt         = filename)
      
    }
  }, deleteFile = FALSE)
  
})
