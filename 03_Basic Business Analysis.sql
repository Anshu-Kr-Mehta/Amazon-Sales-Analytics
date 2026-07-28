USE sale_project;

/*Phase 5: Business Analysis
Business Analysis
│
├── Sales Analysis
├── Product Analysis
├── Customer Analysis
├── Geographic Analysis
├── Payment Analysis
└── Time Series Analysis*/



/*Section 1: Sales Analysis*/

/*Question 1
What is the Total Revenue?*/

SELECT
    ROUND(SUM(TotalAmount),2) AS Total_Revenue
FROM amazon_sales;



/*Question 2
What is the Average Order Value? */

SELECT
    ROUND(AVG(TotalAmount),2) AS Average_Order_Value
FROM amazon_sales;

/*Question 3
How many total orders? */    

SELECT COUNT(*) AS Total_Orders
FROM amazon_sales;

/* Section 2: Product Analysis*/
 /*Question 5
Revenue by Category */   /* */

SELECT
Category,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Category
ORDER BY Revenue DESC;

 /* Question 6
Top 10 Products by Revenue*/

SELECT
ProductName,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;


/*Question 6
Top 10 Products by Revenue */

SELECT
ProductName,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;

/* Question 7
Bottom 10 Products*/

SELECT
ProductName,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY ProductName
ORDER BY Revenue
LIMIT 10;

/*Question 8
Best Brands */

SELECT
Brand,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Brand
ORDER BY Revenue DESC;

/*Section 3: Customer Analysis */
/* Question 9
Top 10 Customers*/

SELECT
CustomerName,
ROUND(SUM(TotalAmount),2) AS Spending
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Spending DESC
LIMIT 10;

/*Question 10
Customers with Most Orders */

SELECT
CustomerName,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Orders DESC
LIMIT 10;

/* Section 4: Geographic Analysis*/
/*Question 11
Revenue by Country */

SELECT
Country,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Country
ORDER BY Revenue DESC;

/*Question 12
Revenue by State */
SELECT
State,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

/*Question 13
Revenue by City */
SELECT
City,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY City
ORDER BY Revenue DESC
LIMIT 10;

/*Section 5: Payment Analysis */
/*Question 14
Most Used Payment Method */
SELECT
PaymentMethod,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY Orders DESC;

/*Question 15
Revenue by Payment Method */
SELECT
PaymentMethod,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

/* Section 6: Order Status
Question 16*/
SELECT
OrderStatus,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY OrderStatus;

/*Section 7: Monthly Sales Trend */
SELECT
DATE_FORMAT(STR_TO_DATE(OrderDate,'%Y-%m-%d'),'%Y-%m') AS Month,
ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Month
ORDER BY Month;

/* */