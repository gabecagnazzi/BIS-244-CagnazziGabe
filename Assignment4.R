library(dplyr)
library(readr)
library(scales)
library(tidyverse)

Twitch <- read_csv("Most Popular Twitch Streamers.csv")

Twitch$Date <- as.Date(Twitch$Date, "%m/%d/%Y")

p <- ggplot(data=Twitch, 
            aes(x = Date, 
                y= Viewers, 
                group = Streamer, colour = as.factor(Streamer)))

p + geom_line()

p + geom_line(mapping = aes(group = Streamer)) + 
  facet_wrap(~ Streamer)      
