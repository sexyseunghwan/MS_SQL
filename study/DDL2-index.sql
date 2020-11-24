--�ε����� ���� �˾ƺ���


/*

�ε��� : "�����͸� �� �� ������ ã�� �� �ֵ��� ���ִ� ����"
������ �ε����� �� ����ؾ� �����͸� ȿ�������� ã���� �ִ°����� ���������� ����ϸ� ������ �� ������
������ �� �ִ�.

�ε��� ����� ���� �⺻���� : �ε����� ��������� ���ؼ��� Ư���� ���������� �ʿ��ѵ�
�װ��� ������������ unique �� �ɷ��ְų� primary key �� �ɷ��־�� �ε����� ����� �� �ְ� �ȴ�.


1. Ŭ�������� �ε���
- Ŭ�������� �ε����� ��������̶�� �����ϸ� �ȴ�.
- Ŭ�������� �ε����� ���̺�ȿ� �ϳ��� ������ �����ϴ�.
- Ŭ�������� �ε����� ������ �˻� �ÿ� ���� ����� ������ ���δ�.



2. ��Ŭ�������� �ε���
- å �ڿ� �ִ� ã�ƺ����� �����ϸ� �ȴ�.
- �� Ŭ�������� �ε����� ���̺�ȿ� �������� ������ �����ϴ�.




*/




create table dbo.testpknonunique
(
	a int primary key,
	b int,
	c int
)

drop table dbo.testpknonunique
-- ���� ���� ���̺��� �����ϰ�, ���� pk�� �߰��ϰ� �Ǹ� 
-- a���� clustered, unique, primary key located on DATA_FG �̷������� ������ ������ �ȴ�.

--drop table dbo.testpk


-- unique �Ӽ�
-- unique�� �� Ŭ�������� �ε������ �����ϸ� �ȴ�.

create table dbo.testpkunique
(
	a int primary key,
	b int unique,
	c int unique 
)

drop table dbo.testpkunique

-- ���̺����� ���� �ϳ��� �÷����� Ŭ�������� �ε����� �ɼ� �ִ�.
-- Ŭ������ �ε����� ���� ���� ������ �ȵǴ� ������ �ֳ� ����?
-- pk �� ������ Ŭ�������� �ε����� �ƴϴ�.

      
create table dbo.TESTCLU 
(
	a int primary key,
	b int unique clustered,

)



--Ŭ�������� �ε����� ��Ŭ�������� �ε����� ����ó���� �ٸ����� ����
-- 
create table dbo.TBLTESTCLUSTERED (
	clus_user_id varchar(20) not null,
	clus_user_name varchar(20) not null
)

alter table dbo.TBLTESTCLUSTERED
	add constraint PK__TBLTESTCLUSTERED__CLUS__USER__ID PRIMARY KEY (clus_user_id)

drop table dbo.TBLTESTCLUSTERED

insert into dbo.TBLTESTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTCLUSTERED values ('m','mango');

select * from dbo.TBLTESTCLUSTERED with(nolock) 

create table dbo.TBLTESTNOTCLUSTERED (
	nonclus_user_id varchar(20) not null,
	nonclus_user_name varchar(20) not null
)



drop table dbo.TBLTESTNOTCLUSTERED

insert into dbo.TBLTESTNOTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTNOTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTNOTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTNOTCLUSTERED values ('m','mango');


alter table dbo.TBLTESTNOTCLUSTERED
	add constraint UN__TBLTESTNONCLUSTERED__NONCLUS__USER__ID UNIQUE (nonclus_user_id)
   
select * from dbo.TBLTESTNOTCLUSTERED with(nolock)



go



create table dbo.TBLTESTSH
(
	sh_seq_no int not null,
	sh_name varchar(10) not null
)

--create index ID__TBLTESTSH__SH__SEQ__NO on dbo.TBLTESTSH (sh_seq_no)


drop table dbo.TBLTESTSH


create table dbo.MIXEDTBL
(
	userID char(8) not null,
	name nvarchar(10) not null,
	addr nchar(2)
)

drop table dbo.MIXEDTBL

alter table dbo.MIXEDTBL alter column name varchar(30)

alter table dbo.MIXEDTBL alter column addr varchar(30)


