use NorthWnd

select 'Hello World', 'Buenos días', 'Hola Mundo';
select 'Hello world' as Label, 'Hola Mundo'  as Label;

select cast (1234 as float) / 561

select log(38)
select 47 + 1234 * 1243
select 'hola' + ' '+ 'mundo'
select UPPER('Hello world')
select LEFT('Hello world',8)
select right ('Hello world', 7)
select left (upper(SUBSTRING('Hello world', 3, 7)), 5)
--------------------------
--------------------------
-- comentario de una línea
--------------------------
--------------------------
/*
comentario
de
varias
líneas
*/
-- VARIABLES
declare @miVariable1 as int = 29;
set @miVariable1 = @miVariable1 + 54
select @miVariable1 = 98
select @miVariable1
-------------- FECHAS ---------------------
select getdate()
declare @f1 as DATETIME = '20250924 13:17:52.973'
select DATEPART(hour, @f1) 
select @f1
select DATEADD(MILLISECOND, -17, @f1)
SELECT @f1 + 54, @f1 + 54.5
declare @f3 as DATETIME = '20251224'
select @f3
--select DATEDIFF(SECOND, @f1, @f3)
select DATEPART(WEEKDAY, @f3) 

-- conversiones fecha <--> varchar
DECLARE @v1 as varchar (100) = '20210919 03:26:50'
DECLARE @f4 as DATETIME = '20250527 14:47:38'

select CONVERT(datetime, @v1, 103)
select CONVERT(varchar(90), @f4, 113)

-- BITS
-- AND  1 --> 1 & 1
-- OR   0  --> 0 | 0
-- NOT  1  --> 0    0 --> 1
DECLARE @n5 as INT = 234873
declare @mascara as int = POWER (2, 9)
select cast (@n5 & @mascara as bit)

DECLARE @n6 as INT = 2343
declare @n7 as int = 3743
select @n6 | @n7

declare @b1 as BIT = 0
select @b1
set @b1 = 7
select @b1
set @b1 = -1
select @b1

----------------- bifurcaciones
--  TRANSACT-SQL T/SQL TSQL T-SQL
        if (DATEPART(SECOND, getdate()) > 30)
            BEGIN
                select 'Estamos en la parte alta del minuto...'
                select 'ahorita cambiamos'
            END
        ELSE
            BEGIN
                select 'Estamos en la parte BAJA del minuto...'
            END
        select 'vamos a esperar'

-- case

SELECT 
    case DATEPART(SECOND, getdate())
        when 30 then 'treinta'
        when 10 then 'diez'
        when 49 then 'cuarenta y nueve'
        else 'No hay de piña'
    end as PruebaCase

SELECT 
    case 
        when DATEPART(SECOND, getdate()) between 15 and 30 then 'Estoy entre 15 y 30'
        when DATEPART(SECOND, getdate()) between 10 and 20 then 'Estoy entre 10 y 20'
        when DATEPART(SECOND, getdate()) between 43 and 48 then 'Estoy entre 43 y 48'
        else 'No hay de piña'
    end as PruebaCase

