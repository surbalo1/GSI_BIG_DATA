library(tidyverse)


#(1) Summarize the data by whether children participated in the meal 
#preparation or not.  Use an appropriately labelled table to show the results.  
#Also include a graphical presentation that shows the distribution of calories 
#for participants vs. non-participants.  Describe the shape of each 
#distribution and comment on the similarity (or lack thereof) between the 
#distributions in each population.
data <- read_csv("data.csv")

long_data <- data %>%
  pivot_longer(cols = everything(),
               names_to = "Participation",
               values_to = "Calories") %>%
  filter(!is.na(Calories))

summary_table <- long_data %>%
  group_by(Participation) %>%
  summarise(
    Mean = mean(Calories),
    Median = median(Calories),
    SD = sd(Calories),
    Count = n()
  )

print(summary_table)

ggplot(long_data, aes(x = Participation, y = Calories, fill = Participation)) +
  geom_boxplot() +
  labs(
    title = "Participants vs Non-Participants",
    x = "Participation",
    y = "Calories"
  ) +
  theme_minimal()


#(2) Does the mean calorie consumption for those who participated in the meal 
#preparation differ from 425?  Formally test at the level using the 5 steps 
#outlined in the module.
participants <- data$Participants
participants <- participants[!is.na(participants)]
non_participants <- data$`Non-Participants`
non_participants <- non_participants[!is.na(non_participants)]

mu0 <- 425         
a <- 0.05       

# t-test, two sided, 30 less, one sample
result <- t.test(participants, mu = mu0, alternative = "two.sided") 

print(result)

if(result$p.value < a){
  cat("The mean differs from 425.\n")
} else {
  cat("Not enough evidence to say the mean differs from 425.\n")
}


#(3) Calculate a 90% confidence interval for the mean calorie intake for 
#participants in the meal preparation.  Interpret the confidence interval.
# t-test with confidence of 90%
ci_result <- t.test(participants, conf.level = 0.90) 

print(ci_result$conf.int)


#(4) Formally test whether or not participants consumed more calories than 
#non-participants at the level using the 5 steps outlined in the module.
# t-test (participants > non-participants
t_test_result <- t.test(participants, non_participants,
                        alternative = "greater",    # one-sided test
                        var.equal = FALSE)         # assume unequal variances

print(t_test_result)

if (t_test_result$p.value < a) {
  cat("Participants consumed significantly more calories.\n")
} else {
  cat("Not enough evidence that participants consumed more.\n")
}


#(5) Are the assumptions of the test used in (4) met?  How do you know?
par(mfrow = c(1, 4))
hist(participants, main = "Participants", 
     xlab = "Calories", 
     col = "skyblue", 
     breaks = 10)
hist(non_participants, main = "Non-Participants", 
     xlab = "Calories", 
     col = "salmon", 
     breaks = 10)

qqnorm(participants, main = "Q-Q Plot: Participants"); 
qqline(participants, col = "red")
qqnorm(non_participants, main = "Q-Q Plot: Non-Participants"); 
qqline(non_participants, col = "red")
par(mfrow = c(1, 1))
