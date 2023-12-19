# Load necessary libraries
library(ggplot2)
library(dplyr)
library(broom)

# Read the data
grocery_data <- read.csv('D:/University/DataAn/Lab5_DataAn/Grocery_Stores.csv')

# Inspect the data
head(grocery_data)

# Select relevant columns for regression, including ZipCode and Better_Long for the independent variables
# and SquareFeet as the dependent variable
regression_data <- grocery_data %>% 
  select(SquareFeet, Better_Long, ZipCode) %>% 
  na.omit()  # Remove rows with missing data

# Visualization for Better_Long
ggplot(regression_data, aes(x=Better_Long, y=SquareFeet)) +
  geom_point() +
  geom_smooth(method='lm', se=FALSE)

# Regression model for Better_Long
model <- lm(SquareFeet ~ Better_Long, data=regression_data)
summary(model)

# Additional Task: Visualization for ZipCode
ggplot(regression_data, aes(x=ZipCode, y=SquareFeet)) +
  geom_point() +
  geom_smooth(method='lm', se=FALSE)

# Additional Task: Regression model for ZipCode
model_zip <- lm(SquareFeet ~ ZipCode, data=regression_data)
summary(model_zip)

# Extract and display coefficients for both models
coefficients <- summary(model)$coefficients
coefficients_zip <- summary(model_zip)$coefficients

# Augment the data with model predictions for both models
augmented_data <- augment(model)
augmented_data_zip <- augment(model_zip)

# Inspect augmented data
head(augmented_data)
head(augmented_data_zip)