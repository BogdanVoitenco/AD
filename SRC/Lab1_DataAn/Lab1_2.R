# Load necessary libraries
install.packages("openintro")
install.packages("tidyverse")
library(openintro)
library(tidyverse)

# 1.1
# Read your dataset (replace "your_dataset.csv" with the actual path to your dataset)
your_dataset <- read.csv("D:\\University\\DataAn\\Lab1_DataAn\\Grocery_Stores.csv")

# Take a peek at your dataset using head() function.
head(your_dataset)

# Take a peek at your dataset using the glimpse() function.
glimpse(your_dataset)

# How many observations and variables are there?
# Answer: You can count the number of rows and columns using nrow() and ncol().

# 1.2
# Use the glimpse() function to view the variables in your dataset.
glimpse(your_dataset)

# Review the output to identify each variable as numerical or categorical.

# 1.3
# Create a new dataset called your_dataset_big containing only specific conditions (e.g., SquareFeet > X).
your_condition <- 1000  # Replace with your specific condition
your_dataset_big <- filter(your_dataset, SquareFeet > your_condition)

# Report the dimensions of your_dataset_big using the glimpse() function.
glimpse(your_dataset_big)

# How many observations meet the specified condition?


# 1.4
# Find the median of a numerical variable.
med_square_feet <- median(your_dataset$SquareFeet)

# Create a new column num_char_cat.
your_dataset_updated <- your_dataset %>%
  mutate(SquareFeet_cat = if_else(SquareFeet < med_square_feet, "below median", "at or above median"))

# Count the number of observations in each level of SquareFeet_cat.
count(your_dataset_updated, SquareFeet_cat)

# 1.5
# Create a new variable based on specific conditions (e.g., combining levels).
your_dataset_updated <- your_dataset_updated %>%
  mutate(New_Variable = if_else(SquareFeet > your_condition, "yes", "no"))

# View the updated dataset
glimpse(your_dataset_updated)



# 1.6
# Создать точечную диаграмму рассеяния для вашего датасета
ggplot(your_dataset_updated, aes(x = SquareFeet, y = Better_Long, color = Common_Name)) +
  geom_point()




# 1.7
# Inspect your dataset using the summary() function.
summary(your_dataset)

# Glimpse() vs. Summary():
# glimpse() provides a detailed view of the dataset.
# summary() provides basic summary statistics for numerical variables.

# 1.8
# Recode the "SquareFeet" variable into a new categorical variable.
your_dataset <- your_dataset %>%
  mutate(New_Categorical_Variable = case_when(
    SquareFeet <= Centroid_X ~ "small",
    SquareFeet <= Centroid_Y ~ "midsize",
    SquareFeet >= Data_Source ~ "large"
  ))


# New_Categorical_Variable is a categorical variable.

# 1.9 - 1.16
# These tasks are related to your course project and require specific information about your dataset and project goals.
# Please provide details about your dataset and project for further assistance.
