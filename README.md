# MS_SQL





https://ninearies.tistory.com/151 -> user, index, 동적쿼리에 관해서 연습...





--인덱스에 대해 알아보자


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




create table dbo.testpknonunique
(
	a int primary key,
	b int,
	c int
)

drop table dbo.testpknonunique
-- 위와 같이 테이블을 생성하고, 열에 pk를 추가하게 되면 
-- a열은 clustered, unique, primary key located on DATA_FG 이런형식의 성질을 가지게 된다.

--drop table dbo.testpk


-- unique 속성
-- unique는 비 클러스터형 인덱스라고 생각하면 된다.

create table dbo.testpkunique
(
	a int primary key,
	b int unique,
	c int unique 
)

drop table dbo.testpkunique

-- 테이블에서는 오직 하나의 컬럼만이 클러스터형 인덱스가 될수 있다.
-- 클러스터 인덱스는 같은 값이 들어오면 안되는 성질이 있나 없나?
-- pk 는 무조건 클러스터형 인덱스가 아니다.

      
create table dbo.TESTCLU 
(
	a int primary key,
	b int unique clustered,

)



--클러스터형 인덱스와 비클러스터형 인덱스의 정렬처리가 다른것을 보자
-- 
create table dbo.TBLTESTCLUSTERED (
	clus_user_id varchar(20) not null,
	clus_user_name varchar(20) not null
)

alter table dbo.TBLTESTCLUSTERED
	add constraint PK__TBLTESTCLUSTERED__CLUS__USER__ID PRIMARY KEY (clus_user_id)

drop table dbo.TBLTESTCLUSTERED

insert into dbo.TBLTESTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTCLUSTERED values ('m','mango');

select * from dbo.TBLTESTCLUSTERED with(nolock) 

create table dbo.TBLTESTNOTCLUSTERED (
	nonclus_user_id varchar(20) not null,
	nonclus_user_name varchar(20) not null
)



drop table dbo.TBLTESTNOTCLUSTERED

insert into dbo.TBLTESTNOTCLUSTERED values ('a','apple');
insert into dbo.TBLTESTNOTCLUSTERED values ('c','crayne');
insert into dbo.TBLTESTNOTCLUSTERED values ('z','zoo');
insert into dbo.TBLTESTNOTCLUSTERED values ('m','mango');


alter table dbo.TBLTESTNOTCLUSTERED
	add constraint UN__TBLTESTNONCLUSTERED__NONCLUS__USER__ID UNIQUE (nonclus_user_id)
   
select * from dbo.TBLTESTNOTCLUSTERED with(nolock)



go



create table dbo.TBLTESTSH
(
	sh_seq_no int not null,
	sh_name varchar(10) not null
)

--create index ID__TBLTESTSH__SH__SEQ__NO on dbo.TBLTESTSH (sh_seq_no)


drop table dbo.TBLTESTSH


create table dbo.MIXEDTBL
(
	userID char(8) not null,
	name nvarchar(10) not null,
	addr nchar(2)
)

drop table dbo.MIXEDTBL

alter table dbo.MIXEDTBL alter column name varchar(30)

alter table dbo.MIXEDTBL alter column addr varchar(30)


insert into dbo.MIXEDTBL values ('LSG','LEE SUNG KEE','SEOUL')
insert into dbo.MIXEDTBL values ('KBS','KIM BUM SOO','KN')
insert into dbo.MIXEDTBL values ('KKH','KIM KYOUNG HO','JN')
insert into dbo.MIXEDTBL values ('JYP','JHO YONG PHIL','KK')
insert into dbo.MIXEDTBL values ('SSK','SUMG SI KYOUNG','SEOUL')
insert into dbo.MIXEDTBL values ('LJB','LIM JAE BEOM','SEOUL')
insert into dbo.MIXEDTBL values ('YJS','YOON JONG SHIN','KN')
insert into dbo.MIXEDTBL values ('EJW','EUN JI WON','KB')
insert into dbo.MIXEDTBL values ('JKW','JHO KWAN WOO','KK')
insert into dbo.MIXEDTBL values ('BBK','BA BI KIM','SEOUL')

