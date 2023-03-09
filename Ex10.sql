WITH a AS 
(SELECT TOP 10 ResellerKey, SUM(OrderQuantity) AS TotalQuantity, SUM(TotalProductCost) AS TotalOrderCost
FROM FactResellerSales
GROUP BY ResellerKey
ORDER BY TotalOrderCost DESC)
SELECT ResellerName, a.ResellerKey, TotalQuantity, TotalOrderCost
FROM a
JOIN DimReseller ON a.ResellerKey = DimReseller.ResellerKey
