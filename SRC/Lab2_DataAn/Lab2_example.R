library(readr)
library(dplyr) 
library(tidyr) 
library(ggplot2) 
comics <- read_csv("D:\\University\\DataAn\\Lab2_DataAn\\comic_characters.csv")
comics$align <- factor(comics$align)
comics$sex <- factor(comics$sex)
# Exercise 1
head(comics)
levels(comics$align)
levels(comics$sex)
tab <- comics %>%
  count(sex, align) %>%
  pivot_wider(names_from = sex, values_from = n)
# Exercise 2
tab
level_to_filter <- "Level_to_filter"
comics_filtered <- comics %>%
  filter(align != level_to_filter)
comics_filtered$align <- droplevels(comics_filtered$align)
write.csv(comics_filtered, "comics_filtered.csv")
levels(comics_filtered$align)
# Exercise 3
ggplot(comics_filtered, aes(x = align, fill = sex)) +
  geom_bar(position = "dodge") +
  labs(x = "Alignment", y = "Count", fill = "Sex") +
  ggtitle("Character Alignment by Sex")
ggplot(comics_filtered, aes(x = sex, fill = align)) +
  geom_bar(position = "dodge") +
  labs(x = "Sex", y = "Count", fill = "Alignment") +
  ggtitle("Character Sex by Alignment")