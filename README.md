**# E-Commerce Customer Analysis – Power BI \& SQL**



**## 📌 Project Overview**



**This project focuses on analyzing customer data to understand \*\*customer demographics, spending behavior, purchasing patterns, and marketing campaign responses\*\*.**



**The project combines \*\*SQL analysis\*\* and an interactive \*\*Power BI dashboard\*\* to transform raw customer data into meaningful business insights.**



**The analysis was performed using \*\*SQLite and SQL\*\* for data exploration and business questions, followed by \*\*Power BI and DAX\*\* for interactive visualization and reporting.**



**---**



**## 🎯 Business Objective**



**The main objective of this project is to understand customer behavior and provide insights that can support better business and marketing decisions.**



**The project focuses on:**



**- Understanding customer demographics**

**- Analyzing customer spending patterns**

**- Comparing different purchasing channels**

**- Analyzing marketing campaign responses**

**- Identifying high-value Customers**

**- Understanding customer purchasing behavior**

**- Creating an interactive business intelligence dashboard**



**---**



**## 🗂️ Dataset**



**The project uses a customer marketing dataset containing information related to:**



**- Customer demographics**

**- Year of birth**

**- Education**

**- Marital status**

**- Income**

**- Household information**

**- Product-wise spending**

**- Web purchases**

**- Catalog purchases**

**- Store purchases**

**- Deal purchases**

**- Website visits**

**- Marketing campaign response**

**- Customer complaints**



**The dataset is stored in:**



**```text**

**Dataset/customer\_data.csv**

**```**

**---**



**## 🛠️ Tools \& Technologies**



**| Tool / Technology      | Purpose                                        |**

**| ---------------------- | ---------------------------------------------- |**

**| \*\*Power BI\*\*           | Interactive dashboard and data visualization   |**

**| \*\*DAX\*\*                | Calculated metrics and analytical calculations |**

**| \*\*SQL\*\*                | Data exploration and business analysis         |**

**| \*\*SQLite\*\*             | Database management                            |**

**| \*\*VS Code / SQLTools\*\* | SQL development and database interaction       |**

**| \*\*CSV\*\*                | Source dataset                                 |**



**---**



**# 🔄 Project Workflow**



**```text**

**Customer Dataset**

&#x20;      **↓**

**Data Exploration**

&#x20;      **↓**

**SQL Analysis**

&#x20;      **↓**

**Business Questions**

&#x20;      **↓**

**DAX Calculations**

&#x20;      **↓**

**Power BI Dashboard**

&#x20;      **↓**

**Customer Insights**

&#x20;      **↓**

**Business Recommendations**

**```**



**---**



**# 🗄️ SQL Analysis**



**SQL was used to explore the customer dataset, understand its structure, and answer business-related questions.**



**The SQL analysis was organized into three scripts.**



**### 1. Data Exploration**



**File:**



**```text**

**SQL/01\_Data\_Exploration.sql**

**```**



**This stage focused on understanding the dataset and checking its quality.**



**Activities included:**



**\* Inspecting customer records**

**\* Checking the number of Customers**

**\* Examining the database schema**

**\* Checking missing values**

**\* Identifying unique education categories**

**\* Identifying unique marital status categories**

**\* Examining income values**

**\* Exploring age-related data**

**\* Understanding the available customer attributes**



**---**



**### 2. Business Questions**



**File:**



**```text**

**SQL/02\_Business\_Questions.sql**

**```**



**This stage focused on answering practical business questions using SQL.**



**The analysis included:**



**\* Customer spending analysis**

**\* Income analysis**

**\* Education-based analysis**

**\* Marital-status analysis**

**\* Purchasing channel analysis**

**\* Marketing campaign response analysis**

**\* Customer complaint analysis**

**\* Identifying high-spending Customers**



**SQL clauses and functions used included:**



**```sql**

**SELECT**

**WHERE**

**GROUP BY**

**ORDER BY**

**HAVING**

**LIMIT**

**COUNT()**

**SUM()**

**AVG()**

**MIN()**

**MAX()**

**```**



**---**



**### 3. Advanced Analysis**



**File:**



**```text**

**SQL/03\_Advanced\_Analysis.sql**

**```**



**The advanced analysis was used to perform deeper customer-level analysis.**



**Techniques included:**



**\* `CASE` statements**

**\* Common Table Expressions (CTEs)**

**\* Aggregations**

