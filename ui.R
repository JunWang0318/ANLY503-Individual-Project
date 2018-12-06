library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(
    titlePanel("Boxplots for NFA Data"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("slider1", 
                    label=h3("Year"),
                    min=1961, max=2014, value=50, sep="", animate=TRUE),
      hr(),
      helpText("World Ecological Footprint Data from Kaagle")
    ),
      
      mainPanel(
        plotOutput("boxPlot")
      )
    )
  )
)