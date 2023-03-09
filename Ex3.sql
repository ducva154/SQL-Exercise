USE AdventureWorksDW2019
SELECT TOP 100 DimProduct.EnglishProductName AS ProductName, DimProduct.ModelName, DimProduct.ProductLine, 
	DimProductCategory.EnglishProductCategoryName AS ProductCategoryName, DimProductSubcategory.EnglishProductSubcategoryName AS ProductSubcategoryName, 
	DealerPrice, ListPrice, Color, DimProduct.EnglishDescription AS [Description]
FROM DimProduct 
JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
ORDER BY DimProduct.ListPrice DESC