SELECT * FROM walmart_sales LIMIT 5;
SELECT COUNT(*) AS total_rows FROM walmart_sales;

DESCRIBE walmart_sales;

SELECT DISTINCT Date FROM walmart_sales LIMIT 10;

SELECT Date, COUNT(*) AS occurrences
FROM walmart_sales
GROUP BY Date
ORDER BY occurrences DESC
LIMIT 10;

ALTER TABLE walmart_sales
ADD COLUMN date_cleaned DATE;

UPDATE walmart_sales
SET date_cleaned = CASE
    -- Format: MM/DD/YYYY (e.g., 5/2/2010 or 05/02/2010)
    WHEN Date REGEXP '^[0-1]?[0-9]/[0-3]?[0-9]/[0-9]{4}$' THEN
        STR_TO_DATE(Date, '%m/%d/%Y')
    -- Format: DD-MM-YYYY (e.g., 19-02-2010)
    WHEN Date REGEXP '^[0-3]?[0-9]-[0-1]?[0-9]-[0-9]{4}$' THEN
        STR_TO_DATE(Date, '%d-%m-%Y')
    -- Format: DD-MMM-YYYY (e.g., 05-Feb-2010)
    WHEN Date REGEXP '^[0-3]?[0-9]-[A-Za-z]{3}-[0-9]{4}$' THEN
        STR_TO_DATE(Date, '%d-%b-%Y')
    ELSE NULL
END;

SELECT Date, date_cleaned
FROM walmart_sales
LIMIT 100;

SELECT Date, COUNT(*) AS failed_count
FROM walmart_sales
WHERE date_cleaned IS NULL
GROUP BY Date;

ALTER TABLE walmart_sales
DROP COLUMN Date;

ALTER TABLE walmart_sales
CHANGE COLUMN date_cleaned Date DATE;

DESCRIBE walmart_sales;

SELECT Date FROM walmart_sales LIMIT 5;

SELECT * FROM walmart_sales LIMIT 5;

SELECT
    SUM(CASE WHEN Store IS NULL THEN 1 ELSE 0 END) AS store_nulls,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS date_nulls,
    SUM(CASE WHEN Weekly_Sales IS NULL THEN 1 ELSE 0 END) AS sales_nulls,
    SUM(CASE WHEN Holiday_Flag IS NULL THEN 1 ELSE 0 END) AS holiday_nulls,
    SUM(CASE WHEN Temperature IS NULL THEN 1 ELSE 0 END) AS temp_nulls,
    SUM(CASE WHEN Fuel_Price IS NULL THEN 1 ELSE 0 END) AS fuel_nulls,
    SUM(CASE WHEN CPI IS NULL THEN 1 ELSE 0 END) AS cpi_nulls,
    SUM(CASE WHEN Unemployment IS NULL THEN 1 ELSE 0 END) AS unemp_nulls
FROM walmart_sales;

SELECT COUNT(DISTINCT Store) AS unique_stores FROM walmart_sales;

SELECT MIN(Date) AS earliest_date, MAX(Date) AS latest_date FROM walmart_sales;


SELECT DISTINCT Holiday_Flag FROM walmart_sales;

CREATE INDEX idx_store ON walmart_sales(Store);
CREATE INDEX idx_date ON walmart_sales(Date);

SELECT * FROM walmart_sales LIMIT 5;
SELECT Date, TRIM(Date) FROM walmart_sales;
