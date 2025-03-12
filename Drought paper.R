# Load required libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# Create the data frame
data <- data.frame(
  FFG = c("Collector-Gatherer", "Grazer-Scraper", "Filterer", "Predator", "Shredder"),
  February = c(83.5, 5.2, 4.8, 3.4, 3.1),
  June = c(92.7, 6.1, 0.5, 0.5, 0.2),
  July = c(93.0, 4.4, 0.9, 0.8, 0.9),
  September = c(51.3, 10.3, 16.7, 21.8, 0.0),
  November = c(82.2, 8.3, 1.1, 6.4, 1.9)
)

# Reshape data to long format
data_long <- data %>%
  pivot_longer(cols = -FFG, names_to = "Month", values_to = "Percentage")

# Ensure correct order of months
data_long$Month <- factor(data_long$Month, levels = c("February", "June", "July", "September", "November"))

# Plot the data
ggplot(data_long, aes(x = Month, y = Percentage, fill = FFG)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "",
       x = "Month",
       y = "Percentage",
       fill = "Feeding\n habits") +  # Line break in legend titl) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, color = "black", size = 14),
    axis.text.y = element_text(color = "black", size = 14),
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16),
    legend.text = element_text(size = 12),
    legend.title = element_text(size = 14)
  )


