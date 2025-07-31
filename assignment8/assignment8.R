library(readr)
people <- read_csv("people.csv")


#Task 1: Calculate the mean, median, first and third quartiles (Q1 and Q3), and 
#standard deviation of height and weight for the individuals in the dataset.
# height
print(paste("Height statistics: Mean =", mean(people$height), 
            ", Median =", median(people$height), 
            ", Q1 =", quantile(people$height, 0.25), 
            ", Q3 =", quantile(people$height, 0.75), 
            ", SD =", sd(people$height)))
# weight
print(paste("Weight statistics: Mean =", mean(people$weight), 
            ", Median =", median(people$weight), 
            ", Q1 =", quantile(people$weight, 0.25), 
            ", Q3 =", quantile(people$weight, 0.75), 
            ", SD =", sd(people$weight)))


#Task 2: Generate histograms to visualize the distribution of height and weight 
#for the individuals in the dataset.
# height
hist(people$height, 
     main = "Height Distribution", 
     xlab = "Height (cm)", 
     col = "lightblue", 
     border = "black")
# weight
hist(people$weight, 
     main = "Weight Distribution", 
     xlab = "Weight (kg)", 
     col = "lightgreen", 
     border = "black")


#Task 3: Identify any potential outliers in the dataset for weight.
# using iqr
weight_q1 <- quantile(people$weight, 0.25)
weight_q3 <- quantile(people$weight, 0.75)
weight_iqr <- weight_q3 - weight_q1
weight_outliers <- people$weight[people$weight < (weight_q1 - 1.5 * weight_iqr) | 
                                  people$weight > (weight_q3 + 1.5 * weight_iqr)]
# displaying the outliers
if(length(weight_outliers) > 0) {
  print("Potential outliers:")
  print(weight_outliers)
} else {
  print("No potential outliers:")
}
boxplot(people$weight, main = "Weight Boxplot", col = "orange")


#Assuming that the height and weight data follow a normal distribution with the 
#mean and standard deviation calculated from the dataset, perform the following 
#calculations:
#Task 4: Determine the percentage of individuals taller than 150 cm.
# using the normal distribution
height_taller_150 <- pnorm(150, mean = mean(people$height), 
                           sd = sd(people$height), lower.tail = FALSE) * 100
cat("Percentage of individuals taller than 150 cm:", height_taller_150, "%")


#Task 5: Calculate the percentage of individuals with a weight between 60 kg 
#and 100 kg.
weight_60_to_100 <- pnorm(100, mean = mean(people$weight), sd = sd(people$weight)) - 
                     pnorm(60, mean = mean(people$weight), sd = sd(people$weight))
weight_60_to_100_percentage <- weight_60_to_100 * 100
cat("Percentage of individuals between 60 kg and 100 kg:", 
    weight_60_to_100_percentage, "%")


#Task 6: Identify the weight range that encompasses 60% of the individuals.
weight_lower_bound <- qnorm(0.2, mean = weight_mean, sd = weight_sd)
weight_upper_bound <- qnorm(0.8, mean = weight_mean, sd = weight_sd)
cat("Weight range of the 60% of people are between:",
    weight_lower_bound, "and", weight_upper_bound, "kg\n")


#Task 7: Calculate the height above which 1% of the individuals are taller.
height_1_percent <- qnorm(0.99, mean = mean(people$height), sd = sd(people$height))
cat("Height above which 1% of individuals are taller:", height_1_percent, "cm")


#Task 8: Determine the weight below which 5% of the individuals weigh less.
weight05_percent <- qnorm(0.005, mean = mean(people$weight), sd = sd(people$weight))
cat("Weight below which 0.05% of individuals weigh less:", 
    weight05_percent, "kg")


#Task 9: Compute the BMI for each individual in the dataset and classify those 
#with a BMI greater than 30 as obese.
people$bmi <- people$weight / (people$height / 100) ^ 2
# classifying
people$obese <- ifelse(people$bmi > 30, "Yes", "No")
# displaying results
head(people[, c("height", "weight", "bmi", "obese")])

