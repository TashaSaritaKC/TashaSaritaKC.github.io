# Forecast sales for the next 30 days
forecast_values <- forecast(exp_smoothing_model, h = nrow(test_data))

# Plot the forecast
autoplot(forecast_values) +
  labs(title = "Sales Forecast", x = "Date", y = "Total Sales")

# Calculate Mean Absolute Percentage Error (MAPE)
actual_values <- test_data$Total_Sales
forecasted_values <- as.numeric(forecast_values$mean)

mape <- mean(abs((actual_values - forecasted_values) / actual_values)) * 100
print(paste("MAPE:", round(mape, 2), "%"))