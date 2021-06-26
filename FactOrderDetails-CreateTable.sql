use PruebasETL
go
if OBJECT_ID('dbo.FactOrderDetails')  is not NULL
    drop table dbo.FactOrderDetails;
go

CREATE TABLE [dbo].[FactOrderDetails](
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL,
	[MontoBruto] [money] NULL,
	[DescuentoUnitario] [money] NULL,
	[DescuentoTotal] [money] NULL,
	[MontoNeto] [money] NULL,
	[EstratoUnitPrice] [varchar](100) NULL,
	[EstratoQuantity] [varchar](100) NULL,
	[EstratoDiscount] [varchar](100) NULL,
	[EstratoMontoBruto] [varchar](100) NULL,
	[EstratoDescuentoUnitario] [varchar](100) NULL,
	[EstratoDescuentoTotal] [varchar](100) NULL,
	[EstratoMontoNeto] [varchar](100) NULL
);
go


begin TRAN
	insert into FactOrderDetails
	(
	[OrderID]  , 	[ProductID]  ,  	[UnitPrice]  ,	[Quantity]  , 	[Discount]  ,
	[MontoBruto]  , 	[DescuentoUnitario]  , 	[DescuentoTotal]  , 	[MontoNeto]  , 	[EstratoUnitPrice]  ,
	[EstratoQuantity]  , 	[EstratoDiscount]  , 	[EstratoMontoBruto]  , 	[EstratoDescuentoUnitario]  ,
	[EstratoDescuentoTotal]  , 	[EstratoMontoNeto]  
	)
	select 
	od.OrderID, od.ProductID, od.UnitPrice,  od.Quantity, od.UnitPrice, 
	od.UnitPrice * od.Quantity, 
	od.UnitPrice * od.Discount,
	od.Quantity * od.UnitPrice * od.Discount,
	od.UnitPrice * od.Quantity - od.Quantity * od.UnitPrice * od.Discount, null, null, null, null, null, null,null
	from NorthWnd.dbo.[Order Details] od
commit;