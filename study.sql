

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = '2000001'




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
	qoouser_id varchar(100) not null,--회원 아이디
	qoouser_pw varchar(800) not null, -- 회원 비밀번호 encryption
	qoouser_birthday datetime,--회원 생년월일
	qoouser_email varchar(200) null,--회원 이메일 
	qoouser_gender char(1) null,--회원 성별 
	qoouser_nation char(2) null,-- 회원 국가 
	qoouser_ipaddress varchar(200) null,-- 회원 아이피주소
	qoouser_hascoin int not null,-- 회원이 소유한 코인
	qoouser_phone_num varchar(20) not null,-- 회원의 전화번호
	qoouser_grade int not null, -- 회원의 등급
	qoouser_receive_email char(1) not null, -- 회원의 이메일 수신 여부
	qoouser_receive_sms char(1) not null, -- 회원의 문자 수신 여부
	qoouser_denide char(1) not null, -- 차단된 회원인지 여부
	qoouser_register_datetime datetime not null, -- 회원 등록일
	qoouser_lastlogin_datetime datetime null, -- 회원이 최종 로그인 시간
	qoouser_lastlogin_ipaddress varchar(200) null--회원의 최종 로그인 아이피
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
,	COUNT(*) -- 컬럼을 변형
,	MAX(qoouser_hascoin) -- 컬럼을 변형
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

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT FK__BUYTBL__USERID FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)--이런식으로 참조키 지정

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
,	N'신나라'
,	1987
,	N'인천'
,	'010'
,	'12347899'
,	180
)


SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

--  WITH NOCHECK

ALTER TABLE dbo.BUYTBL WITH NOCHECK ADD CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT CHECK (price >= 0 and amount >= 0)
 
--ALTER TABLE dbo.BUYTBL DROP CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT




INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',-1,3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',-1,-3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',1,-3)

INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',1000,3)

select max(qoouser_seq) from dbo.QOO10_USER_REAL with(nolock)


--DROP TABLE dbo.QOO10_USER_REAL_TEST

create table dbo.QOO10_USER_REAL_TEST
(  
	qoouser_seq bigint identity(1,1) not null,--회원 고유 번호
	qoouser_id varchar(100) not null,--회원 아이디
	qoouser_pw varchar(800) not null, -- 회원 비밀번호 encryption
	qoouser_birthday datetime,--회원 생년월일
	qoouser_email varchar(200) null,--회원 이메일 
	qoouser_gender char(1) null,--회원 성별 
	qoouser_nation char(2) null,-- 회원 국가 
	qoouser_ipaddress varchar(200) null,-- 회원 아이피주소
	qoouser_hascoin int not null,-- 회원이 소유한 코인
	qoouser_phone_num varchar(20) not null,-- 회원의 전화번호
	qoouser_grade int not null, -- 회원의 등급
	qoouser_receive_email char(1) not null, -- 회원의 이메일 수신 여부
	qoouser_receive_sms char(1) not null, -- 회원의 문자 수신 여부
	qoouser_denide char(1) not null, -- 차단된 회원인지 여부
	qoouser_register_datetime datetime not null, -- 회원 등록일
	qoouser_lastlogin_datetime datetime null, -- 회원이 최종 로그인 시간
	qoouser_lastlogin_ipaddress varchar(200) null--회원의 최종 로그인 아이피
)

ALTER TABLE dbo.QOO10_USER_REAL ADD CONSTRAINT PK__QOO10_USER_REAL__QOOUSER_SEQ PRIMARY KEY (qoouser_seq)



select top(100) * from dbo.QOO10_USER_REAL with(nolock)

--drop table dbo.ELECTRONIC_PRODUCTS

select * from dbo.ELECTRONIC_PRODUCTS with(nolock)

