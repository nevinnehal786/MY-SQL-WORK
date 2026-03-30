create table student(sid int primary key identity(1,1),name varchar(50),mobile_no bigint,age int,city varchar(50))
insert into student values('arjun','987654213',20,'chennai')
insert into student values('rahul','991023456780',21,'mumbai')
insert into student values('priya','988776655',19,'delhi')
insert into student values('Sneha', '9012345678', 22, 'Bangalore')
insert into student values('Vikram', '9090909090', 23, 'Hyderabad')
insert into student values('Kiran', '9345678123', 20, 'Pune')
insert into student values('Meena', '8765432109', 18, 'Kolkata')
insert into student values('Ravi', '8899001122', 24, 'Ahmedabad')
insert into student values('Divya', '9776655443', 21, 'Jaipur')
insert into student values('Suresh', '9654321789', 22, 'Chennai')
insert into student values('Anjali', '9111222333', 19, 'Mumbai')
insert into student values('Manoj', '9222333444', 20, 'Delhi')
insert into student values('Lakshmi', '9333444555', 23, 'Bangalore')
insert into student values('Harish', '9444555666', 21, 'Hyderabad')
insert into student values('Kavya', '9555666777', 22, 'Pune')
insert into student values('Gokul', '9666777888', 24, 'Chennai')
insert into student values('Nisha', '9777888999', 20, 'Delhi')
insert into student values('Praveen', '9888999000', 19, 'Mumbai')
insert into student values('Deepa', '9999000011', 21, 'Kolkata')
insert into student values('Aravind', '9000011122', 23, 'Jaipur')
insert into student values('Swathi', '9111122233', 18, 'Ahmedabad')
insert into student values('Vignesh', '9222233344', 22, 'Chennai')
insert into student values('Pooja', '9333344455', 21, 'Hyderabad')
insert into student values('Sandhya', '9555566677', 23, 'Pune')
insert into student values('Ramesh', '9444455566', 20, 'Bangalore')
insert into student values('Sandhya', '9555566677', 23, 'Pune')
insert into student values('Dinesh', '9666677788', 24, 'Delhi')
insert into student values('Preethi', '9777788899', 19, 'Mumbai')
insert into student values('Karthik', '9888899900', 21, 'Chennai')
insert into student values('Shalini', '9999900011', 22, 'Kolkata')
insert into student values('Ajay', '9000022233', 20, 'Hyderabad')
alter table student add dID int constraint fk_department foreign key references department(dID)

create table department(dID int primary key identity(1,1),dname varchar(100))
insert into department values('computer science'),('mechanical'),('civil'),('electrical'),
('electronics'),('information technology'),('artificial intelligence'),('data science'),('biotechnology'),('chemical engineering')
select*from department

create table fees(fid int primary key identity(1,1),famount decimal(10,2))
insert into fees values (25000),(30000),(35000),(40000),(45000),(50000),(55000),(60000),(65000),(70000)
select*from fees

create table cons (id int primary key identity(1,1),name varchar(50) not null,
mobile_no bigint unique,mail varchar(50) constraint uq_mail unique,
city varchar(50) constraint df_city default'chennai',age int constraint ck_age 
check(age>18))
insert into cons values('nevin',6380113506,'nevinnehal756@gamil.com','madurai',20)
select*from cons
insert into cons (mobile_no,mail,city,age)values(6380116506,'magicwolf5640@gamil.com','trichy',19)
insert into cons (name,mobile_no,mail,age)values('raja',9942962150,'hero@gamil.com',45)
insert into cons values('suresh',8240510256,'suryaraj@gmail.com','kerala',15)



alter table cons drop constraint [uq_mail],[UQ__cons__D7B19EFA1AEC7A73],[ck_age],[df_city]
alter table cons add constraint uq_mobile_no unique(mobile_no)
alter table cons add constraint df_city default'madurai'for city
alter table cons add constraint ck_age check(age>18)
alter table cons alter column name varchar(50) not null


alter table student add dID int constraint fk_department foreign key references department(dID)
update student set dID= 2 where sid in (4,6,8,12)
select*from student
update student set dID=1 where sid in (1,2,3,5)
update student set dID=3 where sid in (7,9,10,11)
update student set dID=4 where sid in (13,15,17,19)
update student set dId=5 where sid in (14,16,18,20)


alter table department add fid int constraint fk_fees foreign key references fees (fid)
update department set fid =2 where dId =2
update department set fid =5 where dId =3
update department set fid =6 where dId =4
update department set fid =3 where dId =5
update department set fid =4 where dID =6
select*from department
update department set fid =7 where dID =7
update department set fid =8 where dID=8
update department set fid =9 where dID =9
update department set fid =10 where dID =10

--join --> combine multiple table in single statement and getting result in single table
--types of join
--inner join
--left join or left outer join
--right join or right outer join
--full join or full outer join
--cross join or cartesian join
--self join-- table refer itself  
--inner join--> it show the output of only the common values
--left


select*from student inner join department on department.dID=student.dID
select student.name,department.dname from student inner join department on department.dID=student.dID
select s.name,d.dname from student s inner join department d on d.dID=s.dID
select s.name,d.dname from student s left join department d on d.dID=s.dID
select s.name,d.dname from student s right join department d on d.dID=s.dID
select s.name,d.dname from student s full join department d on d.dID=s.dID
select s.name,d.dname from student s cross join department d 
select s.name from student s inner join student d on d.dID=s.dID
select s.name,d.dname,f.famount from student s inner join department d on d.dID=s.dID inner join fees f on f.fid=d.fid
select s.name,d.dname,f.famount from student s inner join department d on d.dID=s.dID left join fees f on f.fid=d.fid
select s.name,d.dname,f.famount from student s inner join department d on d.dID=s.dID right join fees f on f.fid=d.fid


