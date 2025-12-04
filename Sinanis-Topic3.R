###############################################
#Topic 3
###############################################

#load necessary libraries
library(tidyverse)

#load dataset
wine_data <- read.table(file.choose(),header=TRUE,sep=";")

#############################################################
#(a)inspect dataset
#############################################################

str(wine_data)
summary(wine_data)

#############################################################
#(b)compute correlation matrix
#############################################################

#keep relevant columns only
short_wine_data <- wine_data
short_wine_data$fixed.acidity <- NULL
short_wine_data$volatile.acidity <- NULL
short_wine_data$free.sulfur.dioxide <- NULL
short_wine_data$total.sulfur.dioxide <- NULL
short_wine_data$pH <- NULL
short_wine_data$quality <- NULL

#inspect dataset
str(short_wine_data)
summary(short_wine_data)

# Correlation matrix
cor_matrix <- cor(short_wine_data,method = "pearson")
cor_matrix

#############################################################
# Heatmap
#############################################################

library(ggplot2)
library(reshape2)

cor_melt <- melt(cor_matrix)

ggplot(cor_melt, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limits = c(-1, 1),name = "Pearson") +
  labs(title = "Correlation Matrix (Pearson)", x = NULL, y = NULL)

#############################################################
#(c)min-max normalization
#############################################################

short_wine_data_norm <- as.data.frame(lapply(short_wine_data, function(x) {
  if (is.numeric(x)) {
    (x - min(x)) / (max(x) - min(x))
  } else {
    x
  }
}))

cor_matrix_norm <- cor(short_wine_data_norm,method = "pearson")
cor_matrix_norm

#############################################################
#(d)scatter plot with jitter
#############################################################

plot(jitter(wine_data$citric.acid), jitter(wine_data$fixed.acidity),
     main = "Relationship between Citric Acid & Fixed Acidity",
     xlab = "Citric Acid",ylab = "Fixed Acidity")
