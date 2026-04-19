Create database SuperStore;

Use SuperStore;

select * from Superstore_Kaggle;

select top 10 * from Superstore_Kaggle;

-- Sale, Discount, Profit 2 decimal place
select ROUND(Sales, 2) from Superstore_Kaggle;

update Superstore_Kaggle
set sales = ROUND(Sales, 2),
	Discount = ROUND(Discount, 2),
	Profit = ROUND(Profit, 2);

-- Count of Rows and Columns
select count(*) as #Rows from Superstore_Kaggle;

-- Q1: Total sales kitni hai?
select round(SUM(Sales), 2) as Total_Sale from Superstore_Kaggle;
-- Q2: Total profit kitna hai?
select ROUND(SUM(Profit), 2) as Total_Profit from Superstore_Kaggle;
-- Q3: Top 5 products by sales
Select TOP 5 Product_ID, Product_Name, sum(sales) as Total_Sale from Superstore_Kaggle
group by Product_ID, Product_Name
order by Total_Sale DESC;
-- Q4: Region-wise sales
select  Region, round(SUM(sales), 2) as Total_Sale from Superstore_Kaggle
group by Region;
-- Q5: Month-wise sales trend
Select Year(Order_Date) as Year, MONTH(Order_Date) as Month, ROUND(SUM(Sales), 2) as Total_Sales from Superstore_Kaggle
group by Year(Order_Date), Month(Order_Date)
Order by Year(Order_Date), Month(Order_Date);

-- Step 3: Intermediate
-- Q6: Top 5 customers by profit
Select Top 5 Customer_ID, Customer_Name, Sum(Profit) as Total_Profit from Superstore_Kaggle
group by Customer_ID, Customer_Name
order by Total_Profit DESC;
-- Q7: Loss making products
Select TOP 10 Product_ID, Product_Name, sum(Sales) as Total_Sale, SUM(Profit) as Total_Profit from Superstore_Kaggle
group by Product_ID, Product_Name
Order BY Total_Profit ASC;
-- Q8: Category-wise performance
Select TOP 10 Category, Sub_Category, sum(Sales) as Total_Sale, SUM(Profit) as Total_Profit from Superstore_Kaggle
group by Category, Sub_Category
Order BY Total_Sale DESC;

--Table
select * from Superstore_Kaggle;

-- Which countries do they have sales?
select distinct(Country) as Country from Superstore_Kaggle;
--Top 20 states by sales
select top 20 state, ROUND(SUM(Sales), 2) as Total_Sale from Superstore_Kaggle
group by state
order by Total_Sale DESC;
--Top 20 states by profit
select top 20 state, round(sum(profit), 2) as Total_Profit from Superstore_Kaggle
group by state
order by Total_Profit DESC;

--Two important states are New York and California. New York is more profitable than California.

--Top 10 Customers in NY based on Profit.
Select top 10 Customer_ID, Customer_Name, round(SUM(Sales),2) as Total_Sales, ROUND(SUM(profit),2) as Total_Profit from Superstore_Kaggle
where state = 'New York'
group by Customer_ID, Customer_Name
order by Total_Profit DESC;

--'Tom Ashbrook' contributes a lot to high profitability of New York.

--Top 10 Customers in California based on Profit.
Select top 10 Customer_ID, Customer_Name, round(SUM(Sales),2) as Total_Sales, ROUND(SUM(profit),2) as Total_Profit from Superstore_Kaggle
where state = 'California'
group by Customer_ID, Customer_Name
order by Total_Profit DESC;

--'Jane Waco' contributes a lot to high profitability of New York.


--Top 20 cities by Profit
select top 20 city, SUM(profit) as Total_Profit from Superstore_Kaggle
group by city
order by Total_Profit DESC;

--Profitability of New York City is outstanding.

--Top 20 Customers by Sales
select top 20 Customer_ID, Customer_Name, SUM(Sales) as Total_Sale from Superstore_Kaggle
group by Customer_ID, Customer_Name
order by Total_Sale DESC;

--Top 20 Customers by Sales and Profit
select top 20 Customer_ID, Customer_Name, SUM(Sales) as Total_Sale, SUM(profit) as Total_Profit from Superstore_Kaggle
group by Customer_ID, Customer_Name
order by Total_Profit DESC;

--Sales by Categories
select category, round(sum(Sales),2) as Total_Sales from Superstore_Kaggle group by category order by Total_Sales DESC;
-- Technology is in top

--Profit by Categories
select category, round(sum(Profit),2) as Total_Profit from Superstore_Kaggle group by category order by Total_Profit DESC;
-- Technology is in top

--Sub Categories by Sales
select Sub_category, round(sum(Sales),2) as Total_Sales from Superstore_Kaggle group by Sub_category order by Total_Sales DESC;
-- Phones is in top

