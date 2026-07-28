USE sale_project;

/*EDA Query 1: Total Orders 
Business Question
How many orders are present?*/

SELECT COUNT(*) AS Total_Orders
FROM amazon_sales;

/*EDA Query 2: Unique Customers
Business Question
How many customers have placed orders?*/

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM amazon_sales;

/*EDA Query 3: Unique Products*/

SELECT COUNT(DISTINCT ProductID) AS Total_Products
FROM amazon_sales;

/*EDA Query 4: Categories*/

SELECT COUNT(DISTINCT Category) AS Total_Categories
FROM amazon_sales;

/*EDA Query 5: Brands*/

SELECT COUNT(DISTINCT Brand) AS Total_Brands
FROM amazon_sales;

/*EDA Query 6: Sellers*/

SELECT COUNT(DISTINCT SellerID) AS Total_Sellers
FROM amazon_sales;

/*EDA Query 7: Countries*/

SELECT DISTINCT Country
FROM amazon_sales;

/*EDA Query 8: States*/

SELECT COUNT(DISTINCT State) AS Total_States
FROM amazon_sales;

/*EDA Query 9: Cities*/

SELECT COUNT(DISTINCT City) AS Total_Cities
FROM amazon_sales;

/*EDA Query 10: Revenue Summary*/

SELECT
    ROUND(SUM(TotalAmount),2) AS Total_Revenue,
    ROUND(AVG(TotalAmount),2) AS Average_Order_Value,
    ROUND(MIN(TotalAmount),2) AS Minimum_Order,
    ROUND(MAX(TotalAmount),2) AS Maximum_Order
FROM amazon_sales;