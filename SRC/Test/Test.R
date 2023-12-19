# Load necessary libraries
library(ggplot2)
library(scales)
library(dplyr) 

# Assuming your data is loaded into a DataFrame named grocery_data
# Replace 'your_dataframe' with the actual name of your DataFrame
grocery_data <- read.csv("D:/University/DataAn/Test/Grocery_Stores.csv")

# Clean data - remove rows with NA values in Better_Lat and Better_Long
coordinates <- grocery_data[, c("Better_Lat", "Better_Long")]
coordinates <- na.omit(coordinates) # Removes rows with any NA values in the selected columns

# K-means clustering
set.seed(123) # Setting seed for reproducibility
clusters <- kmeans(coordinates, 3) # Change the number of clusters as needed

# Plotting the clusters
plot(coordinates, col=clusters$cluster, main="K-Means Clustering", xlab="Longitude", ylab="Latitude")
points(clusters$centers, col=1:3, pch=8, cex=2)

# Plotting histogram with ggplot2
ggplot(grocery_data, aes(x=SquareFeet)) +
  geom_histogram(binwidth = 1000, fill="green", color="black") +
  ggtitle("Distribution of Store Sizes") +
  xlab("Square Feet") +
  ylab("Frequency")

# Create a horizontal bar chart of the number of stores by postal code
ggplot(grocery_data, aes(x=as.factor(ZipCode))) + 
  geom_bar(fill="green", color="black") +
  coord_flip() + # Flip the coordinates to make the bars horizontal
  labs(title="Количество магазинов по почтовым индексам", y="Количество магазинов", x="Почтовый индекс") +
  theme(axis.text.y = element_text(angle = 0, hjust = 1)) # Adjust the y labels for better readability


# Calculate statistics for annotations
min_value <- min(grocery_data$SquareFeet, na.rm = TRUE)
max_value <- max(grocery_data$SquareFeet, na.rm = TRUE)
avg_value <- mean(grocery_data$SquareFeet, na.rm = TRUE)

# Generate a line plot with smooth lines and colored by the SquareFeet value
p <- ggplot(grocery_data, aes(x = seq_along(SquareFeet), y = SquareFeet)) + 
  geom_smooth(se = FALSE, span = 0.3) + # Smooth the line, adjust span for more or less smoothing
  geom_point(aes(color = SquareFeet)) + # Color points by SquareFeet value
  scale_color_gradient(low = "blue", high = "red") + # Gradient color for points
  geom_text(aes(label = ifelse(SquareFeet == max_value, as.character(max_value), '')),
            hjust = 1.5, vjust = 0, check_overlap = TRUE, nudge_y = 10000) +
  geom_hline(yintercept = avg_value, linetype = "dashed", color = "darkgreen") +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  labs(title = "Variable Over Time", x = "Id", y = "SquareFeet Value") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  guides(color = guide_legend(title = "Square Feet")) # Add legend for color scale

# Print the plot
print(p)


# Calculate the count of each 'Common_Name'
common_name_counts <- grocery_data %>%
  group_by(Common_Name) %>%
  summarise(Count = n(), .groups = 'drop')

# Decide on a cutoff for the number of top categories to display separately
# Increase the cutoff value to show more individual categories
cutoff <- 20  # Adjust this number based on your preference

# Create a new category for "Other"
common_name_counts <- common_name_counts %>%
  mutate(Category = ifelse(rank(-Count) <= cutoff, Common_Name, "Other")) %>%
  group_by(Category) %>%
  summarise(Count = sum(Count), .groups = 'drop')

# Create a bar chart
ggplot(common_name_counts, aes(x = reorder(Category, Count), y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Flip coordinates to make it horizontal
  labs(x = "Common Name", y = "Count", title = "Counts of Stores by Common Name") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend to reduce clutter

# Print the plot
ggsave("Store_Counts_by_Common_Name.png", width = 12, height = 8)