use PruebasETL
go
if OBJECT_ID('dbo.DimEmployees')  is not NULL
    drop table dbo.DimEmployees;
go

CREATE TABLE [dbo].[DimEmployees](
	[EmployeeID] [int] NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](10) NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	[ReportsToName] [nvarchar](100) NULL,
	[FullLastNameFirstName] [nvarchar](100) NULL,
	[FullFirstNameLastName] [nvarchar](100) NULL,
	[LastNameInitials] [nvarchar](1) NULL,
	[FirstNameInitials] [nvarchar](1) NULL,
	[EmployeeAge] [int] NULL,
	[EmployeeAntiquity] [int] NULL,
	[EstratoEmployeeAge] [varchar](100) NULL,
	[EstratoEmployeeAntiquity] [varchar](100) NULL
 );
 go