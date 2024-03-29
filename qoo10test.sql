WITH YEARCOUNT AS
(
SELECT 
	YEAR(b.buy_date) AS per_year
,	SUM(product_quantity) AS sell_count
,	SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total
FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
GROUP BY YEAR(b.buy_date)
)
SELECT
	cur.per_year AS standard_year
,	cur.sell_count AS standard_sell_count
,	FORMAT(cur.total,'#,#') AS standard_total
,	prev.per_year AS comparison_year
,	prev.sell_count AS comparison_sell_count
,	FORMAT(prev.total,'#,#') AS comparison_total
,	FORMAT(cur.total - prev.total,'#,#') AS benefit
,	CONVERT(VARCHAR(10),CONVERT(NUMERIC(10,3),((cur.total - prev.total) / CONVERT(NUMERIC,cur.total)) * 100.0)) + ' %' AS benefit_percent
FROM YEARCOUNT AS cur
LEFT OUTER JOIN YEARCOUNT AS prev ON cur.per_year = prev.per_year + 1
ORDER BY standard_year DESC

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = 20001 




create table dbo.APPLEBUYTBL 
( 
	buyseq int identity(1,1) not null,  -- 구매코드
	userseq int not null,  -- 회원고유코드
	prodserial int not null,  -- 제품 고유 코드
	quantity int not null,  -- 수량
	buydate date not null  -- 구매 일자
)

ALTER TABLE dbo.APPLEBUYTBL ADD CONSTRAINT PK__APPLEBUYTBL__BUYSEQ PRIMARY KEY CLUSTERED (buyseq)


SELECT * FROM sys.tables WITH(NOLOCK)

SELECT * FROM sys.schemas WITH(NOLOCK)

SELECT * FROM sys.columns WITH(NOLOCK)



select * from dbo.APPLEINC with(nolock)

select count(*) from dbo.QOO10_USER_REAL with(nolock)



CREATE TABLE dbo.ELECTRONIC_PRODUCTS
(
	elect_prodserial bigint identity(1,1) not null,--가전 제품 고유번호
	elect_prod_name nvarchar(100) not null,--가전 제품 이름
	elect_prod_price int not null,--가전 제품 가격
	product_manufacturer_comp_seq int not null,--제조사 고유번호
	product_available_stock int not null,--재고 수량

)

select * from dbo.ELECTRONIC_PRODUCTS with(nolock)



SELECT
	cur.per_year AS standard_year
,	cur.sell_count AS standard_sell_count
,	FORMAT(cur.total,'#,#') AS standard_total
,	prev.per_year AS comparison_year
,	prev.sell_count AS comparison_sell_count
,	FORMAT(prev.total,'#,#') AS comparison_total
,	FORMAT(cur.total - prev.total,'#,#') AS benefit
,	CONVERT(VARCHAR(10),CONVERT(NUMERIC(10,3),((cur.total - prev.total) / CONVERT(NUMERIC,cur.total)) * 100.0)) + ' %' AS benefit_percent
FROM 
(SELECT 
	YEAR(b.buy_date) AS per_year
,	SUM(product_quantity) AS sell_count
,	SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total
FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
GROUP BY YEAR(b.buy_date)) AS cur

LEFT OUTER JOIN

(SELECT 
	YEAR(b.buy_date) AS per_year
,	SUM(product_quantity) AS sell_count
,	SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total
FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
GROUP BY YEAR(b.buy_date)) AS prev

ON cur.per_year = prev.per_year + 1
ORDER BY standard_year DESC






WITH YEARCOUNT AS
(
SELECT 
	YEAR(b.buy_date) AS per_year
,	SUM(product_quantity) AS sell_count
,	SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total
FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
GROUP BY YEAR(b.buy_date)) AS cur
)
SELECT
	cur.per_year AS standard_year
,	cur.sell_count AS standard_sell_count
,	FORMAT(cur.total,'#,#') AS standard_total
,	prev.per_year AS comparison_year
,	prev.sell_count AS comparison_sell_count
,	FORMAT(prev.total,'#,#') AS comparison_total
,	FORMAT(cur.total - prev.total,'#,#') AS benefit
,	CONVERT(VARCHAR(10),CONVERT(NUMERIC(10,3),((cur.total - prev.total) / CONVERT(NUMERIC,cur.total)) * 100.0)) + ' %' AS benefit_percent
FROM YEARCOUNT AS cur
LEFT OUTER JOIN YEARCOUNT AS prev ON cur.per_year = prev.per_year + 1
ORDER BY standard_year DESC





select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'





select
SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total
FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e ON e.elect_prodserial = b.product_serial
WHERE YEAR(b.buy_date) = 2000




















update dbo.QOO10_USER_REAL set qoouser_lastlogin_ipaddress = '111.111' where qoouser_id = 'admin'





select * from dbo.APPLEBUYTBL with(nolock)


select * from APPLEINC with(nolock)

select count(*) from dbo.QOO10USER with(nolock)

select * from dbo.QOO10USER with(nolock)

select id,count(*) from dbo.QOO10USER with(nolock)
group by id
having count(*) > 1

drop table dbo.QOO10USER




--drop proc dbo.qoo10_dummy_init

/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 더미데이터 생성 : 회원관련
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성
				  2021-04-14 Seunghwan Shin	#qoouser_birthday 추가

*/
create proc [dbo].[qoo10_dummy_init]
	@id varchar(100),
	@pw varchar(100),
	@email varchar(200),
	@gender char(1),
	@nation char(2),
	@ipaddress varchar(200),
	@coin int
as
set nocount on
set transaction isolation level read uncommitted
begin

	insert into dbo.QOO10USER values (@id,@pw,@email,@gender,@nation,@ipaddress,@coin)

	if @@error <> 0
	begin
		return 0;
	end

end

drop table dbo.QOO10USERENC

drop table dbo.QOO10_USER_REAL

select top(1000) * from dbo.QOO10_USER_REAL with(nolock)


select qoouser_email from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'nyigd609658'

-- QOO10 의 회원 테이블(더미데이터로 만든것) : 암호화작업 확인
create table dbo.QOO10_USER_REAL 
( 
	qoouser_code int identity(1,1) not null,--회원고유코드 
	qoouser_id varchar(100) not null,--회원 아이디
	qoouser_pw varchar(800) not null, -- 회원 비밀번호 encryption
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

ALTER TABLE dbo.QOO10_USER_REAL ADD CONSTRAINT PK__QOO10_USER_REAL__QOOUSER_CODE PRIMARY KEY CLUSTERED (qoouser_code)

drop table dbo.QOO10USERENC 

select * from dbo.QOO10USERENC  with(nolock)




-- QOO10 의 회원 테이블(더미데이터로 만든것)
create table dbo.QOO10USER 
( 
	usercode int identity(1,1) not null,--회원고유코드 
	id varchar(100) not null,--회원 아이디
	pw varchar(100) not null,--회원 비밀번호
	email varchar(200) null,--회원 이메일 
	gender char(1) null,--회원 성별 
	nation char(2) null,-- 회원 국가 
	ipaddress varchar(200) null,-- 회원 아이피주소
	hascoin int -- 회원이 소유한 코인
)

ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)

ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)
ALTER TABLE dbo.QOO10USER ADD CONSTRAINT CK__QOO10USER__HASCOIN CHECK (hascoin >= 0)

select * from dbo.QOO10USER with(nolock)

select * from dbo.QOO10SELLER with(nolock)


-- 테스트용
/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 더미데이터 생성 : 회원관련
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성
				  2021-04-14 Seunghwan Shin	#qoouser_birthday 추가

*/
create proc [dbo].[qoo10_test_mybatis]
	@seller_id varchar(100),
	@new_seller_nation char(2)
as
set nocount on
set transaction isolation level read uncommitted
begin

	update dbo.QOO10SELLER set seller_nation = @new_seller_nation where seller_id = @seller_id

	if @@error <> 0
	begin
		return 0;
	end

end







create table dbo.QOO10SELLER
(
	sellercode int identity(1,1),-- 셀러 고유 코드
	seller_id varchar(100) not null,-- 셀러 아이디
	seller_pw varchar(100) not null,-- 셀러 비밀번호
	seller_gender char(1) null,--회원 성별 
	seller_nation char(2) null, -- 셀러 국가
	seller_hascoin int -- 셀러가 소유한 코인
)

ALTER TABLE dbo.QOO10SELLER ADD CONSTRAINT PK__QOO10SELLER__SELLERCODE PRIMARY KEY CLUSTERED (sellercode)

INSERT INTO dbo.QOO10SELLER VALUES ('appleseller','qwe123','M','KR',120000)

select * from dbo.QOO10SELLER with(nolock)




select count(*) from QOO10USER with(nolock)

select * from dbo.QOO10USER with(nolock) where usercode = (select count(*) from QOO10USER with(nolock))


select count(*) from dbo.APPLEBUYTBL with(nolock)

select * from dbo.QOO10_USER_REAL


--drop proc dbo.qoo10_dummy_init


/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 더미데이터 생성 : 회원관련
	    
	History		:	2021-02-20 Seunghwan Shin	#최초 생성
					2021-03-30 Seunghwan Shin   #컬럼 추가
					2021-04-14 Seunghwan Shin   #qoouser_birthday 컬럼추가
			
*/
ALTER proc [dbo].[qoo10_dummy_init]
	@qoouser_id varchar(100),--
	@qoouser_pw varchar(800),--
	@qoouser_birthday datetime,--
	@qoouser_email varchar(200),--
	@qoouser_gender char(1),--
	@qoouser_nation char(2),--
	@qoouser_ipaddress varchar(200),--
	@qoouser_hascoin int,--
	@qoouser_phone_num varchar(20),--
	@qoouser_grade int,--
	@qoouser_receive_email char(1),--
	@qoouser_receive_sms char(1),
	@qoouser_denide char(1),
	@qoouser_register_datetime datetime,
	@qoouser_lastlogin_datetime datetime,
	@qoouser_lastlogin_ipaddress varchar(200)
as
set nocount on
set transaction isolation level read uncommitted
begin

	insert into dbo.QOO10_USER_REAL_TEST values 
	(
		@qoouser_id
	,	@qoouser_pw
	,	@qoouser_birthday
	,	@qoouser_email
	,	@qoouser_gender
	,	@qoouser_nation
	,	@qoouser_ipaddress
	,	@qoouser_hascoin
	,	@qoouser_phone_num
	,	@qoouser_grade
	,	@qoouser_receive_email 
	,	@qoouser_receive_sms 
	,	@qoouser_denide
	,	@qoouser_register_datetime
	,	@qoouser_lastlogin_datetime
	,	@qoouser_lastlogin_ipaddress 
	)

	if @@error <> 0
	begin
		return 0;
	end

end



--drop proc qoo10_login

/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 로그인 처리
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_login]
	@inputid varchar(100),
	@inputpw varchar(100)
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select count(*) as cnt from dbo.QOO10USER with(nolock) where id = @inputid and pw = @inputpw;
	
end


select count(*) from dbo.QOO10USER with(nolock)

select * from dbo.QOO10USER with(nolock) where usercode = 15001

update dbo.QOO10USER set hascoin = 500000 where usercode = 15001

insert into dbo.QOO10USER values ('admin','qwe123','ssh9308@naver.com','M','KR','192.128.66.236',5000000)

--select count(*) as cnt from dbo.QOO10USER with(nolock) where id = 'ayyyk544846' and pw = '%jbiO6s@OPj"=l';



DROP PROC qoo10_buy_product

