library(dplyr)
library(ggplot2)
# Exercise 1
comics <- read_csv("D:\\University\\DataAn\\Lab2_DataAn\\comic_characters.csv")
head(comics)
levels(comics$align)
levels(comics$gender)
colnames(comics)
tab <- comics %>%
  count(sex, align) %>%
  pivot_wider(names_from = sex, values_from = n)
# Exercise 2
print(tab)
comics_filtered <- comics %>%
  filter(align != "Low Count Align")
comics_filtered$align <- factor(comics_filtered$align)
levels(comics_filtered$align)
colnames(comics)
# Exercise 3
library(ggplot2)
ggplot(comics, aes(x = align, fill = sex)) +
  geom_bar(position = "dodge") +
  labs(x = "Alignment", y = "Count", fill = "Sex") +
  ggtitle("Character Alignment by Sex")
ggplot(comics, aes(x = sex, fill = align)) +
  geom_bar(position = "dodge") +
  labs(x = "Gender", y = "Count", fill = "Alignment") +
  ggtitle("Character Gender by Alignment")
# Exercise 4
joint_prop_table <- comics %>%
  count(sex, align) %>%
  mutate(prop = n / sum(n))
conditional_prop_table <- comics %>%
  group_by(sex) %>%
  count(align) %>%
  mutate(prop = n / sum(n))
ggplot(joint_prop_table, aes(x = sex, y = prop, fill = align)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Gender", y = "Proportion", fill = "Alignment") +
  ggtitle("Joint Proportions of Gender and Alignment")
ggplot(conditional_prop_table, aes(x = align, y = prop, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Alignment", y = "Proportion", fill = "Gender") +
  ggtitle("Conditional Proportions of Alignment by Gender")
# Exercise 5
library(openintro)
histogram1 <- ggplot(data = cars93, aes(x = horsepower)) +
  geom_histogram(binwidth = 3, fill = "blue", color = "black") +
  labs(x = "Horsepower", y = "Frequency") +
  ggtitle("Histogram of Horsepower (Binwidth = 3)")
histogram2 <- ggplot(data = cars93, aes(x = horsepower)) +
  geom_histogram(binwidth = 30, fill = "green", color = "black") +
  labs(x = "Horsepower", y = "Frequency") +
  ggtitle("Histogram of Horsepower (Binwidth = 30)")
histogram3 <- ggplot(data = cars93, aes(x = horsepower)) +
  geom_histogram(binwidth = 60, fill = "red", color = "black") +
  labs(x = "Horsepower", y = "Frequency") +
  ggtitle("Histogram of Horsepower (Binwidth = 60)")
# Exercise 6
boxplot1 <- ggplot(data = cars93, aes(y = price)) +
  geom_boxplot(fill = "blue") +
  labs(y = "Price") +
  ggtitle("Boxplot of Price")
cars_no_out <- cars93 %>%
  filter(price < 40000)
boxplot2 <- ggplot(data = cars_no_out, aes(y = price)) +
  geom_boxplot(fill = "green") +
  labs(y = "Price") +
  ggtitle("Boxplot of Price (Outliers Removed)")
boxplot1
boxplot2
# Exercise 7
ggplot(cars93, aes(x = mpg_city)) +
  geom_histogram(binwidth = 5, fill = "purple", color = "black") +
  facet_wrap(~ type, ncol = 2) +
  labs(x = "City MPG", y = "Frequency") +
  ggtitle("Distribution of City MPG by Vehicle Type")
