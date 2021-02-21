

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

select * from QOO10USER with(nolock)


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

update dbo.QOO10USER set hascoin = 1500000 where usercode = 15001

select * from dbo.QOO10SELLER WITH(NOLOCK)

update dbo.QOO10SELLER set seller_hascoin = 0 where sellercode=1
