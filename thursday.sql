CREATE TABLE StudentMark (sid INT PRIMARY KEY,name VARCHAR(50),department VARCHAR(50),mark INT);
INSERT INTO StudentMark VALUES
(1, 'Arun', 'CSE', 450),
(2, 'Bala', 'ECE', 420),
(3, 'Charan', 'MECH', 380),
(4, 'Deepak', 'IT', 410),
(5, 'Eshan', 'CSE', 450),
(6, 'Farhan', 'ECE', 395),
(7, 'Gokul', 'IT', 410),
(8, 'Hari', 'MECH', 360),
(9, 'Imran', 'CSE', 475),
(10, 'John', 'ECE', 420),
(11, 'Karthik', 'IT', 390),
(12, 'Lokesh', 'CSE', 405),
(13, 'Manoj', 'MECH', 355),
(14, 'Naveen', 'ECE', 430),
(15, 'Omkar', 'IT', 450),
(16, 'Prakash', 'CSE', 370),
(17, 'Qadir', 'MECH', 365),
(18, 'Rahul', 'ECE', 420),
(19, 'Sanjay', 'IT', 398),
(20, 'Tarun', 'CSE', 475),
(21, 'Uday', 'MECH', 340),
(22, 'Vikram', 'ECE', 415),
(23, 'Wasim', 'IT', 390),
(24, 'Xavier', 'CSE', 450),
(25, 'Yash', 'MECH', 360),
(26, 'Zaid', 'ECE', 430),
(27, 'Ajay', 'IT', 405),
(28, 'Bharath', 'CSE', 398),
(29, 'Chirag', 'ECE', 420),
(30, 'Dinesh', 'MECH', 350)
SELECT * FROM StudentMark
--ranking function
--1st row_number()
--2nd rank()
--3rd dense_rank()
--4th ntile()
select* ,row_number() over(order by mark )from StudentMark
--partition
select*,row_number() over(partition by department order by mark )from StudentMark
select*,row_number() over(partition by mark order by mark )from StudentMark
--rank
select*,rank() over(order by mark desc )from StudentMark
select*,dense_rank() over(order by mark desc )from StudentMark
--ntile
select*,ntile(6) over(order by mark desc )from StudentMark

--common table expression (CTE)
--it is used to store the result set into virtual table
with cte_mark as(select*,dense_rank() over(order by mark desc )as result from StudentMark)
select result,count(sid)from cte_mark group by result
--table variable (declare@-variablename-datatype)
declare @sample table (id int,name varchar(50),ph_no bigint)
insert into @sample values(1,'sundar',8245810256)
select*from @sample
update @sample set ph_no=56784321
select*from @sample

--temp table-#for local temp table,## for global temp table
create table #sample1(id int primary key  identity(1,1),name varchar(50),city varchar(50),phone_num bigint)
insert into #sample1 values('mathes','chennai',7894561213),('ganeshan','madurai',456123789)
select*from #sample1

create table  ##sample2(id int primary key  identity(1,1),name varchar(50),city varchar(50),phone_num bigint)
insert into ##sample2 values('mathew','chennai',7894561213),('guru','madurai',456123789)
select*from ##sample2

--error handling/exception handling
--2 types (try,catch)
begin try 
select 1/0
end try 
begin catch
select ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_LINE(),ERROR_MESSAGE(),ERROR_PROCEDURE()
end catch



--condition statement-only single value or record can be seen 
--2type(single condition,multiple condition statement)
--single-if&else
--multiple-if else if else

declare @age int 
set @age=(select age from student where sid=5)
if(@age>18)
select ('eligible for voting')
else
select('not eligible for voting')

--multiple condition
declare @mark int 
set @mark =(select mark from StudentMark where sid =6)
if(@mark>90 and @mark<=100)
select('o grade')
else if(@mark>80 and @mark<=90)
select('a grade')
else if(@mark>60 and @mark<=80)
select('b grade')
else if(@mark>=40 and @mark<=60)
select('c grade')
else if (@mark<40)
select('fail')
else
select('please check your mark maximum mark is 100')

