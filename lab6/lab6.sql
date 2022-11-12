use AdventureWorks2019;

--Zad1
with zad1 as (
SELECT sum([SalesAmount]) as sum_amount
      ,[OrderDate] as o_date
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  group by [OrderDate])

  SELECT avg(sum_amount) over (order by o_date rows
  between 3 preceding and current row) as rolling FROM zad1
  order by o_date

  --Zad2
  SELECT m as month_of_year, ISNULL([0], 0) AS "[0]", ISNULL([1], 0) AS "[1]",ISNULL([2], 0) AS "[2]",
	ISNULL([3], 0) AS "[3]",ISNULL([4], 0) AS "[4]",ISNULL([5], 0) AS "[5]",ISNULL([6], 0) AS "[6]",ISNULL([7], 0) AS "[7]",
	ISNULL([8], 0) AS "[8]",ISNULL([9], 0) AS "[9]",ISNULL([10], 0) AS "[10]" FROM
  (
  SELECT [SalesTerritoryKey], month([OrderDate]) as m, 
  sum([SalesAmount]) as SalesAmount
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where YEAR([OrderDate]) = 2011
  group by 
  MONTH([OrderDate]), [SalesTerritoryKey]
  ) as MainTable
  PIVOT
  (
  sum(SalesAmount)
  FOR [SalesTerritoryKey] in ([0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
  ) as PivotTable;
  

  --Zad3
  SELECT [OrganizationKey]
      ,[DepartmentGroupKey],
	  sum([Amount])
  FROM [AdventureWorksDW2019].[dbo].[FactFinance]
  group by rollup([OrganizationKey],[DepartmentGroupKey])
  ORDER BY [OrganizationKey];

  --Zad4
  SELECT [OrganizationKey]
      ,[DepartmentGroupKey],
	  sum([Amount])
  FROM [AdventureWorksDW2019].[dbo].[FactFinance]
  group by cube([OrganizationKey],[DepartmentGroupKey])
  ORDER BY [OrganizationKey];

  --Zad5
  with zad5 as (
select [OrganizationKey], sum([Amount]) as Amount
from [AdventureWorksDW2019].[dbo].[FactFinance]
where year([Date]) = 2012
group by [OrganizationKey]
)

select distinct do.[OrganizationKey], do.[OrganizationName], zad5.Amount,
PERCENT_RANK() over (order by Amount) as percentile from zad5 
join [AdventureWorksDW2019].[dbo].[DimOrganization] do on do.OrganizationKey = zad5.OrganizationKey
order by [OrganizationKey]

--Zad6
  with zad6 as (
select [OrganizationKey], sum([Amount]) as Amount
from [AdventureWorksDW2019].[dbo].[FactFinance]
where year([Date]) = 2012
group by [OrganizationKey]
)

select distinct do.[OrganizationKey], do.[OrganizationName], zad6.Amount,
PERCENT_RANK() over (order by Amount) as percentile,
STDEV([Amount]) over (order by Amount) as StdDeviation
from zad6
join [AdventureWorksDW2019].[dbo].[DimOrganization] do on do.OrganizationKey = zad6.OrganizationKey
order by [OrganizationKey]