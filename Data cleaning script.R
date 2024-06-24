# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(forecast)

# Load the data
data <- read.csv("C:/Users/Tasha/Downloads/My/Projects/sales data analysis/datasets/Amazon Sale Report.csv", stringsAsFactors = FALSE)
View(data)

# Inspect the data
str(data)
summary(data)

# Convert Date column to Date format
data$Date <- as.Date(data$Date, format = "%m-%d-%y")

# Handle missing values
median_amount <- median(data$Amount, na.rm = TRUE)
data$Amount[is.na(data$Amount)] <- median_amount

# Convert Amount and Qty columns to numeric
data$Amount <- as.numeric(data$Amount)
data$Qty <- as.numeric(data$Qty)

# Remove cancelled orders
data <- data[data$Status != "Cancelled", ]