library(wordcloud2)

nfa <- read.csv("NFA.csv", stringsAsFactors = FALSE)
sub_nfa <- nfa[which(nfa$UN_region!='World'& nfa$year==2014 & nfa$record=='BiocapPerCap'),]
sub_nfa$round <- round(sub_nfa$total, digit = 2)
data <- sub_nfa[c(1,16)]
colnames(data) <- c("word", "freq")

#for better visulization remove the two outlier countries
data <- data[which(data$word != 'French Guiana' 
                   & data$word != 'Guyana'),]

#View(data)
wordcloud2(data = data, 
           size = 3, 
           shape = 'trangle')


