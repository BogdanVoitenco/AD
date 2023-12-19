
install.packages("openintro")
install.packages("tidyverse")
library(openintro)
library(tidyverse)
head(email50)
glimpse(email50)
glimpse(email50)
email50_big <- filter(email50, number == "big")
glimpse(email50_big)
med_num_char <- median(email50$num_char)
email50_updated <- email50 %>%
  mutate(num_char_cat = if_else(num_char < med_num_char, "below median", "at or above median"))
count(email50_updated, num_char_cat)
email50_updated <- email50_updated %>%
  mutate(number_cat = if_else(number %in% c("small", "big"), "yes", "no"))
ggplot(email50_updated, aes(x = number_cat)) +
  geom_bar()
ggplot(email50_updated, aes(x = num_char, y = exclaim_mess, color = factor(spam))) +
  geom_point()
summary(evals)
evals <- evals %>%
  mutate(cls_type = case_when(
    cls_students <= 18 ~ "small",
    cls_students <= 59 ~ "midsize",
    cls_students >= 60 ~ "large"
  ))