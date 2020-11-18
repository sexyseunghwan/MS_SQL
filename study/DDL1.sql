
-- Data definition language (ddl)을 알아보자

-- 이곳에 있는 개념
-- 테이블 생성, 제약조건 걸기

-- 아래대로 작성하는게 좋다.

--  table 생성에 대해서 알아보자구나
--  **테이블명은 대문자, 컬럼명은 소문자로 지정해준다.** -> 규칙으로 정하자 : 해당 규칙은 회사에 따라 다를 수 있다.

-- 테이블 생성 첫번째 방법
go
create table [dbo].[TBLTESTTABLE](
	[test_seq_no] [bigint] IDENTITY(1,1) NOT NULL,
	[test_name] [varchar](50) NOT NULL,
	[reg_dt] [datetime] NOT NULL,
	[reg_id] [varchar](25) NOT NULL,
	[chg_dt] [datetime] NULL,
	[chg_id] [varchar](25) NULL
)

go

-- 테이블 생성 두번째 방법
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)


go

-- 테이블의 성질을 확인해주는 시스템 프로시저라고 생각해주면 된다. 세가지로 사용해도 모두 다 잘된다.
--exec sys.sp_help TBLTESTTABLE
--exec sp_help TBLTESTTABLE
--sp_help TBLTESTTABLE


go

-- 테이블 생성 확인
-- 항상 테이블을 select 해줄때는 with(nolock)을 붙여야 한다!
select * from TBLTESTTABLE with(nolock)
drop table TBLTESTTABLE



-- 위의 테이블의 제약조건을 걸어보자.
-- 여러가지 방법이 존재한다 => 테이블을 만들 당시에 제약조건을 걸 수 있고 또한, 테이블을 만든 이후에도 제약조건을 걸 수 있다.


-- 1. pk 조건 걸기
-- 첫번째로 제약조건 거는 방법 : 단점 프라이머리키의 성질을 알기가 매우 어려워진다
-- PK__TBLTESTT__C1A912FA8191C016 이런식으로 pk의 이름이 붙여진다.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null primary key,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)

-- PK__TBLTESTT__C1A912FA8191C016 이런식으로 pk의 이름이 붙여진다. -> 이런식으로 이름이 붙여지길 원치않으므로! -> pk의 이름을 바꿔주도록 하자.
-- 두번째로 제약조건 거는 방법
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null constraint PK__TBLTESTTABLE__test_seq_no primary key,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
	
)

--이런식으로 pk 를 지정하게 되면 index name 이 PK__TBLTESTTABLE__test_seq_no 이런식으로 우리가 좀더 알아보기 쉽게 나오게 된다. 

-- 세번째 또한 테이블 컬럼 뒤에써서 재참조 해서 만들어 줄수도 있다.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null,
	constraint PK__TBLTESTTABLE__test_seq_no primary key (test_seq_no)
)


-- 네번째 : 이미 테이블을 먼저 만들었을 경우에 밖에서 제약조건을 걸어준다.
create table dbo.TBLTESTTABLE (
	test_seq_no bigint identity(1,1) not null,
	test_name varchar(50) not null,
	reg_dt datetime not null,
	reg_id varchar(25) not null,
	chg_dt datetime not null,
	chg_id varchar(25) null
)

alter table dbo.TBLTESTTABLE add constraint PK__TBLTESTTABLE__test_seq_no primary key (test_seq_no)


-- 2. default 제약 조건 걸기

-- 2-1. 컬럼옆에 제약조건 걸기 
-- 위에서 봤지만 아래의 방법은 열에 대해서 직접 이름을 입력할수 없으므로 별로 좋은 방법은 아니라고 생각하면 된다.
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime default	getdate()
)

go
-- 2-2. 테이블 내에서 디폴트 제약조건 추가해주기(컬럼의 제약조건을 따로 ..?!..)
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime 
		constraint DF__TBLINSA__REG__DT default getdate()
)

go

-- 2-3 테이블 외부에서 디폴트 제약조건 추가해주기
create table dbo.TBLINSA
(
	insa_seq_no bigint not null,
	insa_name varchar(20) not null,
	reg_dt datetime 
)

alter table dbo.TBLINSA add constraint DF__TBLINSA__REG__DT default getdate() for reg_dt


go

-- default 열에 insert 해주는 방법
-- 정석적으로 모든 컬럼들을 다 입력해줘서 하나하나 지정해주는 경우
-- default 열은 적지않고 그냥 넣어주면 default 값이 알아서 지정되게 된다.
insert into dbo.TBLINSA (insa_seq_no,insa_name) values (2,'jhone')

-- 그냥 values 로 넣어주는 방법은 default 라고 넣어줘야 한다.
insert into dbo.TBLINSA values (1,'harry',DEFAULT)


-- 확인
select * from dbo.TBLINSA with(nolock)




-- 3. SPARSE
-- 스파스 열에 대해서 알아보자
-- 스파스열이란 : null 값에 최적화 되어있는 저장소가 있는 일반 열로 정의할수 있다!
go


use tempdb;
create database sparseDB;


use sparseDB;
create table chartbl
(
	id int identity,
	data char(100) null
)

create table sparseCharTbl (
	id int identity,
	data char(100) SPARSE null
)



declare @i int = 0
while @i < 10000
begin
	insert into chartbl values(null);
	insert into chartbl values(null);
	insert into chartbl values(null);
	insert into chartbl values(replicate('A',100));
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(null);
	insert into sparseCharTbl values(replicate('A',100));
	set @i += 1
end

select * from chartbl

--열에 null값이 많을때는 제약조건으로 SPARSE 를 넣어주면 저장공간을 훨씬더 아낄수 있다
-- 하지만 NULL 값이 생각보다 없는경우에 SPASE 를 쓰게 된다면 오히려 더 많은 데이터를 잡아먹게 된다 즉 성능상의 이슈를 가져올 수 있다.


create table dbo.tblsparse
(
	seq int null,
	name varchar(10) not null
)





