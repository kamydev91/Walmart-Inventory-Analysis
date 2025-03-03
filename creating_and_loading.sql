DROP DATABASE IF EXISTS `walmart_inventory`;
CREATE DATABASE `walmart_inventory`;
USE `walmart_inventory`;

CREATE TABLE walmart_sales (
     Store INT,
     Date VARCHAR(10),
     Weekly_Sales DECIMAL(10,2),
     Holiday_Flag INT,
     Temperature DECIMAL(10,2),
     Fuel_Price DECIMAL(10,2),
     CPI DECIMAL(10,2),
     Unemployment DECIMAL(10,2)
);
