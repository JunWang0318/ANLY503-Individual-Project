library(networkD3)

edgelist <- read.csv('/Users/jun/Desktop/503 final/networkd3/edgelist.csv')
nodelist <- read.csv('/Users/jun/Desktop/503 final/networkd3/nodelist.csv')

forceNetwork(Links = edgelist, 
             Nodes = nodelist,
             Source = "SourceID", 
             Target = "TargetID",
             Value = "CosSim", 
             NodeID = "NodeName",
             opacity = 0.8,
             Nodesize='Rate',
             legend = TRUE,
             Group = "group1",zoom=TRUE,
             colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
             fontSize = 18,
             fontFamily = "serif", 
             linkDistance = 50
)

