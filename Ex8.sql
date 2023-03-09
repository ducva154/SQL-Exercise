SELECT SalesOrderNumber, SalesOrderLineNumber, 
	CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS CustomerName,
	EnglishProductName AS ProductName,
	OrderQuantity, UnitPrice, DiscountAmount, SalesAmount, 
	ProductStandardCost, TotalProductCost
  FROM FactInternetSales
  JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
  JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
  WHERE EnglishProductName = 'Road-150 Red, 48'