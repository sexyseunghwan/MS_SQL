


--아래의 테이블은 일단 보류를 해놓는게 좋을거 같음.
create table dbo.APPLEOPTION
(
	optionseq int identity(1,1) not null,

)

drop table dbo.APPLEBUYTBL


drop table dbo.APPLEBUYTBL

create table dbo.APPLEBUYTBL
(
	buyseq int identity(1,1) not null,
	userseq int not null,
	prodserial int not null,
	quantity int not null,
	buydate date not null
)

ALTER TABLE dbo.APPLEBUYTBL ADD CONSTRAINT [PK__APPLEBUYTBL__BUYSEQ] PRIMARY KEY CLUSTERED (buyseq)


select count(*) from dbo.APPLEBUYTBL with(nolock)

select * from dbo.APPLEBUYTBL with(nolock)


select q.id,q.gender,ac.prodname,ac.price,a.quantity from dbo.QOOUSERTBL q
	inner join dbo.APPLEBUYTBL a on q.idseq = a.userseq
	inner join dbo.APPLEINC ac on ac.serial = a.prodserial
	where YEAR(a.buydate) = '2013'



drop table dbo.APPLEBUYTBL

go

create proc dbo.apple_buy_go
(
	@userseq int,
	@prodserial int,
	@quantity int,
	@buydate date
)
as
begin
set nocount on 
set transaction isolation level read uncommitted
	
	insert into dbo.APPLEBUYTBL values (@userseq,@prodserial,@quantity,@buydate)


	if @@error <> 0 
	begin 
		return -1 
	end
end


exec dbo.apple_buy_go 1,11,2,'21-01-01'



go

--drop table dbo.APPLEINC

create table dbo.APPLEINC 
(	 
	prodserial int identity(1,1) not null, -- 제품 고유 코드 
	prodname varchar(100) not null, -- 제품 이름 
	price int not null, -- 가격 
	prodgroup int not null, -- 제품 그룹 1 : 스마트폰, 2 : 태블릿 pc, 3 : 컴퓨터 , 4 : 액세서리 
)

ALTER TABLE dbo.APPLEINC ADD CONSTRAINT PK__APPLEINC__PRODSERIAL PRIMARY KEY CLUSTERED (prodserial)

insert into dbo.APPLEINC values ('iphone12 mini',1200000,1)
insert into dbo.APPLEINC values ('iphone12',1400000,1)
insert into dbo.APPLEINC values ('iphone pro',1600000,1)
insert into dbo.APPLEINC values ('iphone pro max',1900000,1)
insert into dbo.APPLEINC values ('ipad 9th',400000,2);
insert into dbo.APPLEINC values ('ipad mini 3th',500000,2);
insert into dbo.APPLEINC values ('ipad air 3th',750000,2);
insert into dbo.APPLEINC values ('ipad pro 4th 11',990000,2);
insert into dbo.APPLEINC values ('ipad pro 4th 12.9',1190000,2);
insert into dbo.APPLEINC values ('apple pencil 1th',120000,4);
insert into dbo.APPLEINC values ('apple pencil 2th',150000,4);
insert into dbo.APPLEINC values ('airpod 1th',110000,4);
insert into dbo.APPLEINC values ('airpod 2th',190000,4);
insert into dbo.APPLEINC values ('airpod 3th',230000,4);
insert into dbo.APPLEINC values ('airpod pro',320000,4);
insert into dbo.APPLEINC values ('apple watch se',360000,4);
insert into dbo.APPLEINC values ('apple watch 6th',600000,4);
insert into dbo.APPLEINC values ('apple watch pro',1050000,4);
insert into dbo.APPLEINC values ('apple watch pro hermes',1500000,4);
insert into dbo.APPLEINC values ('mac book air',1300000,3);
insert into dbo.APPLEINC values ('mac book pro 13',1700000,3);
insert into dbo.APPLEINC values ('mac book pro 16',2300000,3);


--select * from dbo.APPLEINC with(nolock)





--QOOUSERTBLTEST

--drop table dbo.QOO10USER

create table dbo.QOO10USER
(
	usercode int identity(1,1) not null,
	id varchar(100) not null,
	email varchar(200) null,
	gender char(1) null,
	nation char(2) null,
	ipaddress varchar(200) null
)




SELECT * FROM dbo.QOO10USER WITH(NOLOCK)

SELECT * FROM dbo.QOOUSERTBL WITH(NOLOCK)