/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 상품 구매
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_buy_product]
	@user_code int,--유저 고유 코드
	@seller_code varchar(100),--셀러 고유 코드
	@prod_serial int,--제품 시리얼 번호
	@quantity int--제품 수량
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @use_coin int,--사용될 코인합
			@prod_price int--제품 가격
			
	select @prod_price = price from dbo.APPLEINC with(nolock) where prodserial = @prod_serial

	set @use_coin = @prod_price * @quantity -- 사용될 코인의 합.

	begin try
		begin tran
			update dbo.QOO10USER set hascoin -= @use_coin where usercode = @user_code;
			update dbo.QOO10SELLER set seller_hascoin += @use_coin where sellercode = @seller_code;
		commit tran
	end try

	begin catch
		rollback tran
	end catch
end



EXEC dbo.QOO10_BUY_PRODUCT 15001,1,1,1



select * from dbo.APPLEINC with(nolock)

select count(*) from dbo.QOO10USER with(nolock)


select * from dbo.QOO10USER with(nolock) where usercode = 15001


DROP TABLE dbo.QOO10USERLOG

-- Q0010 의 회원 로그인 기록
create table dbo.QOO10USERLOG 
(
	log_seq bigint identity(1,1) not null, -- 로그인 번호
	log_user_seq bigint not null, -- 로그인한 유저 고유번호
	log_user_id varchar(100) not null, -- 로그인한 아이디
	log_dt datetime not null, -- 로그인한 날짜 시간
	ip_address varchar(100) not null -- 로그인 한 ip주소
)

ALTER TABLE dbo.QOO10USERLOG add constraint PK__QOO10USERLOG__LOG_SEQ PRIMARY KEY (log_seq)
ALTER TABLE dbo.QOO10USERLOG add constraint DF__QOO10USERLOG__LOG_DT DEFAULT getdate() FOR log_dt 

select top(10) * from dbo.QOO10_USER_REAL with(nolock)

select * from dbo.QOO10USERLOG with(nolock)



SELECT * FROM dbo.QOO10USERLOG WITH(NOLOCK)

DROP TABLE dbo.QOO10USERLOG

ALTER TABLE dbo.QOO10SELLER ADD CONSTRAINT PK__QOO10SELLER__SELLERCODE PRIMARY KEY CLUSTERED (sellercode)

select * from dbo.QOO10USER WITH(NOLOCK) Where usercode = 15001

update dbo.QOO10USER set hascoin = 1500000 where usercode = 15001

select * from dbo.QOO10SELLER WITH(NOLOCK)

update dbo.QOO10SELLER set seller_hascoin = 0 where sellercode=1


--select * from dbo.QOO10USERLOG with(nolock)


--drop proc qoo10_log_stack

/*
	Author      : Seunghwan Shin
	Create date : 2021-03-02 
	Description : 로그인 기록 
	    
	History		: 2021-03-02 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_log_stack]
	@user_id varchar(100),-- 유저 아이디
	@user_ip_address varchar(100) -- 유저의 ip주소
as
set nocount on
set transaction isolation level read uncommitted
begin

	insert into dbo.QOO10USERLOG 
	(
		log_user_id
	,	log_dt
	,	ip_address
	)
	values 
	(	@user_id
	,	default
	,	@user_ip_address
	)

	if @@ERROR <> 0
	begin
		return -1
	end
end



select * from dbo.LOGINTRYIP with(nolock)

--drop table dbo.LOGINTRYIP

-- 해당 아이피에서 로그인시도 얼마나 하는지 데이터
CREATE TABLE dbo.LOGINTRYIP
(
	ip_address_seq bigint identity(1,1) not null,--기본키역할
	ip_address varchar(100),-- 아이피주소
	try_time datetime not null --접속시간
)

ALTER TABLE dbo.LOGINTRYIP ADD CONSTRAINT  PK__LOGINTRYIP__IP_ADDRESS_SEQ PRIMARY KEY CLUSTERED (ip_address_seq)
ALTER TABLE dbo.LOGINTRYIP add constraint DF__LOGINTRYIP__TRY_TIME DEFAULT getdate() FOR try_time 


--drop table dbo.TBLBANNEDIPLIST
--벤당한 아이피 리스트 목록
CREATE TABLE dbo.TBLBANNEDIPLIST
(
	banned_ip_address varchar(100) not null,--벤시킬 아이피

)


select * from dbo.TBLBANNEDIPLIST with(nolock)

begin tran

update dbo.TBLBANNEDIPLIST set banned_ip_address = '123123' where banned_ip_address = '0:0:0:0:0:0:0:1'

commit tran


select * from dbo.TBLBANNEDIPLIST with(nolock)

ALTER TABLE dbo.TBLBANNEDIPLIST ADD CONSTRAINT PK__TBLBANNEDIPLIST__BANNED_IP_ADDRESS PRIMARY KEY CLUSTERED (banned_ip_address)

select * from dbo.TBLBANNEDIPLIST witth(nolock)

--192.168.0.1

insert into dbo.TBLBANNEDIPLIST values ('192.168.0.1')


select * from dbo.TBLBANNEDIPLIST with(nolock)


--drop proc qoo10_login_try

/*
	Author      : Seunghwan Shin
	Create date : 2021-03-06 
	Description : 로그인시도하는 아이피 스택으로 쌓을것 
	    
	History		: 2021-03-06 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_login_try]
	@user_ip_address varchar(100)-- 유저의 ip주소
as
set nocount on
set transaction isolation level read uncommitted
begin
		
		insert into dbo.LOGINTRYIP 
		(
			ip_address
		,	try_time
		)
		values
		(
			@user_ip_address,
			default
		)

	if @@ERROR <> 0
	begin
		return -1
	end

end

select * from dbo.LOGINTRYIP with(nolock)

--insert into dbo.LOGINTRYIP values ('0:0:0:0:0:0:0:1',default)

--drop proc dbo.qoo10_banned

/*
	Author      : Seunghwan Shin
	Create date : 2021-03-06 
	Description : 한 아이피에서 로그인을 비정상적으로 많이 시도하는 경우 해당 아이피를 차단시켜준다. 
	    
	History		: 2021-03-06 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_banned]
	@user_ip_address varchar(100)-- 유저의 ip주소
as
set nocount on
set transaction isolation level read uncommitted
begin
		
	declare @try_count int--시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
	
	select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
	where ip_address = @user_ip_address 
	and  DATEDIFF(ss,try_time,getdate()) <= 15
	
	if (@try_count >= 4)
	begin
		insert into dbo.TBLBANNEDIPLIST values (@user_ip_address)

		if @@ERROR <> 0
		begin
			return -1
		end
	end
end



--drop proc dbo.qoo10_banned_list_check

/*
	Author      : Seunghwan Shin
	Create date : 2021-03-07 
	Description : 벤당한 아이피인경우 로그인자체를 무효화 한다. 
	    
	History		: 2021-03-07 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_banned_list_check]
	@user_ip_address varchar(100)-- 유저의 ip주소
as
set nocount on
set transaction isolation level read uncommitted
begin
		
	select count(*) as cnt from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @user_ip_address	

end



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-02-10  
	Description : 상품 구매 
	     
    	History	: 2021-02-10 Seunghwan Shin #최초 생성 
*/ 
create proc [dbo].[qoo10_buy_product] 
	@user_code int,--유저 고유 코드 
	@seller_code varchar(100),--셀러 고유 코드 
	@prod_serial int,--제품 시리얼 번호 
	@quantity int--제품 수량 
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	declare @use_coin int,--사용될 코인합 
		@prod_price int--제품 가격 
	select @prod_price = price from dbo.APPLEINC with(nolock) where prodserial = @prod_serial 
	set @use_coin = @prod_price * @quantity -- 사용될 코인의 합. 
        begin try 
		begin tran 
			update dbo.QOO10USER set hascoin -= @use_coin where usercode = @user_code; 
			update dbo.QOO10SELLER set seller_hascoin += @use_coin where sellercode = @seller_code; 
		commit tran 
	end try 
	begin catch 
		rollback tran 
	end catch 
end



select * from dbo.QOO10SELLER with(nolock)

select * from dbo.QOO10USER with(nolock) where usercode = (select count(*) from dbo.QOO10USER)

update dbo.QOO10USER set hascoin = 1500000 where usercode = (select count(*) from dbo.QOO10USER)

update dbo.QOO10SELLER set seller_hascoin = 0 where sellercode = 1


select * from dbo.APPLEINC with(nolock)


drop proc dbo.qoo10_buy_product_test

create proc [dbo].[qoo10_buy_product_test] 
	@user_code int,--유저 고유 코드 
	@seller_code varchar(100),--셀러 고유 코드 
	@prod_serial int,--제품 시리얼 번호 
	@quantity int--제품 수량 
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	declare @use_coin int,--사용될 코인합 
		@prod_price int--제품 가격 
	select @prod_price = price from dbo.APPLEINC with(nolock) where prodserial = @prod_serial 
	set @use_coin = @prod_price * @quantity -- 사용될 코인의 합. 
        
	begin tran
		
	update dbo.QOO10USER set hascoin -= @use_coin where usercode = @user_code; 

	if @@ERROR <> 0
	begin
		rollback tran
	end
	
	else
	begin
		update dbo.QOO10SELLER set seller_hascoin += @use_coin where sellercode = @seller_code;
			
		insert into dbo.APPLEBUYTBL 
		(
			userseq
		,	prodserial
		,	quantity
		,	buydate
		)
		values
		(
			@user_code
		,	@prod_serial
		,	@quantity
		,	getdate()
		)

		commit tran
	end	 
end

select * from dbo.APPLEBUYTBL with(nolock) where buyseq = (select count(*) from dbo.APPLEBUYTBL with(nolock))


--select * from dbo.APPLEBUYTBL with(nolock)

create proc [dbo].[qoo10_buy_product_test] 
	@user_code int,--유저 고유 코드 
	@seller_code varchar(100),--셀러 고유 코드 
	@prod_serial int,--제품 시리얼 번호 
	@quantity int--제품 수량 
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	declare @use_coin int,--사용될 코인합 
		@prod_price int--제품 가격 
	select @prod_price = price from dbo.APPLEINC with(nolock) where prodserial = @prod_serial 
	set @use_coin = @prod_price * @quantity -- 사용될 코인의 합. 
        begin try 
		begin tran 
			update dbo.QOO10USER set hascoin -= @use_coin where usercode = @user_code; 
			update dbo.QOO10SELLER set seller_hascoin += @use_coin where sellercode = @seller_code;

                insert into dbo.APPLEBUYTBL 
    		(
			userseq
		,	prodserial
		,	quantity
		,	buydate
		)
		values
		(
			@user_code
		,	@prod_serial
		,	@quantity
		,	getdate()
		)
 
		commit tran 
	end try 
	begin catch 
		rollback tran 
	end catch 
end


EXEC dbo.qoo10_buy_product_test 15001,1,1,4



