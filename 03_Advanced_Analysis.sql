-- ============================================================================
-- ADVANCED SQL ANALYSIS
-- E-Commerce Customer Analysis Project
-- ============================================================================

-- This file demonstrates advanced SQL concepts including:
-- - Views
-- - Aggregations
-- - GROUP BY
-- - HAVING
-- - ORDER BY
-- - CASE WHEN
-- - Window Functions
-- - Common Table Expressions (CTEs)
-- - Subqueries
-- - Joins (when applicable)
-- - Dashboard Views for Power BI

-- ============================================================================
-- SECTION 1: VIEWS
-- ============================================================================

-- Drop view if it exists to avoid conflicts
DROP VIEW IF EXISTS customer_summary;

-- Create customer_summary view
-- This view consolidates key customer information with calculated Total_Spending
CREATE VIEW customer_summary AS
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    Year_Birth,
    (2026 - Year_Birth) AS Age,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    Response,
    Complain,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers;

-- View the customer_summary
SELECT * FROM customer_summary LIMIT 10;

-- ============================================================================
-- SECTION 2: AGGREGATIONS
-- ============================================================================

-- Average Spending across all customers
SELECT 
    AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Average_Spending
FROM customers;

-- Highest Spending Customer
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Total_Spending DESC
LIMIT 1;

-- Lowest Spending Customer
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Total_Spending ASC
LIMIT 1;

-- Average Income
SELECT 
    AVG(Income) AS Average_Income,
    MIN(Income) AS Minimum_Income,
    MAX(Income) AS Maximum_Income
FROM customers;

-- Total Spending by Product Category
SELECT 
    SUM(MntWines) AS Total_Wines,
    SUM(MntFruits) AS Total_Fruits,
    SUM(MntMeatProducts) AS Total_Meat,
    SUM(MntFishProducts) AS Total_Fish,
    SUM(MntSweetProducts) AS Total_Sweets,
    SUM(MntGoldProds) AS Total_Gold
FROM customers;

-- ============================================================================
-- SECTION 3: GROUP BY
-- ============================================================================

-- Education vs Average Spending
SELECT 
    Education,
    COUNT(*) AS Customer_Count,
    AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Average_Spending,
    AVG(Income) AS Average_Income
FROM customers
GROUP BY Education
ORDER BY Average_Spending DESC;

-- Marital Status vs Average Spending
SELECT 
    Marital_Status,
    COUNT(*) AS Customer_Count,
    AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Average_Spending,
    AVG(Income) AS Average_Income
FROM customers
GROUP BY Marital_Status
ORDER BY Average_Spending DESC;

