#Reading csv
credits <- read.csv("/Users/rafaelgonzalez/Desktop/assignment3/Credit.csv")

#Task 1: Calculate the median income for male and female customers in the dataset. 
#Is there a difference between the two groups in this sample dataset?

male.customers.income <- credits[credits$Gender == " Male",]$Income
female.customers.income <- credits[credits$Gender == "Female",]$Income

print(paste("Median Income for Male Customers is: ", median(male.customers.income)))
print(paste("Median Income for Female Customers is: ", median(female.customers.income)))

#Task 2: Create separate histograms showing the income distribution for male and female customers. 
#Compare the two histograms and interpret your findings.

par(mfrow = c(1, 2))  

hist(male.customers.income,
     main = "Income Distribution: Male Customers",
     xlab = "Income",
     col = "skyblue",
     breaks = 20)

hist(female.customers.income,
     main = "Income Distribution: Female Customers",
     xlab = "Income",
     col = "pink",
     breaks = 20)

par(mfrow = c(1, 1))

#Task 3: Do different ethnic groups in the dataset have different average education levels?

edu.caucasian.ethnic <- credits[credits$Ethnicity == "Caucasian",]
edu.asian.ethnic <- credits[credits$Ethnicity == "Asian",]
edu.african.ethnic <- credits[credits$Ethnicity == "African American",]

mean(edu.caucasian.ethnic$Education)
mean(edu.asian.ethnic$Education)
mean(edu.african.ethnic$Education)

#Task 3.1: Do students have a higher number of education years?

student.yes <- credits[credits$Student == "Yes",]
student.no <- credits[credits$Student == "No",]

mean(student.yes$Education)
mean(student.no$Education)

summary(credits[credits$Student == "Yes", ]$Education)
summary(credits[credits$Student == "No", ]$Education)

#Task 3.2 Do people with more than 10 years of education have a higher balance on their account?

summary(credits[credits$Education > 10, ]$Balance)
summary(credits[credits$Education <= 10, ]$Balance)

#male.married.morethan10yearseducation.asian.morethan3cards

edu <- credits[credits$Education > 10,]
male.edu <- edu[edu$Gender == " Male",]
male.edu.married <- male.edu[edu$Married == "Yes",]
male.edu.asian <- male.edu.married[male.edu.married$Ethnicity == "Asian", ]
male.edu.asian.card <- male.edu.asian[male.edu.asian$Cards > 3,]
print(male.edu.asian.card)

#Task 4: Do people older than 50 years have a higher average income compared to the rest of the dataset?

old.people <- credits[credits$Age > 50, ]$Income
rest.income <- credits[credits$Age <= 50, ]$Income
avg.old <- mean(old.people)
avg.rest <- mean(rest.income)
avg.old > avg.rest

#Task 5: Do people younger than 30 years old have more credit cards on average?

people.younger30 <- credits[credits$Age > 30, ]$Cards
people.bigger30 <- credits[credits$Age <= 30, ]$Cards
number.cards.30more <- mean(people.bigger30)
number.cards.30less <- mean(people.younger30)
number.cards.30less > number.cards.30more

#Task 6: Do different ethnic groups have different average incomes?

mean(edu.african.ethnic$Income)
mean(edu.asian.ethnic$Income)
mean(edu.caucasian.ethnic$Income)