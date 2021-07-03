use PruebasETL
go
if OBJECT_ID('dbo.FactOrders')  is not NULL
    drop table dbo.FactOrders;
go

CREATE TABLE [dbo].[FactOrders](
	[OrderID] [int]  NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[CompanyName] [nvarchar](60) NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[EstratoFreight] [varchar](100) NULL
);
go
