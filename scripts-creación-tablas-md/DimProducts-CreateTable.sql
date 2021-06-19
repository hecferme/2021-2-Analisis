use PruebasETL
go
if OBJECT_ID('dbo.DimProducts')  is not NULL
    drop table dbo.DimProducts;
go

CREATE TABLE [dbo].[DimProducts](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Discontinued] [bit] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
	[SuplierCity] [nvarchar](40) NOT NULL,
	[SuplierRegion] [nvarchar](40) NOT NULL,
	[SuplierCountry] [nvarchar](40) NOT NULL,
	[EstratoUnitPrice] [varchar](100) NULL
);
go