SELECT * FROM dbo.MIXEDTBL with(nolock)

drop table dbo.MIXEDTBL

truncate table dbo.MIXEDTBL

alter table dbo.MIXEDTBL add constraint PK__MIXEDTBL__userID primary key (userID)

alter table dbo.MIXEDTBL add constraint UQ__MIXEDTBL__name unique (name)

--**** 헷갈려하지 말것!!****
--**그리고 항상 헷갈리지 말아야하는건 nonclustered index, clustered index 와 개체의 유일성과는 아무런 관계가 없다고 생각해야 한다!**
-- 그저 성능 향상을 위해서 분리시키는 것일뿐이다! 쿼리 결과에는 상관이 없다고 보는게 맞다.

-- 이런식으로 클러스터형 인덱스와 넌클러스터형 인덱스를 혼합해서 사용했을때, 실행계획을 보면서 어떤 방법이 더 효과적인지 파악해보자 
--select addr from dbo.MIXEDTBL where name = 'jHO YONG PHIL'

-- 인덱스 생성을 직접 해보자.
create index IDX__MIXEDTBL__ADDR on dbo.MIXEDTBL (addr)
--이런식으로 테이블 내에 인덱스를 생성해주면 기본적으로 넌클러스터 인덱스가 생성되게 된다.

-- 유니크 인덱스를 생성해보자
create unique index IDX__MIXEDTBL__NAME on dbo.MIXEDTBL (name)

--클러스터 인덱스 생성해보자
create clustered index IDX__MIXEDTBL__USERID on dbo.MIXEDTBL (userID)

select * from dbo.MIXEDTBL with(nolock)


create table dbo.MIXEDTBL
(
	userID varchar(30) not null,
	name varchar(30) not null,
	addr varchar(30) not null,
	code int not null

)

insert into dbo.MIXEDTBL values ('LSG','LEE SUNG KEE','SEOUL',1)
insert into dbo.MIXEDTBL values ('KBS','KIM BUM SOO','KN',2)
insert into dbo.MIXEDTBL values ('KKH','KIM KYOUNG HO','JN',4)
insert into dbo.MIXEDTBL values ('JYP','JHO YONG PHIL','KK',1)
insert into dbo.MIXEDTBL values ('SSK','SUMG SI KYOUNG','SEOUL',6)
insert into dbo.MIXEDTBL values ('LJB','LIM JAE BEOM','SEOUL',8)
insert into dbo.MIXEDTBL values ('YJS','YOON JONG SHIN','KN',10)
insert into dbo.MIXEDTBL values ('EJW','EUN JI WON','KB',32)
insert into dbo.MIXEDTBL values ('JKW','JHO KWAN WOO','KK',99)
insert into dbo.MIXEDTBL values ('BBK','BA BI KIM','SEOUL',54)

select * from dbo.MIXEDTBL with(nolock)


create nonclustered index IDX__MIXEDTBL__ADDR_CODE on dbo.MIXEDTBL (addr,code) 


select * from dbo.MIXEDTBL with(nolock) where addr = 'SEOUL' and code = 1

drop table dbo.MIXEDTBL


--계산열에 인덱스를 취해보자.
create table dbo.COMPUTETBL
(
	input1 int not null,
	input2 int not null,
	sumation as input1 + input2 persisted,
	minus as input1 - input2 persisted,
	multiple as input1 * input2 persisted,
	divide as input1 / input2 persisted 
)

drop table dbo.COMPUTETBL

insert into dbo.COMPUTETBL values (20,30)

select * from dbo.COMPUTETBL with(nolock)
--이런식으로 계산열을 지정할수 있다.

-- **** 저장 프로시저에 대해 학습해보자



