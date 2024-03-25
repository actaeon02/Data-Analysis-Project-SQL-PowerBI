-- Cleansed DIM_Date Table
-- Removed the unecessary columns that are not required for the report.
-- Transformed the data columns (Renaming the column name)
SELECT [DateKey]
      ,[FullDateAlternateKey] AS Date
      ,[EnglishDayNameOfWeek] AS Day
      ,[WeekNumberOfYear] AS Week_No
      ,[EnglishMonthName] AS Month
      ,[MonthNumberOfYear] AS Month_No
      ,[CalendarQuarter] AS Quarter
      ,[CalendarYear] AS Year
  FROM [AdventureWorksDW2022].[dbo].[DimDate]
  -- Client requested the data showcased is up to 2 years back from 2021
  -- The condition is made to get the data from 2018 and above (Just in case) 
  WHERE CalendarYear >= 2018
