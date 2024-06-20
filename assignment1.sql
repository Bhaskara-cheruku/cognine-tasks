use emp_272

--1--
declare @numeric nvarchar(20)
set @numeric = 'hbjdsi7494bdd93hbdw3'
WHILE PATINDEX('%[^0-9]%', @numeric) > 0 
SET @numeric = REPLACE(@numeric, SUBSTRING(@numeric, PATINDEX('%[^0-9]%', @numeric), 1), '' ) 
select convert(int,@numeric) as numericdata


--2--
SELECT DATEDIFF(year,'2002-08-31',getdate() ) AS age;



--3--
create table tb2(
id int,
name varchar(20),
error as convert(int,'dciad')
);
insert into tb2 values(1,'nbnc');
select * from tb2;
select id,name from tb2;



--4--
create table calender(
[date] date,
[dayofyear] as DATEPART(DAYOFYEAR, [date]),
[week] as DATEPART(WEEK,[date]),
[dayofweek] as DATEPART(WEEKDAY, [date]),
[month] as DATEPART(MONTH, [date]),
[dateofmonth] as DATEPART(DAY, [date])
);
DECLARE @y INT = 2017
DECLARE @d DATE = CONCAT(@y, '/01/01')

WHILE (YEAR(@d)=@y)
BEGIN
	INSERT INTO Calender VALUES (
		@d)
	SET @d = DATEADD(d, 1, @d)
END
select * from calender;



--5--
create table emp(
emp_id int,
emp_name varchar(30),
manger_id int
);
insert into emp values(1,'pradeep',null),(2,'raj',1),(3,'sumith',2),(4,'bhaskara',3),(5,'vivek',3);
select * from emp;

declare @id int
set @id =3;
with empcte as
(
select emp_id,emp_name,manger_id, 1 AS Hierarchy_Level
from emp
where emp_id=@ID

union all

select emp.emp_id,emp.emp_name,emp.manger_id, Hierarchy_Level+1 as Hierarchy_Level
 from emp join empcte on emp.emp_id= empcte.manger_id
)
select e1.emp_name, e2.emp_name as manager,e1.Hierarchy_Level
from empcte e1 left join empcte e2 on e1.manger_id = e2.emp_id
