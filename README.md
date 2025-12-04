# Homework1_DAMA51
R scripts for HOU DAMA51: Foundations in Computer Science Written Assignment 1. Tasks cover data inspection, cleaning, visualization (Topic 2), correlation and normalization (Topic 3), and complex data frame manipulation (Topic 4)

📚 DAMA51: Foundations in Computer Science - Written Assignment 1

Overview

This repository contains the R code and documentation for the first written assignment of the DAMA51: Foundations in Computer Science course, part of the Data Science and Machine Learning (MSc) program at the Hellenic Open University (HOU) for the Academic Year: 2025-2026. 

The assignment focuses on data analysis, statistical correlation, and the use of Data Frames in R, utilizing two primary datasets: Coffee Sales and Red Wine Quality.

📂 Repository Structure

The submission requires one document file and a compressed file containing R scripts. This repository reflects the contents of the compressed file.

.

├── Sinanis-Topic2.R       # R script for Topic 2: Tabular and Graphical Representations 

├── Sinanis-Topic3.R       # R script for Topic 3: Correlation 

├── Sinanis-Topic4.R       # R script for Topic 4: Data Frames 

└── README.md              # This file


🛠️ Setup and Execution

Data Sources

The scripts require access to the following datasets:

Topic          Dataset                                NameSource/Link

Topic 2 & 4    Coffee Sales Dataset                   https://www.kaggle.com/datasets/anassarfraz13/coffee-sales-dataset 

Topic 3        Wine Quality Dataset (Red Wine)        https://archive.ics.uci.edu/dataset/186/wine+quality 

Important Note on File Reading:The R scripts employ interactive methods (e.g., file.choose()) to allow the user to select the file path, instead of using static paths.

Execution Guidelines

The R script files must run automatically using the Code -> Source File menu item in RStudio without producing any errors.All requested results are printed to the console, and all requested plots are drawn in the plots window.Comments are included before each command to explain its functionality.All numerical answers are given to three decimal places unless otherwise stated.


📋 Detailed Assignment Topics

Topic 2: Tabular and Graphical Representations 

This topic involves inspecting, cleaning, manipulating, and visualizing the Coffee Sales Dataset. 

*2.a. Inspection and Basic Statistics: Store the dataset in a dataframe (coffee_data), inspect it using str() and summary(), and calculate key metrics (number of records, attributes, numeric attributes  (integer), and mean amount of money spent in a transaction).

*2.b. Data Preparation for a Classifier: Create a new dataframe (new_coffee_data) by performing the following steps:Remove irrelevant attributes/columns.Move the coffee_name column to be the last column.Remove data records for non-coffee beverages ("Hot Chocolate" and "Cocoa").Unify "Americano" and "Americano with Milk" into one value.

*2.c. Contingency Table: Create a frequency distribution contingency table for coffee_name and Weekday, ensuring day columns are displayed in their week order. Infer the relationship between coffee types and days of sales.

*2.d. Bar Chart: Create a bar chart showing the frequencies of coffee types.

*2.e. Pie Chart: Create a pie chart showing the distribution of coffee sales across different months. Evaluate if a pie chart is the best visualization for safe conclusions in this case.

*2.f. Box Plots: Create box plots to show the money distribution of sales across different days of the week.


Topic 3: Correlation

This topic focuses on correlation analysis and data normalization using the winequality-red dataset.

*3.a. Data Inspection: Store the dataset in a dataframe (wine_data), inspect it using str() and summary(), and report the number of records, attributes, and numeric attributes (num).

*3.b. Correlation Matrix and Heatmap:Create short_wine_data by removing specified attributes3.Calculate and display the Pearson's correlation matrix for short_wine_data31.Identify the pair of variables with the strongest correlation.Visualize the correlation matrix using a heatmap (suppressing dendrograms).

*3.c. Normalization Effect: Fetch the correlation between chlorides and sulphates (cor_before). Normalize numeric variables using min-max scaling and recompute the correlation (cor_after), then discuss any observed differences.

*3.d. Scatter Plot and Jitter: Create a scatter plot of citric.acid and fixed.acidity. Investigate the need to use jitter and provide justification.


Topic 4: Data Frames 

This topic covers advanced data frame manipulation and calculation using the Coffee Sales Dataset.

*4.a. Cleanup and Unique Beverages: Load the dataset, remove the Date and Time columns, verify the removal, and print/report the different types of beverages.

*4.b. Sales by Time Period: Identify the different time periods (Time_of_Day) and calculate the number of beverages sold in each period.

*4.c. Coffee vs. Non-Coffee Statistics:Calculate the number and mean price of non-coffee ("Hot Chocolate", "Cocoa") and coffee beverages.Determine if more coffee or non-coffee beverages are consumed in the morning (Morning).

*4.d. Total Daily Revenue: Calculate the sum of money (money) from sales for each weekday. Create a new dataframe (daily_sales) combining the weekdays and the calculated money_per_day vector. Identify the three days with the largest number of sales.

*4.e. Sales by Day and Time Period: Calculate the number of sales for each weekday across three time periods (morning, afternoon, night). Extend the daily_sales dataframe with these new vectors and identify the best day for morning, afternoon, and night sales.