create table dbo.QOOUSERTBL
(
	idseq int identity(1,1) not null,
	id varchar(100) not null,
	email varchar(200) null,
	gender char(1) null,
	nation char(2) null,
	ipaddress varchar(200) null
)

alter table dbo.QOOUSERTBL add constraint [PK__QOOUSERTBL__IDSEQ] PRIMARY KEY CLUSTERED (idseq)

create index [IDX__QOOUSERTBL__ID] ON dbo.QOOUSERTBL (id)

select * from dbo.QOOUSERTBL with(nolock)

select email from dbo.QOOUSERTBL with(nolock) where id = 'chinys33'


--create index IDX__QOOUSERTBL__ID ON dbo.QOOUSERTBL (id)

--drop index IDX__QOOUSERTBL__NATION on dbo.QOOUSERTBL


drop table dbo.QOOUSERTBL

truncate table dbo.QOOUSERTBL

go

create proc dbo.insert_tuning
(
	@id varchar(100),
	@email varchar(200),
	@gender char(1),
	@nation char(2),
	@ipaddress varchar(200)
)
as
begin
set nocount on 
set transaction isolation level read uncommitted

	insert into dbo.QOOUSERTBL values (@id,@email,@gender,@nation,@ipaddress)
	
	if @@error <> 0 
	begin 
		return -1 
	end
end


exec dbo.insert_tuning '211434329','jacqulineleong@gmail.com','F','SG','203.117.37.215'

--DROP TABLE dbo.SELLER_INFO_TEST

CREATE TABLE dbo.SELLER_INFO_TEST
(
	seller_id varchar(100) not null,
	seller_name varchar(50) not null,
	seller_grade int not null
)

insert into dbo.SELLER_INFO_TEST values ('hr6799','harry',1)
insert into dbo.SELLER_INFO_TEST values ('jh12032','jhone',3)
insert into dbo.SELLER_INFO_TEST values ('kly9080','kelly',6)
insert into dbo.SELLER_INFO_TEST values ('mml43','maserti',3)
insert into dbo.SELLER_INFO_TEST values ('kee123','chyki',5)
insert into dbo.SELLER_INFO_TEST values ('maeng9','maenha',2)
insert into dbo.SELLER_INFO_TEST values ('legeno1974','zelda',4)
insert into dbo.SELLER_INFO_TEST values ('klesin98000','hustler',7)
insert into dbo.SELLER_INFO_TEST values ('plol1998','polhamer',5)
insert into dbo.SELLER_INFO_TEST values ('mountain1668','aphelacia',1)


select * from dbo.SELLER_INFO_TEST 

--select count(*) from dbo.SELLER_INFO_TEST with(nolock)

SELECT * FROM dbo.SELLER_INFO_TEST WITH(NOLOCK)

ALTER TABLE dbo.SELLER_INFO_TEST ADD CONSTRAINT PK__SELLER_INFO_TEST__SELLER_ID PRIMARY KEY CLUSTERED (seller_id)

INSERT INTO dbo.SELLER_INFO_TEST VALUES ('icandoit','mario',1)

INSERT INTO dbo.SELLER_INFO_TEST VALUES ('klfe1654','koku',6)

select * from dbo.SELLER_INFO_TEST



-- QOO10 의 회원 테이블(더미데이터로 만든것)
create table dbo.QOO10USER 
( 
	idseq int identity(1,1) not null,--회원고유코드 
	id varchar(100) not null,--회원 아이디 
	email varchar(200) null,--회원 이메일 
	gender char(1) null,--회원 성별 
	nation char(2) null,-- 회원 국가 
	ipaddress varchar(200) null-- 회원 아이피주소 
)

ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__IDSEQ PRIMARY KEY CLUSTERED (idseq)
-- QOO10 에서 APPLE 기기를 산 내역(더미데이터)
create table dbo.APPLEBUYTBL 
( 
	buyseq int identity(1,1) not null,  -- 구매코드
	userseq int not null,  -- 회원고유코드
	prodserial int not null,  -- 제품 고유 코드
	quantity int not null,  -- 수량
	buydate date not null  -- 구매 일자
)

drop index IDX__APPLEINC__TEST on dbo.APPLEBUYTBL
drop index IDX__APPLEINC__TEST2 on dbo.APPLEBUYTBL


ALTER TABLE dbo.APPLEBUYTBL ADD CONSTRAINT PK__APPLEBUYTBL__BUYSEQ PRIMARY KEY CLUSTERED (buyseq)

select count(*) from dbo.APPLEBUYTBL with(nolock)

