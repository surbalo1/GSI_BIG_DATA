#ASSIGNMENT 1
#GSI Intro to Big Data and Data Mining
#Zhaowen Fan
#Rafael Ignacio Gonzalez Chong

#Reading data
days <- read.csv("~/Desktop/work1/datos.csv", header = FALSE)

# To convert and flatten data from a data frame you can use the unlist command. 
my.days <-as.numeric(unlist(days, use.names = FALSE))

# Check the type
str(my.days)

# Create a histogram
hist(my.days,
     main = "Histogram of Hospital",
     xlab = "Days in Hospital",
     col = "lightgreen",
     border = "black",
     breaks = 10)
     
# Print basic statistics
mean.value <- mean (my.days)
median.value <- median (my.days )
sd.value <- sd( my.days )
q1 <- quantile(my.days, 0.25)
q3 <- quantile(my.days, 0.75)
min.value <- min (my.days )
max.value <- max ( my.days )
iqr.value <- IQR(my.days)

# Summary
summary(my.days)

# Print a summary table
summary.table <- data.frame(
  Statistic = c("Mean", "Median", "Std. Deviation", "Q1 (25%)", "Q3 (75%)", "Minimum", "Maximum"),
  Value     = c(mean.value, median.value, sd.value, q1, q3, min.value, max.value)
)
print(summary.table)

# Create a boxplot
boxplot(my.days,
        main = "Boxplot of Hospital Day Duration",
        ylab = "Days in Hospital",
        col = "lightblue",
        border = "darkblue")
