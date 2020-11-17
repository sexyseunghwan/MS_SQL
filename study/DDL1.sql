
-- Data definition language (ddl)을 알아보자

-- 이곳에 있는 개념
-- 테이블 생성, 제약조건 걸기

-- 아래대로 작성하는게 좋다.

-- 1. table 생성
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


--뭐 이런식으로 해줄수 있다 이정도로만 일단 기억하자



