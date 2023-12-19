library(dplyr)
library(ggplot2)
your_data <- read.csv("D:\\University\\DataAn\\Lab2_DataAn\\Filtered_Grocery_Stores.csv")
common_name_summary <- your_data %>%
  group_by(Common_Name) %>%
  summarize(mean_SquareFeet = mean(SquareFeet),
            median_SquareFeet = median(SquareFeet))
spread_summary <- your_data %>%
  group_by(Common_Name) %>%
  summarize(
    sd_SquareFeet = sd(SquareFeet, na.rm = TRUE), 
    iqr_SquareFeet = IQR(SquareFeet, na.rm = TRUE), 
    n_entries = sum(!is.na(SquareFeet))  
  )
subset_summary <- your_data %>%
  filter(DIG_MEMBER == "Yes") %>%
  summarize(mean_SquareFeet = mean(SquareFeet),
            median_SquareFeet = median(SquareFeet),
            sd_SquareFeet = sd(SquareFeet),
            iqr_SquareFeet = IQR(SquareFeet))
your_data_filtered <- your_data %>%
  filter(!is.na(SquareFeet) & is.finite(SquareFeet))
ggplot(your_data_filtered, aes(x = SquareFeet)) +
  geom_density() +
  labs(title = "Density Plot of SquareFeet")
your_data_filtered <- your_data_filtered %>%
  mutate(log_SquareFeet = log(SquareFeet)) %>%
  filter(!is.na(log_SquareFeet) & is.finite(log_SquareFeet))
ggplot(your_data_filtered, aes(x = log_SquareFeet)) +
  geom_density() +
  labs(title = "Density Plot of Log-Transformed SquareFeet")
your_data <- your_data %>%
  mutate(is_outlier = ifelse(SquareFeet > 5000, TRUE, FALSE))
boxplot_data <- your_data %>%
  filter(DIG_MEMBER == "Yes" & !is_outlier)
ggplot(boxplot_data, aes(y = SquareFeet)) +
  geom_boxplot() +
  labs(title = "Boxplot of SquareFeet in DIG_MEMBER 'Yes' (Outliers Removed)")