insert into dbo.MIXEDTBL values ('LSG','LEE SUNG KEE','SEOUL')
insert into dbo.MIXEDTBL values ('KBS','KIM BUM SOO','KN')
insert into dbo.MIXEDTBL values ('KKH','KIM KYOUNG HO','JN')
insert into dbo.MIXEDTBL values ('JYP','JHO YONG PHIL','KK')
insert into dbo.MIXEDTBL values ('SSK','SUMG SI KYOUNG','SEOUL')
insert into dbo.MIXEDTBL values ('LJB','LIM JAE BEOM','SEOUL')
insert into dbo.MIXEDTBL values ('YJS','YOON JONG SHIN','KN')
insert into dbo.MIXEDTBL values ('EJW','EUN JI WON','KB')
insert into dbo.MIXEDTBL values ('JKW','JHO KWAN WOO','KK')
insert into dbo.MIXEDTBL values ('BBK','BA BI KIM','SEOUL')

SELECT * FROM dbo.MIXEDTBL with(nolock)

drop table dbo.MIXEDTBL

truncate table dbo.MIXEDTBL

alter table dbo.MIXEDTBL add constraint PK__MIXEDTBL__userID primary key (userID)

alter table dbo.MIXEDTBL add constraint UQ__MIXEDTBL__name unique (name)

--**** �򰥷����� ����!!****
--**�׸��� �׻� �򰥸��� ���ƾ��ϴ°� nonclustered index, clustered index �� ��ü�� ���ϼ����� �ƹ��� ���谡 ���ٰ� �����ؾ� �Ѵ�!**
-- ���� ���� ����� ���ؼ� �и���Ű�� ���ϻ��̴�! ���� ������� ����� ���ٰ� ���°� �´�.

-- �̷������� Ŭ�������� �ε����� ��Ŭ�������� �ε����� ȥ���ؼ� ���������, �����ȹ�� ���鼭 � ����� �� ȿ�������� �ľ��غ��� 
--select addr from dbo.MIXEDTBL where name = 'jHO YONG PHIL'

-- �ε��� ������ ���� �غ���.
create index IDX__MIXEDTBL__ADDR on dbo.MIXEDTBL (addr)
--�̷������� ���̺� ���� �ε����� �������ָ� �⺻������ ��Ŭ������ �ε����� �����ǰ� �ȴ�.

-- ����ũ �ε����� �����غ���
create unique index IDX__MIXEDTBL__NAME on dbo.MIXEDTBL (name)

--Ŭ������ �ε��� �����غ���
create clustered index IDX__MIXEDTBL__USERID on dbo.MIXEDTBL (userID)

select * from dbo.MIXEDTBL with(nolock)


create table dbo.MIXEDTBL
(
	userID varchar(30) not null,
	name varchar(30) not null,
	addr varchar(30) not null,
	code int not null

)

insert into dbo.MIXEDTBL values ('LSG','LEE SUNG KEE','SEOUL',1)
insert into dbo.MIXEDTBL values ('KBS','KIM BUM SOO','KN',2)
insert into dbo.MIXEDTBL values ('KKH','KIM KYOUNG HO','JN',4)
insert into dbo.MIXEDTBL values ('JYP','JHO YONG PHIL','KK',1)
insert into dbo.MIXEDTBL values ('SSK','SUMG SI KYOUNG','SEOUL',6)
insert into dbo.MIXEDTBL values ('LJB','LIM JAE BEOM','SEOUL',8)
insert into dbo.MIXEDTBL values ('YJS','YOON JONG SHIN','KN',10)
insert into dbo.MIXEDTBL values ('EJW','EUN JI WON','KB',32)
insert into dbo.MIXEDTBL values ('JKW','JHO KWAN WOO','KK',99)
insert into dbo.MIXEDTBL values ('BBK','BA BI KIM','SEOUL',54)

select * from dbo.MIXEDTBL with(nolock)


create nonclustered index IDX__MIXEDTBL__ADDR_CODE on dbo.MIXEDTBL (addr,code) 


select * from dbo.MIXEDTBL with(nolock) where addr = 'SEOUL' and code = 1

drop table dbo.MIXEDTBL


--��꿭�� �ε����� ���غ���.
create table dbo.COMPUTETBL
(
	input1 int not null,
	input2 int not null,
	sumation as input1 + input2 persisted,
	minus as input1 - input2 persisted,
	multiple as input1 * input2 persisted,
	divide as input1 / input2 persisted 
)

drop table dbo.COMPUTETBL

insert into dbo.COMPUTETBL values (20,30)

select * from dbo.COMPUTETBL with(nolock)
--�̷������� ��꿭�� �����Ҽ� �ִ�.

