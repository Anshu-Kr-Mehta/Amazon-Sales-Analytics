USE sale_project;

SELECT
SUM(OrderID IS NULL) AS OrderID,
SUM(OrderDate IS NULL) AS OrderDate,
SUM(CustomerID IS NULL) AS CustomerID,
SUM(CustomerName IS NULL) AS CustomerName,
SUM(ProductID IS NULL) AS ProductID,
SUM(ProductName IS NULL) AS ProductName,
SUM(Category IS NULL) AS Category,
SUM(Brand IS NULL) AS Brand,
SUM(Quantity IS NULL) AS Quantity,
SUM(UnitPrice IS NULL) AS UnitPrice,
SUM(Discount IS NULL) AS Discount,
SUM(Tax IS NULL) AS Tax,
SUM(ShippingCost IS NULL) AS ShippingCost,
SUM(TotalAmount IS NULL) AS TotalAmount,
SUM(PaymentMethod IS NULL) AS PaymentMethod,
SUM(OrderStatus IS NULL) AS OrderStatus,
SUM(City IS NULL) AS City,
SUM(State IS NULL) AS State,
SUM(Country IS NULL) AS Country,
SUM(SellerID IS NULL) AS SellerID
FROM amazon_sales;


SELECT
SUM(TRIM(OrderID)='') AS OrderID,
SUM(TRIM(CustomerName)='') AS CustomerName,
SUM(TRIM(ProductName)='') AS ProductName,
SUM(TRIM(Category)='') AS Category,
SUM(TRIM(Brand)='') AS Brand,
SUM(TRIM(PaymentMethod)='') AS PaymentMethod,
SUM(TRIM(OrderStatus)='') AS OrderStatus,
SUM(TRIM(City)='') AS City,
SUM(TRIM(State)='') AS State,
SUM(TRIM(Country)='') AS Country
FROM amazon_sales;


SELECT
    OrderID,
    COUNT(*) AS duplicate_count
FROM amazon_sales
GROUP BY OrderID
HAVING COUNT(*) > 1;


SELECT
    MIN(OrderDate) AS First_Date,
    MAX(OrderDate) AS Last_Date
FROM amazon_sales;


SELECT
    COUNT(*) AS invalid_dates
FROM amazon_sales
WHERE STR_TO_DATE(OrderDate, '%Y-%m-%d') IS NULL;


ALTER TABLE amazon_sales
MODIFY COLUMN OrderDate DATE;


DESCRIBE amazon_sales;