
create table practice(id int primary key identity(1,1),name varchar(50),age int,city varchar(50),DOB date,ph_no bigint,hobby varchar(50),fathername varchar(50),nationality varchar(50),gender varchar(1))
begin tran insert into practice values('sudhan',18,'madurai','2008-05-11',9874561230,'singing','rajesh','Indian','M')save tran s1
begin tran insert into practice values('madhan',19,'chennai','2007-04-12',9942962158,'gaming','manikandan','Indian','M')save tran s2
begin tran insert into practice values('jeni',21,'sydney','2005-02-11',+61789456123,'reading','jhon','austraila','F')save tran s3
begin tran insert into practice values('arjunmehta',27,'mumbai','1998-05-14',9876543210,'cricket','rajeshmehta','Indian','M')save tran s4
begin tran insert into practice values('liamcarter',29,'toronto','1996-08-21',+16471234567,'surfing','michalecarter','canadian','M')save tran s5
begin tran insert into practice values('sofiamartinez',26,'madrid','1997-02-17',+3461234578,'painting','carlosmartinez','spanish','F')save tran s6
begin tran insert into practice values('aikotanaka',25,'tokyo','2007-07-09',+809012345678,'calligraphy','hiroshitanaka','japanese','M')save tran s7
begin tran insert into practice values('ahmedhassan',31,'cairo','1994-09-18',+201212345678,'chess','omarhassan','egyptian','M')save tran s8
begin tran insert into practice values('isabellarossi',28,'rome','1997-06-30',+3931223456789,'dancing','marcorossi','italian','F')save tran s9
begin tran insert into practice values('joaosilva',26,'lisbon','1999-03-22',+351912345678,'guitar','pedrosilva','portuguese','M')save tran s10
select*from practice
update practice set age = 45
update practice set age = 35 where id=5
update practice set age = 18 where id in(2,6,8)
update practice set age = 20 where id between 6 and 10
truncate table practice 
delete from practice 
delete from practice where id = 11
delete from practice where id in (12,18,20)
delete from practice where id between 16 and 18
select*from practice where id =15
select*from practice where id in (15,19)
select*from practice where id between 15 and 19
select name,age from practice
begin tran rollback
select*from practice
begin tran insert into practice values('isabellarossi',28,'rome','1997-06-30',+3931223456789,'dancing','marcorossi','italian','F')
begin tran insert into practice values('isabellarossi',28,'rome','1997-06-30',+3931223456789,'dancing','marcorossi','italian','F')commit
begin tran rollback 