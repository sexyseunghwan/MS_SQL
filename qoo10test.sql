
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
)


/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : ���̵����� ���� : ȸ������
	    
	History		: 2021-02-20 Seunghwan Shin	#���� ����

*/
set transaction isolation level read uncommitted
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : �α��� ó��
	    
	History		: 2021-02-20 Seunghwan Shin	#���� ����

*/
set transaction isolation level read uncommitted