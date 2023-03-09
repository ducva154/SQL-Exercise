
WITH a AS 
(SELECT TOP 20 OrderDateKey, CustomerKey, SalesOrderNumber, 
	SUM(TotalProductCost) AS TotalOrderCost
FROM FactInternetSales
GROUP BY OrderDateKey, CustomerKey, SalesOrderNumber
ORDER BY TotalOrderCost DESC)
SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS CustomerName, 
	SalesOrderNumber, a.CustomerKey, TotalOrderCost
FROM a
JOIN DimCustomer ON a.CustomerKey = DimCustomer.CustomerKey
