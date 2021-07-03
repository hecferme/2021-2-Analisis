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

begin TRAN
	TRUNCATE TABLE DimCustomers;
	insert into DimCustomers (CustomerID, CompanyName, ContactName, City, Region, Country)
		select 
			c.CustomerID, c.CompanyName, c.ContactName, c.City, c.Region, c.Country
		 from NorthWnd.dbo.Customers c;
COMMIT;