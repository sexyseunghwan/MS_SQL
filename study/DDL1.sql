
-- Data definition language (ddl)�� �˾ƺ���

-- �̰��� �ִ� ����
-- ���̺� ����, �������� �ɱ�

-- �Ʒ���� �ۼ��ϴ°� ����.

--  table ������ ���ؼ� �˾ƺ��ڱ���
--  **���̺���� �빮��, �÷����� �ҹ��ڷ� �������ش�.** -> ��Ģ���� ������ : �ش� ��Ģ�� ȸ�翡 ���� �ٸ� �� �ִ�.

-- ���̺� ���� ù��° ���
go
create table [dbo].[TBLTESTTABLE](
	[test_seq_no] [bigint] IDENTITY(1,1) NOT NULL,
	[test_name] [varchar](50) NOT NULL,
	[reg_dt] [datetime] NOT NULL,
	[reg_id] [varchar](25) NOT NULL,
	[chg_dt] [datetime] NULL,
	[chg_id] [varchar](25) NULL
)

go

-- ���̺� ���� �ι�° ���
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)


go

-- ���̺��� ������ Ȯ�����ִ� �ý��� ���ν������ �������ָ� �ȴ�. �������� ����ص� ��� �� �ߵȴ�.
--exec sys.sp_help TBLTESTTABLE
--exec sp_help TBLTESTTABLE
--sp_help TBLTESTTABLE


go

-- ���̺� ���� Ȯ��
-- �׻� ���̺��� select ���ٶ��� with(nolock)�� �ٿ��� �Ѵ�!
select * from TBLTESTTABLE with(nolock)
drop table TBLTESTTABLE



-- ���� ���̺��� ���������� �ɾ��.
-- �������� ����� �����Ѵ� => ���̺��� ���� ��ÿ� ���������� �� �� �ְ� ����, ���̺��� ���� ���Ŀ��� ���������� �� �� �ִ�.


-- 1. pk ���� �ɱ�
-- ù��°�� �������� �Ŵ� ��� : ���� �����̸Ӹ�Ű�� ������ �˱Ⱑ �ſ� ���������
-- PK__TBLTESTT__C1A912FA8191C016 �̷������� pk�� �̸��� �ٿ�����.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null primary key,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)

-- PK__TBLTESTT__C1A912FA8191C016 �̷������� pk�� �̸��� �ٿ�����. -> �̷������� �̸��� �ٿ����� ��ġ�����Ƿ�! -> pk�� �̸��� �ٲ��ֵ��� ����.
-- �ι�°�� �������� �Ŵ� ���
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null constraint PK__TBLTESTTABLE__test_seq_no primary key,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
	
)

--�̷������� pk �� �����ϰ� �Ǹ� index name �� PK__TBLTESTTABLE__test_seq_no �̷������� �츮�� ���� �˾ƺ��� ���� ������ �ȴ�. 

-- ����° ���� ���̺� �÷� �ڿ��Ἥ ������ �ؼ� ����� �ټ��� �ִ�.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null,
	constraint PK__TBLTESTTABLE__test_seq_no primary key (test_seq_no)
)


-- �׹�° : �̹� ���̺��� ���� ������� ��쿡 �ۿ��� ���������� �ɾ��ش�.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)

alter table dbo.TBLTESTTABLE add constraint PK__TBLTESTTABLE__test_seq_no primary key (test_seq_no)


-- 2. default ���� ���� �ɱ�

-- 2-1. �÷����� �������� �ɱ� 
-- ������ ������ �Ʒ��� ����� ���� ���ؼ� ���� �̸��� �Է��Ҽ� �����Ƿ� ���� ���� ����� �ƴ϶�� �����ϸ� �ȴ�.
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime default	getdate()
)

go
-- 2-2. ���̺� ������ ����Ʈ �������� �߰����ֱ�(�÷��� ���������� ���� ..?!..)
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime 
		constraint DF__TBLINSA__REG__DT default getdate()
)

go

-- 2-3 ���̺� �ܺο��� ����Ʈ �������� �߰����ֱ�
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime 
)

alter table dbo.TBLINSA add constraint DF__TBLINSA__REG__DT default getdate() for reg_dt


go

-- default ���� insert ���ִ� ���
-- ���������� ��� �÷����� �� �Է����༭ �ϳ��ϳ� �������ִ� ���
-- default ���� �����ʰ� �׳� �־��ָ� default ���� �˾Ƽ� �����ǰ� �ȴ�.
insert into dbo.TBLINSA (insa_seq_no,insa_name) values (2,'jhone')

-- �׳� values �� �־��ִ� ����� default ��� �־���� �Ѵ�.
insert into dbo.TBLINSA values (1,'harry',DEFAULT)


-- Ȯ��
select * from dbo.TBLINSA with(nolock)




-- 3. SPARSE
-- ���Ľ� ���� ���ؼ� �˾ƺ���
-- ���Ľ����̶� : null ���� ����ȭ �Ǿ��ִ� ����Ұ� �ִ� �Ϲ� ���� �����Ҽ� �ִ�!
go


use tempdb;
create database sparseDB;


use sparseDB;
create table chartbl
(
	id int identity,
	data char(100) null
)

create table sparseCharTbl (
	id int identity,
	data char(100) SPARSE null
)



declare @i int = 0
while @i < 10000
begin
	insert into chartbl values(null);
	insert into chartbl values(null);
	insert into chartbl values(null);
	insert into chartbl values(replicate('A',100));
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(replicate('A',100));
	set @i += 1
end

select * from chartbl

--���� null���� �������� ������������ SPARSE �� �־��ָ� ��������� �ξ��� �Ƴ��� �ִ�
-- ������ NULL ���� �������� ���°�쿡 SPASE �� ���� �ȴٸ� ������ �� ���� �����͸� ��Ƹ԰� �ȴ� �� ���ɻ��� �̽��� ������ �� �ִ�.


create table dbo.tblsparse
(
	seq int null,
	name varchar(10) not null
)





