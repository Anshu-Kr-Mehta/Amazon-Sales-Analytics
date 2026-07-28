
-- 1. Monthly Sales

CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_FORMAT(STR_TO_DATE(OrderDate,'%Y-%m-%d'),'%Y-%m') AS Month,
    SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Month;

-- 2. Category Revenue

CREATE VIEW vw_category_revenue AS
SELECT
    Category,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY Category;

-- 3. State Revenue

CREATE VIEW vw_state_revenue AS
SELECT
    State,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY State;

-- 4. Top Customers
CREATE VIEW vw_customer_spending AS
SELECT
    CustomerID,
    CustomerName,
    ROUND(SUM(TotalAmount),2) AS Total_Spending
FROM amazon_sales
GROUP BY CustomerID, CustomerName;

-- 5. Payment Analysis

CREATE VIEW vw_payment_analysis AS
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY PaymentMethod;

-- 6. Product Revenue

CREATE VIEW vw_product_revenue AS
SELECT
    ProductName,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM amazon_sales
GROUP BY ProductName;




