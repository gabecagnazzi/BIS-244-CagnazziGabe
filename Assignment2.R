library(dplyr)
library(readr)
library(tidyverse)
us_states <- read_csv("covid-19-data/us-states.csv")
View(us_states)

us_pa <- us_states %>% filter(state=="Pennsylvania")

n <- length(us_pa$date)
us_pa$adj_deaths <- 0
 for (k in 1:n) {
    if (as.character(us_pa$date[k]) == "2020-04-21") {
      us_pa$adj_deaths[k] <- (us_pa$deaths[k] - 282)
    }
    else { 
      if (as.character(us_pa$date[k]) == "2020-04-22") {
        us_pa$adj_deaths[k] <- (us_pa$deaths[k] - 297)
      }
      else {
        us_pa$adj_deaths[k] <- us_pa$deaths[k]
      }
    }
  
 }

sum(us_pa$adj_deaths)
View(us_pa)
