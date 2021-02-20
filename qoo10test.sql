select count(*) from dbo.QOO10USER with(nolock)select * from dbo.QOO10USER with(nolock)select id,count(*) from dbo.QOO10USER with(nolock)group by idhaving count(*) > 1drop table dbo.QOO10USER-- QOO10 의 회원 테이블(더미데이터로 만든것)
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
)ALTER TABLE dbo.QOO10USER ADD CONSTRAINT PK__QOO10USER__USERCODE PRIMARY KEY CLUSTERED (usercode)select count(*) from QOO10USER with(nolock)select * from QOO10USER with(nolock)select count(*) from dbo.APPLEBUYTBL with(nolock)select * from 


/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 더미데이터 생성 : 회원관련
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성

*/create proc [dbo].[qoo10_dummy_init]	@id varchar(100),	@pw varchar(100),	@email varchar(200),	@gender char(1),	@nation char(2),	@ipaddress varchar(200),	@coin intasset nocount on
set transaction isolation level read uncommittedbegin	insert into dbo.QOO10USER values (@id,@pw,@email,@gender,@nation,@ipaddress,@coin)	if @@error <> 0	begin		return 0;	endend--drop proc qoo10_login/*
	Author      : Seunghwan Shin
	Create date : 2021-02-20 
	Description : 로그인 처리
	    
	History		: 2021-02-20 Seunghwan Shin	#최초 생성

*/create proc [dbo].[qoo10_login]	@inputid varchar(100),	@inputpw varchar(100)asset nocount on
set transaction isolation level read uncommittedbegin		select count(*) as cnt from dbo.QOO10USER with(nolock) where id = @inputid and pw = @inputpw;	endselect * from dbo.QOO10USER with(nolock)--select count(*) as cnt from dbo.QOO10USER with(nolock) where id = 'ayyyk544846' and pw = '%jbiO6s@OPj"=l';