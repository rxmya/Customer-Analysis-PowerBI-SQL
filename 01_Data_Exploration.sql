SELECT *
FROM customers
LIMIT 10;

SELECT COUNT(*) AS Total_Customers
FROM customers;

PRAGMA table_info(customers);

SELECT
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
    SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Missing_Education,
    SUM(CASE WHEN Marital_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Marital_Status
FROM customers;

SELECT DISTINCT Education
FROM customers;

SELECT DISTINCT Marital_Status
FROM customers;

SELECT
    MIN(Income) AS Minimum_Income,
    MAX(Income) AS Maximum_Income
FROM customers;

SELECT
    MIN(2026 - Year_Birth) AS Youngest_Age,
    MAX(2026 - Year_Birth) AS Oldest_Age
FROM customers;