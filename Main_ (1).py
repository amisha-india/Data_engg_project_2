import pandas as pd

# Load the CSV data
data = pd.read_csv('C:/Users/amarj/PycharmProjects/EnvironmentalData/environment_data.csv')

# Display the first few rows of the data
print("Original Data:")
print(data.head())

# Data Preprocessing

# 1. Handling Missing Values (fill missing PM2.5 values with the mean of the column)
data.fillna({'PM25':data['PM25'].mean()}, inplace=True)

# 2. Normalizing pollution and weather readings (min-max normalization)
cols_to_normalize = ['PM25', 'PM10', 'CO2', 'Temperature', 'Humidity', 'WindSpeed']
data[cols_to_normalize] = (data[cols_to_normalize] - data[cols_to_normalize].min()) / (data[cols_to_normalize].max() - data[cols_to_normalize].min())

# Display the preprocessed data
print("\nPreprocessed Data:")
print(data.head())

# Feature Engineering

# Example feature: Calculating the pollution index as a weighted sum of PM2.5, PM10, and CO2 levels
data['PollutionIndex'] = data['PM25'] * 0.4 + data['PM10'] * 0.4 + data['CO2'] * 0.2

# Display the features
print("\nData with Feature Engineering (Pollution Index):")
print(data.head())

# Save preprocessed data to a new CSV
data.to_csv('C:/Users/amarj/PycharmProjects/EnvironmentalData/preprocessed_data.csv', index=False)