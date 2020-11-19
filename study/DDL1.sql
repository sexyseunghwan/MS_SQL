
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




/***3. SPARSE***/
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



/***4. 테이블 삭제 및 수정***/

create table dbo.TBLINSA (
	insa_no int IDENTITY(1,1),
	insa_name varchar(20) not null,
	reg_dt datetime not null
)





select * from dbo.TBLINSA with(nolock)

-- 4.1 테이블 삭제
-- 이런식으로 테이블 자체를 삭제 할 수 있다.
drop table dbo.TBLINSA


-- 4.2 테이블 수정

-- 4.2.1 열 추가
-- 아래와 같이 추가 할 수 있다.

--insa_ssn 이라는 컬럼을 하나 추가하겠다.
alter table dbo.TBLINSA 
	add insa_ssn varchar(30) not null

--insa_city 라는 컬럼을 하나 추가하겠다.
alter table dbo.TBLINSA
	add insa_city varchar(10) not null

--열을 추가할때는 기본적으로 기존열들 뒤에서부터 차근차근 추가한다고 보면 된다.


-- 4.2.2 열 삭제
-- TBLINSA 테이블에 있는 insa_city 컬럼을 제거하고 싶을때 아래와 같이 사용하면 된다.
alter table dbo.TBLINSA 
	drop column insa_city

-- 4.2.3 열의 데이터 형식 변경
-- TBLINSA 테이블에 있는 insa_ssn 컬럼의 데이터 형식을 바꿔주려면 아래와 같이 사용하면 된다.
alter table dbo.TBLINSA
	alter column insa_ssn varchar(20) null

alter table dbo.TBLINSA
	alter column insa_name varchar(10)

-- 그러나 제약조건이 걸려있는 열의경우는 위와같이 하면 안된다.

-- TBLINSA 테이블에 제약조건 추가하기
alter table dbo.TBLINSA 
	add constraint DF__TBLINSA__REG__DT default getdate() for reg_dt

-- TBLINSA 테이블에 제약조건 제거하기.
-- 여기서 열의 제약조건을 제거할때 열의 이름을 적는것이 아니라 해당 제약조건의 이름을 적어서 제거를 시키면 된다.
alter table dbo.TBLINSA	
	drop constraint DF__TBLINSA__REG__DT





/** 5. 인덱스**/

/*

인덱스 : "데이터를 좀 더 빠르게 찾을 수 있도록 해주는 도구"
하지만 인덱스를 잘 사용해야 데이터를 효율적으로 찾을수 있는것이지 막무가내로 사용하면 오히려 더 성능이
나빠질 수 있다.

인덱스 사용을 위한 기본공리 : 인덱스가 만들어지기 위해서는 특별한 제약조건이 필요한데
그것은 제약조건으로 unique 가 걸려있거나 primary key 가 걸려있어야 인덱스를 사용할 수 있게 된다.


1. 클러스터형 인덱스
- 클러스터형 인덱스는 영어사전이라고 생각하면 된다.
- 클러스터형 인덱스는 테이블안에 하나만 생성이 가능하다.
- 클러스터형 인덱스는 범위로 검색 시에 아주 우수한 성능을 보인다.


2. 비클러스터형 인덱스
- 책 뒤에 있는 찾아보기라고 생각하면 된다.
- 비 클러스터형 인덱스는 테이블안에 여러개가 생성이 가능하다.




*/


-- 5.1 primary key
create table dbo.testpknonunique
(
	a int primary key,
	b int,
	c int
)

-- 위와 같이 테이블을 생성하고, 열에 pk를 추가하게 되면 
-- a열은 clustered, unique, primary key located on DATA_FG 이런형식의 성질을 가지게 된다.
-- ***즉 기본적으로  pk 를 설정하게 되면 클러스터형 인덱스 처리가 된다.***


--5.2 UNIQUE
-- unique 속성
-- unique는 기본적으로 설정을 하게되면 비클러스터형 인덱스처리가 된다.

create table dbo.testpkunique
(
	a int primary key,
	b int unique,
	c int unique 
)


--5.3 CLUSTER 설정하기

create table dbo.TBLTESTCL1
(
	tcl_no1 int primary key nonclustered,
	tcl_no2 int unique clustered,
	tcl_no3 int unique
)
-- 이런식으로 pk unique 옆에 clustered 제약을 걸어주게 되면 직접 지정을 해줄 수 있다.


-- &&&테이블에서는 오직 하나의 컬럼만이 클러스터형 인덱스가 될수 있다.&&& => 가장 중요한 개념이므로 머리속에 적립해두는것이 좋다.
-- pk 는 무조건 클러스터형 인덱스가 아니다. ** 따로 비클러스터 인덱스로 설정이 가능함.

      
create table dbo.TESTCLU 
(
	a int primary key,
	b int unique clustered,

)


--5.4 클러스터형 인덱스와 비클러스터형 인덱스의 다른 정렬처리
--클러스터형 인덱스와 비클러스터형 인덱스의 정렬처리가 다른것을 보자

create table dbo.TBLTESTCLUSTERED (
	clus_user_id varchar(20) not null,
	clus_user_name varchar(20) not null
)

alter table dbo.TBLTESTCLUSTERED
	add constraint PK__TBLTESTCLUSTERED__CLUS__USER__ID PRIMARY KEY (clus_user_id)


insert into dbo.TBLTESTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTCLUSTERED values ('m','mango');

select * from dbo.TBLTESTCLUSTERED with(nolock) 

-- 만약 기본적으로 클러스터 처리를하게 해주는 pk 를 제약조건으로 걸었다면 사용자가 입력한대로 들어가지 않고 클러스터 정렬을 하게된다.


create table dbo.TBLTESTNOTCLUSTERED (
	nonclus_user_id varchar(20) not null,
	nonclus_user_name varchar(20) not null
)

go

select * from dbo.TBLTESTNOTCLUSTERED with(nolock)


go

insert into dbo.TBLTESTNOTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTNOTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTNOTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTNOTCLUSTERED values ('m','mango');


alter table dbo.TBLTESTNOTCLUSTERED
	add constraint UN__TBLTESTNONCLUSTERED__NONCLUS__USER__ID UNIQUE (nonclus_user_id)
   
select * from dbo.TBLTESTNOTCLUSTERED with(nolock)

-- 제약조건으로 unique 를 적어준다면 비클러스터형 인덱스가 되므로 비클러스터형 정렬은 insert 해준대로 데이터가 들어가게 된다.






