**\* Ranking**

**\* Window functions**

**\* Customer segmentation**

**\* Spending analysis**

**\* Analytical views**



**A reusable SQLite view named `customer\_summary` was also created to simplify customer-level analysis.**



**---**



**# 🗃️ SQLite Database**



**The SQL analysis was performed using \*\*SQLite\*\*.**



**The project database is included in:**



**```text**

**SQL/ecommerce.db**

**```**



**The database contains the customer data used for the SQL analysis.**



**---**



**# 📊 Power BI Dashboard**



**An interactive Power BI dashboard was developed to present the customer analysis in a business-friendly format.**



**The dashboard contains six analytical pages.**



**---**



**## 1. Executive Overview**



**The \*\*Executive Overview\*\* page provides a high-level summary of the customer data and key business metrics.**



**It provides an initial view of the overall customer base before moving into more detailed analysis.**



**!\[Executive Overview](PowerBI/Dashboard%20screenshots/Executive%20overview.jpg)**



**---**



**## 2. Customer Demographics**



**The \*\*Customer Demographics\*\* page focuses on understanding the characteristics of the customer base.**



**The analysis includes areas such as:**



**\* Education**

**\* Marital status**

**\* Age groups**

**\* Income**

**\* Customer distribution**



**This helps understand the composition of the customer base and identify demographic patterns.**



**!\[Customer Demographics](PowerBI/Dashboard%20screenshots/Customer%20Demographics.jpg)**



**---**



**## 3. Spending Analysis**



**The \*\*Spending Analysis\*\* page focuses on customer spending across different product categories.**



**The product spending categories include:**



**\* Wines**

**\* Fruits**

**\* Meat products**

**\* Fish products**

**\* Sweet products**

**\* Gold products**



**A \*\*Total Spending\*\* calculation was also used to analyze the overall spending of individual Customers.**



**!\[Spending Analysis](PowerBI/Dashboard%20screenshots/Spending%20Analysis.jpg)**



**---**



**## 4. Customer Purchase Behaviour**



**The \*\*Customer Purchase Behaviour\*\* page analyzes how Customers purchase products through different channels.**



**The analysis includes:**



**\* Web purchases**

**\* Catalog purchases**

**\* Store purchases**

**\* Deal purchases**

**\* Website visits**



**This allows purchasing behavior to be compared across different customer channels.**



**!\[Customer Purchase Behaviour](PowerBI/Dashboard%20screenshots/Customer%20Purchase%20Behaviour.jpg)**



**---**



**## 5. Marketing Campaign Analysis**



**The \*\*Marketing Campaign Analysis\*\* page focuses on customer responses and engagement with marketing campaigns.**



**The analysis includes:**



**\* Campaign response**

**\* Response rate**

**\* Customer complaints**

**\* Customer engagement**



**This can help businesses understand campaign effectiveness and identify opportunities for improving customer engagement.**



**!\[Marketing Campaign Analysis](PowerBI/Dashboard%20screenshots/Marketing%20Campaign%20Analysis.jpg)**



**---**



**## 6. Customer Insights Dashboard**



**The \*\*Customer Insights Dashboard\*\* brings together customer-level information to support business analysis and decision-making.**



**The analysis considers factors such as:**



**\* Customer spending**

**\* Income**

**\* Demographics**

**\* Purchasing behavior**

**\* Campaign response**



**This page helps identify customer patterns and potential customer segments.**



**!\[Customer Insights Dashboard](PowerBI/Dashboard%20screenshots/Customer%20Insights%20Dashboard.jpg)**



**---**



**# 📐 DAX Analysis**



**DAX was used in Power BI to create additional calculations and metrics for the dashboard.**



**## Total Spending**



**Total customer spending was calculated by combining spending across the six product categories:**



**```DAX**

**Total Spending =**

&#x20;   **'Customers'\[MntWines]**

&#x20;   **+ 'Customers'\[MntFruits]**

&#x20;   **+ 'Customers'\[MntMeatProducts]**

&#x20;   **+ 'Customers'\[MntFishProducts]**

&#x20;   **+ 'Customers'\[MntSweetProducts]**

&#x20;   **+ 'Customers'\[MntGoldProds]**

**```**



**This calculation provides a single metric representing the overall spending of a customer.**



**---**



**## Complaint Rate**



**A complaint rate calculation was used to measure the proportion of Customers who registered complaints.**



