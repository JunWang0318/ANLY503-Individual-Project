library(shiny)
library(ggplot2)

nfa <- read.csv('NFA.csv', stringsAsFactors = FALSE)
function(input, output) {
  
  output$boxPlot <- renderPlot({
    sub_nfa <- nfa[which(nfa$country!='World' 
                         & nfa$year==(input$slider1) 
                         & nfa$record=='EFConsPerCap'),]
   tmp <- paste('Regional Percapita Footprint Distributions', input$slider1, sep = " for ")
   ggplot(sub_nfa )+
      geom_boxplot(aes(x=UN_region,y=total,fill=UN_region)) +
      ylab('Ecological Footprint Per Person (gha/person)')+
      theme(axis.text.x = element_text(angle=30,hjust=1)) + 
      ggtitle(tmp)+
      theme(plot.title = element_text(hjust = 0.5, size=18))
    
  }, 
  height = 700)
  
}