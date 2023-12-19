library(readr) 
library(dplyr) 
library(tidyr) 
library(ggplot2)
your_dataset <- read_csv("D:\\University\\DataAn\\Lab2_DataAn\\Grocery_Stores.csv")
# Exercise 1
head(your_dataset)
levels(your_dataset$Common_Name)
levels(your_dataset$DIG_MEMBER)
tab <- your_dataset %>%
  count(Common_Name, DIG_MEMBER) %>%
  pivot_wider(names_from = Common_Name, values_from = n)
# Exercise 2
tab <- your_dataset %>%
  count(Common_Name, DIG_MEMBER) %>%
  pivot_wider(names_from = Common_Name, values_from = n)
level_to_filter <- which.min(colSums(tab[, -1]))  # Exclude the first column
level_to_filter_name <- colnames(tab)[-1][level_to_filter]
your_dataset_filtered <- your_dataset %>%
  filter(!(State != "MI"))
unique(your_dataset_filtered$DIG_MEMBER)
write.csv(your_dataset_filtered, "D:\\University\\DataAn\\Lab2_DataAn\\Filtered_Grocery_Stores.csv")
unique(your_dataset_filtered$DIG_MEMBER)
# Exercise 3
ggplot(your_dataset_filtered, aes(x = Common_Name, fill = DIG_MEMBER)) +
  geom_bar(position = "dodge") +
  labs(x = "Common Name", y = "Count", fill = "DIG_MEMBER") +
  ggtitle("Common Name by DIG_MEMBER")
ggplot(your_dataset_filtered, aes(x = DIG_MEMBER, fill = Common_Name)) +
  geom_bar(position = "dodge") +
  labs(x = "DIG_MEMBER", y = "Count", fill = "Common Name") +
  ggtitle("DIG_MEMBER by Common Name")
