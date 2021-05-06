



SELECT * FROM dbo.TBLINSA WITH(NOLOCK)




SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rm,name,occupation FROM dbo.OCCUPATIONS


SELECT * FROM dbo.OCCUPATIONS WITH(NOLOCK)


SELECT 
	ROW_NUMBER() OVER (PARTITION BY buseo ORDER BY basicpay+sudang DESC) AS rn
,	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang
FROM dbo.TBLINSA WITH(NOLOCK)


SELECT
	num
,	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY salary DESC
OFFSET 56 ROWS


SELECT COUNT(*) AS total FROM dbo.TBLINSA WITH(NOLOCK)




SELECT TOP (1) PERCENT
	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY salary DESC




SELECT 
	name
,	ssn
,	city
,	tel
,	buseo
,	jikwi
,	basicpay 
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY ibsaDate DESC




SELECT DISTINCT
	city
,	jikwi
,	buseo
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY city DESC







select top(100) * from dbo.QOO10_USER_REAL with(nolock)







create table dbo.QOO10_USER_REAL 
(  
	qoouser_id varchar(100) not null,--ȸ�� ���̵�
	qoouser_pw varchar(800) not null, -- ȸ�� ��й�ȣ encryption
	qoouser_birthday datetime,--ȸ�� �������
	qoouser_email varchar(200) null,--ȸ�� �̸��� 
	qoouser_gender char(1) null,--ȸ�� ���� 
	qoouser_nation char(2) null,-- ȸ�� ���� 
	qoouser_ipaddress varchar(200) null,-- ȸ�� �������ּ�
	qoouser_hascoin int not null,-- ȸ���� ������ ����
	qoouser_phone_num varchar(20) not null,-- ȸ���� ��ȭ��ȣ
	qoouser_grade int not null, -- ȸ���� ���
	qoouser_receive_email char(1) not null, -- ȸ���� �̸��� ���� ����
	qoouser_receive_sms char(1) not null, -- ȸ���� ���� ���� ����
	qoouser_denide char(1) not null, -- ���ܵ� ȸ������ ����
	qoouser_register_datetime datetime not null, -- ȸ�� �����
	qoouser_lastlogin_datetime datetime null, -- ȸ���� ���� �α��� �ð�
	qoouser_lastlogin_ipaddress varchar(200) null--ȸ���� ���� �α��� ������
)


SELECT * 
FROM dbo.QOO10_USER_REAL WITH(NOLOCK) 
WHERE qoouser_lastlogin_datetime >= '2021-03-31'

ALTER TABLE dbo.QOO10_USER_REAL ADD CONSTRAINT PK__QOO10_USER_REAL__QOOUSER_ID PRIMARY KEY (qoouser_id)


SELECT DISTINCT
	qoouser_grade
,	qoouser_nation
,	qoouser_register_datetime
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)
WHERE qoouser_register_datetime > '2008-01-01'




SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) AS cnt
,	MAX(qoouser_hascoin) AS richcoin
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime > '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING MAX(qoouser_hascoin) > 3014000

SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) -- �÷��� ����
,	MAX(qoouser_hascoin) -- �÷��� ����
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime > '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING MAX(qoouser_hascoin) > 3014000



SELECT
	qoouser_grade
,	qoouser_nation
,	YEAR(qoouser_birthday) AS btd
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)

--WHERE qoouser_birthday >= '2000'



DROP TABLE dbo.TESTSH

CREATE TABLE dbo.TESTSH
(
	seq INT NOT NULL,
	name VARCHAR(20) NULL,
	nation CHAR(2) NULL
)

ALTER TABLE dbo.TESTSH ADD CONSTRAINT PK__TESTSH__SEQ PRIMARY KEY (seq)

INSERT INTO dbo.TESTSH VALUES (1,'harry','KR')
INSERT INTO dbo.TESTSH VALUES (2,'harry','SG')
INSERT INTO dbo.TESTSH VALUES (3,'harry','KR')
INSERT INTO dbo.TESTSH VALUES (4,'jhone','KR')
INSERT INTO dbo.TESTSH VALUES (5,'krul','CN')
INSERT INTO dbo.TESTSH VALUES (6,'galua','JP')

SELECT name,nation FROM dbo.TESTSH WITH(NOLOCK) 

SELECT DISTINCT name,nation FROM dbo.TESTSH WITH(NOLOCK) 