/*
	Author      : Seunghwan Shin
	Create date : 2021-03-11 
	Description : 새로운 로그인 처리
	    
	History		: 2021-03-11 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_new_login]
	@id varchar(100),
	@pw varchar(100)
as
set nocount on
set transaction isolation level read uncommitted
begin

	

end


--drop proc dbo.qoo10_new_ip_check


declare @out int
exec dbo.qoo10_new_ip_check '192.168.0.1','admin','qwe12',@out output
select @out


select * from dbo.LOGINTRYIP with(nolock)

select * from dbo.TBLBANNEDIPLIST with(nolock)

--drop proc dbo.qoo10_new_ip_check

drop proc dbo.qoo10_total_login

declare @num int
exec dbo.qoo10_total_login '123.322.143','admin','qwe123', @num output
select @num

--dbo.QOO10USERENC 

--drop proc dbo.qoo10_total_login

--SELECT TOP(100) * FROM dbo.QOO10USERENC WITH(NOLOCK)

select top(10) * from dbo.QOO10_USER_REAL 

insert into dbo.QOO10_USER_REAL values 
(
	'admin'
,	'24b0015e0d850b1c796d7586d21072b5f8ebdc180805edc074cdf034b245478b'
,	'ssh9308@naver.com'
,	'M'
,	'KR'
,	'123.123.123'
,	5000000
,	'01051393792'
,	5
,	'Y'
,	'Y'
,	'Y'
,	GETDATE()
,	getdate()
,	'123.123.123'

)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = 1

update dbo.QOO10_USER_REAL set qoouser_lastlogin_ipaddress = '0:0:0:0:0:0:0:1' where qoouser_seq = 1


--drop proc qoo10_total_login

/*
	Author      : Seunghwan Shin
	Create date : 2021-03-16 
	Description : ip 검증개체
	    
	History		: 2021-03-16 Seunghwan Shin	#최초 생성
				  2021-03-31 Seunghwan Shin	#마지막 회원접속시간,접속ip 추가
				  2021-04-03 Seunghwan Shin #자동로그인 방지 추가
				  2021-05-16 Seunghwan Shin #전반적으로 모두 수정
				  2021-05-26 Seunghwan Shin #비정상 로그인 로직 수정

*/
alter proc [dbo].[qoo10_total_login]
	@user_ip_address varchar(100),-- 접속한 ip주소
	@qoouser_id varchar(100), -- 유저 id
	@qoouser_pw varchar(800), -- 유저 pw
	@login_code int output -- 로그인에 관련된 코드 0 : 로그인 성공, 1 : 로그인 실패(아이디,비번 오류) , -1 : 아이피 접속 승인불가, 2 : 로그인은 성공했지만 마지막으로 접속했던 ip와 현재 접속하는 ip의 위치가 달라 자동로그인 방지 정책을 따라야한다.
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	begin try
		-- 밴 당한 아이피인지 확인해준다.
		if exists (select * from dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address) -- 벤당한 아이피의 경우
		begin
			set @login_code = -1
		end
		else -- 벤당하지 않은 아이피의 경우**
		begin
			if exists (select * from dbo.QOO10_USER_REAL  where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- 로그인 정보가 존재하는 경우
			begin
		
				declare @last_ip_address	varchar(100) -- 마지막으로 접속한 아이피 주소
				,		@qoouser_seq		bigint		 -- 유저의 고유번호

				select @qoouser_seq = qoouser_seq from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw
				select @last_ip_address = qoouser_lastlogin_ipaddress from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq
		
				if(@last_ip_address = @user_ip_address)-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같은경우
				begin
					set @login_code = 0 --로그인 성공

					begin tran
					-- 로그인 성공시간 기록 남기기
					insert into dbo.QOO10USERLOG
					(
						log_user_seq
					,	log_user_id
					,	log_dt
					,	ip_address
					)
					values
					(
						@qoouser_seq
					,	@qoouser_id
					,	default
					,	@user_ip_address
					)

					--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
					update dbo.QOO10_USER_REAL set 
						qoouser_lastlogin_datetime = getdate()
					,	qoouser_lastlogin_ipaddress = @user_ip_address
					where qoouser_id = @qoouser_id 

					commit tran
				end
				else-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같지 않은경우 --> 다시 기록을 남겨줘야한다.
				begin
					set @login_code = 2
				end
			end
			else--로그인 정보가 존재하지 않는 경우 --> 여기서 오류처리를 해주는게 맞아보인다.
			begin

				declare @try_count int

				begin tran
					--아이피 로그기록 남기기
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
				select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

				if (@try_count >= 4)
				begin
					begin tran
						insert into dbo.TBLBANNEDIPLIST values (@user_ip_address)
					commit tran
				end

				set @login_code = 1
			end
		end

	end try
	begin catch
		rollback tran
	end catch
end


select * from dbo.TBLBANNEDIPLIST with(nolock)

update TBLBANNEDIPLIST set banned_ip_address = '0:0:0:0:0:0:0:0' where banned_ip_address ='0:0:0:0:0:0:0:1'



select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

select * from dbo.QOO10USERLOG with(nolock)

select * from dbo.LOGINTRYIP witth(nolock)

SELECT * FROM dbo.QOO10USER WITH(NOLOCK) WHERE usercode < 10


select * from dbo.LOGINTRYIP

select * from dbo.TBLBANNEDIPLIST with(nolock)

--drop table dbo.TBLBANNEDIPLIST
update dbo.TBLBANNEDIPLIST set banned_ip_address = '1:1:1'

declare @result char(1)
exec qoo10_new_ip_check '192.168.0.1',@result output
print @result


SELECT * FROM dbo.QOO10USER WHERE usercode = (SELECT COUNT(*) FROM dbo.QOO10USER WITH(NOLOCK))

select * from dbo.APPLEINC
/*  
	Author      : Seunghwan Shin  
	Create date : 2021-03-11   
	Description : 국가별, 성별, 기기별 가장 많이산 고객의 아이디와 금액정보 (상위 n 건 조회)  
	      
    History	: 2021-03-11 Seunghwan Shin #최초 생성  
*/  
create proc [dbo].[sh_test_first_hash_test] 
	@nation char(2),--국가코드 
	@gender char(1),--성별 
	@number int, --상위 몇명 가져올건지 체크 
	@apple_prod_name varchar(100) -- 애플기기 이름 
as  
set nocount on  
set transaction isolation level read uncommitted  
begin 
	select top (@number) qu.id,sum(ac.price) as summ from dbo.QOO10USER qu with(nolock) 
	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
	inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial 
	where qu.nation = @nation  
	and qu.gender = @gender  
	and ac.prodname = @apple_prod_name 
	group by qu.id 
	order by summ desc 
end


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-03-21   
	Description : 테스트  
	     
	History	: 2021-03-21 Seunghwan Shin	#최초 생성  
*/ 
create proc [dbo].[sh_recompile_login] 
	@usercode int-- 유저의 ip주소  

as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
    select * from dbo.QOO10USER with(nolock) where usercode < @usercode



end


SELECT * FROM TBLBANNEDIPLIST with(nolock)

--update dbo.TBLBANNEDIPLIST set banned_ip_address = '123' 


--DROP TABLE dbo.XMLTESTTBL

CREATE TABLE dbo.XMLTESTTBL
(
	seq int identity(1,1),
	xml_data xml
)

ALTER TABLE dbo.XMLTESTTBL ADD CONSTRAINT PK__XMLTESTTBL__SEQ PRIMARY KEY (seq)


select * from dbo.XMLTESTTBL with(nolock)

declare @input nvarchar(max) = N'<document>
    <userTbl name="이승기" birthYear="1987" addr="서울" />
    <userTbl name="김범수" birthYear="1979" addr="경북" />
    <userTbl name="김경호" birthYear="1971" addr="서울" />
    <userTbl name="조용필" birthYear="1950" addr="충남" />
</document>'

insert into dbo.XMLTESTTBL VALUES (@input)


INSERT INTO dbo.XMLTESTTBL VALUES (N'<document>
    <userTbl name="이승기" birthYear="1987" addr="서울" />
    <userTbl name="김범수" birthYear="1979" addr="경북" />
    <userTbl name="김경호" birthYear="1971" addr="서울" />
    <userTbl name="조용필" birthYear="1950" addr="충남" />
</document>')

SELECT * FROM dbo.XMLTESTTBL WITH(NOLOCK)


drop table dbo.INDEXXMLTBL

CREATE TABLE dbo.INDEXXMLTBL
(
	id int not null,
	fullname varchar(30),
	xmlinfo xml
)

ALTER TABLE dbo.INDEXXMLTBL ADD CONSTRAINT PK__INDEXXMLTBL__ID PRIMARY KEY (id)

drop table dbo.QOO10_USER_REAL

select count(*) from dbo.QOO10_USER_REAL with(nolock)

select top(100) * from dbo.QOO10_USER_REAL with(nolock)


-- 애가 진짜 qoouser라고 할 수 있지 : 생년월일이 없네

--drop table dbo.QOO10_USER_REAL 

create table dbo.QOO10_USER_REAL
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

select qoouser_nation from dbo.QOO10_USER_REAL with(nolock) group by qoouser_nation


alter table dbo.QOO10_USER_REAL add qoouser_name nvarchar(15) null


--drop table dbo.QOOUSERXML 

--drop table dbo.QOOUSERXML

drop table dbo.QOOUSERXML

CREATE TABLE dbo.QOOUSERXML
(
	seq int identity(1,1) not null,
	user_data xml
)

ALTER TABLE dbo.QOOUSERXML ADD CONSTRAINT PK__QOOUSERXML__SEQ PRIMARY KEY (seq)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_code = 1


exec dbo.sh_xml_test 15000


SELECT * FROM dbo.QOOUSERXML WITH(NOLOCK)


select * from dbo.QOOUSERXML with(nolock) where user_data.exist('/row[@qoouser_id="onfyu878596"]') = 1


drop proc dbo.sh_xml_test

/* 
	Author      : Seunghwan Shin 
	Create date : 2021-04-04   
	Description : 테스트  
	     
	History	: 2021-04-04 Seunghwan Shin	#최초 생성  
*/ 
create proc [dbo].[sh_xml_test] 
	@cycle int -- 상위 몇개의 유저 데이터를 xml 화할것인지 지정  

as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare	@qoouser_id			varchar(100)
	,		@qoouser_email		varchar(200)
	,		@qoouser_gender		char(1)
	,		@qoouser_nation		char(2)
	,		@qoouser_ipaddress	varchar(200)
	,		@num_i				int = 0
	

	while(@num_i < @cycle)
	begin

		set @num_i += 1

		declare @xml_data nvarchar(max)

		select 
			@qoouser_id = qoouser_id
		,	@qoouser_email = qoouser_email
		,	@qoouser_gender = qoouser_gender
		,	@qoouser_nation = qoouser_nation
		,	@qoouser_ipaddress = qoouser_ipaddress
		from dbo.QOO10_USER_REAL with(nolock) where qoouser_code = @num_i

		set @xml_data = N'<row qoouser_id="'+@qoouser_id + N'" qoouser_email="' + @qoouser_email + N'" qoouser_gender="'+@qoouser_gender + N'" qoouser_nation="'+@qoouser_nation + N'" qoouser_grade="'+ @qoouser_ipaddress  +'"/>'

		insert into dbo.QOOUSERXML values (@xml_data)
	
	end
	

end


SELECT TOP(1) * FROM dbo.QOO10_USER_REAL FOR XML RAW,ELEMENTS,XMLSCHEMA


CREATE TABLE dbo.SCHEMAXMLTBL
(
	id int identity(1,1),
	xmlcol xml (schema_test)
)



CREATE TABLE dbo.TESTSHTBL
(
	seq int identity(1,1) not null,
	test varchar(10) null

)


ALTER TABLE dbo.TESTSHTBL ADD CONSTRAINT PK__TESTSHTBL__SEQ PRIMARY KEY (seq)

select * from dbo.TESTSHTBL with(nolock) where test = ''

--CREATE INDEX IDX__TESTSHTBL__TEST ON dbo.TESTSHTBL (test)



DECLARE @num int = 0

WHILE (@num < 200)
begin
	insert into dbo.TESTSHTBL values (''+@num)
	set @num += 1
end







/* 
	Author      : Seunghwan Shin 
	Create date : 2021-04-26   
	Description : 테스트  
	     
	History	: 2021-04-26 Seunghwan Shin	#최초 생성  
*/ 
create proc [dbo].[cust_generator] 
	@user_name nvarchar(100)  
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	insert into dbo.TB_CUST
	(
		cust_name
	)
	values
	(
		@user_name
	)
	

end

exec dbo.cust_generator 'HARRY'

SELECT * FROM dbo.TB_CUST WITH(NOLOCK)

DROP TABLE dbo.TB_CUST



CREATE TABLE dbo.TB_CUST(

	cust_no INT NOT NULL,

	cust_name NVARCHAR(100) NOT NULL

	CONSTRAINT PK_TB_CUST PRIMARY KEY(cust_no)
);


INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(1, 'MIKE');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(2, 'OBAMA');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(3, 'TRUMP');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(4, 'MESSI');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(5, 'RONALDO');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(6, 'MALDINI');

INSERT INTO TB_CUST(CUST_NO, CUST_NAME) VALUES(7, 'SANCHEZ');

-- drop TABLE dbo.TB_PRODUCT

CREATE TABLE dbo.TB_PRODUCT(

	product_no INT NOT NULL,

	product_name NCHAR(100) NOT NULL

	CONSTRAINT PK_TB_PRODUCT PRIMARY KEY(PRODUCT_NO)
);

INSERT INTO TB_PRODUCT(PRODUCT_NO, PRODUCT_NAME) VALUES(701, 'MacBook');

INSERT INTO TB_PRODUCT(PRODUCT_NO, PRODUCT_NAME) VALUES(702, 'MagicMouse');

INSERT INTO TB_PRODUCT(PRODUCT_NO, PRODUCT_NAME) VALUES(703, 'IPad');

INSERT INTO TB_PRODUCT(PRODUCT_NO, PRODUCT_NAME) VALUES(704, 'IPhone');

 

CREATE TABLE dbo.TB_ORDER(

	order_no INT NOT NULL,

	cust_no INT NOT NULL,

	product_no INT NOT NULL

	CONSTRAINT PK_TB_ORDER PRIMARY KEY(ORDER_NO));

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201901, 1, 701);

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201902, 1, 702);

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201904, 2, 704);

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201905, 3, 701);

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201906, 4, 703);

