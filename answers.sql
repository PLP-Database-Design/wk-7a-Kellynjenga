question 1
-- Transform ProductDetail table into 1NF
WITH SplitProducts AS (
    SELECT 
        OrderID,
        CustomerName,
        TRIM(value) AS Product
    FROM 
        ProductDetail
        CROSS APPLY STRING_SPLIT(Products, ',')
)
SELECT 
    OrderID,
    CustomerName,
    Product
FROM 
    SplitProducts;

question 2
-- Create Orders table (OrderID and CustomerName)
SELECT DISTINCT
    OrderID,
    CustomerName
INTO Orders
FROM OrderDetails;

-- Create OrderProducts table (OrderID, Product, Quantity)
SELECT 
    OrderID,
    Product,
    Quantity
INTO OrderProducts
FROM OrderDetails;
