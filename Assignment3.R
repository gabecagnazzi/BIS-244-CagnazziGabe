library(dplyr)
library(readr)
library(tidyverse)

us_counties.csv <- read_csv("covid-19-data/us-counties.csv")


us_lehigh_county <- us_counties.csv %>% filter(county=="Lehigh")

p <- ggplot() + 
  geom_point(data = us_lehigh_county, mapping = aes(x = date, y = deaths, color = "Deaths")) +
  geom_point(data = us_lehigh_county, mapping = aes(x = date, y = cases, color = "Cases")) +
  labs(x = "Date", y = "COVID-19 Cases and Deaths",
       title = "COVID-19 Cases and Deaths in Lehigh County",
       subtitle = "Data points are cumulative cases",
       caption = "Source: NY Times web GitGub repo", 
       colour = "Cases or Deaths")

p