**```DAX**

**Complaint Rate =**

**DIVIDE(**

&#x20;   **SUM('Customers'\[Complain]),**

&#x20;   **COUNTROWS('Customers'),**

&#x20;   **0**

**)**

**```**



**The result was formatted as a percentage in Power BI.**



**---**



**## Response Rate**



**A response rate calculation was used to analyze customer responses to marketing campaigns.**



**```DAX**

**Response Rate =**

**DIVIDE(**

&#x20;   **SUM('Customers'\[Response]),**

&#x20;   **COUNTROWS('Customers'),**

&#x20;   **0**

**)**

**```**



**The result was also formatted as a percentage for dashboard reporting.**



**---**



**# 📈 Data Visualization**



**Power BI was used to transform the analyzed data into interactive visualizations.**



**The dashboard uses visual elements such as:**



**\* KPI cards**

**\* Bar charts**

**\* Column charts**

**\* Pie / donut charts**

**\* Tables**

**\* Filters and slicers**

**\* Interactive dashboard elements**



**The dashboard was designed to allow users to explore customer data from different perspectives.**



**---**



**# 💡 Key Analytical Areas**



**The project provides analysis across the following major areas:**



**### Customer Demographics**



**Understanding customer characteristics such as education, marital status, age, and income.**



**### Customer Spending**



**Analyzing spending across different product categories and identifying Customers with higher overall spending.**



**### Purchase Behaviour**



**Comparing customer activity across web, catalog, and store purchasing channels.**



**### Marketing Campaigns**



**Analyzing campaign responses and customer engagement.**



**### Customer Complaints**



**Monitoring complaint behavior to understand potential customer experience issues.**



**---**



**# 💼 Business Recommendations**



**The analysis can support businesses in areas such as:**



**\* Developing targeted customer segments**

**\* Creating personalized marketing campaigns**

**\* Identifying high-value Customers**

**\* Understanding preferred purchasing channels**

**\* Improving customer engagement**

**\* Monitoring customer complaints**

**\* Improving future campaign strategies**

**\* Using customer behavior to support business decisions**



**---**



**# 📸 Dashboard Screenshots**



**The Power BI dashboard screenshots are available in:**



**```text**

**PowerBI/Dashboard screenshots/**

**```**



**The screenshots provide a preview of the different analytical pages developed for the project.**



**---**



**# 📁 Project Structure**



**```text**

**E-Commerce\_Customer\_Analysis/**

**│**

**├── README.md**

**│**

**├── Dataset/**

**│   └── customer\_data.csv**

**│**

**├── PowerBI/**

**│   ├── E-Commerce Customer Dashboard.pbix**

**│   │**

**│   └── Dashboard screenshots/**

**│       ├── Customer Demographics.jpg**

**│       ├── Customer Insights Dashboard.jpg**

**│       ├── Customer Purchase Behaviour.jpg**

**│       ├── Executive overview.jpg**

**│       ├── Marketing Campaign Analysis.jpg**

**│       └── Spending Analysis.jpg**

**│**

**└── SQL/**

&#x20;   **├── 01\_Data\_Exploration.sql**

&#x20;   **├── 02\_Business\_Questions.sql**

&#x20;   **├── 03\_Advanced\_Analysis.sql**

&#x20;   **└── ecommerce.db**

**```**



**---**



**# 🚀 Future Enhancements**



**The project can be further enhanced by:**



**\* Connecting Power BI directly to the SQLite/database layer**

**\* Automating data refresh**

**\* Adding customer lifetime value analysis**

**\* Developing predictive customer segmentation**

**\* Building customer churn prediction models**

**\* Applying machine learning to customer behavior**

**\* Adding more advanced campaign effectiveness analysis**

**\* Developing automated business reports**



**---**



**# 📚 Key Skills Demonstrated**



**Through this project, I developed practical experience in:**



**\* \*\*SQL\*\***

**\* \*\*SQLite\*\***

**\* \*\*Power BI\*\***

**\* \*\*DAX\*\***

**\* \*\*Data Exploration\*\***

**\* \*\*Data Analysis\*\***

**\* \*\*Data Visualization\*\***

**\* \*\*KPI Development\*\***

**\* \*\*Customer Segmentation\*\***

**\* \*\*Business Analysis\*\***

**\* \*\*Business Intelligence\*\***

**\* \*\*Data Storytelling\*\***