INSERT INTO TB_ORDER(ORDER_NO, CUST_NO, PRODUCT_NO) VALUES(201907, 5, 701);

 

-- O.*, C.CUST_NAME, P.PRODUCT_NAME

 

SELECT *
FROM dbo.TB_ORDER O
LEFT JOIN dbo.TB_CUST C ON O.CUST_NO = C.CUST_NO 
LEFT JOIN dbo.TB_PRODUCT P ON O.PRODUCT_NO = P.PRODUCT_NO


SELECT *
FROM dbo.TB_CUST c
LEFT JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no and c.cust_name = 'MIKE' and o.product_no = 701

SELECT *
FROM dbo.TB_CUST c
LEFT JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no and o.product_no = 701 


SELECT *
FROM dbo.TB_CUST c
LEFT JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no


SELECT *
FROM dbo.TB_CUST c
LEFT JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no 

and c.cust_name = 'MIKE' 


SELECT *
FROM dbo.TB_CUST c
INNER JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no  


select * from dbo.TB_ORDER with(nolock)


SELECT *
FROM dbo.TB_CUST c
LEFT JOIN dbo.TB_ORDER o ON o.cust_no = c.cust_no
WHERE c.cust_name = 'MIKE'



select * from dbo.TB_ORDER with(nolock)





--LEFT JOIN dbo.TB_PRODUCT P ON O.PRODUCT_NO = P.PRODUCT_NO


SELECT *
FROM dbo.TB_ORDER O 
LEFT JOIN dbo.TB_PRODUCT P ON O.PRODUCT_NO = P.PRODUCT_NO


SELECT *
FROM dbo.TB_ORDER O 
INNER JOIN dbo.TB_PRODUCT P ON O.PRODUCT_NO = P.PRODUCT_NO

 


SELECT
	c.cust_name
,	c.cust_name
,	p.product_name
,	p.product_no
,	o.order_no
,	o.cust_no
,	o.product_no
 FROM dbo.TB_CUST c WITH(NOLOCK)
 INNER JOIN dbo.TB_ORDER o ON c.cust_no = o.cust_no
 INNER JOIN dbo.TB_PRODUCT p ON p.product_no = o.product_no

 SELECT
	c.cust_name
,	c.cust_name
,	p.product_name
,	p.product_no
,	o.order_no
,	o.cust_no
,	o.product_no
 FROM dbo.TB_CUST c WITH(NOLOCK)
 CROSS JOIN dbo.TB_ORDER o WITH(NOLOCK)
 CROSS JOIN dbo.TB_PRODUCT p WITH(NOLOCK)
 


-- AND C.CUST_NAME = 'MIKE'

drop table  dbo.TB_CUST
drop table  dbo.TB_PRODUCT
drop table  dbo.TB_ORDER


--
SELECT * FROM dbo.TB_CUST with(nolock)
--
SELECT * FROM dbo.TB_PRODUCT with(nolock)
--
SELECT * FROM dbo.TB_ORDER with(nolock)



SELECT 
	t1.cust_no
,	t1.cust_name
,	t2.cust_no
,	t2.cust_name
FROM dbo.TB_CUST t1 WITH(NOLOCK)
INNER JOIN dbo.TB_CUST t2 WITH(NOLOCK) ON t1.cust_no < t2.cust_no
ORDER BY t1.cust_no

SELECT 
	t1.cust_no
,	t1.cust_name
,	t2.cust_no
,	t2.cust_name
FROM dbo.TB_CUST t1 WITH(NOLOCK)
CROSS JOIN dbo.TB_CUST t2 WITH(NOLOCK)
ORDER BY t1.cust_no




CREATE TABLE dbo.TB_CUST(

	cust_no INT NOT NULL, -- 고객번호

	cust_name NVARCHAR(100) NOT NULL -- 고객이름

	CONSTRAINT PK__TB_CUST__CUST_NO PRIMARY KEY(cust_no)

);


INSERT INTO TB_CUST(cust_no, cust_name) VALUES(1, 'MIKE');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(2, 'OBAMA');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(3, 'TRUMP');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(4, 'MESSI');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(5, 'RONALDO');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(6, 'MALDINI');

INSERT INTO TB_CUST(cust_no, cust_name) VALUES(7, 'SANCHEZ');

 


CREATE TABLE dbo.TB_PRODUCT(

	product_no INT NOT NULL, -- 제품 번호
	 
	product_name NCHAR(100) NOT NULL -- 제품 이름

	CONSTRAINT PK__TB_PRODUCT__PRODUCT_NO PRIMARY KEY(product_no)

);


INSERT INTO TB_PRODUCT(product_no, product_name) VALUES(701, 'MacBook');

INSERT INTO TB_PRODUCT(product_no, product_name) VALUES(702, 'MagicMouse');

INSERT INTO TB_PRODUCT(product_no, product_name) VALUES(703, 'IPad');

INSERT INTO TB_PRODUCT(product_no, product_name) VALUES(704, 'IPhone');

 

CREATE TABLE dbo.TB_ORDER(

	order_no INT NOT NULL, --주문 번호

	cust_no INT NOT NULL, -- 주문을 한 고객 번호

	product_no INT NOT NULL -- 주문한 고객이 산 제품 번호

	CONSTRAINT PK__TB_ORDER__ORDER_NO PRIMARY KEY(order_no)

);



INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201901, 1, 701);

INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201902, 1, 702);

INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201904, 2, 704);

INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201905, 3, 701);

INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201906, 4, 703);

INSERT INTO TB_ORDER(order_no, cust_no, product_no) VALUES(201907, 5, 701);




--SELECT * FROM dbo.TBLINSA WITH(NOLOCK)
--DROP TABLE dbo.QOOSTAFF
--DROP TABLE dbo.QOO_ATTENDANCE

CREATE TABLE dbo.QOOSTAFF
(
	staff_name NVARCHAR(5) NOT NULL, -- 직원 이름
	team VARCHAR(20) NOT NULL, --소속 팀
	enter_date DATE NOT NULL, -- 입사일
	out_date DATETIME NULL, -- 퇴사일
	staff_address NVARCHAR(50) NULL -- 집주소 
)

ALTER TABLE dbo.QOOSTAFF ADD CONSTRAINT PK__QOOSTAFF__STAFF_NAME__TEAM PRIMARY KEY (staff_name,team)

INSERT INTO dbo.QOOSTAFF VALUES ('이도윤','HR','2009-08-09',NULL,N'사랑시 고백구 행복동')
INSERT INTO dbo.QOOSTAFF VALUES ('방성필','DEV','2012-04-05',NULL,N'사랑시 고백구 희망동')
INSERT INTO dbo.QOOSTAFF VALUES ('백지현','FM','2015-01-13',NULL,N'사랑시 고백구 기대동')
INSERT INTO dbo.QOOSTAFF VALUES ('홍준표','PR','2018-04-09',NULL,N'사랑시 정열구 용기동')
INSERT INTO dbo.QOOSTAFF VALUES ('홍준표','DEV','2020-10-13',NULL,N'사랑시 우정구 성실동')


CREATE TABLE dbo.QOO_ATTENDANCE
(
	att_seq BIGINT IDENTITY(1,1) NOT NULL,
	staff_name NVARCHAR(5) NOT NULL, -- 직원이름
	team VARCHAR(20) NOT NULL, -- 소속 팀
	enter_time SMALLDATETIME NULL, -- 출근시간
	exit_time SMALLDATETIME NULL -- 퇴근시간
)

ALTER TABLE dbo.QOO_ATTENDANCE ADD CONSTRAINT PK__QOO_ATTENDANCE__ATT_SEQ PRIMARY KEY (att_seq)

INSERT INTO dbo.QOO_ATTENDANCE VALUES ('이도윤','HR','2020-04-29 09:12:13','2020-04-29 18:33:13')
INSERT INTO dbo.QOO_ATTENDANCE VALUES ('이도윤','HR','2020-04-30 09:34:22','2020-04-30 18:30:43')

INSERT INTO dbo.QOO_ATTENDANCE VALUES ('방성필','DEV','2020-04-29 09:32:12','2020-04-29 18:30:02')
INSERT INTO dbo.QOO_ATTENDANCE VALUES ('방성필','DEV','2020-04-30 09:10:03','2020-04-30 18:30:43')

INSERT INTO dbo.QOO_ATTENDANCE VALUES ('백지현','FM','2020-04-29 09:08:00','2020-04-29 18:30:15')
INSERT INTO dbo.QOO_ATTENDANCE VALUES ('백지현','FM','2020-04-30 09:18:44','2020-04-30 18:31:43')

INSERT INTO dbo.QOO_ATTENDANCE VALUES ('홍준표','PR','2020-04-29 10:00:04','2020-04-29 19:00:15')
INSERT INTO dbo.QOO_ATTENDANCE VALUES ('홍준표','PR','2020-04-30 09:14:54','2020-04-30 21:02:13')

INSERT INTO dbo.QOO_ATTENDANCE VALUES ('홍준표','DEV','2020-04-29 09:01:40','2020-04-29 18:30:15')
INSERT INTO dbo.QOO_ATTENDANCE VALUES ('홍준표','DEV','2020-04-30 09:14:55','2020-04-30 19:30:44')


SELECT
	q.staff_name
,	q.team
,	q.enter_date
,	q.out_date
,	q.staff_address
,	a.att_seq
,	a.staff_name
,	a.team
,	a.enter_time,
	a.exit_time