/* ELECTRONIC_PRODUCTS - 전자 제품 */
CREATE TABLE dbo.[ELECTRONIC_PRODUCTS] (
	[elect_prodserial] [BIGINT] identity(1,1) NOT NULL,  /* 가전 제품 고유 번호 -elect_prodserial  */
	[elect_prod_name] [NVARCHAR](100) NOT NULL,  /* 가전 제품 이름 - elect_prod_name */
	[elect_prod_price] [INT] NOT NULL,  /* 가전 제품 가격 - elect_prod_price */
	[product_manufacturer_comp_seq] [INT] NOT NULL,  /* 제조사 고유번호 - product_manufacturer_comp_seq */
	[product_available_stock] [INT] NOT NULL,  /* 재고 수량 - product_available_stock */
	[discount_percent] [SMALLINT] NOT NULL, /* 할인퍼센트 - discount_percent */
	[first_cost] [INT] NOT NULL /*원가 - first_cost*/
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


/* MANUFACTURER_INC - 제조사 */
CREATE TABLE dbo.[MANUFACTURER_INC] (
	[comp_seq] [BIGINT] NOT NULL,  /* 회사 번호 - comp_seq */
	[comp_name] [NVARCHAR](30) NOT NULL,  /* 회사 명 - comp_name */
	[comp_nation_hq] [CHAR](2) NOT NULL,  /* 회사 본사 - comp_nation_hq */
	[staff_count] [INT] NOT NULL /* 직원규모 - staff_count */
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


-- 구매테이블에 더미 데이터를 넣을 것이다.
/*
	Author      : Seunghwan Shin
	Create date : 2021-05-05 
	Description : 구매테이블 더미데이터 넣기
	    
	History		: 2021-05-05 Seunghwan Shin	#최초 생성

*/
ALTER proc [dbo].[qoo10_buy_dummy]
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


select * from dbo.

--drop table BUYTBL_INFO

/* BUYTBL_INFO - 구매 테이블 */
CREATE TABLE dbo.[BUYTBL_INFO] (
	[buy_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 구매 고유번호 - buy_seq */
	[buy_qoouser_seq] [BIGINT] NOT NULL,  /* 구매한 회원 번호 - buy_qoouser_seq */
	[product_serial] [BIGINT] NOT NULL,  /* 제품 고유 번호 - product_serial */
	[product_quantity] [INT] NOT NULL,  /* 구매 수량 - product_quantity */
	[buy_date] [DATETIME] NOT NULL,  /* 구매 일자 - buy_date */
	[buy_confirm_date] [DATETIME] /* 구매 확정 일자 - buy_confirm_date */
)

ALTER TABLE dbo.BUYTBL_INFO ADD CONSTRAINT PK__BUYTBL_INFO__BUY_SEQ PRIMARY KEY (buy_seq)


--ALTER TABLE dbo.BUYTBL_INFO DROP PK__BUYTBL_INFO__BUY_SEQ



--DROP TABLE dbo.BUYTBL_INFO_TEST

/* BUYTBL_INFO - 구매 테이블 */
CREATE TABLE dbo.BUYTBL_INFO_TEST (
	[buy_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 구매 고유번호 - buy_seq */
	[buy_qoouser_seq] [BIGINT] NOT NULL,  /* 구매한 회원 번호 - buy_qoouser_seq */
	[product_serial] [BIGINT] NOT NULL,  /* 제품 고유 번호 - product_serial */
	[product_quantity] [INT] NOT NULL,  /* 구매 수량 - product_quantity */
	[buy_date] [DATETIME] NOT NULL,  /* 구매 일자 - buy_date */
	[buy_confirm_date] [DATETIME] /* 구매 확정 일자 - buy_confirm_date */
)

ALTER TABLE dbo.BUYTBL_INFO_TEST ADD CONSTRAINT PK__BUYTBL_INFO_TEST__BUY_SEQ PRIMARY KEY (buy_seq,buy_qoouser_seq)



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
	Description : 구매테이블 더미데이터 넣기
	    
	History		: 2021-05-05 Seunghwan Shin	#최초 생성

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


--DROP TABLE dbo.QOO10_USER_REAL_TEST

create table dbo.QOO10_USER_REAL_TEST
(  
	qoouser_seq bigint identity(1,1) not null,--회원 고유 번호
	qoouser_id varchar(100) not null,--회원 아이디
	qoouser_pw varchar(800) not null, -- 회원 비밀번호 encryption
	qoouser_birthday datetime,--회원 생년월일
	qoouser_email varchar(200) null,--회원 이메일 
	qoouser_gender char(1) null,--회원 성별 
	qoouser_nation char(2) null,-- 회원 국가 
	qoouser_ipaddress varchar(200) null,-- 회원 아이피주소
	qoouser_hascoin int not null,-- 회원이 소유한 코인
	qoouser_phone_num varchar(20) not null,-- 회원의 전화번호
	qoouser_grade int not null, -- 회원의 등급
	qoouser_receive_email char(1) not null, -- 회원의 이메일 수신 여부
	qoouser_receive_sms char(1) not null, -- 회원의 문자 수신 여부
	qoouser_denide char(1) not null, -- 차단된 회원인지 여부
	qoouser_register_datetime datetime not null, -- 회원 등록일
	qoouser_lastlogin_datetime datetime null, -- 회원이 최종 로그인 시간
	qoouser_lastlogin_ipaddress varchar(200) null--회원의 최종 로그인 아이피
)

ALTER TABLE dbo.QOO10_USER_REAL_TEST ADD CONSTRAINT PK__QOO10_USER_REAL_TEST__QOOUSER_SEQ PRIMARY KEY (qoouser_seq)


select count(*) from dbo.QOO10_USER_REAL_TEST with(nolock)


select count(*) from dbo.BUYTBL_INFO_TEST with(nolock)




SELECT 
	c.cust_no
,	c.cust_name
,	o.order_no
,	o.cust_no
,	o.product_no
FROM dbo.TB_CUST c WITH(NOLOCK)
LEFT OUTER JOIN dbo.TB_ORDER o WITH(NOLOCK) ON c.cust_no = o.cust_no and c.cust_no = 1


c.cust_name = 'MIKE'




SELECT 
	c.cust_no
,	c.cust_name
,	o.order_no
,	o.cust_no
,	o.product_no
FROM dbo.TB_CUST c WITH(NOLOCK)
LEFT OUTER JOIN dbo.TB_ORDER o WITH(NOLOCK) ON c.cust_no = o.cust_no 
WHERE c.cust_name = 'MIKE'









and o.order_no IS NULL



--WHERE o.order_no IS NULL


SELECT 
	c.cust_name 
,	COUNT(*) AS buy_count 
FROM dbo.TB_CUST c 
LEFT JOIN TB_ORDER o ON c.cust_no = o.cust_no  
GROUP BY c.cust_name



SELECT
	s1.order_year AS last_year
,	ISNULL(s2.order_year,2021) AS present_year
,	FORMAT(s1.total_sum,'#,#') AS S1_SUM
,	FORMAT(ISNULL(s2.total_sum,0),'#,#') AS S2_SUM
,	FORMAT(ISNULL(s2.total_sum - s1.total_sum,0),'#,#') AS profit
,	CONVERT(VARCHAR,CONVERT(NUMERIC(20,3),((CONVERT(NUMERIC,s2.total_sum) - s1.total_sum) / s1.total_sum) * 100)) + ' %'
FROM
	(SELECT 
		YEAR(a.buydate) AS order_year
	,	COUNT(a.userseq) AS user_count
	,	SUM(CONVERT(BIGINT,ac.price * a.quantity)) AS total_sum
	FROM dbo.QOO10USER q WITH(NOLOCK)
	INNER JOIN dbo.APPLEBUYTBL a WITH(NOLOCK) ON q.idseq = a.userseq
	INNER JOIN dbo.APPLEINC ac WITH(NOLOCK) on ac.prodserial = a.prodserial
	GROUP BY YEAR(a.buydate)) AS s1
LEFT JOIN
	(SELECT 
		YEAR(a.buydate) AS order_year
	,	COUNT(a.userseq) AS user_count
	,	SUM(CONVERT(BIGINT,ac.price * a.quantity)) AS total_sum
	FROM dbo.QOO10USER q WITH(NOLOCK)
	INNER JOIN dbo.APPLEBUYTBL a WITH(NOLOCK) ON q.idseq = a.userseq
	INNER JOIN dbo.APPLEINC ac WITH(NOLOCK) on ac.prodserial = a.prodserial
	GROUP BY YEAR(a.buydate)) AS s2 
ON s1.order_year = s2.order_year-1
ORDER BY s1.order_year



SELECT COUNT(*) FROM dbo.QOO10_USER_REAL WITH(NOLOCK) -- 200만건의 회원이 존재

SELECT COUNT(*) FROM dbo.BUYTBL_INFO WITH(NOLOCK)

SELECT * FROM dbo.MANUFACTURER_INC WITH(NOLOCK)

SELECT * FROM dbo.ELECTRONIC_PRODUCTS WITH(NOLOCK)



SELECT top(100) * FROM dbo.BUYTBL_INFO WITH(NOLOCK)




SELECT
	t1.buy_year AS last_year
,	t2.buy_year AS present_year
,	FORMAT(t1.total_sum,'#,#') AS S1_SUM
,	FORMAT(ISNULL(t2.total_sum,0),'#,#') AS S2_SUM
,	FORMAT(ISNULL(t2.total_sum - t1.total_sum,0),'#,#') AS profit
,	CONVERT(VARCHAR,CONVERT(NUMERIC(20,3),((CONVERT(NUMERIC,t2.total_sum) - t1.total_sum) / t1.total_sum) * 100)) + ' %'
,	FORMAT(t1.total_sum - t1.cost,'#,#')
,	FORMAT(t2.total_sum - t2.cost,'#,#')
FROM
(SELECT 
	YEAR(b.buy_date) AS buy_year
,	COUNT(q.qoouser_seq) AS user_count
,	SUM(CONVERT(BIGINT,e.elect_prod_price * b.product_quantity)) AS total_sum
,	SUM(CONVERT(BIGINT,e.first_cost * b.product_quantity)) AS cost
FROM dbo.MANUFACTURER_INC m WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON m.comp_seq = e.product_manufacturer_comp_seq
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON b.product_serial = e.elect_prodserial
INNER JOIN dbo.QOO10_USER_REAL q WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
WHERE m.comp_seq = 5
GROUP BY YEAR(b.buy_date)) AS t1
LEFT JOIN
(SELECT 
	YEAR(b.buy_date) AS buy_year
,	COUNT(q.qoouser_seq) AS user_count
,	SUM(CONVERT(BIGINT,e.elect_prod_price * b.product_quantity)) AS total_sum
,	SUM(CONVERT(BIGINT,e.first_cost * b.product_quantity)) AS cost
FROM dbo.MANUFACTURER_INC m WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON m.comp_seq = e.product_manufacturer_comp_seq
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON b.product_serial = e.elect_prodserial
INNER JOIN dbo.QOO10_USER_REAL q WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
WHERE m.comp_seq = 5
GROUP BY YEAR(b.buy_date)) AS t2
ON t1.buy_year = t2.buy_year - 1
ORDER BY t1.buy_year





SELECT * FROM dbo.TBLINSA WITH(NOLOCK)


SELECT TOP(100) * FROM dbo.QOO10_USER_REAL WITH(NOLOCK)

CREATE FUNCTION dbo.getQooTest
(@gender AS CHAR(1), @nation AS CHAR(2)) RETURNS TABLE
AS
RETURN
SELECT TOP(100)
	qoouser_seq
,	qoouser_id
,	qoouser_gender
,	qoouser_nation
,	qoouser_hascoin
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)
WHERE qoouser_gender = @gender
AND   qoouser_nation = @nation
ORDER BY qoouser_seq


SELECT TOP(100)
	qoouser_seq
,	qoouser_id
,	qoouser_gender
,	qoouser_nation
,	qoouser_hascoin
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)
WHERE qoouser_gender = 'F'
AND   qoouser_nation = 'SG'
ORDER BY qoouser_seq


SELECT TOP(20) 
	g.qoouser_seq
,	g.qoouser_id
,	g.qoouser_gender
,	g.qoouser_nation
,	g.qoouser_hascoin
,	e.elect_prod_name
,	b.buy_date
,	FORMAT(e.elect_prod_price,'#,#') AS prod_price
,	b.product_quantity AS pq
,	FORMAT(e.elect_prod_price * b.product_quantity,'#,#') AS total_payment
FROM dbo.getQooTest('F','SG') g
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON g.qoouser_seq = b.buy_qoouser_seq
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
ORDER BY e.elect_prod_price * b.product_quantity DESC, g.qoouser_seq 






SELECT TOP(20) 
	g.qoouser_seq
,	FORMAT(e.elect_prod_price,'#,#') AS prod_price
,	FORMAT(e.elect_prod_price * b.product_quantity,'#,#') AS total_payment
FROM dbo.getQooTest('F','SG') g
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON g.qoouser_seq = b.buy_qoouser_seq
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
GROUP BY g.qoouser_seq
ORDER BY e.elect_prod_price * b.product_quantity DESC, g.qoouser_seq 







CREATE FUNCTION dbo.getTblinsaSeoulGender
(@gender AS CHAR(1)) RETURNS TABLE
AS
RETURN
SELECT
	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicPay
,	sudang
FROM dbo.TBLINSA WITH(NOLOCK)
WHERE city = N'서울'
AND	  ssn LIKE '%-'+  CONVERT(CHAR(1),(CASE WHEN @gender = 'M' THEN 1 
											WHEN @gender = 'F' THEN 2
											ELSE 3 END)) + '%' 


SELECT * FROM dbo.getTblinsaSeoulGender('F')

SELECT * FROM dbo.getTblinsaSeoulGender('M')



select CHARINDEX('a','cry and city',1)


DECLARE @gender CHAR(1) = 'M'

SELECT
	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicPay
,	sudang
FROM dbo.TBLINSA WITH(NOLOCK)
WHERE city = N'서울'
AND	  ssn LIKE '%-'+  CONVERT(CHAR(1),(CASE WHEN @gender = 'M' THEN 1 ELSE 2 END)) + '%' 



DECLARE 

SELECT *
FROM dbo.TBLINSA t WITH(NOLOCK)
CROSS APPLY
(
	SELECT
		o.order_product_name
	,	o.order_date
	FROM dbo.TBLINSAORDER o WITH(NOLOCK)
	WHERE o.insa_seq = t.num AND o.order_date BETWEEN '2021-05-01' AND '2021-05-03'
	--ORDER BY o.order_date DESC, t.num DESC
) AS result



SELECT * FROM dbo.TBLINSA t WITH(NOLOCK)
INNER JOIN dbo.TBLINSAORDER o WITH(NOLOCK) ON  o.insa_seq = t.num
WHERE o.order_date BETWEEN '2021-05-01' AND '2021-05-03'
ORDER BY o.order_date DESC, t.num DESC



SELECT *
FROM dbo.TBLINSA t WITH(NOLOCK)
OUTER APPLY
(
	SELECT
		o.order_product_name
	,	o.order_date
	FROM dbo.TBLINSAORDER o WITH(NOLOCK)
	WHERE o.insa_seq = t.num AND o.order_date BETWEEN '2021-05-01' AND '2021-05-03'
	ORDER BY o.order_date DESC
	OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY
) AS result



CREATE FUNCTION dbo.TopOrders
(@user_seq AS INT,@start_date AS DATETIME,@end_date AS DATETIME, @n AS INT) RETURNS TABLE
AS
RETURN
SELECT
	order_product_name
,	order_date
FROM dbo.TBLINSAORDER WITH(NOLOCK)
WHERE insa_seq = @user_seq AND order_date BETWEEN @start_date AND @end_date
ORDER BY order_date DESC
OFFSET 0 ROWS FETCH FIRST @n ROWS ONLY; 




SELECT * FROM dbo.TopOrders(1005,'2021-05-01','2021-05-03',3)



SELECT * FROM dbo.TBLINSAORDER WITH(NOLOCK)


--왜 안되는거지;
SELECT *
FROM dbo.TBLINSA t WITH(NOLOCK)
CROSS APPLY dbo.TopOrders(t.num,'2021-05-01','2021-05-03',2)








SELECT *
FROM dbo.TBLINSA t WITH(NOLOCK)
OUTER APPLY
(
	SELECT
		o.order_product_name
	,	o.order_date
	FROM dbo.TBLINSAORDER o WITH(NOLOCK)
	WHERE o.insa_seq = t.num AND o.order_date BETWEEN '2021-05-01' AND '2021-05-03'
	--ORDER BY o.order_date DESC
) AS result









SELECT * FROM dbo.TBLINSA t WITH(NOLOCK)
INNER JOIN dbo.TBLINSAORDER o WITH(NOLOCK) ON  o.insa_seq = t.num
WHERE o.order_date BETWEEN '2021-05-01' AND '2021-05-03'





--CROSS JOIN
SELECT * FROM dbo.TBLINSA t WITH(NOLOCK) 
CROSS JOIN dbo.TBLINSAORDER o WITH(NOLOCK)

--CROSS APPLY
SELECT * FROM dbo.TBLINSA t WITH(NOLOCK) 
CROSS APPLY dbo.TBLINSAORDER o WITH(NOLOCK)






SELECT * FROM dbo.TBLINSA WITH(NOLOCK)

SELECT
	num
,	name
,	city
,	basicPay
,	ROW_NUMBER() OVER(ORDER BY basicPay DESC) AS rownum
,	RANK() OVER(ORDER BY basicPay DESC) AS rank
,	DENSE_RANK() OVER(ORDER BY basicPay DESC) AS dense_rank
,	NTILE(10) OVER(ORDER BY basicPay DESC) AS ntile
FROM dbo.TBLINSA WITH(NOLOCK)


SELECT DISTINCT 
	basicPay
,	ROW_NUMBER() OVER(ORDER BY basicPay) AS rn
FROM dbo.TBLINSA WITH(NOLOCK)
GROUP BY basicPay

SELECT DISTINCT 
	basicPay
FROM dbo.TBLINSA WITH(NOLOCK)


SELECT
	num
,	name
,	city
,	basicPay
,	LAG(basicPay,3,-100) OVER(PARTITION BY city ORDER BY basicPay) AS lag
,	LEAD(basicPay,3,-100) OVER(PARTITION BY city ORDER BY basicPay) AS lead
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY city, basicPay



SELECT
	num
,	name
,	city
,	basicPay
,	LAG(basicPay) OVER(ORDER BY basicPay) AS lag
,	LEAD(basicPay) OVER(ORDER BY basicPay) AS lead
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY city, basicPay





SELECT
	num
,	name
,	city
,	basicPay
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY city,basicPay







--GROUP BY city 


SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
,	FIRST_VALUE(basicPay + sudang) OVER (PARTITION BY buseo ORDER BY num ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS first_value
,	LAST_VALUE(basicPay + sudang) OVER (PARTITION BY buseo ORDER BY num ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, num


SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
,	SUM(basicPay + sudang) OVER (PARTITION BY buseo ORDER BY basicPay + sudang ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS accumulate
,	MIN(basicPay + sudang) OVER (PARTITION BY buseo ORDER BY basicPay + sudang ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS min_value_per_buseo
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, salary






SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary
,	
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, salary








SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, num


SELECT
	t1.name
,	t1.buseo
,	t2.salary
,	t2.avg_salary
,	t2.salary - t2.avg_salary AS my_sal_diff
FROM dbo.TBLINSA t1 WITH(NOLOCK)
INNER JOIN 
(SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
,	AVG(basicPay + sudang) OVER (PARTITION BY buseo) AS avg_salary
FROM dbo.TBLINSA WITH(NOLOCK)) t2 ON t1.num = t2.num
ORDER BY t1.buseo, t2.salary






SELECT
	num
,	name
,	buseo
,	basicPay + sudang AS salary
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY buseo,salary






SELECT 
	qoouser_seq
,	qoouser_id
,	e.elect_prod_name
,	e.elect_prod_price
,	b.product_quantity
,	b.buy_date
,	AVG(CONVERT(BIGINT,e.elect_prod_price) * b.product_quantity) OVER(PARTITION BY q.qoouser_nation ORDER BY e.elect_prod_price * b.product_quantity) AS avg_buy
FROM dbo.QOO10_USER_REAL q WITH(NOLOCK)
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
INNER JOIN dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON b.product_serial = e.elect_prodserial
WHERE buy_date BETWEEN '2020-10-10' AND '2021-10-11'


SELECT number FROM RANGE(1,10);




SELECT * FROM dbo.BUYTBL_INFO WITH(NOLOCK)




CREATE TABLE dbo.SH_TEST_ORDERS
(
	orderid INT NOT NULL,
	orderdate DATE NOT NULL,
	empid INT NOT NULL,
	custid VARCHAR(5) NOT NULL,
	qty INT NOT NULL,
);
ALTER TABLE dbo.SH_TEST_ORDERS ADD CONSTRAINT PK__SH_TEST_ORDERS__ORDERID PRIMARY KEY(orderid)

INSERT INTO dbo.SH_TEST_ORDERS(orderid,orderdate,empid,custid,qty)
VALUES 
(30001,'20070802',3,'A',10),
(10001,'20071224',2,'A',12),
(10005,'20071224',1,'B',20),
(40001,'20080109',2,'A',40),
(10006,'20080118',1,'C',14),
(20001,'20080212',2,'B',12),
(40005,'20090212',3,'A',10),
(20002,'20090216',1,'C',20),
(30003,'20090418',2,'B',15),
(30004,'20070418',3,'C',22),
(30007,'20090907',3,'D',30)

SELECT * FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)


SELECT
	empid
,	SUM(CASE WHEN custid = 'A' THEN qty END) AS A
,	SUM(CASE WHEN custid = 'B' THEN qty END) AS B
,	SUM(CASE WHEN custid = 'C' THEN qty END) AS C
,	SUM(CASE WHEN custid = 'D' THEN qty END) AS D
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)
GROUP BY empid


SELECT 
	empid,	A,	B,	C,	D
FROM (SELECT	empid,	custid,	qty
		FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)) AS D
PIVOT(SUM(qty) FOR custid IN(A,B,C,D)) AS P



SELECT
	empid,	A,	B,	C,	D
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)
PIVOT(SUM(qty) FOR custid IN(A,B,C,D)) AS P



advertise_show
 from dbo.ADVERTISE_INFO with(nolock)  


SELECT
	empid
,	custid
,	SUM(qty) AS sumqty
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)
GROUP BY empid,custid














	


SELECT
	empid
,	SUM(CASE WHEN custid = 'A' THEN qty END) AS A
,	SUM(CASE WHEN custid = 'B' THEN qty END) AS B
,	SUM(CASE WHEN custid = 'C' THEN qty END) AS C
,	SUM(CASE WHEN custid = 'D' THEN qty END) AS D
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)
GROUP BY empid








SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
,	COUNT(*) OVER (ORDER BY basicPay + sudang ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS cnt
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, salary


SELECT 
	num 
,	name 
,	buseo 
,	basicPay + sudang AS salary 
,	COUNT(*) OVER (ORDER BY basicPay + sudang RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cnt
FROM dbo.TBLINSA WITH(NOLOCK) 
ORDER BY buseo, salary



SELECT 
	d.dept
,	d.id
,	d.salary
,	SUM(d.salary) OVER (PARTITION BY d.dept ORDER BY d.id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) col
FROM (
          SELECT 20 dept, 100 id, 20000 salary UNION ALL
          SELECT 20 dept, 101 id, 30000 salary UNION ALL
          SELECT 20 dept, 101 id, 10000 salary UNION ALL
          SELECT 20 dept, 102 id,  9000 salary UNION ALL
          SELECT 20 dept, 103 id, 17000 salary
       ) d

SELECT 
	d.dept
,	d.id
,	d.salary
,	SUM(d.salary) OVER (PARTITION BY d.dept ORDER BY d.id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) col
FROM (
          SELECT 20 dept, 100 id, 20000 salary UNION ALL
          SELECT 20 dept, 101 id, 30000 salary UNION ALL
          SELECT 20 dept, 101 id, 10000 salary UNION ALL
          SELECT 20 dept, 102 id,  9000 salary UNION ALL
          SELECT 20 dept, 103 id, 17000 salary
       ) d


CREATE TABLE dbo.SH_TEST_ORDERS_PIVOT 
( 
	empid INT NOT NULL, 
	A VARCHAR(5) NULL, 
	B VARCHAR(5) NULL, 
	C VARCHAR(5) NULL, 
	D VARCHAR(5) NULL 
) 
ALTER TABLE dbo.SH_TEST_ORDERS_PIVOT ADD CONSTRAINT PK__SH_TEST_ORDERS_PIVOT__EMPID PRIMARY KEY(empid)  


--피벗팅한 값을 새로운 테이블에 INSERT 해준다.
INSERT INTO dbo.SH_TEST_ORDERS_PIVOT (empid,A,B,C,D) 
SELECT empid,A,B,C,D 
FROM (SELECT empid,custid,qty FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)) AS D 
PIVOT (SUM(qty) FOR custid IN(A,B,C,D)) AS P 

SELECT * FROM dbo.SH_TEST_ORDERS_PIVOT WITH(NOLOCK)


SELECT * FROM (VALUES ('A'),('B'),('C'),('D')) AS custs(custid)



SELECT *
FROM dbo.SH_TEST_ORDERS_PIVOT
CROSS JOIN (VALUES ('A'),('B'),('C'),('D')) AS custs(custid)


SELECT *
FROM (VALUES ('A',13),('B',20),('C',30),('D',54)) AS O(id,pw)

SELECT *
FROM dbo.SH_TEST_ORDERS_PIVOT
CROSS JOIN (VALUES ('A'),('B'),('C'),('D')) AS custs(custid)



SELECT *
FROM
(SELECT
		empid
	,	custid
	,	CASE custid 
			WHEN 'A' THEN A 
			WHEN 'B' THEN B
			WHEN 'C' THEN C
			WHEN 'D' THEN D
		END AS qty
	FROM dbo.SH_TEST_ORDERS_PIVOT
	CROSS JOIN (VALUES ('A'),('B'),('C'),('D')) AS custs(custid)) AS D
WHERE D.qty IS NOT NULL


SELECT * FROM dbo.SH_TEST_ORDERS_PIVOT WITH(NOLOCK)


SELECT
	empid
,	custid
,	qty
FROM dbo.SH_TEST_ORDERS_PIVOT
UNPIVOT(qty FOR custid IN (A,B,C,D)) AS A



SELECT
	empid,	A,	B,	C,	D
FROM
(
	SELECT
		empid
	,	custid
	,	CONVERT(INT,qty) AS qty -- 형변환필요
	FROM dbo.SH_TEST_ORDERS_PIVOT
	UNPIVOT(qty FOR custid IN (A,B,C,D)) AS U
) AS D
PIVOT(SUM(qty) FOR custid IN (A,B,C,D)) AS P





SELECT * FROM dbo.SH_TEST_ORDERS_PIVOT WITH(NOLOCK)



SELECT
	name
,	buseo
,	SUM(basicPay) AS sum_pay
FROM dbo.TBLINSA WITH(NOLOCK)
GROUP BY name,buseo

UNION ALL

SELECT
	NULL
,	buseo
,	SUM(basicPay) AS sum_pay
FROM dbo.TBLINSA WITH(NOLOCK)
GROUP BY buseo

UNION ALL

SELECT
	name
,	NULL
,	SUM(basicPay) AS sum_pay
FROM dbo.TBLINSA WITH(NOLOCK)
GROUP BY name

UNION ALL

SELECT
	NULL
,	NULL
,	SUM(basicPay) AS sum_pay
FROM dbo.TBLINSA WITH(NOLOCK)




SELECT 
	empid 
,	custid 
,	qty 
FROM dbo.SH_TEST_ORDERS_PIVOT 
UNPIVOT(qty FOR custid IN (A,B,C,D)) AS U


SELECT * FROM dbo.SH_TEST_ORDERS WITH(NOLOCK)



SELECT 
	empid 
,	custid 
,	SUM(qty) AS sum_qty 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY CUBE(empid,custid)



SELECT 
	empid 
,	custid 
,	SUM(qty) AS sum_qty 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY empid,custid

UNION ALL

SELECT 
	empid 
,	NULL 
,	SUM(qty) AS sum_qty 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY empid

UNION ALL

SELECT 
	NULL
,	custid 
,	SUM(qty) AS sum_qty 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY custid


SELECT  
	YEAR(orderdate) AS order_year 
,	MONTH(orderdate) AS order_month 
,	DAY(orderdate) AS order_day 
,	SUM(qty) AS qty_sum 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY ROLLUP (YEAR(orderdate),MONTH(orderdate),DAY(orderdate))


SELECT  
	YEAR(orderdate) AS order_year 
,	MONTH(orderdate) AS order_month 
,	DAY(orderdate) AS order_day 
,	SUM(qty) AS qty_sum 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY ROLLUP (YEAR(orderdate),MONTH(orderdate),DAY(orderdate))



SELECT  
	YEAR(orderdate) AS order_year 
,	MONTH(orderdate) AS order_month 
,	DAY(orderdate) AS order_day 
,	SUM(qty) AS qty_sum 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY ROLLUP (YEAR(orderdate),MONTH(orderdate),DAY(orderdate))
HAVING GROUPING_ID(YEAR(orderdate),MONTH(orderdate),DAY(orderdate)) = 1


SELECT  
	YEAR(orderdate) AS order_year 
,	MONTH(orderdate) AS order_month 
,	DAY(orderdate) AS order_day 
,	SUM(qty) AS qty_sum 
FROM dbo.SH_TEST_ORDERS WITH(NOLOCK) 
GROUP BY ROLLUP (YEAR(orderdate),MONTH(orderdate),DAY(orderdate))
HAVING GROUPING_ID(YEAR(orderdate),MONTH(orderdate),DAY(orderdate)) = 1
OR GROUPING_ID(YEAR(orderdate),MONTH(orderdate),DAY(orderdate)) = 3
OR GROUPING_ID(YEAR(orderdate),MONTH(orderdate),DAY(orderdate)) = 8




select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'


DBCC USEROPTIONS

DBCC USEROPTIONS
SELECT * FROM dbo.TBLINSA WITH(NOLOCK)


BEGIN TRAN
UPDATE dbo.TBLINSA SET name = N'김길동' WHERE num = 1001

COMMIT TRAN

SELECT @@TRANCOUNT
SELECT @@SERVICENAME
select DB_NAME()

select @@SERVERNAME

alter database MSSQLSERVER set allow_snapshot_isolation on;
select DB_NAME()


ALTER DATABASE ADMIN SET ALLOW_SNAPSHOT_ISOLATION ON;
ALTER DATABASE ADMIN SET READ_COMMITTED_SNAPSHOT OFF;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT

SELECT * FROM dbo.TBLINSA


BEGIN TRAN
UPDATE dbo.TBLINSA SET name = N'이순자' WHERE num = 1002



BEGIN TRAN
SELECT * FROM dbo.TBLINSA WHERE num = 1002



SET TRANSACTION ISOLATION LEVEL SERIALIZABLE


UPDATE dbo.TBLINSA SET name = N'갓순자' WHERE num = 1002


SELECT @@TRANCOUNT

COMMIT TRAN


ROLLBACK TRAN


SET TRANSACTION ISOLATION LEVEL SNAPSHOT


BEGIN TRAN 
SELECT * FROM dbo.TBLINSA WHERE num = 1002

UPDATE dbo.TBLINSA SET name = N'갓순자' WHERE num = 1002

ROLLBACK TRAN

BEGIN TRAN

SELECT
	* 
FROM dbo.QOO10_USER_REAL WITH(NOLOCK) 
WHERE qoouser_seq = 1

SELECT @@TRANCOUNT


UPDATE dbo.MANUFACTURER_INC SET staff_count = 150000 WHERE comp_seq = 1


ROLLBACK TRAN


EXEC sp_lock 




SELECT * FROM dbo.MANUFACTURER_INC WITH(NOLOCK) WHERE comp_seq = 1


BEGIN TRAN
UPDATE dbo.MANUFACTURER_INC SET staff_count = 150000 WHERE comp_seq = 1

SELECT * FROM dbo.QOO10_USER_REAL WHERE qoouser_seq = 6









COMMIT TRAN

drop index IDX__TBLINSA__NAME on dbo.tblinsa



SELECT * FROM dbo.TBLINSA WITH(NOLOCK)


CREATE INDEX IDX__TBLINSA__NAME ON dbo.TBLINSA (name)

BEGIN TRAN
UPDATE dbo.TBLINSA SET basicPay = 0 WHERE name = N'박문수'



SELECT * FROM dbo.TBLINSA WHERE name = N'김종서'









SELECT * FROM dbo.TBLINSA WITH(NOLOCK)


SP_HELP TBLINSA

ALTER TABLE dbo.TBLINSA ADD CONSTRAINT PK__TBLINSA__NUM PRIMARY KEY (num)

ALTER TABLE dbo.TBLINSA DROP CONSTRAINT PK__TBLINSA__NUM




BEGIN TRAN
UPDATE dbo.TBLINSA SET basicPay = 0 WHERE num = 1020

SELECT * FROM dbo.TBLINSA WHERE num = 1008


ROLLBACK TRAN


ALTER DATABASE ADMIN SET READ_COMMITTED_SNAPSHOT ON









ROLLBACK TRAN


BEGIN TRAN
UPDATE dbo.TBLINSA SET basicPay = 0 WHERE num = 1001


SELECT * FROM dbo.MANUFACTURER_INC WHERE comp_seq = 1



--CREATE INDEX IDX__TBLINSA__NAME ON dbo.TBLINSA (name)




ALTER TABLE dbo.TBLINSA ADD CONSTRAINT PK__TBLINSA__NUM PRIMARY KEY (num)
ALTER TABLE dbo.TBLINSA DROP CONSTRAINT PK__TBLINSA__NUM



--SELECT * FROM dbo.TBLINSA WHERE name = N'김미나'


ALTER DATABASE ADMIN SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT




BEGIN TRAN

SELECT * FROM dbO.TBLINSA  WHERE num = 1002

COMMIT TRAN


SELECT @@TRANCOUNT


ROLLBACK TRAN

BEGIN TRAN UPDATE dbo.TBLINSA SET name = N'이순신' WHERE num = 1002


SET TRANSACTION ISOLATION LEVEL READ COMMITTED



SELECT * FROM dbO.TBLINSA  WHERE num = 1002


ROLLBACK TRAN