install.packages('openintro') 
install.packages('tidyverse') 
library(openintro)
library(tidyverse)
mydata <- read.csv("D:\\University\\DataAn\\Lab1_DataAn\\Grocery_Stores.csv")
head(mydata)
?glimpse(mydata)
hybryd <- mydata %>% filter(State == "MI" | State == "DETROIT")
glimpse(mydata)
glimpse(hybryd)
#1.4
med_num_char <- median(mydata$State)
mydata_updated <- mydata %>%
  mutate(price_char = if_else(State < med_num_char, "below median", "at or above median"))
counts <- mydata_updated %>%
  count(price_char)
print(counts)
#1.5
mydata_updated <- mydata %>%
  mutate(clean_title_counts = if_else(Notes %in% c("Yes"), "yes", "no"))
ggplot(mydata_updated, aes(x = clean_title_counts)) +
  geom_bar() +
  labs(title = "Distribution of clean_title Variable", x = "Contains Number", y = "Count")
#1.6
library(ggplot2)
ggplot(hybryd, aes(x = SquareFeet, y = State, color = State)) +
  geom_point() +
  labs(
    title = "График SquareFeet",
    x = "Площадь (Square Feet)",
    y = "Штат (State)",
    color = "Штат"
  )
#1.7
glimpse(mydata)
summary(mydata)
#1.8
mydata_updated <- mydata %>%
  mutate(year_cluster = case_when(
    State <= 2010 ~ "old",
    State >= 2015 & State <= 2020 ~ "medium",
    State >= 2020 ~ "new",
    TRUE ~ "unknown"  # Обработка всех остальных случаев
  ))
glimpse(evals)