INSERT INTO dbo.TESTSH VALUES (1,10)
INSERT INTO dbo.TESTSH VALUES (2,20)
INSERT INTO dbo.TESTSH VALUES (3,10)
INSERT INTO dbo.TESTSH VALUES (4,20)
INSERT INTO dbo.TESTSH VALUES (5,50)
INSERT INTO dbo.TESTSH VALUES (6,NULL)

SELECT SUM(etcdata) FROM dbo.TESTSH WITH(NOLOCK)

SELECT SUM(DISTINCT etcdata) FROM dbo.TESTSH WITH(NOLOCK)


INSERT INTO dbo.TESTSH VALUES (1,'DATA1')
INSERT INTO dbo.TESTSH VALUES (2,'DATA2')
INSERT INTO dbo.TESTSH VALUES (3,NULL)
INSERT INTO dbo.TESTSH VALUES (4,'DATA4')

SELECT COUNT(*) AS cnt FROM dbo.TESTSH WITH(NOLOCK)

SELECT SUM(DISTINCT etcdata) AS cnt FROM dbo.TESTSH WITH(NOLOCK)






SELECT qoouser_hascoin FROM dbo.QOO10_USER_REAL WITH(NOLOCK)






SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime >= '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING COUNT(*) > 4500
ORDER BY qoouser_grade, qoouser_nation


SELECT qoouser_id,qoouser_grade, YEAR(qoouser_birthday) AS birthyear, COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'
GROUP BY qoouser_id,qoouser_grade, YEAR(qoouser_birthday)
HAVING COUNT(*) > 1
ORDER BY qoouser_id, birthyear



SELECT TOP(100) * FROM dbo.QOO10_USER_REAL  WITH(NOLOCK)



SELECT qoouser_grade, YEAR(qoouser_birthday) AS birthyear
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'


SELECT qoouser_id,qoouser_grade, YEAR(qoouser_birthday) AS birthyear, COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'
GROUP BY qoouser_id,qoouser_grade, YEAR(qoouser_birthday)
HAVING COUNT(*) > 1
ORDER BY qoouser_id, birthyear








SELECT * FROM dbo.USERTBL

SELECT * FROM dbo.BUYTBL

--ALTER TABLE dbo.USERTBL ADD CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userID)

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT PK__BUYTBL__NUM PRIMARY KEY (num)

--alter table dbo.BUYTBL drop constraint PK__buyTbl__DF908D65297564CE

--alter table dbo.BUYTBL drop constraint FK__buyTbl__userID__795DFB40 

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT FK__BUYTBL__USERID FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)--�̷������� ����Ű ����

SELECT * FROM dbo.USERTBL WITH(NOLOCK)


ALTER TABLE dbo.USERTBL ADD CONSTRAINT DF__USERTBL__MDATE DEFAULT getdate() FOR mDate


INSERT INTO dbo.USERTBL 
(
	userID
,	name
,	birthYear
,	addr
,	mobile1
,	mobile2
,	height
)
VALUES 
(
	'ssh9308'
,	N'�ų���'
,	1987
,	N'��õ'
,	'010'
,	'12347899'
,	180
)


SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

--  WITH NOCHECK

ALTER TABLE dbo.BUYTBL WITH NOCHECK ADD CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT CHECK (price >= 0 and amount >= 0)
 
--ALTER TABLE dbo.BUYTBL DROP CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT




INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',-1,3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',-1,-3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',1,-3)

INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',1000,3)

select max(qoouser_seq) from dbo.QOO10_USER_REAL with(nolock)


create table dbo.QOO10_USER_REAL
(  
	qoouser_seq bigint identity(1,1) not null,--ȸ�� ���� ��ȣ
	qoouser_id varchar(100) not null,--ȸ�� ���̵�
	qoouser_pw varchar(800) not null, -- ȸ�� ��й�ȣ encryption
	qoouser_birthday datetime,--ȸ�� �������
	qoouser_email varchar(200) null,--ȸ�� �̸��� 
	qoouser_gender char(1) null,--ȸ�� ���� 
	qoouser_nation char(2) null,-- ȸ�� ���� 
	qoouser_ipaddress varchar(200) null,-- ȸ�� �������ּ�
	qoouser_hascoin int not null,-- ȸ���� ������ ����
	qoouser_phone_num varchar(20) not null,-- ȸ���� ��ȭ��ȣ
	qoouser_grade int not null, -- ȸ���� ���
	qoouser_receive_email char(1) not null, -- ȸ���� �̸��� ���� ����
	qoouser_receive_sms char(1) not null, -- ȸ���� ���� ���� ����
	qoouser_denide char(1) not null, -- ���ܵ� ȸ������ ����
	qoouser_register_datetime datetime not null, -- ȸ�� �����
	qoouser_lastlogin_datetime datetime null, -- ȸ���� ���� �α��� �ð�
	qoouser_lastlogin_ipaddress varchar(200) null--ȸ���� ���� �α��� ������
)

