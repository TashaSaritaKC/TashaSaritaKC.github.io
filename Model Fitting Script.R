# Total Sales by Date
sales_by_date <- data %>%
  group_by(Date) %>%
  summarise(Total_Sales = sum(Amount * Qty))

# Plot Total Sales over Time
ggplot(sales_by_date, aes(x = Date, y = Total_Sales)) +
  geom_line(color = 'blue') +
  labs(title = "Total Sales Over Time", x = "Date", y = "Total Sales")

# Calculate the 80% threshold date for splitting data
threshold_date <- sales_by_date$Date[floor(0.8 * nrow(sales_by_date))]

# Splitting the data into training (80%) and testing (20%)
train_data <- sales_by_date %>% filter(Date <= threshold_date)
test_data <- sales_by_date %>% filter(Date > threshold_date)

# Fit an Exponential Smoothing model
exp_smoothing_model <- ets(train_data$Total_Sales)