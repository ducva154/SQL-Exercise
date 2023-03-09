
WITH a AS (SELECT MAX(DateKey) AS DateKey, ProductKey
FROM FactProductInventory
GROUP BY ProductKey)
SELECT a.ProductKey, EnglishProductName AS ProductName,
	ModelName, EnglishProductCategoryName AS ProductCategoryName, EnglishProductSubcategoryName AS ProductSubcategoryName,
	UnitsBalance, UnitCost
FROM a
JOIN FactProductInventory on a.DateKey = FactProductInventory.DateKey AND a.ProductKey = FactProductInventory.ProductKey
JOIN DimProduct ON FactProductInventory.ProductKey = DimProduct.ProductKey
JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey