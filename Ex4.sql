USE AdventureWorksDW2019
SELECT AccountDescription, [France], [Germany], [Australia]
FROM (SELECT AccountDescription, Amount, OrganizationName
FROM FactFinance
JOIN DimAccount ON FactFinance.AccountKey = DimAccount.AccountKey
JOIN DimOrganization ON FactFinance.OrganizationKey = DimOrganization.OrganizationKey) a
PIVOT
(
SUM(Amount)
FOR OrganizationName IN ([France], [Germany], [Australia])
) AS BangChuyen
ORDER BY AccountDescription
