###############################################
#Topic 2
###############################################

#load necessary libraries
library(dplyr)
library(tidyverse)

#load dataset
coffee_data <- read.table(file.choose(),header=TRUE,sep=",")

#############################################################
#(a)inspect dataset
#############################################################

#print structure
str(coffee_data)

#print summary statistics
summary(coffee_data)


#############################################################
#(b)prepare dataset for classification
#############################################################

#1.κeep only relevant columns
coffee_data$cash_type <- NULL
coffee_data$Time_of_Day <- NULL
coffee_data$Weekdaysort <- NULL
coffee_data$Monthsort <- NULL
coffee_data$Date <- NULL
coffee_data$Time <- NULL

#2.make coffee_name last column
new_coffee_data <- coffee_data[, c("hour_of_day", "money", "Weekday", "Month_name", "coffee_name")]

#3.remove non-coffee beverages
new_coffee_data <- new_coffee_data %>% filter(coffee_name != 'Hot Chocolate', coffee_name != 'Cocoa')

#4.merge Americano types
new_coffee_data $new_coffee_data[new_coffee_data $coffee_name == "Americano with Milk"] <- "Americano"

#inspect final dataset
head(new_coffee_data)
str(new_coffee_data)
summary(new_coffee_data)

#############################################################
#(c)contingency Table
#############################################################

fsum = xtabs(~coffee_name + Weekday, new_coffee_data)
addmargins(fsum)
fsum <- fsum[, c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")]
addmargins(fsum)

#############################################################
# (d) Bar plot for coffee type frequencies
#############################################################

sales <- sort(table(new_coffee_data$coffee_name), decreasing = TRUE)
barplot(sales, xlab = "Coffee Type", ylab = "Sales", main = "Coffee Type Among Sales",col = "brown")

#############################################################
# (e) Pie chart of monthly sales
#############################################################

sales_by_month <- sort(table(new_coffee_data$Month_name), decreasing = TRUE)
pie(sales_by_month, main = "Coffee Sales Across Different Months of the Year")

#############################################################
# (f) Boxplots of money vs weekday
#############################################################

boxplot(money ~ Weekday, data = new_coffee_data, main = "Sales in Different Days of the Week",xlab = "Days of the Week", ylab = "Money", col = "brown")





