
-- Data definition language (ddl)�� �˾ƺ���

-- �̰��� �ִ� ����
-- ���̺� ����, �������� �ɱ�

-- �Ʒ���� �ۼ��ϴ°� ����.

-- 1. table ����
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


--�� �̷������� ���ټ� �ִ� �������θ� �ϴ� �������



