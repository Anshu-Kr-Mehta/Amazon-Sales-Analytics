

/* Phase 5B – Intermediate Business Analysis
Skills Covered
CASE
HAVING
Date Functions
Subqueries
Aggregate Functions
DISTINCT */

/*Section 1: Sales Performance
Q17. Which month generated the highest revenue?*/
SELECT
    YEAR(STR_TO_DATE(OrderDate,'%Y-%m-%d')) AS Year,
    MONTHNAME(STR_TO_DATE(OrderDate,'%Y-%m-%d')) AS Month,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Year, Month
ORDER BY Revenue DESC;

/*Q18. Which year generated the highest revenue? */
SELECT
YEAR(STR_TO_DATE(OrderDate,'%Y-%m-%d')) AS Year,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Year
ORDER BY Revenue DESC;

/* Q19. Which month had the highest number of orders?*/
SELECT
YEAR(STR_TO_DATE(OrderDate,'%Y-%m-%d')) AS Year,
MONTHNAME(STR_TO_DATE(OrderDate,'%Y-%m-%d')) AS Month,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY Year, Month
ORDER BY Orders DESC;

/* Section 2: Customer Analysis
Q20. Which customers spent more than ₹10,000?*/
SELECT
CustomerName,
ROUND(SUM(TotalAmount),2) AS Spending
FROM amazon_sales
GROUP BY CustomerName
HAVING Spending > 10000
ORDER BY Spending DESC;

/* Q21. Top 20 customers*/
SELECT
CustomerName,
ROUND(SUM(TotalAmount),2) AS Spending
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Spending DESC
LIMIT 20;

/*Section 3: Product Analysis */
/*Q22. Which products sold more than 500 units? */
SELECT
ProductName,
SUM(Quantity) AS Units_Sold
FROM amazon_sales
GROUP BY ProductName
HAVING Units_Sold > 500
ORDER BY Units_Sold DESC;

/* Q23. Which categories have revenue above the average category revenue?*/
SELECT
Category,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Category
HAVING Revenue >
(
SELECT AVG(CategoryRevenue)
FROM
(
SELECT SUM(TotalAmount) AS CategoryRevenue
FROM amazon_sales
GROUP BY Category
) AS x
);


/* Q24. Average Discount by Category*/
SELECT
Category,
ROUND(AVG(Discount),2) AS Average_Discount
FROM amazon_sales
GROUP BY Category
ORDER BY Average_Discount DESC;

/*Q25. Average Shipping Cost by Category */
SELECT
Category,
ROUND(AVG(ShippingCost),2) AS Average_Shipping
FROM amazon_sales
GROUP BY Category
ORDER BY Average_Shipping DESC;

/*Section 4: Geography */
/* Q26. States with more than 1,000 orders*/
SELECT
State,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY State
HAVING Orders > 1000
ORDER BY Orders DESC;

/*Q27. Cities with highest average order value */
SELECT
City,
ROUND(AVG(TotalAmount),2) AS Average_Order
FROM amazon_sales
GROUP BY City
ORDER BY Average_Order DESC
LIMIT 10;

/*Section 5: Payment */
/*Q28. Which payment method has the highest average order value? */
SELECT
PaymentMethod,
ROUND(AVG(TotalAmount),2) AS Average_Order
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY Average_Order DESC;
USE sale_project;
/*Q29. Payment method contributing the highest revenue */
SELECT
PaymentMethod,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

/*Section 6: CASE Statement */
/*Q30. Customer Spending Level */
SELECT
CustomerName,
ROUND(SUM(TotalAmount),2) AS Spending,
CASE
WHEN SUM(TotalAmount) >= 10000 THEN 'High Value'
WHEN SUM(TotalAmount) >= 5000 THEN 'Medium Value'
ELSE 'Low Value'
END AS Customer_Category
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Spending DESC;
