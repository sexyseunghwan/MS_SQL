



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