-- Complaint Rate by Education
SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Complain = 1 THEN 1 ELSE 0 END) AS Complaints,
    ROUND(
        (SUM(CASE WHEN Complain = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Complaint_Rate_Percentage
FROM customers
GROUP BY Education
ORDER BY Complaint_Rate_Percentage DESC;

-- Campaign Response Rate by Education
SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responses,
    ROUND(
        (SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Response_Rate_Percentage
FROM customers
GROUP BY Education
ORDER BY Response_Rate_Percentage DESC;

-- Purchase Channel Analysis
SELECT 
    AVG(NumWebPurchases) AS Avg_Web_Purchases,
    AVG(NumCatalogPurchases) AS Avg_Catalog_Purchases,
    AVG(NumStorePurchases) AS Avg_Store_Purchases,
    AVG(NumDealsPurchases) AS Avg_Deal_Purchases
FROM customers;

-- ============================================================================
-- SECTION 4: HAVING CLAUSE
-- ============================================================================

-- Education groups with average spending greater than 1000
SELECT 
    Education,
    COUNT(*) AS Customer_Count,
    AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Average_Spending
FROM customers
GROUP BY Education
HAVING AVG(
    MntWines + 
    MntFruits + 
    MntMeatProducts + 
    MntFishProducts + 
    MntSweetProducts + 
    MntGoldProds
) > 1000
ORDER BY Average_Spending DESC;

-- Marital status with more than 100 customers
SELECT 
    Marital_Status,
    COUNT(*) AS Customer_Count,
    AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Average_Spending
FROM customers
GROUP BY Marital_Status
HAVING COUNT(*) > 100
ORDER BY Customer_Count DESC;

-- Education groups with response rate above 15%
SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responses,
    ROUND(
        (SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Response_Rate_Percentage
FROM customers
GROUP BY Education
HAVING (SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) > 15
ORDER BY Response_Rate_Percentage DESC;

-- ============================================================================
-- SECTION 5: ORDER BY
-- ============================================================================

-- Top 10 Spenders
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Total_Spending DESC
LIMIT 10;

-- Lowest 10 Spenders
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Total_Spending ASC
LIMIT 10;

-- Highest Income Customers
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (2026 - Year_Birth) AS Age,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Income DESC
LIMIT 10;

-- Customers by Recency (Most recent purchases first)
SELECT 
    ID,
    Education,
    Marital_Status,
    Recency,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Recency ASC
LIMIT 10;

-- ============================================================================
-- SECTION 6: CASE WHEN - CUSTOMER SEGMENTATION
-- ============================================================================

-- Customer Segmentation based on Total Spending
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    CASE
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) > 1500 THEN 'High Value'
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) BETWEEN 700 AND 1500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment
FROM customers
ORDER BY Total_Spending DESC;

-- Customer count by segment
SELECT 
    CASE
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) > 1500 THEN 'High Value'
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) BETWEEN 700 AND 1500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment,
    COUNT(*) AS Customer_Count,
    AVG(Income) AS Average_Income
FROM customers
GROUP BY Customer_Segment
ORDER BY 
    CASE 
        WHEN Customer_Segment = 'High Value' THEN 1
        WHEN Customer_Segment = 'Medium Value' THEN 2
        ELSE 3
    END;

-- Age-based segmentation
SELECT 
    ID,
    (2026 - Year_Birth) AS Age,
    CASE
        WHEN (2026 - Year_Birth) < 30 THEN 'Young Adult'
        WHEN (2026 - Year_Birth) BETWEEN 30 AND 50 THEN 'Adult'
        WHEN (2026 - Year_Birth) BETWEEN 50 AND 65 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Group,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
ORDER BY Age;

-- ============================================================================
-- SECTION 7: WINDOW FUNCTIONS
-- ============================================================================

-- Rank customers by Total Spending using ROW_NUMBER()
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    ROW_NUMBER() OVER (ORDER BY (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) DESC) AS Spending_Rank
FROM customers
ORDER BY Total_Spending DESC;

-- Rank customers by Total Spending using RANK()
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    RANK() OVER (ORDER BY (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) DESC) AS Spending_Rank
FROM customers
ORDER BY Total_Spending DESC;

-- Rank customers by Total Spending using DENSE_RANK()
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    DENSE_RANK() OVER (ORDER BY (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) DESC) AS Spending_Rank
FROM customers
ORDER BY Total_Spending DESC;

-- Calculate running total of spending by education
SELECT 
    ID,
    Education,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    SUM(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) OVER (
        PARTITION BY Education 
        ORDER BY (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) DESC
    ) AS Running_Total_By_Education
FROM customers
ORDER BY Education, Total_Spending DESC;

-- ============================================================================
-- SECTION 8: COMMON TABLE EXPRESSIONS (CTEs)
-- ============================================================================

-- CTE to find customers with spending above average
WITH Spending AS (
    SELECT 
        ID,
        Education,
        Marital_Status,
        Income,
        (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) AS Total_Spending
    FROM customers
),
AverageSpending AS (
    SELECT AVG(Total_Spending) AS Avg_Spending FROM Spending
)
SELECT 
    s.ID,
    s.Education,
    s.Marital_Status,
    s.Income,
    s.Total_Spending,
    a.Avg_Spending,
    ROUND((s.Total_Spending - a.Avg_Spending) / a.Avg_Spending * 100, 2) AS Percent_Above_Average
FROM Spending s
CROSS JOIN AverageSpending a
WHERE s.Total_Spending > a.Avg_Spending
ORDER BY s.Total_Spending DESC;

-- CTE to analyze spending by education level
WITH EducationStats AS (
    SELECT 
        Education,
        COUNT(*) AS Customer_Count,
        AVG(
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) AS Avg_Spending,
        AVG(Income) AS Avg_Income
    FROM customers
    GROUP BY Education
)
SELECT 
    Education,
    Customer_Count,
    ROUND(Avg_Spending, 2) AS Average_Spending,
    ROUND(Avg_Income, 2) AS Average_Income,
    ROUND(Avg_Spending / Avg_Income * 100, 2) AS Spending_to_Income_Ratio
FROM EducationStats
ORDER BY Average_Spending DESC;

-- CTE to find top spenders in each education level
WITH RankedCustomers AS (
    SELECT 
        ID,
        Education,
        Marital_Status,
        Income,
        (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) AS Total_Spending,
        ROW_NUMBER() OVER (PARTITION BY Education ORDER BY (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) DESC) AS Rank_In_Education
    FROM customers
)
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    Total_Spending,
    Rank_In_Education
FROM RankedCustomers
WHERE Rank_In_Education <= 3
ORDER BY Education, Rank_In_Education;

-- ============================================================================
-- SECTION 9: SUBQUERIES
-- ============================================================================

-- Find customers spending above average using subquery
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
WHERE (
    MntWines + 
    MntFruits + 
    MntMeatProducts + 
    MntFishProducts + 
    MntSweetProducts + 
    MntGoldProds
) > (
    SELECT AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) FROM customers
)
ORDER BY Total_Spending DESC;

-- Find customers with income above average and spending above average
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers
WHERE Income > (SELECT AVG(Income) FROM customers)
AND (
    MntWines + 
    MntFruits + 
    MntMeatProducts + 
    MntFishProducts + 
    MntSweetProducts + 
    MntGoldProds
) > (
    SELECT AVG(
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) FROM customers
)
ORDER BY Total_Spending DESC;

-- Find top 3 spending customers from each education level using subquery
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending
FROM customers c1
WHERE (
    SELECT COUNT(*)
    FROM customers c2
    WHERE c2.Education = c1.Education
    AND (
        c2.MntWines + 
        c2.MntFruits + 
        c2.MntMeatProducts + 
        c2.MntFishProducts + 
        c2.MntSweetProducts + 
        c2.MntGoldProds
    ) >= (
        c1.MntWines + 
        c1.MntFruits + 
        c1.MntMeatProducts + 
        c1.MntFishProducts + 
        c1.MntSweetProducts + 
        c1.MntGoldProds
    )
) <= 3
ORDER BY Education, Total_Spending DESC;

-- ============================================================================
-- SECTION 10: DASHBOARD VIEWS FOR POWER BI
-- ============================================================================

-- Drop existing dashboard views if they exist
DROP VIEW IF EXISTS vw_customer_spending_summary;
DROP VIEW IF EXISTS vw_purchase_behaviour;
DROP VIEW IF EXISTS vw_marketing_response;
DROP VIEW IF EXISTS vw_customer_segmentation;

-- View: Customer Spending Summary
-- Provides overall spending metrics for dashboard
CREATE VIEW vw_customer_spending_summary AS
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (2026 - Year_Birth) AS Age,
    Kidhome,
    Teenhome,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    Recency,
    Dt_Customer
FROM customers;

-- View: Purchase Behaviour
-- Analyzes purchase patterns across channels
CREATE VIEW vw_purchase_behaviour AS
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (2026 - Year_Birth) AS Age,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumDealsPurchases,
    NumWebVisitsMonth,
    (
        NumWebPurchases + 
        NumCatalogPurchases + 
        NumStorePurchases
    ) AS Total_Purchases,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    CASE 
        WHEN NumWebPurchases >= NumCatalogPurchases AND NumWebPurchases >= NumStorePurchases THEN 'Web'
        WHEN NumCatalogPurchases >= NumWebPurchases AND NumCatalogPurchases >= NumStorePurchases THEN 'Catalog'
        ELSE 'Store'
    END AS Preferred_Channel
FROM customers;

-- View: Marketing Response
-- Analyzes campaign response and complaints
CREATE VIEW vw_marketing_response AS
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (2026 - Year_Birth) AS Age,
    Response,
    Complain,
    Recency,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    CASE 
        WHEN Response = 1 THEN 'Accepted'
        ELSE 'Not Accepted'
    END AS Campaign_Status,
    CASE 
        WHEN Complain = 1 THEN 'Complained'
        ELSE 'No Complaint'
    END AS Complaint_Status
FROM customers;

-- View: Customer Segmentation
-- Segments customers based on spending and demographics
CREATE VIEW vw_customer_segmentation AS
SELECT 
    ID,
    Education,
    Marital_Status,
    Income,
    (2026 - Year_Birth) AS Age,
    Kidhome + Teenhome AS Total_Children,
    (
        MntWines + 
        MntFruits + 
        MntMeatProducts + 
        MntFishProducts + 
        MntSweetProducts + 
        MntGoldProds
    ) AS Total_Spending,
    CASE
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) > 1500 THEN 'High Value'
        WHEN (
            MntWines + 
            MntFruits + 
            MntMeatProducts + 
            MntFishProducts + 
            MntSweetProducts + 
            MntGoldProds
        ) BETWEEN 700 AND 1500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Segment,
    CASE
        WHEN (2026 - Year_Birth) < 30 THEN 'Young Adult'
        WHEN (2026 - Year_Birth) BETWEEN 30 AND 50 THEN 'Adult'
        WHEN (2026 - Year_Birth) BETWEEN 50 AND 65 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Segment,
    CASE 
        WHEN Kidhome + Teenhome = 0 THEN 'No Children'
        WHEN Kidhome + Teenhome = 1 THEN 'One Child'
        ELSE 'Multiple Children'
    END AS Family_Status,
    Recency,
    CASE 
        WHEN Recency <= 30 THEN 'Active'
        WHEN Recency <= 60 THEN 'At Risk'
        ELSE 'Inactive'
    END AS Engagement_Status
FROM customers;

-- ============================================================================
-- END OF ADVANCED SQL ANALYSIS
-- ============================================================================
