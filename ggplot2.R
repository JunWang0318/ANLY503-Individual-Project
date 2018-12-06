library(ggplot2) # Data visualization

nfa <- read.csv("/Users/jun/Desktop/503 final/ggplots/NFA.csv", stringsAsFactors = FALSE)

plot2 <- ggplot(nfa[nfa$country=='World' & nfa$record %in% c('EFConsPerCap','BiocapPerCap'),],
       aes(x=year,y=total,col=record))+
  geom_line()+
  coord_fixed(ratio=25)+
  ylab('Ecological Footprint Per Capita (gha/person)')+
  ggtitle('World Footprint & Biocapacity Trends')+
  theme(plot.title = element_text(hjust = 0.5))
