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

begin TRAN
	insert into FactOrders
	(
		[OrderID]   , 	[CustomerID]  , 	[EmployeeID]  , 	[OrderDate] ,
		[CompanyName]  , 	[Freight] , 	[ShipName] , 	[ShipCity]  ,
		[ShipRegion]  , 	[ShipCountry]  , 	[EstratoFreight]
	)
	SELECT
		o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, 
		s.CompanyName, o.Freight, o.ShipName, o.ShipCity, o.ShipRegion, 
		o.ShipCountry, null
	from NorthWnd.dbo.Orders o
	inner join NorthWnd.dbo.Shippers s
		on s.ShipperID = o.ShipVia
commit;

