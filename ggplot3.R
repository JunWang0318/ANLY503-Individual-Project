library(ggplot2) 

nfa <- read.csv("NFA.csv", stringsAsFactors = FALSE)

sub_nfa <- nfa[which(nfa$country!='World' & nfa$year==2014 & nfa$record=='BiocapPerCap'),]

plot3 <- ggplot(sub_nfa )+
        geom_violin(aes(x=UN_region,y=total,fill=UN_region)) +
        #xlab('Region')
        ylab('Biocapacity')+
        theme(axis.text.x = element_text(angle=30,hjust=1)) + 
        ggtitle('Regional Biocapacity Distributions (2014)')+
        theme(plot.title = element_text(hjust = 0.5))
