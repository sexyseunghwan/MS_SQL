


/* 저장 프로시저(Stored Procedure)

- 저장프로시저 : 저장프로시저란 쿼리문의 집합으로 어떤 동작을 일괄 처리할 때 사용된다. 자주 사용되는 일반적인 쿼리를 사용하는 것보다는 이것을 모듈화 시켜서 필요할 때마다 호출만 하면 훨씬 편리하게 SQL Server 를 운영할 수 있다.


*/



CREATE TABLE dbo.USERTBL -- 회원 테이블
( userID   CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디
  name     NVARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr    NCHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height     SMALLINT,  -- 키
  mDate     DATE  -- 회원 가입일
);
GO

select * from dbo.userTbl with(nolock)

CREATE TABLE dbo.BUYTBL -- 회원 구매 테이블
(  num   INT IDENTITY NOT NULL PRIMARY KEY, -- 순번(PK)
   userID   CHAR(8) NOT NULL --아이디(FK)
  FOREIGN KEY REFERENCES userTbl(userID),
   prodName  NCHAR(6) NOT NULL, --  물품명
   groupName  NCHAR(4)  , -- 분류
   price      INT  NOT NULL, -- 단가
   amount     SMALLINT  NOT NULL -- 수량
);
GO
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
GO

INSERT INTO buyTbl VALUES('KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES('BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES('KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES('BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES('SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES('EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES('EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES('BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES('BBK', '운동화', NULL   , 30,   2);
GO

-- 위에는 testDB 라고 생각하면 된다.

-- 1.1 입력매개변수가 있는 저장 프로시저를 생성하자

use ADMIN -- 어떠한 DB를 쓸것인지 지정한다
GO
CREATE procedure test1pd
	@username nvarchar(10)
AS
	select * from dbo.USERTBL where name = @username;
GO

--실행을 해보자

exec test1pd '이승기'

-- 1.2 두개의 매개변수가 있는 저장 프로시저를 생성하자
use ADMIN
go
create procedure test2pd
	@userBirth int,
	@userHeight int
AS
	select * from dbo.USERTBL where birthYear > @userBirth and height > @userHeight
go

exec test2pd 1970, 170


-- 1.3 매개변수 순서에 상관없이 호출하고 싶다면 @매개변수 로 써서 호출하면 된다.
exec test2pd @userHeight=170,@userBirth=1970

-- 1.4 디폴트 매개변수를 지정해주자
use ADMIN
go
create procedure test3pd
	@userBirth int = 1970,
	@userHeight int = 170
AS
	select * from dbo.USERTBL where birthYear > @userBirth and height > @userHeight
go

exec test3pd--이런식으로 그냥 써주면 디폴트값이 들어가서 호출이된다고 생각하면된다

exec test3pd 1970,180-- 이런식으로 값을 넣어주게 되면 해당값을 받아서 프로시저를 호출하게 된다.


--1.5  
go
create procedure test4pd
	@txtvalue nchar(10),
	@outvalue int output
as
	insert into dbo.TESTTBL values (@txtvalue);
	select @outvalue = IDENT_CURRENT('TESTTBL');
go

create table dbo.TESTTBL (id INT IDENTITY, txt NCHAR(10)) -- 이런식으로 테이블을 프로시저 뒤에 생성해도 생성이 된다 이것을 "지연된 이름 확인" 이라고 부른다.

go

--위에서 지정한 프로시저를 사용해보자
declare @myvalue int;--여기서 output 값을 초기화해준상태 -> output 값을 받을 그릇을 만든 상태라고 생각하면 된다.
exec test4pd 'test value',@myvalue output;
print '현재 입력한 ID 값' + CAST(@myvalue as char(5));

select * from dbo.TESTTBL with(nolock) -- 정상적으로 잘 들어가게 된다.