--case statement
--keyword (when,then)
select*,case when mark>450 and mark<=500 then 'o grade'when mark>400 and mark<=450 then 'a grade'
when mark>300 and mark<=400 then 'b grade' when mark>=200 and mark<=300 then 'c grade'
when mark<200 then 'fail' else'please check the mark' end from StudentMark
---looping statement
--while loop
--1st condition initial variable decleartion and value assignement
--2nd condition checking 
--3rd increment or decrement part

declare @i int 
set @i=25
while (@i<20)
begin select @i 
set @i=@i-1
end

--cursor-it used to display the output one by one 
--1st declare variable for all the column in the table 
--2nd declare cursor 
--3rd pass the data to the cursor
--4th open the cursor
--5th fetch data form the cursor
--6th use looping statement
--7th open loop
--8th fetch data from the cursor
--9th close loop
--10th close cursor
--11th deallocate cursor 
--types of cursor
--static,dynamic,fast_forward,forward_only
--direction - 4types
--1st first 
--2nd next
--3rd prior
--4th last
--direction should be mention in the fetch

declare @sid int
declare @name varchar(50)
declare @department varchar(50)
declare @mark int
declare cursor_stu cursor static 
for 
select sid,name,department,mark from StudentMark
open cursor_stu
fetch first from cursor_stu into @sid,@name,@department,@mark
while @@fetch_status=0
begin
select @sid,@name,@department,@mark
fetch next from cursor_stu into @sid,@name,@department,@mark
end
close cursor_stu
deallocate cursor_stu



declare @sid int
declare @name varchar(50)
declare @department varchar(50)
declare @mark int
declare cursor_stu cursor forward_only 
for 
select sid,name,department,mark from StudentMark
open cursor_stu
fetch first from cursor_stu into @sid,@name,@department,@mark
while @@fetch_status=0
begin
select @sid,@name,@department,@mark
fetch next from cursor_stu into @sid,@name,@department,@mark
end
close cursor_stu
deallocate cursor_stu



declare @sid int
declare @name varchar(50)
declare @department varchar(50)
declare @mark int
declare cursor_stu cursor fast_forward
for 
select sid,name,department,mark from StudentMark
open cursor_stu
fetch first from cursor_stu into @sid,@name,@department,@mark
while @@fetch_status=0
begin
select @sid,@name,@department,@mark
fetch next from cursor_stu into @sid,@name,@department,@mark
end
close cursor_stu
deallocate cursor_stu

declare @sid int
declare @name varchar(50)
declare @department varchar(50)
declare @mark int
declare cursor_stu cursor fast_forward 
for 
select sid,name,department,mark from StudentMark
open cursor_stu
fetch next from cursor_stu into @sid,@name,@department,@mark
while @@fetch_status=0
begin
select @sid,@name,@department,@mark
fetch next from cursor_stu into @sid,@name,@department,@mark
end
close cursor_stu
deallocate cursor_stu

--dynamic
declare @sid int
declare @name varchar(50)
declare @department varchar(50)
declare @mark int
declare cursor_stu cursor dynamic
for 
select sid,name,department,mark from StudentMark where sid=6
open cursor_stu
fetch last from cursor_stu into @sid,@name,@department,@mark
while @@fetch_status=0
begin
select @sid,@name,@department,@mark 
fetch last from cursor_stu into @sid,@name,@department,@mark
update StudentMark set name='balaji' where current of cursor_stu
end
close cursor_stu
deallocate cursor_stu



--user defined function
--1st scalar   function
--2nd inline table valued function
--3rd multi table valued function
--scalar   function --output in single cell
--inline table valued function --
--static/empty

create function scal_fun()--(create)
returns varchar(50)
as begin
return (select mark from StudentMark where sid=8)
end
select dbo.scal_fun()


alter function scal_fun()--(create)
returns varchar(50)
as begin
return (select mark from studentmark where sid=8)
end
select dbo.scal_fun()

--parameter
create function scal_fun1(@sid int)
returns varchar(50)
as begin
return (select mark from studentmark where sid=@sid)
end
select dbo.scal_fun1(2)

--inline table
create function inline_fun()
returns table
as
return select *from studentmark
select *from inline_fun()

