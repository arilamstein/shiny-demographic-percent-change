library(shiny)
library(choroplethr)

data(df_county_demographics)
options = colnames(df_county_demographics)[-1]

shinyUI(fluidPage(

  titlePanel("Mapping US Demographic Changes: 2010 to 2013."),
  div(HTML("By <a href='http://www.arilamstein.com'>Ari Lamstein</a>.")),
  div(HTML("Data comes from the 2010 and 2013 <a href='https://en.wikipedia.org/wiki/American_Community_Survey'>American Community Survey (ACS).</a>")),

  sidebarLayout(
    sidebarPanel(
      selectInput("demographic", "Demographic", options, "per_capita_income")
    ),

    mainPanel(
      plotOutput("stateMap")
    )
  )
))
