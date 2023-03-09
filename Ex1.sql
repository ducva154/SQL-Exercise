USE AdventureWorksDW2019
SELECT CONCAT(FirstName, MiddleName, LastName) AS FullName, BirthDate,
CASE
    WHEN Gender = 'F' THEN 'Female'
    ELSE 'Male'
END AS Gender, 
	EmailAddress, EnglishEducation AS Education, Phone, AddressLine1, AddressLine2
FROM DimCustomer 
JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
WHERE CountryRegionCode = 'GB'