# Average Weekly Sales per Store 
SELECT
    Store,
    AVG(Weekly_Sales) AS avg_weekly_sales,
    COUNT(*) AS weeks_reported
FROM walmart_sales
GROUP BY Store
ORDER BY avg_weekly_sales DESC;


# Stores with Sales Spikes During Holidays
WITH HolidayStats AS (
    SELECT
        Store,
        AVG(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales ELSE NULL END) AS avg_holiday_sales,
        AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales ELSE NULL END) AS avg_non_holiday_sales
    FROM walmart_sales
    GROUP BY Store
)
SELECT
    Store,
    avg_holiday_sales,
    avg_non_holiday_sales,
    (avg_holiday_sales - avg_non_holiday_sales) AS sales_spike,
    ROUND(((avg_holiday_sales - avg_non_holiday_sales) / avg_non_holiday_sales) * 100, 2) AS spike_percentage
FROM HolidayStats
WHERE avg_holiday_sales > avg_non_holiday_sales
ORDER BY spike_percentage DESC;


# relationships
SELECT
    Store,
    AVG(Weekly_Sales) AS avg_sales,
    AVG(Fuel_Price) AS avg_fuel_price,
    AVG(Temperature) AS avg_temperature
FROM walmart_sales
GROUP BY Store
ORDER BY avg_sales DESC;