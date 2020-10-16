# Gabe Cagnazzi Midterm BIS 244
library(dplyr)
library(readr)
library(scales)
library(tidyverse)

Covid_data.csv <- read_csv("data.csv")
# View(Covid_data.csv)

G7_data <- filter(Covid_data.csv, (countriesAndTerritories == "Canada" |  countriesAndTerritories == "France" | 
                                     countriesAndTerritories == "Germany" | countriesAndTerritories == "Italy" | countriesAndTerritories == "Japan" | 
                                     countriesAndTerritories == "United_States_of_America" | countriesAndTerritories == "United_Kingdom"))

G7_data$dateRep <- as.Date(G7_data$dateRep, "%d/%m/%Y")

# View(G7_data)

p <- ggplot(data = G7_data,
            mapping = aes(x = dateRep,
                          y = cases,
                          color = countriesAndTerritories))

p + geom_line(mapping = aes(group = countriesAndTerritories)) +
  labs(x = "Date",
       y = "New Cases Per Day", title = "G7 Covid-19 Case Counts", subtitle="By Gabe Cagnazzi as of 10-16-20")