-- QOO10 에 존재하는 애플기기 내역(더미데이터)
create table dbo.APPLEINC 
(	 
	prodserial int identity(1,1) not null, -- 제품 고유 코드 
	prodname varchar(100) not null, -- 제품 이름 
	price int not null, -- 가격 
	prodgroup int not null, -- 제품 그룹 1 : 스마트폰, 2 : 태블릿 pc, 3 : 컴퓨터 , 4 : 액세서리 
)

ALTER TABLE dbo.APPLEINC ADD CONSTRAINT PK__APPLEINC__PRODSERIAL PRIMARY KEY CLUSTERED (prodserial)


go
--drop proc 


CREATE PROC dbo.sh_test_tuning 
( 
	@userseq int,--회원 고유코드 
	@prodname varchar(100), -- 상품이름 
	@start_dt datetime, -- 시작날짜 
	@end_dt datetime -- 끝 날짜 
) 
AS 
BEGIN 
    set nocount on  
    set transaction isolation level read uncommitted 
	
	select  
		ac.prodname, 
		qu.id, 
		ac.price, 
		ab.quantity, 
		ab.buydate, 
		ab.quantity*ac.price as totalprice 
	from dbo.QOO10USER qu with(nolock) 
	inner join dbo.APPLEBUYTBL ab on qu.usercode = ab.userseq 
	inner join dbo.APPLEINC ac on ac.prodserial = ab.prodserial 
	where qu.usercode = @userseq and ac.prodname = @prodname and ab.buydate between @start_dt and @end_dt 
END

exec dbo.sh_test_tuning 777,'airpod 1th','2016-08-07','2018-08-07'


select top 10 * from dbo.APPLEBUYTBL with(nolock)

select * from dbo.APPLEINC with(nolock)

select * from dbo.QOO10USER with(nolock)

--ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)


-- QOO10 의 회원 테이블(더미데이터로 만든것)
create table dbo.QOO10USER 
( 
	usercode int identity(1,1) not null,--회원고유코드 
	id varchar(100) not null,--회원 아이디 
	email varchar(200) null,--회원 이메일 
	gender char(1) null,--회원 성별 
	nation char(2) null,-- 회원 국가 
	ipaddress varchar(200) null-- 회원 아이피주소 
)

ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)
-- QOO10 에서 APPLE 기기를 산 내역(더미데이터)
create table dbo.APPLEBUYTBL 
( 
	buyseq int identity(1,1) not null,  -- 구매코드
	userseq int not null,  -- 회원고유코드
	prodserial int not null,  -- 제품 고유 코드
	quantity int not null,  -- 수량
	buydate date not null  -- 구매 일자
)

ALTER TABLE dbo.APPLEBUYTBL ADD CONSTRAINT PK__APPLEBUYTBL__BUYSEQ PRIMARY KEY CLUSTERED (buyseq)

-- QOO10 에 존재하는 애플기기 내역(더미데이터)
create table dbo.APPLEINC 
(	 
	prodserial int identity(1,1) not null, -- 제품 고유 코드 
	prodname varchar(100) not null, -- 제품 이름 
	price int not null, -- 가격 
	prodgroup int not null, -- 제품 그룹 1 : 스마트폰, 2 : 태블릿 pc, 3 : 컴퓨터 , 4 : 액세서리 
)

ALTER TABLE dbo.APPLEINC ADD CONSTRAINT PK__APPLEINC__PRODSERIAL PRIMARY KEY CLUSTERED (prodserial)


DROP PROC dbo.sh_test_tuning 

CREATE PROC dbo.sh_test_tuning 
( 
	@userseq int,--회원 고유코드 
	@prodname varchar(100), -- 상품이름 
	@start_dt datetime, -- 시작날짜 
	@end_dt datetime -- 끝 날짜 
) 
AS 
BEGIN 
    set nocount on  
    set transaction isolation level read uncommitted 
	
	select  
		ac.prodname, 
		qu.id, 
		ac.price, 
		ab.quantity, 
		ab.buydate, 
		ab.quantity*ac.price as totalprice 
	from dbo.QOO10USER qu with(nolock) 
	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
	inner join dbo.APPLEINC ac with(nolock,forceseek) on ac.prodserial = ab.prodserial 
	where qu.usercode = @userseq and ac.prodname = @prodname and ab.buydate between @start_dt and @end_dt 
END


