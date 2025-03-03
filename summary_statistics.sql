SELECT
    AVG(Weekly_Sales) AS avg_sales,
    MIN(Weekly_Sales) AS min_sales,
    MAX(Weekly_Sales) AS max_sales,
    AVG(Temperature) AS avg_temp,
    AVG(Fuel_Price) AS avg_fuel,
    AVG(CPI) AS avg_cpi,
    AVG(Unemployment) AS avg_unemp
FROM walmart_sales;

