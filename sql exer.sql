



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
