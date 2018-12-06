library(plotly)
packageVersion('plotly')

nfa <- read.csv("/Users/jun/Desktop/503 final/ggplots/NFA.csv", stringsAsFactors = FALSE)

china <- nfa[which(nfa$country=='China'& 
                    nfa$year==2014 & 
                    nfa$record=='EFConsTotGHA'),]
num_China <- as.character(china[7:11])

usa <- nfa[which(nfa$country=='United States of America'& 
                     nfa$year==2014 & 
                     nfa$record=='EFConsTotGHA'),]
num_usa <- as.character(usa[7:11])


canada <- nfa[which(nfa$country=='Canada'& 
                     nfa$year==2014 & 
                     nfa$record=='EFConsTotGHA'),]
num_Canada <- as.character(canada[7:11])


land_type <- c('crop_land','grazing_land','forest_land',
               'fishing_ground', 'built_up_land')

t <- list(
  family = "sans serif",
  size = 14,
  color = 'Black')


plotly_R <- plot_ly(
  type = 'scatterpolar',
  fill = 'toself'
  
) %>%
  
  add_trace(
    r = num_China,
    theta = land_type,
    name = 'China'
  ) %>%
  
  add_trace(
    r = num_usa,
    theta = land_type,
    name = 'United States of America'
  ) %>%
  
  add_trace(
    r = num_Canada,
    theta = land_type,
    name = 'Canada'
  ) %>%
  
  layout(
    title = 'Comparison Between Different Types of Land (USA & China & Canada)',
    font = t,
    polar = list(
      radialaxis = list(
        visible = T,
        range = c(0,900000000)
      )
    )
  )

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
#chart_link <- api_create(plotly_R, filename = "Radar-Comparison")
#chart_link