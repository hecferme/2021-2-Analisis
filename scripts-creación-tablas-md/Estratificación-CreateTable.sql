use PruebasETL
go
if OBJECT_ID('dbo.Estratificacion')  is not NULL
    drop table dbo.Estratificacion;
go


create table Estratificacion
(
    id int NULL,
    Tipo [nvarchar] (30) NULL,
    RangoInferior [real] NULL,
    RangoSuperior [real] NULL,
    Descripcion [nvarchar] (100) NULL
)