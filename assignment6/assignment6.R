# Install the package if needed. 

# install.packages('dplyr')

library(dplyr)

DelayDataLocation <- "https://raw.githubusercontent.com/kiat/Cloud-Computing/refs/heads/main/Spark-Example-FlightsData/flights_data_small.csv"
delay.dat.houston <- read.csv(DelayDataLocation, 
                              header=FALSE,
                              stringsAsFactors = FALSE)



airportDataLocation <- "/Users/rafaelgonzalez/Desktop/assignment6/airports.csv"


airports <- read.csv(airportDataLocation, 
                     header=TRUE,
                     stringsAsFactors = FALSE)

#Task 1: How many flights are in this dataset from Houston to city of "Los Angels"? Print the number.   

#Task 2:  Which top-10 destination cities have the highest arrival delay of flights?
  
#Task 3: Which top 10 destination cities have the most cancelations of flights?

#Task 4: Is there any Cities without a Flight from Houston?

#Task 5: What is the ratio of flights canceled for each cities? Which city has the highest ratio? 