CREATE PROC dbo.sh_test_tuning_basic
( 
	@userseq int,--회원 고유코드 
	@prodname varchar(100), -- 상품이름 
	@start_dt datetime, -- 시작날짜 
	@end_dt datetime -- 끝 날짜 
) 
AS 
BEGIN 
    set nocount on  
    set transaction isolation level read uncommitted 
	
	select  
		ac.prodname, 
		qu.id, 
		ac.price, 
		ab.quantity, 
		ab.buydate, 
		ab.quantity*ac.price as totalprice 
	from dbo.QOO10USER qu with(nolock) 
	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
	inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial 
	where qu.usercode = @userseq and ac.prodname = @prodname and ab.buydate between @start_dt and @end_dt 
END






CREATE INDEX IDX__APPLEBUYTBL__USERSEQ__BUYDATE ON dbo.APPLEBUYTBL (userseq,buydate)

DROP INDEX IDX__APPLEBUYTBL__USERSEQ__PRODSERIAL__BUYDATE ON dbo.APPLEBUYTBL

CREATE INDEX IDX__APPLEINC__PRODNAME ON dbo.APPLEINC (prodname)

DROP INDEX IDX__APPLEINC__PRODNAME ON dbo.APPLEINC

CREATE INDEX IDX__APPLEBUYTBL__USERSEQ ON dbo.APPLEBUYTBL (userseq)

CREATE INDEX IDX__APPLEBUYTBL__BUYDATE ON dbo.APPLEBUYTBL (buydate)

--DROP INDEX IDX__APPLEBUYTBL__BUYDATE ON dbo.APPLEBUYTBL

--DROP INDEX IDX__APPLEBUYTBL__USERSEQ ON dbo.APPLEBUYTBL

--exec dbo.sh_test_tuning 777,'airpod 1th','2016-08-07','2018-08-07' -- 777번호의 회원이 airpod 1th를 2016-08-07 ~ 2018-08-07 사이에 구매한적 있는지 확인하는 데이터


--drop proc dbo.sh_test_tuning_basic

--CREATE PROC dbo.sh_test_tuning_basic
--( 
--	@userseq int,--회원 고유코드 
--	@prodname varchar(100), -- 상품이름 
--	@start_dt datetime, -- 시작날짜 
--	@end_dt datetime -- 끝 날짜 
--) 
--AS 
--BEGIN 
--    set nocount on  
--    set transaction isolation level read uncommitted 
	
--	select  
--		ac.prodname, 
--		qu.id, 
--		ac.price, 
--		ab.quantity, 
--		ab.buydate, 
--		ab.quantity*ac.price as totalprice 
--	from dbo.QOO10USER qu with(nolock) 
--	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
--	inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial 
--	where qu.usercode = @userseq and ac.prodname = @prodname and ab.buydate between @start_dt and @end_dt 
--END


----어떤 고객이 가장 많은 지출을 했나
	
--	with cte_sh_test(ac_prodname,qu_id,ac_price,ab_quantity,ab_buydate)
--	as
--	(
--		select  
--			ac.prodname, 
--			qu.id, 
--			ac.price, 
--			ab.quantity, 
--			ab.buydate 
--		from dbo.QOO10USER qu with(nolock) 
--		inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
--		inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial
--	)



--	select  
--			qu.id,
--			--ac.prodname,
--			--ac.price, 
--			--ab.quantity, 
--			--ab.buydate
--			sum(ac.price*ab.quantity) as totalsum
--		from dbo.QOO10USER qu with(nolock) 
--		inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
--		inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial
--	where ab.buydate between '2015-01-01' and '2019-01-01'
--	group by qu.id
--	order by totalsum desc
	
	
	
	
--	--and qu_id = (select 
--	--																			top 1 qu_id
--	--																	from cte_sh_test
--	--																	where ab_buydate between '2015-01-01' and '2019-01-01'
--	--																	group by qu_id
--	--																	order by sum(ac_price*ab_quantity) desc)





--	select  
--		ac.prodname, 
--		qu.id, 
--		ac.price, 
--		ab.quantity, 
--		ab.buydate, 
--		--ab.quantity*ac.price as totalprice 
--	from dbo.QOO10USER qu with(nolock) 
--	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
--	inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial--	where ab.buydate between '2015-01-01' and '2019-01-01' and qu.id = -- APPLEBUYTBL-- APPLEINCselect * from dbo.HACKEDiNFO with(nolock)select count(*) from dbo.QOO10USER with(nolock)select count(*) from dbo.APPLEBUYTBL with(nolock)