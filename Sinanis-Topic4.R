###############################################
#Topic 4
###############################################

#load necessary libraries
library(tidyverse)
library(dplyr)

#load dataset
coffee_sales <- read.table(file.choose(),header=TRUE,sep=",")

#############################################################
#(a)remove Date & Time and inspect
#############################################################

coffee_sales$Date <- NULL
coffee_sales$Time <- NULL

head(coffee_sales)

print(distinct(coffee_sales,coffee_sales$coffee_name))

#############################################################
#(b)count beverages per Time_of_Day
#############################################################

coffee_sales %>%
  group_by(Time_of_Day)%>%
  summarise(num_of_beverages_sold= n())

#############################################################
# (c) Coffee vs non-coffee beverages
#############################################################

non_coffee <- filter(coffee_sales, coffee_name == "Hot Chocolate" | coffee_name == "Cocoa")
num_of_non_coffee <- nrow(non_coffee)
mean_of_non_coffee <- mean(non_coffee$money)
print(num_of_non_coffee)
print(signif(mean_of_non_coffee, 5))

coffee <- filter(coffee_sales, coffee_name != "Hot Chocolate" & coffee_name != "Cocoa")
num_of_coffee <- nrow(coffee)
mean_of_coffee <- mean(coffee$money)
print(num_of_coffee)
print(signif(mean_of_coffee, 5))


# Morning drinkers
coffee %>%
  filter(Time_of_Day == "Morning")%>%
  nrow()

non_coffee %>%
  filter(Time_of_Day == "Morning")%>%
  nrow()
#############################################################
# (d) Total sales per weekday
#############################################################

daily_sales <- coffee_sales
daily_sales$hour_of_day <- NULL
daily_sales$cash_type <- NULL
daily_sales$coffee_name <- NULL
daily_sales$Time_of_Day <- NULL
daily_sales$Month_name <- NULL
daily_sales$Weekdaysort <- NULL
daily_sales$Monthsort <- NULL


daily_sales <- daily_sales %>%
  group_by(Weekday) %>%
  summarise(sales_per_day = sum(money))


daily_sales_sorted <- daily_sales[order(-daily_sales$sales_per_day), ]

print(daily_sales)
print(daily_sales_sorted)

#############################################################
#(e)Morning / Afternoon / Night per weekday
#############################################################

morning <-filter(coffee_sales,Time_of_Day=="Morning")
afternoon <-filter(coffee_sales,Time_of_Day=="Afternoon")
night <-filter(coffee_sales,Time_of_Day=="Night")

morning <- morning %>%
  group_by(Weekday) %>%
  summarise(num_of_sales = n())
afternoon <- afternoon %>%
  group_by(Weekday) %>%
  summarise(num_of_sales = n())
night <- night %>%
  group_by(Weekday) %>%
  summarise(num_of_sales = n())

#merge columns into daily_sales
daily_sales$morning_sales <- morning$num_of_sales
daily_sales$afternoon_sales <- afternoon$num_of_sales
daily_sales$night_sales <- night$num_of_sales

daily_sales

#best days
best_morning <-daily_sales[order(-daily_sales$morning_sales), ]
best_afternoon <- daily_sales[order(-daily_sales$afternoon_sales), ]
best_night <- daily_sales[order(-daily_sales$night_sales), ]

print(best_morning[1,])
print(best_afternoon[1,])
print(best_night[1,])

