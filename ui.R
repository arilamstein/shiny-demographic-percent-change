library(shiny)
library(choroplethr)

data(df_county_demographics)
options = colnames(df_county_demographics)[-1]

long_text = paste("Data comes from the 2010 and 2013 American Community Survey (ACS).<br/>",
                  "Want to make maps like this? Take my free course <a href='http://www.arilamstein.com/free-course'>Learn to Map Census Data in R</a>.")

shinyUI(fluidPage(

  titlePanel("Mapping US Demographic Changes: 2010 to 2013."),
  div(HTML("By <a href='http://www.arilamstein.com'>Ari Lamstein</a>.")),
  
  div(HTML(long_text)),

  sidebarLayout(
    sidebarPanel(
      selectInput("demographic", "Demographic", options, "per_capita_income")
    ),

    mainPanel(
      imageOutput("stateMap", width="640px", height="480px")
    )
  )
))
