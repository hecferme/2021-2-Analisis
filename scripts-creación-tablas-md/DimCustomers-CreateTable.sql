use PruebasETL
go
if OBJECT_ID('dbo.DimCustomers')  is not NULL
    drop table dbo.DimCustomers;
go
CREATE TABLE [dbo].[DimCustomers](
	[CustomerID] [nchar](5) NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL
);
go