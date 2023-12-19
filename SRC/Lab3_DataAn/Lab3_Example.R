library(dplyr)
library(gapminder)
library(ggplot2)
gap2007 <- gapminder %>% filter(year == 2007)
continent_summary <- gap2007 %>%
  group_by(continent) %>%
  summarize(mean_life_expectancy = mean(lifeExp),
            median_life_expectancy = median(lifeExp))
spread_summary <- gap2007 %>%
  group_by(continent) %>%
  summarize(sd_life_expectancy = sd(lifeExp),
            iqr_life_expectancy = IQR(lifeExp),
            n_countries = n())
americas_summary <- gap2007 %>%
  filter(continent == "Americas") %>%
  summarize(mean_life_expectancy = mean(lifeExp),
            median_life_expectancy = median(lifeExp),
            sd_life_expectancy = sd(lifeExp),
            iqr_life_expectancy = IQR(lifeExp))
ggplot(gap2007, aes(x = pop)) +
  geom_density() +
  labs(title = "Density Plot of Population")
gap2007 <- gap2007 %>%
  mutate(log_pop = log(pop))
ggplot(gap2007, aes(x = log_pop)) +
  geom_density() +
  labs(title = "Density Plot of Log-Transformed Population")
gap2007 <- gap2007 %>%
  mutate(is_outlier = if_else(lifeExp < 50, TRUE, FALSE))
boxplot_data <- gap2007 %>%
  filter(continent == "Asia" & !is_outlier)
ggplot(boxplot_data, aes(y = lifeExp)) +
  geom_boxplot() +
  labs(title = "Boxplot of Life Expectancy in Asia (Outliers Removed)")