--set function-combine multiple select statement on getting result in single table ,number of cloumn must be same, datatype also same
--types union,union all, intersect,except-->union- produce unique record
--excpet -uncommon from the first select statement
select sid,name from student union select dID,dname from department 
select sid from student union select dID from department 
select sid from student union all select dID from department 
select sid from student intersect select dID from department 
select sid from student except select dID from department 
select dID from department except select sid from student


--top clause -> it is used to select the top of the table or see the data how it used
select top (5)*from student
--sorting-> order by -->it is used to ascend and descend the data(asc)(desc)
select*from student order by name desc
select*from student order by city asc
--distinct -> to show the unique record
select distinct(city)from student
--functions or methods --its a block of codes ,code reusability,
--types are in-built function and user-defined function
--in built
--aggregate function
select avg(famount)from fees
select count(famount)from fees
select max(famount)from fees
select min(famount)from fees
select sum(famount)from fees
--date&time
select current_timestamp 
select getdate()
select Getutcdate()
select sysdatetime()
select sysdatetimeoffset()
select sysutcdatetime()
select dateadd(year,6,getdate())
--(year,yyyy,yy
--quarter,qq,q
--month,mm,m
--week,ww,wk
--dayofyear,dy,y
--day,dd,d
--weekday,dw,w
--hour,hh
--minute,mi,n
--second,ss,s
--millisecond,ms)

select Datediff(year,'20050103',getdate()) 
select datename(year,getdate())
select datepart(year,getdate())
select datepart(month,getdate())
select datename(month,getdate())
select datepart(weekday,getdate())
select datename(weekday,getdate())
select datepart(dayofyear,getdate())
select datepart(weekday,getdate())
select datepart(day,getdate())
select day(getdate())
select month(getdate())
select year(getdate())
select isdate('20260229')--op:0, bcoz 29 not in feb month
select isdate('20260226')

--string function:
--ascii,which is used to encrypt and decrypt,each char asign as numeric value
select name,ascii(name) from student
--capital letters start with 65
--small letters start with 97
select ascii('s')--for particular character

--char 
select char(97)
--charindex()
select name,charindex('s',name) from student
--index start with '1'
select name,charindex('s',name,4) from student
--it's consider from the 4th palce 

--left()
select name,left(name,7) from student
--right()
select name,right(name,3) from student
--substring
--string,starting position ,end position
select name,substring(name,3,5) from student
--len()
select name,len(name) from student
select name,datalength(name) from student
select len('    sharmila    ')
select datalength('    sharmila    ') 

--lower()
select name,lower(name) from student
--upper()
select name,upper(name) from student
--Ltrim(),trim(),rtrim()--remove the space
select Ltrim('    sharmila    ')
select Rtrim('    sharmila    ')
select trim('    sharmila    ')
--Quotename()-- to put the output in desired phrases,default-->([])
select Quotename(name) from student
select Quotename(name,'""') from student
--Replace-->to replace the character in the table 
select name ,replace(name,'a','b') from student
--Replicate--to make duplicate copy
select name ,replicate(name,2) from student
--Reverse-->used to reverse the values in the table  
select name ,reverse(name) from student
--Concat()--> to concat the table column
select name ,concat (name,age,city) from student
--Concar_ws--> it means concat with separator
select name ,concat_ws ('/',name,age,city) from student
--operators--it used to perform operation using values that are given
--3 operators-->
--arithmetic operators-->it is used for mathematical operations(+,-,*,/,%)
select sid,dID,(sid+dID)from student
select sid,dID,(sid-dID)from student
select sid,dID,(sid*dID)from student
select sid,dID,(sid/dID)from student
select sid,dID,(sid%dID)from student
--comparison operator-->(=,!=,<>,<,<=,>,>=)
select *from student where sid=5
select *from student where sid!=5
select *from student where sid<>5
select *from student where sid<5
select *from student where sid<=5
select *from student where sid>5
select *from student where sid>=5
--Logical operator-->(and,or,in,between,like,not,all,any,some,exists)
select *from student where sid=5and name='Vikram'
select *from student where sid=5or name='arjun'
select *from student where sid in(8,9,10,31)
select *from student where sid between 8 and 20
select * from student where name like '%a%'--the name contains the character
select * from student where name like 'a%'--the name start with character
select * from student where name like '%a'--the name end with character
select * from student where name not like '%a'--not is used to negate the conditon it used in fornt of in,between and like 
--cannot be used separately

--all
select*from student where dID= all(select dId from department where dname='civil')--here we use main query and sub query to find the student 

select*from student where dID= all(select dId from department where dname='biotechnology')

select*from student where dID= all(select dId from department where dname='medicine')
select*from student where dID= all(select dId from department where dname in('civil','electrical'))

---any
select*from student where dID= any(select dId from department where dname='civil')--here we use main query and sub query to find the student 
select*from student where dID= any(select dId from department where dname='biotechnology')
select*from student where dID= any(select dId from department where dname='medicine')
select*from student where dID= any(select dId from department where dname in ('electrical','civil')) 
--some-any are same it produce same result
select*from student where dID= some(select dId from department where dname='civil')
select*from student where dID= some(select dId from department where dname='biotechnology')
select*from student where dID= some(select dId from department where dname='medicine')
select*from student where dID= some(select dId from department where dname in ('electrical','civil')) 
--exists
select*from student where exists (select dId from department where dname ='civil')
select*from student where exists (select dId from department where dname ='biotechnology')
select*from student where exists (select dId from department where dname ='medicine')
select*from student where exists (select dId from department where dname in('electrical','civil'))






























































































