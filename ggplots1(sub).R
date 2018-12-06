library(ggplot2)
library(gridExtra)

nfa <- read.csv("/Users/jun/Desktop/503 final/ggplots/NFA.csv", stringsAsFactors = FALSE)
#View(nfa)

nfa$country <- as.factor(nfa$country)
nfa$ISO.alpha.3.code <- as.factor(nfa$ISO.alpha.3.code)
nfa$UN_region <- as.factor(nfa$UN_region)
nfa$UN_subregion <- as.factor(nfa$UN_subregion)
nfa$year <- as.integer(nfa$year)
nfa$record <- as.factor(nfa$record)

world_EFcon <- nfa[which(nfa$UN_region=='World' & nfa$record=='EFConsTotGHA'),]
#View(world_EFcon)

p1 = ggplot(data = world_EFcon, aes(x = population, y = crop_land)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('Crop Land')

p2 = ggplot(data = world_EFcon, aes(x = population, y = grazing_land)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('Grazing Land')

p3 = ggplot(data = world_EFcon, aes(x = population, y = forest_land)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('Forest Land')

p4 = ggplot(data = world_EFcon, aes(x = population, y = fishing_ground)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('Fishing Land')

p5 = ggplot(data = world_EFcon, aes(x = population, y = carbon)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('carbon Land')


p6 = ggplot(data = world_EFcon, aes(x = population, y = built_up_land)) + 
  geom_point(color='blue') +
  geom_smooth(color = 'red', method = "lm", se = FALSE)+
  xlab('Population')+
  ylab('Built Up Land')

plot1 <- grid.arrange(p1, p2, p3, p4, p5, p6, nrow = 2, 
             top = "Linear Regression Between Population and Various Types of Land")


