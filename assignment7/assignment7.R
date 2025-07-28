#ASSIGNMENT 7
#GSI Intro to Big Data and Data Mining
#Zhaowen Fan
#Rafael Ignacio Gonzalez Chong

library(dplyr)
library(ggplot2)
flights.file <- "/Users/rafaelgonzalez/Desktop/assignment7/flights-small.csv"
flights <- read.csv(flights.file, stringsAsFactors = FALSE)

#Create at least two of the following Visualization Ideas,
#or create your own visualization idea using ggplot2 package.

#Number of flights per day of the week
flights %>% 
  count(DAY_OF_WEEK) %>% 
  ggplot(aes(
    x = factor(DAY_OF_WEEK, levels = 1:7, labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")), 
    y = n,
    fill = n
  )) +
  geom_col() +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  labs(
    title = "Number of Flights per Day", 
    x = "Day", 
    y = "Flights"
  )


#Average departure delay per day of the week
flights %>%
  filter(CANCELLED == 0, !is.na(DEPARTURE_DELAY)) %>%
  group_by(DAY_OF_WEEK) %>%
  summarise(avg_delay = mean(DEPARTURE_DELAY)) %>%
  ggplot(aes(factor(DAY_OF_WEEK, levels=1:7, labels=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")), avg_delay, fill=avg_delay)) +
  geom_col() +
  labs(title="Avg Departure Delay by Day", x="Day", y="Avg Delay in min")
