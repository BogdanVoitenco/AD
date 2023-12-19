# Load necessary libraries
library(tidyverse)
library(ggplot2)

# Read the data
grocery_stores <- read.csv("D:/University/DataAn/Lab4_DataAn/Grocery_Stores.csv")

# Colorful Scatterplot of Store Size by ZipCode
ggplot(data = grocery_stores, aes(x = ZipCode, y = SquareFeet, color = ZipCode)) +
  geom_point() +
  labs(x = "Zip Code", y = "Square Feet", title = "Scatterplot of Store Size by ZipCode")

# Colorful Boxplot of Store Size by City
ggplot(data = grocery_stores, aes(x = City, y = SquareFeet, fill = City)) +
  geom_boxplot() +
  labs(x = "City", y = "Square Feet", title = "Boxplot of Store Size by City")


# Task 3: Histogram of Store Sizes
# Colorful Histogram of Store Sizes
ggplot(data = grocery_stores, aes(x = SquareFeet, fill = ..count..)) +
  geom_histogram(binwidth = 500) +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(x = "Square Feet", y = "Count", title = "Histogram of Store Sizes")


# Task 4: Density Plot of Latitude and Longitude
ggplot(data = grocery_stores, aes(x = Better_Long, y = Better_Lat)) +
  geom_density2d() +
  labs(x = "Longitude", y = "Latitude", title = "Density Plot of Store Locations")

# Task 5: Bar Plot of Stores by State
ggplot(data = grocery_stores, aes(x = State)) +
  geom_bar() +
  labs(x = "State", y = "Count of Stores", title = "Bar Plot of Stores by State")

ggplot(data = grocery_stores, aes(x = Better_Lat, y = SquareFeet)) +
  geom_point(alpha = 0.5) +
  labs(x = "Latitude", y = "Store Square Feet", title = "Scatter Plot of Store Size by Latitude") +
  theme_minimal()
