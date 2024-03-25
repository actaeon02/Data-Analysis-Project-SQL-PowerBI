-- Cleansed DIM_Customer Table
-- Removed the unecessary columns that are not required for the report.
-- Transformed the data columns (Renaming the column name)
SELECT [CustomerKey]
      ,[FirstName]
      ,[LastName]	  
      ,[FirstName] + ' ' + [LastName] AS [Full Name]
      ,CASE [Gender]	
		WHEN 'M' THEN 'Male'
		WHEN 'F' THEN 'Female'
		END AS Gender
      ,[DateFirstPurchase]
      ,City AS [Customer City] -- Joined from DIMGeography Table to get the Customer based City
FROM 
	[dbo].[DimCustomer] AS c
	LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey
ORDER BY
	CustomerKey ASC