FROM dbo.QOOSTAFF q WITH(NOLOCK)
INNER JOIN QOO_ATTENDANCE a WITH(NOLOCK) ON q.staff_name = a.staff_name AND q.team = a.team
 


 select * from dbo.QOO10_USER_REAL with(nolock)

 
 SELECT * FROM dbo.TBLINSA t1
 INNER JOIN dbo.TBLINSA t2 ON t1.num < t2.num


-- drop table dbo.ADVERTISE_INFO

 /*광고관련*/
 CREATE TABLE dbo.ADVERTISE_INFO (
	ad_seq bigint identity(1,1) not null,--광고번호
	ad_name nvarchar(30) not null,--광고 이름
	ad_pic_url nvarchar(30) not null,--광고 사진 경로
	ad_url nvarchar(300) not null,--광고 url
	ad_price_monthly int null--광고가 한달에 지불하는 비용
 )

 alter table dbo.ADVERTISE_INFO add constraint PK__ADVERTISE_INFO__AD_SEQ PRIMARY KEY (ad_seq)


insert into dbo.ADVERTISE_INFO values (N'아이폰12','apple_01.jpg','https://www.apple.com/kr/iphone-12-pro/',150000000);
insert into dbo.ADVERTISE_INFO values (N'배민','baemin_01.jpg','https://www.baemin.com/',80000000);
insert into dbo.ADVERTISE_INFO values (N'버거킹','burgerking_01.png','https://www.burgerking.co.kr/#/home',20000000);
insert into dbo.ADVERTISE_INFO values (N'쿠팡잇츠','coupeat_01.jpg','https://www.coupangeats.com/',75000000);
insert into dbo.ADVERTISE_INFO values (N'동원참치','dongwon_01.jpg','https://www.dongwonmall.com/index.do?gt_network=g&gt_keyword=%EB%8F%99%EC%9B%90&gt_target_id=kwd-333513636938&gt_campaign_id=11483096606&gt_adgroup_id=115774212681&gclid=Cj0KCQjw7pKFBhDUARIsAFUoMDa5KcCS4BkuWOFKhKozuXGwW0l4WE-I7sv4CDemQl-h6Xc3iuWpcosaArt6EALw_wcB',62000000);
insert into dbo.ADVERTISE_INFO values (N'구찌','gucci_01.jpg','https://www.gucci.com/kr/ko/?&utm_source=naverbs_kr_pc&utm_medium=brandzone_main&utm_campaign=ouverture_A&utm_content=%ED%99%88%EB%A7%81%ED%81%AC&utm_term=&NaPm=ct%3Dkovewxwo%7Cci%3D0zS0002nZofu%2DJqnPf3X%7Ctr%3Dbrnd%7Chk%3D88d51d8fea640d57e84591e1e4c96288dc077312',210000000);
insert into dbo.ADVERTISE_INFO values (N'루이비통','lv_01.jpg','https://kr.louisvuitton.com/kor-kr/homepage?gclid=Cj0KCQjw7pKFBhDUARIsAFUoMDZo45YP0oOJURy5pOY2W166MpjnyyVOa6NF0h5LeOYY_8nv8h4-U3YaAnt6EALw_wcB',320000000);
insert into dbo.ADVERTISE_INFO values (N'네이트','nate_01.jpg','https://www.nate.com/',22000000);
insert into dbo.ADVERTISE_INFO values (N'갤럭시폴드 톰브라운','samsung_01.jpg','https://www.samsung.com/sec/smartphones/galaxy-z-flip/thom-browne-edition/',368000000);


select * from dbo.ADVERTISE_INFO with(nolock)



--exec dbo.advertise_show

 /* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성  
*/ 
create proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	

end




select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*) from dbo.QOO10_USER_REAL with(nolock))



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-22   
	Description : 회원가입
	     
	History	: 2021-05-22 Seunghwan Shin	#최초 생성  
*/
alter proc dbo.qoo_sign_up
	@qoouser_id varchar(100) -- 아이디 o
,	@qoouser_pw varchar(800) -- 비밀번호 o
,	@qoouser_birthday datetime -- 생년월일 o
,	@qoouser_email varchar(200) -- 이메일 o
,	@qoouser_gender  char(1) -- 성별 o
,	@qoouser_nation char(2) -- 국적 o
,	@qoouser_ipaddress varchar(200) -- 아이피주소 o
,	@qoouser_phone_num varchar(20) -- 전화번호 o
,	@qoouser_receive_email char(1) -- 이메일 알람 o
,	@qoouser_receive_sms char(1) -- sms 알람 o
,	@qoouser_name nvarchar(30) -- 이름
,	@check int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
  
begin try
	
	begin tran
	insert into dbo.QOO10_USER_REAL 
	(
		qoouser_id--
	,	qoouser_pw--
	,	qoouser_birthday--
	,	qoouser_email--
	,	qoouser_gender--
	,	qoouser_nation--
	,	qoouser_ipaddress--
	,	qoouser_hascoin
	,	qoouser_phone_num
	,	qoouser_grade
	,	qoouser_receive_email
	,	qoouser_receive_sms
	,	qoouser_denide
	,	qoouser_register_datetime
	,	qoouser_lastlogin_datetime
	,	qoouser_lastlogin_ipaddress
	,	qoouser_name
	)
	values
	(
		@qoouser_id
	,	@qoouser_pw
	,	@qoouser_birthday
	,	@qoouser_email
	,	@qoouser_gender
	,	@qoouser_nation
	,	@qoouser_ipaddress
	,	0
	,	@qoouser_phone_num
	,	1
	,	@qoouser_receive_email
	,	@qoouser_receive_sms
	,	'N'
	,	getdate()
	,	null
	,	@qoouser_ipaddress
	,	@qoouser_name
	)
	commit tran
	set @check = 1

end try
begin catch
	set @check = -1
	rollback tran
end catch

end


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-30   
	Description : 회원가입 : 아이디 검증과정
	     
	History	: 2021-05-30 Seunghwan Shin	#최초 생성  
*/
alter proc dbo.qoo_sign_up_id_check
	@qoouser_id varchar(100) -- 아이디 o
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end


declare @result int
exec qoo_sign_up_id_check '987asd',@result output
select  @result





select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

update dbo.QOO10_USER_REAL set qoouser_lastlogin_ipaddress = '111.111.111.111' where qoouser_id = 'admin'


exec dbo.advertise_show


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 /* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성  
*/ 
create proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	

end

qoo10_total_login

select top(10) * from dbo.QOO10_USER_REAL with(nolock)


		declare @user_seq int
		declare @login_code int
		exec dbo.qoo10_total_login '111.111.111.111', 'admin', '24b0015e0d850b1c796d7586d21072b5f8ebdc180805edc074cdf034b245478b', @login_code output, @user_seq output
		select @login_code, @user_seq
		--select @user_seq


		select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

		update dbo.QOO10_USER_REAL set qoouser_lastlogin_ipaddress = '0:0:0:0:0:0:0:1' where qoouser_id = 'admin'

qoo_sign_up

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = 2000001

/*
	Author      : Seunghwan Shin
	Create date : 2021-06-10
	Description : 자동로그인방지 인증 후 회원의 로그인정보 기록
	    
	History		: 2021-06-10 Seunghwan Shin	#최초 생성

*/
alter proc [dbo].[qoo10_login_after_auto_check]
	@user_ip_address varchar(100)-- 접속한 ip주소
,	@user_seq int-- 유저고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	

	--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
	update dbo.QOO10_USER_REAL set 
			qoouser_lastlogin_datetime = getdate()
		,	qoouser_lastlogin_ipaddress = @user_ip_address
	where qoouser_seq = @user_seq 

	if @@ERROR <> 0
	begin
		rollback tran
	end
					
end

--exec dbo.qoo10_login_after_auto_check '123','20000000'







/*
	Author      : Seunghwan Shin
	Create date : 2021-06-08
	Description : 유저 정보 반환
	    
	History		: 2021-06-08 Seunghwan Shin #유저객체를 넘겨주기 위한 로직 수정

*/
create proc [dbo].[qoo10_user_info]
	@qoouser_seq int
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		qoouser_seq as userSeq
	,	qoouser_id as userId
	,	qoouser_gender as userGender
	,	qoouser_nation as userNation
	,	qoouser_hascoin as userHasCoin
	,	qoouser_grade as userGrade
	,	qoouser_name as userName
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @qoouser_seq


end



select count(*) from dbo.QOO10_USER_REAL with(nolock) 

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*) from dbo.QOO10_USER_REAL with(nolock) )-1



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-22   
	Description : 회원가입
	     
	History	: 2021-05-22 Seunghwan Shin	#최초 생성  
*/
CREATE proc dbo.qoo_sign_up
	@qoouser_id varchar(100) -- 아이디
,	@qoouser_pw varchar(800) -- 비밀번호
,	@qoouser_birthday datetime -- 생년월일
,	@qoouser_email varchar(200) -- 이메일
,	@qoouser_gender  char(1) -- 성별
,	@qoouser_nation char(2) -- 국적
,	@qoouser_ipaddress varchar(200) -- 아이피주소
,	@qoouser_phone_num varchar(20) -- 전화번호
,	@qoouser_receive_email char(1) -- 이메일 알람
,	@qoouser_receive_sms char(1) -- sms 알람
,	@qoouser_name nvarchar(30) -- 이름
,	@check int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
  
begin try
	
	begin tran
	insert into dbo.QOO10_USER_REAL 
	(
		qoouser_id
	,	qoouser_pw
	,	qoouser_birthday
	,	qoouser_email
	,	qoouser_gender
	,	qoouser_nation
	,	qoouser_ipaddress
	,	qoouser_hascoin
	,	qoouser_phone_num
	,	qoouser_grade
	,	qoouser_receive_email
	,	qoouser_receive_sms
	,	qoouser_denide
	,	qoouser_register_datetime
	,	qoouser_lastlogin_datetime
	,	qoouser_lastlogin_ipaddress
	,	qoouser_name
	)
	values
	(
		@qoouser_id
	,	@qoouser_pw
	,	@qoouser_birthday
	,	@qoouser_email
	,	@qoouser_gender
	,	@qoouser_nation
	,	@qoouser_ipaddress
	,	0
	,	@qoouser_phone_num
	,	1
	,	@qoouser_receive_email
	,	@qoouser_receive_sms
	,	'N'
	,	getdate()
	,	null
	,	@qoouser_ipaddress
	,	@qoouser_name
	)
	commit tran
	set @check = 1

end try
begin catch
	set @check = -1
	rollback tran
end catch

end



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-30   
	Description : 회원가입 : 아이디 검증과정
	     
	History	: 2021-05-30 Seunghwan Shin	#최초 생성  
*/
create proc dbo.qoo_sign_up_id_check
	@qoouser_id varchar(100) -- 아이디 o
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end


declare @result int
exec qoo_sign_up_id_check 'ssh9308' , @result output
select @result


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*) from dbo.QOO10_USER_REAL with(nolock))





/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성 
			  2021-05-19 Seunghwan Shin #top(),order by 절 추가
*/ 
ALTER proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select top(9)
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	order by adPriceMonthly
	

end


--userSignUpIdCheck



--qoo_sign_up_id_check

grant execute to junpyo



