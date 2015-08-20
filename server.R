library(shiny)
library(choroplethr)
library(choroplethrMaps)
library(acs)
library(ggplot2)

state_demo_2010 = get_state_demographics(2010)
state_demo_2013 = get_state_demographics(2013)
state_demo_all = merge(state_demo_2010, 
                       state_demo_2013, 
                       by="region")

shinyServer(function(input, output) {

  output$stateMap = renderPlot({

    demo = input$demographic
    end = paste0(demo, ".y")
    start = paste0(demo, ".x")
    
    state_demo_all$value = (state_demo_all[, end] - state_demo_all[, start]) / state_demo_all[, start] * 100

    c = StateChoropleth$new(state_demo_all)
    c$set_num_colors(1)
    min = min(state_demo_all$value)
    max = max(state_demo_all$value)
    c$ggplot_scale = scale_fill_gradient2(name="Percent Change", limits=c(min, max))
    c$render()
  })
  
})
