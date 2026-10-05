--How many customers belong to each education level?

SELECT
    Education,
    COUNT(*) AS Total_Customers
FROM customers
GROUP BY Education
ORDER BY Total_Customers DESC;

--How many customers belong to each marital status?

SELECT
    Marital_Status,
    COUNT(*) AS Total_Customers
FROM customers
GROUP BY Marital_Status
ORDER BY Total_Customers DESC;

--Average income By Education?

SELECT
    Education,
    ROUND(AVG(Income),2) AS Average_Income
FROM customers
GROUP BY Education
ORDER BY Average_Income DESC;

--Average spending by education

SELECT
    Education,
    ROUND(
        AVG(
            MntWines +
            MntFruits +
            MntMeatProducts +
            MntFishProducts +
            MntSweetProducts +
            MntGoldProds
        ),
        2
    ) AS Average_Spending
FROM customers
GROUP BY Education
ORDER BY Average_Spending DESC;

--Top 10 highest spending customers

SELECT
    ID,
    Education,
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

--PRAGMA table_info(customers);

--Average Spending by Marital Status
-- Average Spending by Marital Status

SELECT
    Marital_Status,
    ROUND(
        AVG(
            MntWines +
            MntFruits +
            MntMeatProducts +
            MntFishProducts +
            MntSweetProducts +
            MntGoldProds
        ),
        2
    ) AS Average_Spending
FROM customers
GROUP BY Marital_Status
ORDER BY Average_Spending DESC;

-- Customers Spending More Than Average

SELECT
    ID,
    Education,
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
WHERE
(
    MntWines +
    MntFruits +
    MntMeatProducts +
    MntFishProducts +
    MntSweetProducts +
    MntGoldProds
)
>
(
    SELECT AVG(
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    )
    FROM customers
)
ORDER BY Total_Spending DESC;

-- Customers Spending More Than Average

SELECT
    ID,
    Education,
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
WHERE
(
    MntWines +
    MntFruits +
    MntMeatProducts +
    MntFishProducts +
    MntSweetProducts +
    MntGoldProds
)
>
(
    SELECT AVG(
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    )
    FROM customers
)
ORDER BY Total_Spending DESC;

-- Total Spending by Education

SELECT
    Education,
    SUM(
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Spending
FROM customers
GROUP BY Education
ORDER BY Total_Spending DESC;

-- Total Spending by Marital Status

SELECT
    Marital_Status,
    SUM(
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Spending
FROM customers
GROUP BY Marital_Status
ORDER BY Total_Spending DESC;

-- Income vs Total Spending

SELECT
    ID,
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
ORDER BY Income DESC;

