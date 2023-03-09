USE AdventureWorksDW2019
SELECT DimGeography.EnglishCountryRegionName AS CountryName, COUNT(*) AS TotalCustomer
FROM DimCustomer 
JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
GROUP BY DimGeography.EnglishCountryRegionName