select * from(
         select 
			row_number() over (order by A.reg_dt desc) as rn
		 ,	A.seq
		 ,	A.title
		 ,	A.content
		 ,	A.reg_id
		 ,	A.reg_dt
		 from
            (
				SELECT
					seq
				,	title
				,	content
				,	reg_id
				,	CONVERT(CHAR(23),reg_dt,23) as reg_dt
				FROM dbo.NOTICE with(nolock)
            ) A
         ) where rnum between #{start} and # {end}


				
				
				SELECT
					seq
				,	title
				,	content
				,	reg_id
				,	CONVERT(CHAR(23),reg_dt,23) as reg_dt
				FROM dbo.NOTICE with(nolock)


         select 
			row_number() over (order by A.reg_dt desc) as rn
		 ,	A.seq
		 ,	A.title
		 ,	A.content
		 ,	A.reg_id
		 ,	A.reg_dt
		 from
            (
				SELECT
					seq
				,	title
				,	content
				,	reg_id
				,	CONVERT(CHAR(23),reg_dt,23) as reg_dt
				FROM dbo.NOTICE with(nolock)
            ) A

select * from (
            SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS rownum,
            seq, title,
            content, reg_id, CONVERT(CHAR(23),reg_dt,23) as reg_dt
            FROM dbo.NOTICE with(nolock)    
            ) A where rownum between 1 and 2




select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*) from dbo.QOO10_USER_REAL with(nolock))

/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-20   
	Description : 회원가입 : 아이디 검증과정
	     
	History	: 2021-06-20 Seunghwan Shin	#최초 생성  
*/
create proc dbo.kakao_sign_up_email_check
	@email varchar(200) -- 이메일 아이디
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_email = @email)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end

		declare @result int
		exec dbo.kakao_sign_up_email_check 'ssh9308@daum.net',@result output
		select @result



select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_email = 'ssh9308@daum.net'


CREATE INDEX IDX__QOO10_USER_REAL__QOOUSER_EMAIL ON dbo.QOO10_USER_REAL (qoouser_email)

CREATE INDEX IDX__QOO10_USER_REAL__QOOUSER_ID ON dbo.QOO10_USER_REAL (qoouser_id)


select * from dbo.KAKAO_ERR_LOG_TBL with(nolock)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*)-1 from dbo.QOO10_USER_REAL with(nolock))


CREATE TABLE dbo.KAKAO_ERR_LOG_TBL
(
	err_seq bigint identity(1,1) not null,
	user_ip_address varchar(200) not null,
	err_msg nvarchar(max) null
	
)

ALTER TABLE dbo.KAKAO_ERR_LOG_TBL ADD CONSTRAINT PK__KAKAO_ERR_LOG_TBL__ERR_SEQ__USER_IP_ADDRESS PRIMARY KEY (err_seq,user_ip_address)


alter table dbo.KAKAO_ERR_LOG_TBL add error_time datetime null



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-23   
	Description : 에러요인 입력
	     
	History	: 2021-06-23 Seunghwan Shin	#최초 생성  
			  2021-06-24 Seunghwan Shin	#error_time 추가
*/
alter proc dbo.kakao_error_log
	@user_ip_address varchar(200) -- 유저 아이피
,	@err_msg nvarchar(max)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	insert into dbo.KAKAO_ERR_LOG_TBL 
	(
		user_ip_address
	,	err_msg
	,	error_time
	)
	values 
	(
		@user_ip_address
	,	@err_msg
	,	getdate()
	);

end


select * from dbo.KAKAO_ERR_LOG_TBL with(nolock)

select * from dbo.QOO10_USER_REAL with(nolock)



SELECT * FROM dbo.TBLINSA
qoo10_total_login

SET TRANSACTION ISOLATION LEVEL SNAPSHOT
ALTER DATABASE ADMIN SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE


BEGIN TRAN
SELECT * FROM dbo.TBLINSA WHERE num = 1002


SELECT @@TRANCOUNT

ROLLBACK TRAN

UPDATE dbo.TBLINSA SET name = N'이순신' WHERE num = 1002




BEGIN TRAN
UPDATE dbo.TBLINSA SET name = N'리순자' WHERE num = 1002

select * from dbo.QOO10_USER_REAL with(nolock)

/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-29   
	Description : 회원 아이디 찾기
	     
	History	: 2021-06-29 Seunghwan Shin	#최초 생성  
*/
alter proc dbo.kakao_find_user_id
	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@qoouser_id varchar(100) = null output -- 유저 아이디
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	
	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_email = @qoouser_email and qoouser_phone_num = @qoouser_phone_num)
	begin
		select
			@qoouser_id = qoouser_id
		from dbo.QOO10_USER_REAL with(nolock)
		where qoouser_email = @qoouser_email 
		and qoouser_phone_num = @qoouser_phone_num

	end
	


end



select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = (select count(*)-3 from dbo.QOO10_USER_REAL with(nolock))


alter table dbo.QOO10_USER_REAL add qoouser_instance_pw_grant char(1)

update dbo.QOO10_USER_REAL set qoouser_phone_num = '01051393792' where qoouser_seq = 2000017


--01045557778

select * from dbo.



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-03   
	Description : 회원의 비밀번호를 찾기전 회원이 입력한 정보와 일치하는 아이디가 있는지 찾아주는 작업
	     
	History	: 2021-07-03 Seunghwan Shin	#최초 생성  
*/
create proc dbo.kakao_find_user_pw_exists
	@qoouser_id varchar(100)
,	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id and qoouser_email = @qoouser_email and qoouser_phone_num = @qoouser_phone_num)
	begin
		set @result = 1;
	end
	else
	begin
		set @result = -1;
	end
	
end



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-03   
	Description : 회원의 비밀번호를 임시비밀번호로 변경해주는 로직
	     
	History	: 2021-07-03 Seunghwan Shin	#최초 생성  
*/
alter proc dbo.kakao_user_modify_pw
	@qoouser_id varchar(100)
,	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@qoouser_pw varchar(800) -- 임시비밀번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @user_seq bigint;
	
	select 
		@user_seq = qoouser_seq 
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_id = @qoouser_id
	and qoouser_email = @qoouser_email
	and qoouser_phone_num = @qoouser_phone_num


	begin try
		begin tran
			update dbo.QOO10_USER_REAL 
			set qoouser_pw = @qoouser_pw
			,	qoouser_instance_pw_grant = 'Y'
			where qoouser_seq = @user_seq

			set @result = 1;

		commit tran
	end try
	begin catch
		set @result = -1;
		rollback tran
	end catch
end


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-23   
	Description : 에러요인 입력
	     
	History	: 2021-06-23 Seunghwan Shin	#최초 생성  
			  2021-06-24 Seunghwan Shin	#error_time 추가
*/
CREATE proc dbo.kakao_error_log
	@user_ip_address varchar(200) -- 유저 아이피
,	@err_msg nvarchar(max)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	insert into dbo.KAKAO_ERR_LOG_TBL 
	(
		user_ip_address
	,	err_msg
	,	error_time
	)
	values 
	(
		@user_ip_address
	,	@err_msg
	,	getdate()
	);

end


select * from dbo.KAKAO_ERR_LOG_TBL with(nolock)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-04   
	Description : 회원가입 - 고객의 휴대폰번호가 중복되는지 체크
	     
	History	: 2021-07-04 Seunghwan Shin	#최초 생성 
*/
CREATE proc dbo.kakao_sign_up_phone_num_check
	@user_phone_num varchar(20) -- 유저가 입력한 폰번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_phone_num = @user_phone_num)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end


declare @result int
		exec dbo.kakao_sign_up_phone_num_check '01046023792',@result output
		select @result





select * from dbo.QOO10_USER_REAL with(nolock) where 




/*
	Author      : Seunghwan Shin
	Create date : 2021-03-16 
	Description : ip 검증개체
	    
	History		: 2021-03-16 Seunghwan Shin	#최초 생성
				  2021-03-31 Seunghwan Shin	#마지막 회원접속시간,접속ip 추가
				  2021-04-03 Seunghwan Shin #자동로그인 방지 추가
				  2021-05-16 Seunghwan Shin #전반적으로 모두 수정
				  2021-05-26 Seunghwan Shin #비정상 로그인 로직 수정
				  2021-06-08 Seunghwan Shin #유저객체를 넘겨주기 위한 로직 수정
				  2021-07-06 Seunghwan Shin #임시비밀번호를 발급받은 유저를 바로 비밀번호 변경 페이지로 넘겨주기

*/
alter proc [dbo].[qoo10_total_login]
	@user_ip_address varchar(100)-- 접속한 ip주소
,	@qoouser_id varchar(100) -- 유저 id
,	@qoouser_pw varchar(800) -- 유저 pw
,	@login_code int output /*로그인에 관련된 코드 
							   0 : 로그인 성공
							,  1 : 로그인 실패(아이디,비번 오류) 
							, -1 : 아이피 접속 승인불가
							,  2 : 로그인은 성공했지만 마지막으로 접속했던 ip와 현재 접속하는 ip의 위치가 달라 자동로그인 방지 정책을 따라야한다.
							,  3 : 임시비밀번호 발급상태 -> 비밀번호 변경페이지로 옮겨줘야한다.*/ 
