use PruebasETL
go
if OBJECT_ID('dbo.DimProducts')  is not NULL
    drop table dbo.DimProducts;
go

CREATE TABLE [dbo].[DimProducts](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40)  NULL,
	[UnitPrice] [money] NULL,
	[Discontinued] [bit]  NULL,
	[CompanyName] [nvarchar](40)  NULL,
	[CategoryName] [nvarchar](40)  NULL,
	[SuplierCity] [nvarchar](40)  NULL,
	[SuplierRegion] [nvarchar](40)  NULL,
	[SuplierCountry] [nvarchar](40)  NULL,
	[EstratoUnitPrice] [varchar](100) NULL
);
go

begin TRAN
	insert into DimProducts
	(
		[ProductID]  , 	[ProductName]  , 	
		[UnitPrice]  , 	[Discontinued]   , 	[CompanyName]   , 	[CategoryName]   ,
		[SuplierCity]   , 	[SuplierRegion]   , 	[SuplierCountry]   , 	[EstratoUnitPrice] 
	)
	select 
		p.ProductID, p.ProductID, p.UnitPrice	, p.Discontinued
		, s.CompanyName, c.CategoryName, s.City, s.Region, s.Country, null
	from NorthWnd.dbo.Products p
	inner join NorthWnd.dbo.Suppliers s
		on s.SupplierID = p.SupplierID
	inner join NorthWnd.dbo.Categories c
		on c.CategoryID = p.CategoryID
COMMIT;