--Sub Categories by Profit
select Sub_category, round(sum(profit),2) as Total_Profit from Superstore_Kaggle group by Sub_category order by Total_Profit DESC;
-- Copies is in top and Supplies, Bookcases and Tables are in -ve

--Time Series Analysis
Select year(order_date) as Year, round(sum(Sales),2) as Total_Sales from Superstore_Kaggle group by Year(order_date) order by Year(order_date) DESC;

--Profit Margin
select category, ROUND(SUM(sales),2) as Total_Sales, ROUND(SUM(Profit),2) as Total_Profit, ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) as Profit_Margin_Percentage from Superstore_Kaggle
group by category
order by Total_Sales DESC;
--Furniture category has high sales but very low profitability, which indicates high cost, heavy discounting, or inefficiency.










--🚀 🔥 FINAL POLISHED SQL PROJECT



-- 🔹 Create & Use Database
CREATE DATABASE SuperStore;
USE SuperStore;

-- 🔹 View Data
SELECT TOP 10 * FROM Superstore_Kaggle;

---------------------------------------------------
-- 🔹 BASIC DATA CHECK
---------------------------------------------------

-- Total Rows
SELECT COUNT(*) AS Total_Rows FROM Superstore_Kaggle;

-- Distinct Countries
SELECT DISTINCT Country FROM Superstore_Kaggle;

---------------------------------------------------
-- 🔹 CORE BUSINESS METRICS
---------------------------------------------------

-- Total Sales
SELECT ROUND(SUM(Sales), 2) AS Total_Sales FROM Superstore_Kaggle;

-- Total Profit
SELECT ROUND(SUM(Profit), 2) AS Total_Profit FROM Superstore_Kaggle;

---------------------------------------------------
-- 🔹 PRODUCT ANALYSIS
---------------------------------------------------

-- Top 5 Products by Sales
SELECT TOP 5 
    Product_ID, 
    Product_Name, 
    SUM(Sales) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY Product_ID, Product_Name
ORDER BY Total_Sales DESC;

-- Loss Making Products (Top 10)
SELECT TOP 10 
    Product_ID, 
    Product_Name, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY Product_ID, Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

---------------------------------------------------
-- 🔹 CUSTOMER ANALYSIS
---------------------------------------------------

-- Top 5 Customers by Profit
SELECT TOP 5 
    Customer_ID, 
    Customer_Name, 
    SUM(Profit) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Profit DESC;

-- Top 20 Customers by Sales
SELECT TOP 20 
    Customer_ID, 
    Customer_Name, 
    SUM(Sales) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC;

---------------------------------------------------
-- 🔹 REGION / LOCATION ANALYSIS
---------------------------------------------------

-- Region-wise Sales
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Top 20 States by Sales
SELECT TOP 20 
    State, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY State
ORDER BY Total_Sales DESC;

-- Top 20 States by Profit
SELECT TOP 20 
    State, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY State
ORDER BY Total_Profit DESC;

-- Top 20 Cities by Profit
SELECT TOP 20 
    City, 
    SUM(Profit) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY City
ORDER BY Total_Profit DESC;

---------------------------------------------------
-- 🔹 CATEGORY ANALYSIS
---------------------------------------------------

-- Sales by Category
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Profit by Category
SELECT 
    Category, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Sub-Category Sales
SELECT 
    Sub_Category, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- Sub-Category Profit
SELECT 
    Sub_Category, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore_Kaggle
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

---------------------------------------------------
-- 🔹 TIME SERIES ANALYSIS
---------------------------------------------------

-- Year-wise Sales
SELECT 
    YEAR(Order_Date) AS Year, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY YEAR(Order_Date)
ORDER BY Year;

-- Month-wise Sales Trend (Improved)
SELECT 
    FORMAT(Order_Date, 'MMM-yyyy') AS Month, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Superstore_Kaggle
GROUP BY FORMAT(Order_Date, 'MMM-yyyy')
ORDER BY MIN(Order_Date);

---------------------------------------------------
-- 🔹 PROFITABILITY ANALYSIS (🔥 MOST IMPORTANT)
---------------------------------------------------

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
FROM Superstore_Kaggle
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;

---------------------------------------------------
-- 🔹 STATE LEVEL DEEP DIVE
---------------------------------------------------

-- Top Customers in New York
SELECT TOP 10 
    Customer_ID, 
    Customer_Name, 
    ROUND(SUM(Sales),2) AS Total_Sales, 
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore_Kaggle
WHERE State = 'New York'
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Profit DESC;

-- Top Customers in California
SELECT TOP 10 
    Customer_ID, 
    Customer_Name, 
    ROUND(SUM(Sales),2) AS Total_Sales, 
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore_Kaggle
WHERE State = 'California'
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Profit DESC;