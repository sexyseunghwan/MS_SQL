

select * from APPLEINC with(nolock)

select count(*) from dbo.QOO10USER with(nolock)

select * from dbo.QOO10USER with(nolock)

select id,count(*) from dbo.QOO10USER with(nolock)
group by id
having count(*) > 1

drop table dbo.QOO10USER

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


insert into dbo.QOO10USER values ('%s','%s','%s','%s','%s','%s',%d)

--
ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)

ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)
ALTER TABLE dbo.QOO10USER ADD CONSTRAINT CK__QOO10USER__HASCOIN CHECK (hascoin >= 0)

select * from dbo.QOO10USER with(nolock)

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

select * from 


/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 더미데이터 생성 : 회원관련
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성

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

create table dbo.QOO10USERLOG 
(
	log_seq bigint identity(1,1) not null,
	log_user_id varchar(100) not null,
	log_dt datetime not null,
	ip_address varchar(100) not null
)

ALTER TABLE dbo.QOO10USERLOG add constraint PK__QOO10USERLOG__LOG_SEQ PRIMARY KEY (log_seq)
ALTER TABLE dbo.QOO10USERLOG add constraint DF__QOO10USERLOG__LOG_DT DEFAULT getdate() FOR log_dt 

SELECT * FROM dbo.QOO10USERLOG WITH(NOLOCK)

ALTER TABLE dbo.QOO10SELLER ADD CONSTRAINT PK__QOO10SELLER__SELLERCODE PRIMARY KEY CLUSTERED (sellercode)

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



--select * from dbo.LOGINTRYIP with(nolock)

--drop table dbo.LOGINTRYIP
-- 로그인시도 얼마나 하는지 데이터
CREATE TABLE dbo.LOGINTRYIP
(
	ip_address_seq bigint identity(1,1) not null,--기본키역할
	ip_address varchar(100),-- 아이피주소
	try_time datetime not null --접속시간
)

ALTER TABLE dbo.LOGINTRYIP ADD CONSTRAINT  PK__LOGINTRYIP__IP_ADDRESS_SEQ PRIMARY KEY CLUSTERED (ip_address_seq)
ALTER TABLE dbo.LOGINTRYIP add constraint DF__LOGINTRYIP__TRY_TIME DEFAULT getdate() FOR try_time 

--벤당한 아이피 리스트 목록
CREATE TABLE dbo.TBLBANNEDIPLIST
(
	banned_ip_address varchar(100) not null,--벤시킬 아이피

)

ALTER TABLE dbo.TBLBANNEDIPLIST ADD CONSTRAINT PK__TBLBANNEDIPLIST__BANNED_IP_ADDRESS PRIMARY KEY CLUSTERED (banned_ip_address)


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
		
	declare @try_count int,--시도한 횟수 : 10초안에 4번이상 시도하면, 밴을 시킨다.
	
	select @try_count = count(*) from 
				

end