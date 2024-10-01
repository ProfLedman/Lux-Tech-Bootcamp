-- Finds the total sales for each product
SELECT ProductID, SUM(Amount) AS total_sales
FROM Sales
GROUP BY ProductID;

-- Calculates the total sales for each month
SELECT 
    YEAR(SaleDate) AS year, 
    MONTH(SaleDate) AS month, 
    SUM(Amount) AS total_sales
FROM Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
ORDER BY year, month;

-- Identifys customers who made more than 5 purchases.
SELECT CustomerID, COUNT(SaleID) AS purchase_count
FROM Sales
GROUP BY CustomerID
HAVING COUNT(SaleID) > 5;
