select count(*) from dbo.QOO10USER with(nolock)select * from dbo.QOO10USER with(nolock)select id,count(*) from dbo.QOO10USER with(nolock)group by idhaving count(*) > 1drop table dbo.QOO10USER-- QOO10 �� ȸ�� ���̺�(���̵����ͷ� �����)
create table dbo.QOO10USER 
( 
	usercode int identity(1,1) not null,--ȸ�������ڵ� 
	id varchar(100) not null,--ȸ�� ���̵�
	pw varchar(100) not null,--ȸ�� ��й�ȣ
	email varchar(200) null,--ȸ�� �̸��� 
	gender char(1) null,--ȸ�� ���� 
	nation char(2) null,-- ȸ�� ���� 
	ipaddress varchar(200) null,-- ȸ�� �������ּ�
	hascoin int -- ȸ���� ������ ����
)ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)select count(*) from QOO10USER with(nolock)select * from QOO10USER with(nolock)select count(*) from dbo.APPLEBUYTBL with(nolock)select * from 


/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : ���̵����� ���� : ȸ������
	    
	History		: 2021-02-20 Seunghwan Shin	#���� ����

*/create proc [dbo].[qoo10_dummy_init]	@id varchar(100),	@pw varchar(100),	@email varchar(200),	@gender char(1),	@nation char(2),	@ipaddress varchar(200),	@coin intasset nocount on
set transaction isolation level read uncommittedbegin	insert into dbo.QOO10USER values (@id,@pw,@email,@gender,@nation,@ipaddress,@coin)	if @@error <> 0	begin		return 0;	endend--drop proc qoo10_login/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : �α��� ó��
	    
	History		: 2021-02-20 Seunghwan Shin	#���� ����

*/create proc [dbo].[qoo10_login]	@inputid varchar(100),	@inputpw varchar(100)asset nocount on
set transaction isolation level read uncommittedbegin		select count(*) as cnt from dbo.QOO10USER with(nolock) where id = @inputid and pw = @inputpw;	endselect * from dbo.QOO10USER with(nolock)--select count(*) as cnt from dbo.QOO10USER with(nolock) where id = 'ayyyk544846' and pw = '%jbiO6s@OPj"=l';