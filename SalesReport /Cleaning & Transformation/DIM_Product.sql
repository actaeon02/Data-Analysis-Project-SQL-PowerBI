-- Cleansed DIM_Product Table
-- Removed the unecessary columns that are not required for the report.
-- Transformed the data columns (Renaming the column name)
SELECT [ProductKey]
      ,[ProductAlternateKey]				      AS [Product Code]
      ,[EnglishProductName]					      AS [Product Name]
	    ,psc.EnglishProductSubcategoryName	AS [Product Sub Category]	-- Joined with DIMProductSubCategory
	    ,pc.EnglishProductCategoryName		  AS [Product Category]		  -- Joined with DIMProductSubCategory
      ,[Color]								            AS [Product Color]
      ,[Size]								              AS [Product Size]
      ,[ProductLine]						          AS [Product Line]
      ,[ModelName]							          AS [Product Model Name]
      ,[EnglishDescription]					      AS [Product Description]
      ,ISNULL([Status], 'Outdated')			  AS [Product Status]
FROM 
	[dbo].[DimProduct] AS p
	LEFT JOIN dbo.DimProductSubcategory psc ON psc.ProductSubcategoryKey = p.ProductSubcategoryKey
	LEFT JOIN dbo.DimProductCategory pc ON psc.ProductCategoryKey = pc.ProductCategoryKey