,	@user_seq int = -1 output -- 유저고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	begin try
		-- 밴 당한 아이피인지 확인해준다.
		if exists (select * from dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address) -- 벤당한 아이피의 경우
		begin
			set @login_code = -1
		end
		else -- 벤당하지 않은 아이피의 경우**
		begin
			if exists (select * from dbo.QOO10_USER_REAL  where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- 로그인 정보가 존재하는 경우
			begin
				
				declare @last_ip_address	varchar(100) -- 마지막으로 접속한 아이피 주소
				,		@qoouser_seq		bigint		 -- 유저의 고유번호

				select @qoouser_seq = qoouser_seq from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw
				select @last_ip_address = qoouser_lastlogin_ipaddress from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq
				
				--임시비밀번호를 발급받은 상태라면
				if (isnull((select qoouser_instance_pw_grant from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq),'N') = 'Y')
				begin
					set @login_code = 3 --로그인 성공 : 비밀번호를 바꿔야하는 상태

					--유저 고유번호 할당
					select @user_seq = @qoouser_seq
				end
				--임시비밀번호를 발급받지 않은 상태라면
				else
					if(@last_ip_address = @user_ip_address)-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같은경우
					begin
						set @login_code = 0 --로그인 성공	

						--유저 고유번호 할당
						select @user_seq = @qoouser_seq
						
						begin tran
						-- 로그인 성공시간 기록 남기기
						insert into dbo.QOO10USERLOG
						(
							log_user_seq
						,	log_user_id
						,	log_dt
						,	ip_address
						)
						values
						(
							@qoouser_seq
						,	@qoouser_id
						,	default
						,	@user_ip_address
						)

						SELECT * FROM DBO.QOO10USERLOG with(nolock)


						--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
						update dbo.QOO10_USER_REAL set 
							qoouser_lastlogin_datetime = getdate()
						,	qoouser_lastlogin_ipaddress = @user_ip_address
						where qoouser_id = @qoouser_id 

						commit tran
					end
					else-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같지 않은경우
					begin
						set @login_code = 2
					
						--유저 고유번호 할당
						select @user_seq = @qoouser_seq

					end

				begin
				
				end

				
			else--로그인 정보가 존재하지 않는 경우 --> 여기서 오류처리를 해주는게 맞아보인다.
			begin

				declare @try_count int

				begin tran
					--아이피 로그기록 남기기
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				SELECT * FROM DBO.LOGINTRYIP WITH(NOLOCK)


				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
				select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

				if (@try_count >= 4)
				begin
					begin tran
						insert into dbo.TBLBANNEDIPLIST values (@user_ip_address)
					commit tran
				end

				set @login_code = 1
			end
		end

	end try
	begin catch
		rollback tran
	end catch
end


select * from dbo.QOO10USERLOG with(nolock)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_instance_pw_grant = 'Y'


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-07   
	Description : 고객의 임시비밀번호를 고객이 지정한 비밀번호로 변경
	     
	History	: 2021-07-07 Seunghwan Shin	#최초 생성 
*/
alter proc dbo.kakao_user_pw_redefined_return
	@user_seq bigint -- 유저의 고유번호
,	@user_pw varchar(800) --유저가 지정한 비밀번호	
,	@user_id varchar(100) --유저의 아이디
,	@user_ip_address varchar(200) --유저의 아이피 주소
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	begin try
		
		begin tran
			update dbo.QOO10_USER_REAL 
			set qoouser_pw = @user_pw
			,	qoouser_instance_pw_grant = 'N'
			where qoouser_seq = @user_seq

									
			-- 로그인 성공시간 기록 남기기
			insert into dbo.QOO10USERLOG
			(
				log_user_seq
			,	log_user_id
			,	log_dt
			,	ip_address
			)
			values
			(
				@user_seq
			,	@user_id
			,	default
			,	@user_ip_address
			)

			--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
			update dbo.QOO10_USER_REAL set 
				qoouser_lastlogin_datetime = getdate()
			,	qoouser_lastlogin_ipaddress = @user_ip_address
			where qoouser_seq = @user_seq 


			set @result = 1;
		commit tran

	end try
	begin catch
		set @result = -1;
		rollback tran

	end catch
end

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = '2000017'

select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id ='byeanma123'


update dbo.QOO10_USER_REAL set qoouser_pw = '24b0015e0d850b1c796d7586d21072b5f8ebdc180805edc074cdf034b245478b' where qoouser_id ='admin'


update dbo.QOO10_USER_REAL set qoouser_lastlogin_ipaddress = '123.123.123' where qoouser_id ='byeanma123'



update dbo.QOO10_USER_REAL
set qoouser_lastlogin_ipaddress = '123.123'
where qoouser_seq = '2000017'


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성 
			  2021-05-19 Seunghwan Shin #top(),order by 절 추가
*/ 
CREATE proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select top(9)
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	order by adPriceMonthly
	

end



LOGINTRYIP


select * from dbo.tblinsa with(nolock)


DROP TABLE dbo.COMMENT_TEST


CREATE TABLE dbo.COMMENT_TEST
(
	comment_id		bigint not null,
	parent_id		bigint null,
	comment			nvarchar(500) not null,
	comment_date	datetime not null,
	author			varchar(20) not null
)

ALTER TABLE dbo.COMMENT_TEST ADD CONSTRAINT PK__COMMENT_TEST__COMMENT_ID PRIMARY KEY (comment_id)


INSERT INTO dbo.COMMENT_TEST VALUES (1,NULL,N'데이터베이스 어려운가요?',getdate(),'ssh9308');
INSERT INTO dbo.COMMENT_TEST VALUES (2,1,N'열심히 공부하시면 어렵지 않을겁니다!',getdate(),'kyj9787')
INSERT INTO dbo.COMMENT_TEST VALUES (3,2,N'친절한 답변 감사합니다!',getdate(),'ssh9308')

INSERT INTO dbo.COMMENT_TEST VALUES (4,1,N'SQL 안티패턴 책을 한번 봐보세요',getdate(),'korea1993')
INSERT INTO dbo.COMMENT_TEST VALUES (5,4,N'어려운 내용은 아닐까요?',getdate(),'mansae4433')
INSERT INTO dbo.COMMENT_TEST VALUES (6,4,N'그책은 입문서로는 좀 어렵지 않을까요?',getdate(),'respond9977')
INSERT INTO dbo.COMMENT_TEST VALUES (7,6,N'입문서로는 좀 어려울수 있겠군요 ㅜ',getdate(),'youngboys123')


SELECT c1.*,c2.* FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
inner JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id



SELECT c1.*,c2.* FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT OUTER JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id


SELECT 
	c1.comment
,	c2.comment
,	c3.comment
,	c4.comment 
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT OUTER JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
LEFT OUTER JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.comment_id = c3.parent_id
LEFT OUTER JOIN dbo.COMMENT_TEST c4 WITH(NOLOCK) ON c3.comment_id = c4.parent_id





SELECT c1.comment,c2.comment,c3.comment,c4.comment FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
INNER JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.comment_id = c3.parent_id
INNER JOIN dbo.COMMENT_TEST c4 WITH(NOLOCK) ON c3.comment_id = c4.parent_id



SELECT 
	comment_id
,	comment
,	author 
,	(SELECT COUNT(*) FROM dbo.COMMENT_TEST c2 WITH(NOLOCK) WHERE c1.comment_id = c2.parent_id) as comment_cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)



SELECT 
	c1.comment_id
,	c1.comment
,	c1.author
,	c1.parent_id
--,	COUNT(*)
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id


SELECT
*
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id




SELECT 
	comment_id
,	comment
,	author 
,	(SELECT COUNT(*) FROM dbo.COMMENT_TEST c2 WITH(NOLOCK) WHERE c1.comment_id = c2.parent_id) as comment_cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)



SELECT
	c1.comment_id
,	c1.comment
,	c1.author
,	c1.parent_id
,	c2.comment_id
--,	COUNT(c2.parent_id) AS cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
GROUP BY c2.comment_id,c1.comment_id
--GROUP BY c1.comment_id


--,c1.comment,c1.author


SELECT 
	comment_id
,	comment
,	author 
,	(SELECT COUNT(*) FROM dbo.COMMENT_TEST c2 WITH(NOLOCK) WHERE c1.comment_id = c2.parent_id) as comment_cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)



SELECT
	c1.comment_id
,	c1.comment
,	c1.author
,	COUNT(c2.parent_id) AS cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id AND c2.comment_id IS NOT NULL
GROUP BY c1.comment_id,c1.comment, c1.author



WHERE c2.comment_id IS NOT NULL


with cte
as
(
SELECT
	c1.comment_id as c1_comment_id
,	c1.parent_id as c1_parent_id
,	c1.comment as c1_comment
,	c1.comment_date as c1_comment_date
,	c1.author as c1_author
,	c2.comment_id as c2_comment_id
,	c2.parent_id as c2_parent_id
,	c2.comment as c2_comment
,	c2.comment_date as c2_comment_date
,	c2.author as author
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
)

select * from cte t1
inner join cte t2 on t1.c1_comment_id = t2.c2_parent_id
--left join cte t3 on t2.c1_comment_id = t3.c1_parent_id



SELECT
	*
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
LEFT JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.comment_id = c3.parent_id







LEFT JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.parent_id = c3.parent_id




SELECT 
	*
FROM
(
SELECT
	c1.comment_id
,	c1.parent_id
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
) AS p1
LEFT JOIN 
(
SELECT
	c1.comment_id
,	c1.parent_id
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
) AS p2
ON p1.parent_id = p2.comment_id
group by p2.comment_id




SELECT
	*
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id




--LEFT JOIN dbo.COMMENT_TEST c4 WITH(NOLOCK) ON c3.comment_id = c4.parent_id 



--??;;

drop table dbo.COMMENT_TEST_PATH

CREATE TABLE dbo.COMMENT_TEST_PATH
(
	comment_id		bigint not null,
	path			varchar(1000) null,
	comment			nvarchar(500) not null,
	comment_date	datetime not null,
	author			varchar(20) not null
)

ALTER TABLE dbo.COMMENT_TEST_PATH ADD CONSTRAINT PK__COMMENT_TEST_PATH__COMMENT_ID PRIMARY KEY (comment_id)


INSERT INTO dbo.COMMENT_TEST_PATH VALUES (1,'1/',N'데이터베이스 어려운가요?',getdate(),'ssh9308');
INSERT INTO dbo.COMMENT_TEST_PATH VALUES (2,'1/2/',N'열심히 공부하시면 어렵지 않을겁니다!',getdate(),'kyj9787')
INSERT INTO dbo.COMMENT_TEST_PATH VALUES (3,'1/2/3/',N'친절한 답변 감사합니다!',getdate(),'ssh9308')

INSERT INTO dbo.COMMENT_TEST_PATH VALUES (4,'1/4/',N'SQL 안티패턴 책을 한번 봐보세요',getdate(),'korea1993')
INSERT INTO dbo.COMMENT_TEST_PATH VALUES (5,'1/4/5/',N'어려운 내용은 아닐까요?',getdate(),'mansae4433')
INSERT INTO dbo.COMMENT_TEST_PATH VALUES (6,'1/4/6/',N'그책은 입문서로는 좀 어렵지 않을까요?',getdate(),'respond9977')
INSERT INTO dbo.COMMENT_TEST_PATH VALUES (7,'1/4/6/7/',N'입문서로는 좀 어려울수 있겠군요 ㅜ',getdate(),'youngboys123')



SELECT 
	COUNT(*) as cnt
FROM dbo.COMMENT_TEST_PATH WITH(NOLOCK)
WHERE path LIKE '1/%' 

INSERT INTO dbo.COMMENT_TEST_PATH VALUES (8,'1/4/8/',N'막상 봐보니 그렇게 어려운 내용은 아니더라고요~',GETDATE(),'asap9308')


SELECT * FROM dbo.COMMENT_TEST_PATH WITH(NOLOCK)

DROP TABLE dbo.COMMENT_TEST_NESTED


CREATE TABLE dbo.COMMENT_TEST_NESTED
(
	comment_id		bigint not null,
	nsleft			int not null,
	nsright			int not null,
	comment			nvarchar(500) not null,
	comment_date	datetime not null,
	author			varchar(20) not null
)

ALTER TABLE dbo.COMMENT_TEST_NESTED ADD CONSTRAINT PK__COMMENT_TEST_NESTED__COMMENT_ID PRIMARY KEY (comment_id)


INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (1,1,14,N'데이터베이스 어려운가요?',getdate(),'ssh9308');
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (2,2,5,N'열심히 공부하시면 어렵지 않을겁니다!',getdate(),'kyj9787')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (3,3,4,N'친절한 답변 감사합니다!',getdate(),'ssh9308')

INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (4,6,13,N'SQL 안티패턴 책을 한번 봐보세요',getdate(),'korea1993')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (5,7,8,N'어려운 내용은 아닐까요?',getdate(),'mansae4433')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (6,9,12,N'그책은 입문서로는 좀 어렵지 않을까요?',getdate(),'respond9977')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (7,10,11,N'입문서로는 좀 어려울수 있겠군요 ㅜ',getdate(),'youngboys123')


SELECT * FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK) 

SELECT * FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)


SELECT 
	c2.*
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK) ON c2.nsleft BETWEEN c1.nsleft AND c1.nsright
WHERE c1.comment_id = 4 AND c2.comment_id != 4


drop table dbo.COMMENT_TEST_NESTED

CREATE TABLE dbo.COMMENT_TEST_NESTED
(
comment_id bigint identity(1,1) not null,
nsleft int not null,
nsright int not null,
comment nvarchar(500) not null,
comment_date datetime not null,
author varchar(20) not null
)
ALTER TABLE dbo.COMMENT_TEST_NESTED ADD CONSTRAINT PK__COMMENT_TEST_NESTED__COMMENT_ID PRIMARY KEY (comment_id)

INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (1,14,N'데이터베이스 어려운가요?',getdate(),'ssh9308');
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (2,5,N'열심히 공부하시면 어렵지 않을겁니다!',getdate(),'kyj9787')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (3,4,N'친절한 답변 감사합니다!',getdate(),'ssh9308')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (6,13,N'SQL 안티패턴 책을 한번 봐보세요',getdate(),'korea1993')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (7,8,N'어려운 내용은 아닐까요?',getdate(),'mansae4433')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (9,12,N'그책은 입문서로는 좀 어렵지 않을까요?',getdate(),'respond9977')
INSERT INTO dbo.COMMENT_TEST_NESTED VALUES (10,11,N'입문서로는 좀 어려울수 있겠군요 ㅜ',getdate(),'youngboys123')

SELECT * FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)


SELECT  
c2.*
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK) ON c2.nsleft BETWEEN c1.nsleft AND c1.nsright
WHERE c1.comment_id = 4 AND c2.comment_id != 4



SELECT
c2.comment_id
, COUNT(c2.comment_id)
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK) ON c1.nsleft BETWEEN c2.nsleft and c2.nsright
WHERE c1.comment_id = 7
GROUP BY c2.comment_id



SELECT
MAX(c2.comment) AS content
, count(c2.comment) AS depth
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK) ON c1.nsleft BETWEEN c2.nsleft and c2.nsright
WHERE c1.comment_id = 5


BEGIN TRAN

ROLLBACK TRAN

DELETE dbo.COMMENT_TEST_NESTED WHERE comment_id = 4


SELECT
MAX(c2.comment) AS content
, count(c2.comment) AS depth
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK) ON c1.nsleft BETWEEN c2.nsleft and c2.nsright
WHERE c1.comment_id = 5



SELECT
c1.nsleft
, c2.nsleft
, c2.nsright
FROM dbo.COMMENT_TEST_NESTED c1 WITH(NOLOCK)
CROSS JOIN dbo.COMMENT_TEST_NESTED c2 WITH(NOLOCK)




SELECT
parent.comment
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
LEFT JOIN
WHERE me.comment_id = 6

ROLLBACK TRAN


BEGIN TRAN

DELETE dbo.COMMENT_TEST_NESTED WHERE comment_id = 4

ROLLBACK TRAN

SELECT
parent.*
, in_between.*
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK)
ON me.nsleft BETWEEN parent.nsleft and parent.nsright
LEFT OUTER JOIN dbo.COMMENT_TEST_NESTED in_between WITH(NOLOCK)
ON me.nsleft BETWEEN in_between.nsleft and in_between.nsright
AND in_between.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 6



--AND in_between.comment_id IS NULL

BEGIN TRAN

DELETE dbo.COMMENT_TEST_NESTED WHERE comment_id = 4

rollback tran

SELECT
top 1
parent.comment
, parent.comment_id
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK)
ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 6 AND parent.comment_id != 6
ORDER BY parent.nsleft DESC



SELECT * FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)

rollback tran

BEGIN TRAN


CREATE PROC dbo.add_comment_test_nested
	@parent_id bigint
,	@comment nvarchar(500)
,	@author varchar(20)
as
set nocount on
set transaction isolation level read uncommitted
begin

	declare @last_sibling int
	,		@last_nsright int

	SELECT
		@last_sibling = comment_id
	,	@last_nsright = nsright
	FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)
	WHERE nsright = (SELECT
	max(me.nsright)
	FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
	INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft AND parent.nsright
	WHERE parent.comment_id = @parent_id)

	BEGIN TRAN
		UPDATE dbo.COMMENT_TEST_NESTED
		SET nsleft = CASE WHEN nsleft > @last_nsright THEN nsleft + 2 ELSE nsleft END
		,	nsright += 2
		WHERE nsright > @last_nsright



		INSERT INTO dbo.COMMENT_TEST_NESTED
		(
			nsleft
		,	nsright
		,	comment
		,	comment_date
		,	author
		)
		VALUES	
		(
			@last_nsright
		,	@last_nsright + 1
		,	@comment
		,	GETDATE()
		,	@author
		)

	COMMIT TRAN
	
	IF @@ERROR <> 0
		ROLLBACK TRAN
end




SELECT @@TRANCOUNT

ROLLBACK TRAN

BEGIN TRAN



EXEC add_comment_test_nested 5,N'저는 좀 어렵던데...','gifting4490' -- #5 의 답글 -> #8

EXEC add_comment_test_nested 4,N'어느 출판사 인가요?','harry9988' -- #4 의 답글 -> #9

EXEC add_comment_test_nested 7,N'그정도로 어려운 책은 아닌듯?','kicker933' --#7의 답글 -> #10



SELECT
	parent.*
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 8


SELECT
	parent.*
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 9

SELECT
	parent.*
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 10


--AND parent.comment_id !=8




SELECT * FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)

SELECT
comment_id
, nsleft
, nsright
FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)
WHERE nsright = (SELECT
max(me.nsright)
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft AND parent.nsright
WHERE parent.comment_id = 3)




SELECT
parent.comment
, parent.comment_id
, parent.nsleft
, parent.nsright
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft AND parent.nsright
WHERE me.comment_id = 10 AND parent.comment_id != 10





SELECT
comment_id
, nsleft
, nsright
, comment
FROM dbo.COMMENT_TEST_NESTED WITH(NOLOCK)
WHERE nsright = (SELECT
max(me.nsright)
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft AND parent.nsright
WHERE parent.comment_id = 4 AND me.comment_id != 4)




--AND parent.comment_id != 8
SELECT
max(me.nsright)
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft AND parent.nsright
WHERE parent.comment_id = 4 AND me.comment_id != 4






select @@trancount

rollback tran

begin tran

UPDATE dbo.COMMENT_TEST_NESTED
SET nsleft = CASE WHEN nsleft > 4 THEN nsleft + 2 ELSE nsleft END
,	nsright += 2
WHERE nsright > 4

INSERT INTO dbo.COMMENT_TEST_NESTED
(
	nsleft
,	nsright
,	comment
,	comment_date
,	author
)
VALUES
(
	5
,	6
,	N'공부 열심히 하셨나봐요 ~'
,	GETDATE()
,	'shambala3421'
)


SELECT
	parent.*
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 8 AND parent.comment_id != 8



rollback tran

SELECT
parent.comment
, parent.comment_id
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK) ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 5 AND parent.comment_id != 5





SELECT
parent.comment
, parent.comment_id
, parent.nsleft
, parent.nsright
FROM dbo.COMMENT_TEST_NESTED me WITH(NOLOCK)
INNER JOIN dbo.COMMENT_TEST_NESTED parent WITH(NOLOCK)
ON me.nsleft BETWEEN parent.nsleft and parent.nsright
WHERE me.comment_id = 5 AND parent.comment_id != 5



CREATE TABLE dbo.COMMENT_TEST_CLOSER
(
	comment_id bigint identity(1,1) not null,
	comment nvarchar(500) not null,
	comment_date datetime not null,
	author varchar(20) not null
)
ALTER TABLE dbo.COMMENT_TEST_CLOSER ADD CONSTRAINT PK__COMMENT_TEST_CLOSER__COMMENT_ID PRIMARY KEY (comment_id)

INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'데이터베이스 어려운가요?',getdate(),'ssh9308');
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'열심히 공부하시면 어렵지 않을겁니다!',getdate(),'kyj9787')
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'친절한 답변 감사합니다!',getdate(),'ssh9308')
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'SQL 안티패턴 책을 한번 봐보세요',getdate(),'korea1993')
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'어려운 내용은 아닐까요?',getdate(),'mansae4433')
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'그책은 입문서로는 좀 어렵지 않을까요?',getdate(),'respond9977')
INSERT INTO dbo.COMMENT_TEST_CLOSER VALUES (N'입문서로는 좀 어려울수 있겠군요 ㅜ',getdate(),'youngboys123')


DROP TABLE dbo.TREEPATH

CREATE TABLE dbo.TREEPATH
(
	ancester	bigint not null,
	descendant	bigint not null,
	path_length bigint not null
)

ALTER TABLE dbo.TREEPATH ADD CONSTRAINT PK__TREEPATH__ANCESTER__DESCENDANT PRIMARY KEY (ancester,descendant)

INSERT INTO dbo.TREEPATH VALUES (1,1,0)
INSERT INTO dbo.TREEPATH VALUES (1,2,1)
INSERT INTO dbo.TREEPATH VALUES (1,3,2)
INSERT INTO dbo.TREEPATH VALUES (1,4,1)
INSERT INTO dbo.TREEPATH VALUES (1,5,2)
INSERT INTO dbo.TREEPATH VALUES (1,6,2)
INSERT INTO dbo.TREEPATH VALUES (1,7,3)
INSERT INTO dbo.TREEPATH VALUES (2,2,0)
INSERT INTO dbo.TREEPATH VALUES (2,3,1)
INSERT INTO dbo.TREEPATH VALUES (3,3,0)
INSERT INTO dbo.TREEPATH VALUES (4,4,0)
INSERT INTO dbo.TREEPATH VALUES (4,5,1)
INSERT INTO dbo.TREEPATH VALUES (4,6,1)
INSERT INTO dbo.TREEPATH VALUES (4,7,2)
INSERT INTO dbo.TREEPATH VALUES (5,5,0)
INSERT INTO dbo.TREEPATH VALUES (6,6,0)
INSERT INTO dbo.TREEPATH VALUES (6,7,1)
INSERT INTO dbo.TREEPATH VALUES (7,7,0)





SELECT
	d.*
FROM dbo.COMMENT_TEST_CLOSER c WITH(NOLOCK)
INNER JOIN dbo.TREEPATH t WITH(NOLOCK) ON c.comment_id = t.descendant
LEFT JOIN dbo.COMMENT_TEST_CLOSER d WITH(NOLOCK) ON d.comment_id = t.ancester
WHERE t.descendant = 7 AND t.ancester != 7 



SELECT
	d.*
FROM dbo.COMMENT_TEST_CLOSER c WITH(NOLOCK)
INNER JOIN dbo.TREEPATH t WITH(NOLOCK) ON c.comment_id = t.descendant
LEFT JOIN dbo.COMMENT_TEST_CLOSER d WITH(NOLOCK) ON d.comment_id = t.ancester
WHERE t.descendant = 7 AND t.ancester != 7 AND t.path_length = 1


SELECT 
	t.ancester
,	8
FROM dbo.TREEPATH t WITH(NOLOCK)
WHERE t.descendant = 5
UNION ALL
SELECT 8,8


SELECT  
	comment_id 
,	comment 
,	author  
,	(SELECT COUNT(*) FROM dbo.COMMENT_TEST c2 WITH(NOLOCK) WHERE c1.comment_id = c2.parent_id) as comment_cnt 
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)



SELECT * FROM dbo.COMMENT_TEST WITH(NOLOCK)


BEGIN TRAN

DELETE dbo.COMMENT_TEST WHERE comment_id = 4


SELECT * FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
WHERE c1.parent_id = 1



SELECT 
    c1.comment,c2.comment,c3.comment,c4.comment 
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK) 
LEFT OUTER JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id 
LEFT OUTER JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.comment_id = c3.parent_id 
LEFT OUTER JOIN dbo.COMMENT_TEST c4 WITH(NOLOCK) ON c3.comment_id = c4.parent_id



WHERE c1.parent_id = 1

SELECT @@TRANCOUNT

ROLLBACK TRAN


SELECT 
	t.ancester 
,	8 
,	t.path_length + 1 
FROM dbo.TREEPATH t WITH(NOLOCK) 
WHERE t.descendant= 5 


SELECT 
	T.* 
FROM dbo.COMMENT_TEST_CLOSER c WITH(NOLOCK) 
INNER JOIN dbo.TREEPATH t WITH(NOLOCK) ON c.comment_id = t.descendant 
WHERE t.descendant = 7 AND t.ancester != 7




