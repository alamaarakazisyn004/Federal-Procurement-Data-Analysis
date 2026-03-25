CREATE DATABASE fpds_analysis;

USE fpds_analysis;

-- Check Data
SELECT * FROM clean_fpds_data LIMIT 5;

-- 1. Year-wise Spending
SELECT year,
       SUM(contract_value) AS total_spending
FROM clean_fpds_data
GROUP BY year
ORDER BY year;

-- 2. Top Vendors
SELECT vendor,
       SUM(contract_value) AS total_value
FROM clean_fpds_data
GROUP BY vendor
ORDER BY total_value DESC
LIMIT 10;

-- 3. Top Agencies
SELECT agency,
       SUM(contract_value) AS total_spending
FROM clean_fpds_data
GROUP BY agency
ORDER BY total_spending DESC
LIMIT 10;

-- 4. State-wise Spending
SELECT state,
       SUM(contract_value) AS total_spending
FROM clean_fpds_data
GROUP BY state
ORDER BY total_spending DESC;

-- 5. Vendor Performance
SELECT vendor,
       COUNT(*) AS total_contracts,
       SUM(contract_value) AS total_value,
       AVG(contract_value) AS avg_contract_value
FROM clean_fpds_data
GROUP BY vendor
ORDER BY total_value DESC;