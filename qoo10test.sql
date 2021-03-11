

create table dbo.APPLEBUYTBL 
( 
	buyseq int identity(1,1) not null,  -- 구매코드
	userseq int not null,  -- 회원고유코드
	prodserial int not null,  -- 제품 고유 코드
	quantity int not null,  -- 수량
	buydate date not null  -- 구매 일자
)

ALTER TABLE dbo.APPLEBUYTBL ADD CONSTRAINT PK__APPLEBUYTBL__BUYSEQ PRIMARY KEY CLUSTERED (buyseq)


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


select count(*) from dbo.QOO10USER with(nolock)





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
-- 로그인시도 얼마나 하는지 데이터
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


/*
	Author      : Seunghwan Shin
	Create date : 2021-03-11 
	Description : ip 검증개체
	    
	History		: 2021-03-11 Seunghwan Shin	#최초 생성

*/
create proc [dbo].[qoo10_new_ip_check]
	@user_ip_address varchar(100),-- 유저의 ip주소
	@pass_fail char(1) output-- 'y'면 pass 'n'이면 block
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	--declare @error int = 0 -- 에러의 갯수
	declare @try_count int -- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
	set @pass_fail = 'Y' -- 접속승인 할것인지 안할것인지 판단.

begin try
	begin tran
		-- 아이피 로그기록 남기기
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

	-- 밴 당한 아이피인지 확인해준다.
	if ((select count(*) from dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address) <> 0)
	begin
		set @pass_fail = 'N'
	end


end try
begin catch
	rollback tran
end catch


end

select * from dbo.LOGINTRYIP

select * from dbo.TBLBANNEDIPLIST with(nolock)

declare @result char(1)
exec qoo10_new_ip_check '192.168.0.1',@result output
print @result