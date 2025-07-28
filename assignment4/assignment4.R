library(stats)
library(base)
library(dplyr)

#Task 1: Number of United Airline Flights in the Dataset
#Determine the number of flights operated by United Airlines in the given dataset.
DelayDataLocation <- "./Datasets/airline/HoustonAirline.csv"
delay.dat.houston <- read.csv(DelayDataLocation, 
                              header=TRUE,
                              stringsAsFactors = FALSE)
# tbl_df allows for nice printing
delay.dat.houston <- as_tibble(delay.dat.houston)
###
delay.dat.houston
united.airline.flights <- filter(delay.dat.houston, UniqueCarrier == "UA")
cat("There are", nrow(united.airline.flights), "UA flights")


#Task 2: Comparison of United and American Airline Weekend Flights
#Compare the number of United Airlines flights on weekends to the number of American Airlines flights on weekends.
weekend.flights <- filter(delay.dat.houston, DayOfWeek %in% c(6, 7))
ua.weekend <- filter(weekend.flights, UniqueCarrier == "UA")
ua.weekend.count <- nrow(ua.weekend)
aa.weekend <- filter(weekend.flights, UniqueCarrier == "AA")
aa.weekend.count <- nrow(aa.weekend)
cat("United Airlines weekend flights:", ua.weekend.count,"\n")
cat("American Airlines weekend flights:", aa.weekend.count)


#Task 3: Largest Departure Delay
#Identify the flight with the longest departure delay in the dataset.
max.depdelay <- max(delay.dat.houston$DepDelay, na.rm = TRUE)
largest.delay.flight <- filter(delay.dat.houston, DepDelay == max.depdelay)
print(largest.delay.flight)
cat("The largest departure delay is:", max.depdelay, "minutes")


#Task 4: Shortest Flight
#Determine the flight with the shortest duration in the dataset.
min.depdelay <- min(delay.dat.houston$DepDelay, na.rm = TRUE)
shortest.delay.flight <- filter(delay.dat.houston, DepDelay == min.depdelay)
print(shortest.delay.flight)
cat("The shortest departure is:", min.depdelay, "minutes")


#Task 5: Longest and Shortest Taxi In Times
#Find the flights with the longest and shortest Taxi In times in the dataset.

min.taxin <- min(delay.dat.houston$TaxiIn, na.rm = TRUE)
taxin <- filter(delay.dat.houston, DepDelay == min.taxin)
print(taxin)
cat("The taxin is:", min.taxin, "minutes")
max.taxout <- max(delay.dat.houston$TaxiOut, na.rm = TRUE)
taxout <- filter(delay.dat.houston, DepDelay == max.taxout)
print(taxout)
cat("The taxout is:", max.taxout, "minutes")