ALTER TABLE dbo.QOO10_USER_REAL ADD CONSTRAINT PK__QOO10_USER_REAL__QOOUSER_SEQ PRIMARY KEY (qoouser_seq)



select top(100) * from dbo.QOO10_USER_REAL with(nolock)

--drop table dbo.ELECTRONIC_PRODUCTS

select * from dbo.ELECTRONIC_PRODUCTS with(nolock)

/* ELECTRONIC_PRODUCTS - ���� ��ǰ */
CREATE TABLE dbo.[ELECTRONIC_PRODUCTS] (
	[elect_prodserial] [BIGINT] identity(1,1) NOT NULL,  /* ���� ��ǰ ���� ��ȣ -elect_prodserial  */
	[elect_prod_name] [NVARCHAR](100) NOT NULL,  /* ���� ��ǰ �̸� - elect_prod_name */
	[elect_prod_price] [INT] NOT NULL,  /* ���� ��ǰ ���� - elect_prod_price */
	[product_manufacturer_comp_seq] [INT] NOT NULL,  /* ������ ������ȣ - product_manufacturer_comp_seq */
	[product_available_stock] [INT] NOT NULL,  /* ��� ���� - product_available_stock */
	[discount_percent] [SMALLINT] NOT NULL, /* �����ۼ�Ʈ - discount_percent */
	[first_cost] [INT] NOT NULL /*���� - first_cost*/
)

alter table dbo.ELECTRONIC_PRODUCTS add constraint PK__ELECTRONIC_PRODUCTS__ELECT_PRODSERIAL PRIMARY KEY (elect_prodserial)

INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s20',1300000,2,12000000,10,300000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s20+',1400000,2,9000000,10,350000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s20 ultra',1570000,2,11000000,15,400000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy note 20',1350000,2,5100000,5,320000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy note 20+',1450000,2,4800000,5,380000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s21',1500000,2,20000000,20,390000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s21+',1700000,2,20000000,20,430000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy s21 ultra',1800000,2,20000000,15,440000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy fold 1',1900000,2,5000000,10,520000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy fold 2',1900000,2,6000000,10,520000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy buds eco',115000,2,25000000,0,22000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy buds',150000,2,25000000,0,25000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy buds live',180000,2,25000000,10,30000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy buds pro',210000,2,30000000,15,32000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy tab s7 11',700000,2,5000000,10,150000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy tab s7 12.9',990000,2,4000000,10,200000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('galaxy tab s7+ 12.9',1050000,2,4000000,10,240000)

INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('iphone 12 mini',990000,1,12000000,0,150000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('iphone 12',1100000,1,12000000,0,250000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('iphone 12 pro',1300000,1,12000000,0,300000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('iphone 12 pro max',1550000,1,12000000,0,320000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('macbook air 13',1200000,1,8000000,0,250000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('macbook pro 13',1800000,1,8000000,0,300000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('macbook pro 16',2800000,1,5000000,0,560000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('ipad 9th',520000,1,15000000,0,180000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('ipad 9th mini',420000,1,15000000,0,150000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('ipad air 4th',720000,1,13000000,0,200000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('ipad pro 11',990000,1,13000000,0,210000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('ipad pro 12.9',1200000,1,10000000,0,320000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('apple watch 6th',620000,1,20000000,0,180000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('apple watch se',320000,1,30000000,0,90000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('apple watch 6th - hermes',1200000,1,1000000,0,200000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('mac pro - basic',7800000,1,200000,0,1200000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('mac pro - intermediate',12000000,1,100000,0,1800000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('mac pro - highend',34000000,1,20000,0,3200000)

INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('playstation 4',420000,3,12000000,10,150000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('playstation 4 pro',520000,3,12000000,10,200000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('playstation 5',800000,3,200000,0,420000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('playstation 5 pro',1100000,3,10000,0,550000)

INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('nintendo wii',210000,7,10000000,0,58000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('nintendo switch',420000,7,20000000,0,220000)

INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('xbox one',420000,5,8000000,10,120000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('xbox series s',420000,5,8000000,20,120000)
INSERT INTO dbo.ELECTRONIC_PRODUCTS VALUES ('xbox series x',890000,5,1000000,0,450000)


select * from dbo.ELECTRONIC_PRODUCTS with(nolock)


/* MANUFACTURER_INC - ������ */
CREATE TABLE dbo.[MANUFACTURER_INC] (
	[comp_seq] [BIGINT] NOT NULL,  /* ȸ�� ��ȣ - comp_seq */
	[comp_name] [NVARCHAR](30) NOT NULL,  /* ȸ�� �� - comp_name */
	[comp_nation_hq] [CHAR](2) NOT NULL,  /* ȸ�� ���� - comp_nation_hq */
	[staff_count] [INT] NOT NULL /* �����Ը� - staff_count */
)

ALTER TABLE dbo.MANUFACTURER_INC ADD CONSTRAINT PK__MANUFACTURER_INC__COMP_SEQ PRIMARY KEY (comp_seq)


INSERT INTO dbo.MANUFACTURER_INC VALUES (1,'APPLE','US',147000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (2,'SAMSUNG ELECT','KR',280000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (3,'SONY','JP',110000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (4,'LG ELECT','KR',40000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (5,'MICROSOFT','US',160000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (6,'OPPO','CN',40000)
INSERT INTO dbo.MANUFACTURER_INC VALUES (7,'NINTENDO','JP',6200)

select * from dbo.MANUFACTURER_INC with(nolock)


-- �������̺� ���� �����͸� ���� ���̴�.
/*
	Author      : Seunghwan Shin
	Create date : 2021-05-05 
	Description : �������̺� ���̵����� �ֱ�
	    
	History		: 2021-05-05 Seunghwan Shin	#���� ����

*/
create proc [dbo].[qoo10_buy_dummy]
	@buy_qoouser_seq int
,	@product_serial int
,	@product_quantity int
,	@buy_date datetime
,	@buy_confirm_date datetime
as
set nocount on
set transaction isolation level read uncommitted
begin
		
	insert into dbo.BUYTBL_INFO values (@buy_qoouser_seq,@product_serial,@product_quantity,@buy_date,@buy_confirm_date)


end


--drop table BUYTBL_INFO

/* BUYTBL_INFO - ���� ���̺� */
CREATE TABLE dbo.[BUYTBL_INFO] (
	[buy_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* ���� ������ȣ - buy_seq */
	[buy_qoouser_seq] [BIGINT] NOT NULL,  /* ������ ȸ�� ��ȣ - buy_qoouser_seq */
	[product_serial] [BIGINT] NOT NULL,  /* ��ǰ ���� ��ȣ - product_serial */
	[product_quantity] [INT] NOT NULL,  /* ���� ���� - product_quantity */
	[buy_date] [DATETIME] NOT NULL,  /* ���� ���� - buy_date */
	[buy_confirm_date] [DATETIME] /* ���� Ȯ�� ���� - buy_confirm_date */
)

ALTER TABLE dbo.BUYTBL_INFO ADD CONSTRAINT PK__BUYTBL_INFO__BUY_SEQ PRIMARY KEY (buy_seq)


select count(*) from dbo.BUYTBL_INFO with(nolock)

select top(100) * from dbo.BUYTBL_INFO with(nolock)


select * from dbo.QOO10_USER_REAL q with(nolock)
inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial




	
	select top(10)
		m.comp_name
	,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	from dbo.QOO10_USER_REAL q with(nolock)
	inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	where q.qoouser_nation = 'KR' and (b.buy_date between '2000-01-01' and '2000-03-01') 
	group by m.comp_name
	order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc


--drop proc dbo.qoo10_test_sp
/*
	Author      : Seunghwan Shin
	Create date : 2021-05-05 
	Description : �������̺� ���̵����� �ֱ�
	    
	History		: 2021-05-05 Seunghwan Shin	#���� ����

*/
create proc [dbo].[qoo10_test_sp]
	@start_dt datetime
,	@end_dt datetime
,	@nation_cd char(2)
as
set nocount on
set transaction isolation level read uncommitted
begin
		
	select top(10)
		m.comp_name
	,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	from dbo.QOO10_USER_REAL q with(nolock)
	inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	where q.qoouser_nation = @nation_cd and (b.buy_date between @start_dt and @end_dt) 
	group by m.comp_name
	order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc


end