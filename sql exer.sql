



go


create table TBLTEST1 (
	
	seq int identity(1,1) primary key,
	name varchar(5) not null,
	score int not null
)

go


select * from TBLTEST1

insert into TBLTEST1 values ('apple',12)

delete tbltest1


insert into TBLTEST1 values ('banana',12)
insert into TBLTEST1 values ('kiwi',12)
insert into TBLTEST1 values ('mango',12)

select * from TBLTEST1


go



go


declare @seqno int
begin tran
insert into TBLTEST1 values ('go',90)
insert into TBLTEST1 values ('yesasdfasdf',890)

if @@error <> 0 and @@rowcount <> 1

commit tran
go





declare @number int
begin tran
insert into TBLTEST1 values ('go',123)
insert into TBLTEST1 values ('aplasdsssa',132)

if @@error <> 0 and @@rowcount <> 1
begin
	if @@trancount > 0 
		rollback tran
end

commit tran

select * from TBLTEST1

delete TBLTEST1

go



go



begin tran
insert into TBLTEST1 values ('bak',988)
insert into TBLTEST1 values ('vel',882)

if @@error <> 0 and @@rowcount <> 1
begin
	if @@trancount > 0
		begin
			rollback tran
		end
end

commit tran



go

 SELECT * FROM TBLTEST1




delete TBLTEST1


create table tbltriangle (
	seq int identity(1,1) primary key,
	a1 int not null,
	a2 int not null,
	a3 int not null
)


insert into tbltriangle values (10,10,10)



insert into tbltriangle values (11,11,11)
insert into tbltriangle values (30,32,30)
insert into tbltriangle values (40,40,40)
insert into tbltriangle values (20,20,21)
insert into tbltriangle values (21,21,21)
insert into tbltriangle values (20,22,50)



select * from tbltriangle

go


declare @num int
set @num = (select top 1 a1 from tbltriangle)
print @num

go

--declare @num1 int, @num2 int, @num3 int
--set @num1 = (select top 1 a1 from tbltriangle order by a1)
 

select * from tbltriangle

--when 과 case 문을 사용해서 써봐라
--아 when 절을 사용하면 되는거구나?!....


select * from tbltriangle

select
	case when a1 = a2 and a2 = a3 then 'equal'
		 when a1 + a2 < a3 or a2+ a3 < a1 or a1 + a3 < a2 then 'not tri'
		 when a1 = a2 or a2 = a3 or a1 = a3 then 'just one'
		 else 'basic tri'
	end
from tbltriangle

