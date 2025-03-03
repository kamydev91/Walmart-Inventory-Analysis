# Walmart Inventory Management Analysis
## Overview
In this project I analyzed Walmart sales data to optimize inventory management using MySQL. It calculates average sales per store, identifies holiday sales spikes, and explores external factors like fuel price and temperature.

## Dataset
- Source: [Kaggle](https://www.kaggle.com/datasets/yasserh/walmart-dataset)
- Columns: Store, Date, Weekly_Sales, Holiday_Flag, Temperature, Fuel_Price, CPI, Unemployment

## Setup
1. Load `Walmart.csv` into MySQL Workbench or run `creating_and_loading.sql`.
2. Run `cleaning_and_formatting.sql` to clean and format data.

## Analysis
- **EDA and Statistics**: `summary_statistics.sql` checks data quality and summarizes key metrics.
- **Analysis**: `Queries.sql` contains queries for:
  - Average weekly sales per store
  - Holiday sales spikes
  - Sales vs. external factors

## Results
- `Average_Weekly_Sales_per_Store.csv`: Sales performance by store
- `Stores_with_Sales_Spikes_During_Holidays.csv`: Stores with holiday sales increases
- `Relationships.csv`: Sales with fuel price and temperature

## Tools
- MySQL Workbench
- SQL

## License
Dataset used under Kaggle’s terms. Code is open-source (MIT License).