--multi table
create function multi_fun()
returns @result table (sid int,name varchar(50),department varchar(50),mark int,result varchar(50))
as begin
insert into @result (sid,name,department,mark)
select sid,name,department,mark from studentmark
return
end
select *from multi_fun()

alter function multi_fun()
returns @result table (sid int,name varchar(50),department varchar(50),mark int,result varchar(50))
as begin
insert into @result (sid,name,department,mark)
select sid,name,department,mark from studentmark
update @result set result='pass'
return
end


create function scal_fun2(@id int)
returns varchar(200)
as
begin
declare @result varchar(200)
select @result = s.name +'-'+
cast(m.mark as varchar)+'-'+
d.department
from StudentMark s 
join dbo.StudentMark m on s.sid=m.sid
join dbo.department d on s.did=d.did
where s.sid=@id
return @result
end
select dbo.scal_fun2(2)



create function scal_fun3()--(create)
returns varchar(50)
as begin
return ( select concat_ws('-',name,department, mark) from StudentMark where sid=8)
end
select dbo.scal_fun3()

--view
--2types of view
--simple view->if single table is used it is simple view
--complex view->if multiple table is used it is complex view
--
create view simple_view as 
select*from student
select*from simple_view


alter view simple_view as 
select name as result1 ,mobile_no as result2 from student
select*from simple_view

create view complex_view as
select s.name as result1, d.dname as result2 from student s inner join department d on d.dID =s.dID 
select*from complex_view

exec sp_helptext complex_view


alter view complex_view with encryption as
select s.name as result1, d.dname as result2 from student s inner join department d on d.dID =s.dID 
select*from complex_view

--schemabinding->it is a keyword help not to delete or modify the table or data 

alter view complex_view with encryption,schemabinding as
select s.name as result1, d.dname as result2 from dbo.student s inner join dbo.department d on d.dID =s.dID 
select*from complex_view

drop table student


--trigger
--2type of trigger
--ddl trigger-> protect the database
--dml trigger-> it perform another action while doing a action

create trigger ddl_trig on database 
for 
create_table,alter_table,drop_table,create_function
as print 'you are not able to create alter drop tables in this database'
rollback

create table trig (id int,name varchar(50),department varchar(50),mark int,message varchar(100),ins_date datetime)
create trigger ins_trig on StudentMark 
after insert as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from inserted
end
insert into StudentMark values(31,'nevin','cse',450)
select *from StudentMark
select*from trig

alter trigger ins_trig on StudentMark 
instead of  insert as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from inserted
end
insert into StudentMark values(32,'nehal','mech',350)

--update(after)
create trigger upd_trigg on StudentMark 
after update as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from inserted
end
update StudentMark set name ='sankar'where sid=30
select *from StudentMark
select*from trig


--update(instead of)
alter trigger upd_trigg on StudentMark 
instead of update as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from inserted
end
update StudentMark set name ='rajaram'where sid=29
select *from StudentMark
select*from trig

--delete
create trigger del_trigg on StudentMark 
after delete as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from deleted
end
delete from StudentMark where sid=30
select *from StudentMark
select*from trig

alter trigger del_trigg on StudentMark 
instead of delete as begin 
insert into trig 
select sid,name,department,mark,'the student is graduated',getdate() from deleted
end
delete from StudentMark where sid=29

--store procedure
create procedure ins_procedure
@id int,@name varchar(50),@department varchar(50),@mark int
as begin
insert into StudentMark values(@id,@name,@department,@mark)
select*from StudentMark
end

exec ins_procedure @id=33,@name='bala',@department='AIDS',@mark=367
--update procedure
create procedure upd_procedure
@name varchar(50),@mark int,@id int
as begin 
update StudentMark set mark=@mark,name=@name where sid=@id
select*from StudentMark where sid=@id
end
exec upd_procedure @id=20,@name='siva',@mark=460
--delete procedure
create procedure del_procedure
@id int
as begin
delete from StudentMark where sid=@id
select*from StudentMark
end
exec del_procedure @id=10

--index
--2type cluster index and non cluster index
--1column cluster index
--multiple column non cluster index

create index cluster on StudentMark(name)
create index noncluster on StudentMark (name asc,department desc)

--backup
--right click the database
--task click backup


--restore
--click the databases 
--right click and restore and click devices



















