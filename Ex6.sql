WITH a AS (SELECT TOP (10) ProductKey, MAX(UnitCost) AS UnitCost
FROM FactProductInventory
GROUP BY ProductKey
ORDER BY UnitCost DESC)
SELECT a.ProductKey, EnglishProductName AS ProductName,
	ModelName, EnglishProductCategoryName AS ProductCategoryName, EnglishProductSubcategoryName AS ProductSubcategoryName,
	UnitsBalance, a.UnitCost
FROM a
JOIN FactProductInventory on a.ProductKey = FactProductInventory.ProductKey AND a.UnitCost = FactProductInventory.UnitCost
JOIN DimProduct ON FactProductInventory.ProductKey = DimProduct.ProductKey
JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey