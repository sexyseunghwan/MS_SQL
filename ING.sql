


declare @day varchar(8)
set @day = '20201223'
print @day


declare @num varchar(14)
set @num = '930823-1058818'

print @num
-- 010-5139-3792
--

select * from dbo.TBLINSA with(nolock)


select * from dbo.TBLINSA with(nolock) where city = N'서울'

alter table dbo.TBLINSA add constraint PK__TBLINSA__NUM primary key (num)

alter table dbo.TBLINSA drop tblInsa_pk


drop index tblInsa_pk on dbo.TBLINSA

DROP TABLE dbo.TBLBUSEO

CREATE TABLE dbo.TBLBUSEO
(
	buseo varchar(15),
	room int not null

)

ALTER TABLE dbo.TBLBUSEO ALTER COLUMN room varchar(15) NOT NULL

ALTER TABLE dbo.TBLBUSEO ADD CONSTRAINT PK__TBLBUSEO__ROOM PRIMARY KEY (room)


insert into dbo.TBLBUSEO values ('개발부',101)
insert into dbo.TBLBUSEO values ('개발부',102)
insert into dbo.TBLBUSEO values ('개발부',103)
insert into dbo.TBLBUSEO values ('개발부',104)

insert into dbo.TBLBUSEO values ('개발부',109)

insert into dbo.TBLBUSEO values ('기획부',105)
insert into dbo.TBLBUSEO values ('기획부',106)
insert into dbo.TBLBUSEO values ('기획부',107)

insert into dbo.TBLBUSEO values ('영업부',108)
insert into dbo.TBLBUSEO values ('영업부',109)
insert into dbo.TBLBUSEO values ('영업부',110)
insert into dbo.TBLBUSEO values ('영업부',111)
insert into dbo.TBLBUSEO values ('영업부',112)

insert into dbo.TBLBUSEO values ('인사부',113)
insert into dbo.TBLBUSEO values ('인사부',114)
insert into dbo.TBLBUSEO values ('인사부',115)
insert into dbo.TBLBUSEO values ('인사부',116)

insert into dbo.TBLBUSEO values ('자재부',117)
insert into dbo.TBLBUSEO values ('자재부',118)

insert into dbo.TBLBUSEO values ('총무부',119)

insert into dbo.TBLBUSEO values ('홍보부',120)
insert into dbo.TBLBUSEO values ('홍보부',121)
insert into dbo.TBLBUSEO values ('홍보부',122)
insert into dbo.TBLBUSEO values ('홍보부',123)


select * from dbo.TBLBUSEO WITH(NOLOCK)

select ti.name,tb.buseo from dbo.TBLINSA ti with(nolock)
	inner join dbo.TBLBUSEO tb with(nolock) on ti.buseo = tb.buseo


select ti.name,tb.buseo,ti.jikwi from dbo.TBLINSA ti with(nolock,forceseek) 
	inner join dbo.TBLBUSEO tb with(nolock,forceseek) on ti.buseo = tb.buseo
	where tb.buseo = '개발부'

go

create procedure sh_test1
(
	@buseo varchar(15)
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

select ti.name,tb.buseo,ti.jikwi from dbo.TBLINSA ti with(nolock,forceseek) 
	inner join dbo.TBLBUSEO tb with(nolock) on ti.buseo = tb.buseo
	where tb.buseo = @buseo

end

go


exec sh_test1 '개발부'


go

CREATE INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA (buseo)


CREATE INDEX [IDX__TBLBUSEO__BUSEO] ON dbo.TBLBUSEO (buseo)


DROP INDEX [IDX__TBLBUSEO__BUSEO] ON dbo.TBLINSA

DROP INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA





select distinct buseo from dbo.TBLINSA WITH(NOLOCK)


select * from dbo.tblinsa with(nolock)

select name from dbo.tblinsa with(nolock) where name = '엄용수'

select city,name from dbo.tblinsa with(nolock) where buseo = '개발부'


DROP INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA
CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (name)

DROP INDEX [IDX__TBLINSA__CITY] ON dbo.TBLINSA
CREATE INDEX [IDX__TBLINSA__CITY] ON dbo.TBLINSA (city)

DROP INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA
CREATE INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA (buseo)

DROP INDEX [IDX__TBLINSA__BUSEO__NAME__JIKWI] ON dbo.TBLINSA
CREATE INDEX [IDX__TBLINSA__BUSEO__NAME__JIKWI] ON dbo.TBLINSA (buseo,name,jikwi)

























create procedure testproc1
(
	@buseo varchar(15),
	@jikwi varchar(15)
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	select num,name,buseo,jikwi from dbo.tblinsa where buseo = @buseo and jikwi = @jikwi
return
end

go


select num,name,buseo,jikwi from dbo.tblinsa WITH(NOLOCK,FORCESEEK)
where buseo = '개발부' and jikwi = '사원'

--프로시저 호출을 잘 잡아야제 인간다


select name,buseo,jikwi from dbo.tblinsa where buseo = '개발부' AND jikwi = '사원'





create index [IDX__TBLINSA__BUSEO__JIKWI] ON dbo.TBLINSA (buseo,jikwi)

CREATE INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA (buseo)

DROP INDEX [IDX__TBLINSA__BUSEO] ON dbo.TBLINSA


go

select * from dbo.tblinsa



SELECT top 10 name,ssn FROM dbo.TBLINSA


select * from dbo.TBLINSA


drop procedure dbo.proctestsh

create procedure dbo.proctestsh
(
	@name int
)
as
WITH CTE_FIRST (rm,name,occupation)
AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rm,name,occupation FROM dbo.OCCUPATIONS
)
SELECT [Doctor],[Professor],[Singer],[Actor] FROM CTE_FIRST
PIVOT (MAX(name) FOR occupation IN ([Doctor],[Professor],[Singer],[Actor])) AS pvt


exec dbo.proctestsh 1



SELECT * FROM dbo.TBLSCORE

SELECT * FROM dbo.TBLSCORE
PIVOT (MAX(score) FOR class IN ([1반],[2반],[3반],[4반],[5반])) AS pvt


--학년별로 자동으로 정렬이 된거 같은데?!



SELECT * FROM TBLINSA


WITH CTE(rm,name,buseo)
AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY buseo ORDER BY name),name,buseo FROM dbo.TBLINSA
)
SELECT [개발부],[기획부],[영업부],[인사부],[자재부],[총무부],[홍보부] FROM CTE
PIVOT (MAX(name) FOR buseo IN ([개발부],[기획부],[영업부],[인사부],[자재부],[총무부],[홍보부])) AS pvt


WITH CTE_FIRST (rm,name,occupation)
AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rm,name,occupation FROM dbo.OCCUPATIONS
)
SELECT [Doctor],[Professor],[Singer],[Actor] FROM CTE_FIRST
PIVOT (MAX(name) FOR occupation IN ([Doctor],[Professor],[Singer],[Actor])) AS pvt





SELECT buseo FROM dbo.TBLINSA
GROUP BY buseo 


SELECT * FROM dbo.BUYTBL

create table dbo.tbltest
(
	seq int identity(1,1) not null,
	number int
)

select * from dbo.tbltest with(nolock)


declare @x int = 1;
while @x < 1000
begin
	insert into dbo.tbltest values (@x);
	--select case when @x % 2 = 0 then 
	set @x = @x + 1
end


--select * from dbo.tbltest



--declare @check int = 0
--select case when number % 2 = 0 then set @check = @check + 1 end from dbo.tbltest



-- [Doctor],[Professor],[Singer],[Actor]

select [Doctor],[Professor],[Singer],[Actor] from 
(select ROW_NUMBER() over (partition by occupation order by name) as rn,name,occupation from occupations) as rownum
pivot (min(name) for occupation in ([Doctor],[Professor],[Singer],[Actor])) as pvt



-- 8 점 미만의 성적을 받은 학생들은 이름을 null로 사용한다.
-- 보고서는 등급별 내림차순
-- 같은 그랭이드일 경우에는 이름으로 오름차순
-- 1~ 7 사이에는 점수를 오름차순으로 정렬한다.


/*
Ketty 는 Eve 에게 Name , Grade 및 Mark의 세 열이 포함 된 보고서를 생성하는 작업을 제공합니다 . 
Ketty 는 8 점 미만의 성적을받은 학생들의 이름을 원하지 않습니다 . 보고서는 등급별 내림차순이어야합니다. 
즉, 높은 등급이 먼저 입력됩니다. 같은 학년 (8-10)이 배정 된 학생이 한 명 이상있는 경우 해당 학생의 이름을 알파벳순으로 정렬합니다. 
마지막으로, 등급이 8 미만이면 이름으로 "NULL"을 사용하고 등급별로 내림차순으로 나열합니다.
같은 학년 (1-7)이 배정 된 학생이 한 명 이상인 경우 해당 학생의 점수를 오름차순으로 정렬합니다.
*/


create table TBLORDERBYTEST
(
	name varchar(30),
	grade int,
	marks int
)

insert into TBLORDERBYTEST values ('APPLE',4,95)
insert into TBLORDERBYTEST values ('PANASONIC',3,71)
insert into TBLORDERBYTEST values ('SAMSUNG',32,92)
insert into TBLORDERBYTEST values ('LG',6,85)
insert into TBLORDERBYTEST values ('FACEBOOK',23,94)
insert into TBLORDERBYTEST values ('AMAZON',43,99)
insert into TBLORDERBYTEST values ('HWAWEI',77,81)
insert into TBLORDERBYTEST values ('XIAOMI',2,79)
insert into TBLORDERBYTEST values ('SONY',4,728)
insert into TBLORDERBYTEST values ('BAMBI',231,666)
insert into TBLORDERBYTEST values ('KIRINA',54,574)

select * from TBLORDERBYTEST
order by grade

select * from TBLORDERBYTEST
order by grade, marks 











create table dbo.OCCUPATIONS
(
	name varchar(30),
	occupation varchar(30)
)



insert into dbo.OCCUPATIONS values ('Ashley','Professor')
insert into dbo.OCCUPATIONS values ('Samantha' ,'Actor')
insert into dbo.OCCUPATIONS values ('Julia' ,'Doctor')
insert into dbo.OCCUPATIONS values ('Britney' ,'Professor')

insert into dbo.OCCUPATIONS values ('Maria' ,'Professor')
insert into dbo.OCCUPATIONS values ('Meera' ,'Professor')
insert into dbo.OCCUPATIONS values ('Priya' ,'Doctor')
insert into dbo.OCCUPATIONS values ('Priyanka' ,'Professor')


insert into dbo.OCCUPATIONS values ('Jennifer','Actor')
insert into dbo.OCCUPATIONS values ('Ketty' ,'Actor')

insert into dbo.OCCUPATIONS values ('Belvet' ,'Professor')
insert into dbo.OCCUPATIONS values ('Naomi', 'Professor')
insert into dbo.OCCUPATIONS values ('Jane' ,'Singer')
insert into dbo.OCCUPATIONS values ('Jenny' ,'Singer')

insert into dbo.OCCUPATIONS values ('Kristeen' ,'Singer')
insert into dbo.OCCUPATIONS values ('Christeen' ,'Singer')
insert into dbo.OCCUPATIONS values ('Eve' ,'Actor')
insert into dbo.OCCUPATIONS values ('Aamina' ,'Doctor')






select * from 
(select * from OCCUPATIONS) as temptable



select ROW_NUMBER() over (partition by occupation order by name),name,occupation from OCCUPATIONS
















go



select rownum, [Doctor],[Professor],[Singer],[Actor] from
(

	select ROW_NUMBER() over (partition by occupation order by name) as rownum,name,occupation from occupations

) as temptable
pivot (max(name) for occupation in ([Doctor],[Professor],[Singer],[Actor])) as pvt


select rownum, [Doctor],[Professor],[Singer],[Actor] from
(

	select ROW_NUMBER() over (partition by occupation order by name) as rownum,name,occupation from occupations

) as temptable
pivot (min(name) for occupation in ([Doctor],[Professor],[Singer],[Actor])) as pvt


--그룹화 시켜주기 위해 생긴 애들 같거든?


go

select * from tblscore



select class,[1학년],[2학년],[3학년] from tblscore
pivot(max(score) for grade in ([1학년],[2학년],[3학년])) as pvt



select grade,[1반],[2반],[3반],[4반],[5반] from tblscore
pivot (max(score) for class in ([1반],[2반],[3반],[4반],[5반])) as pvt


go

select * from dbo.occupations order by name

declare @r1 int = 0,@r2 int= 0,@r3 int= 0,@r4 int= 0
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (set @r1 = @r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber


select	case when Occupation='Doctor' then Name end as Doctor,
		case when Occupation='Professor' then Name end as Professor,
		case when Occupation='Singer' then Name end as Singer,
		case when Occupation='Actor' then Name end as Actor
from dbo.OCCUPATIONS


/*

SELECT *
  FROM ( 피벗할 쿼리문 ) AS result
 PIVOT ( 그룹합수(집계컬럼) FOR 피벗대상컬럼 IN ([피벗컬럼값] ... ) AS pivot_result
 
 */

 -- Doctor, Professor, Singer or Actor.

select [Doctor],[Professor],[Singer],[Actor] from occupations
pivot ( max(name) for occupation in ([Doctor],[Professor],[Singer],[Actor])) as pvtbl

 
 select min(Doctor) from
(select	

		case when Occupation='Doctor' then Name end as Doctor,
		case when Occupation='Professor' then Name end as Professor,
		case when Occupation='Singer' then Name end as Singer,
		case when Occupation='Actor' then Name end as Actor
from dbo.OCCUPATIONS
pivot (max(Doctor)) for 
order by name) as temp



declare @a1 int = 0,@a2 int = 0,@a3 int = 0,@a4 int = 0
	



select	
		--case when Occupation='Doctor' then @a1
  --          when Occupation='Professor' then @a2 
  --          when Occupation='Singer' then @a3
  --          when Occupation='Actor' then @a4 end as rownum,
		case when Occupation='Doctor' then Name end as Doctor,
		case when Occupation='Professor' then Name end as Professor,
		case when Occupation='Singer' then Name end as Singer,
		case when Occupation='Actor' then Name end as Actor
from dbo.OCCUPATIONS
order by name













select ROW_NUMBER() over (partition by occupation order by name)



select ROW_NUMBER() over (PARTITION BY occupation order by name) ronumber, * from occupations


select * from(
select * from occupations
)


PIVOT
(
    MAX(NAME) FOR OCCUPATION IN ([name], [occupation])
)




create table dbo.TBLSCORE
(
	grade varchar(10),
	class varchar(10),
	score int 
)

go



--1,2,3,4,5반뿐임
insert into dbo.TBLSCORE values ('1학년','1반',100)
insert into dbo.TBLSCORE values ('1학년','2반',50)
insert into dbo.TBLSCORE values ('1학년','3반',78)
insert into dbo.TBLSCORE values ('1학년','4반',77)
insert into dbo.TBLSCORE values ('1학년','5반',94)
insert into dbo.TBLSCORE values ('2학년','1반',12)
insert into dbo.TBLSCORE values ('2학년','2반',46)
insert into dbo.TBLSCORE values ('2학년','3반',78)
insert into dbo.TBLSCORE values ('2학년','4반',47)
insert into dbo.TBLSCORE values ('2학년','5반',12)
insert into dbo.TBLSCORE values ('3학년','1반',31)
insert into dbo.TBLSCORE values ('3학년','2반',89)
insert into dbo.TBLSCORE values ('3학년','3반',97)
insert into dbo.TBLSCORE values ('3학년','4반',100)
insert into dbo.TBLSCORE values ('3학년','5반',94)
insert into dbo.TBLSCORE values ('3학년','5반',194)



select * from dbo.TBLSCORE




select 


go


select grade,sum(score) from dbo.TBLSCORE group by grade


select * from dbo.TBLSCORE

select grade,[1반],[2반],[3반],[4반],[5반] from dbo.TBLSCORE
pivot (max(score) for class in ([1반],[2반],[3반],[4반],[5반])) as pvt



go



SELECT * FROM dbo.TBLSCORE

SELECT * FROM dbo.TBLSCORE
PIVOT (max(score) FOR grade IN ([1학년],[2학년],[3학년])) as pvt


select * from dbo.TBLSCORE
pivot (max(score) for grade in ([1학년],[2학년],[3학년])) as pvt

go


SELECT * FROM dbo.TBLSCORE
PIVOT (MAX(score) FOR class IN ([1반],[2반],[3반],[4반],[5반])) AS pvt



SELECT * FROM dbo.TBLSCORE

SELECT * FROM dbo.TBLSCORE
PIVOT (MAX(score) FOR grade IN ([1학년],[2학년],[3학년])) AS pvt

SELECT ROW_NUMBER() OVER (PARTITION BY buseo ORDER BY basicpay) AS sl, * FROM dbo.TBLINSA


SELECT * FROM dbo.TBLSCORE
pivot (MAX(score) FOR grade IN ([1학년],[2학년],[3학년])) AS pvt


SELECT * FROM dbo.TBLSCORE
SELECT * FROM dbo.TBLSCORE
PIVOT (MAX(score) FOR class IN ([1반],[2반],[3반],[4반],[5반])) AS pvt


SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name DESC) [rm], * FROM OCCUPATIONS



SELECT * FROM dbo.OCCUPATIONS
PIVOT(MAX(name) FOR occupation IN ([Doctor],[Professor],[Actor],[Singer])) AS pvt


SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) [RowNumber], * FROM OCCUPATIONS

GO

WITH cte(rownumber,name,occupation)
AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY name) [rownumber],* FROM OCCUPATIONS
)
SELECT * FROM cte
--PIVOT (MAX(name) FOR occupation IN ([Doctor],[Professor],[Actor],[Singer])) as pvt

GO

WITH cte(rownumber,name,occupation)
AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY name) [rownumber],* FROM OCCUPATIONS
)
SELECT * FROM cte
PIVOT (MAX(name) FOR occupation IN ([Doctor],[Professor],[Actor],[Singer])) as pvt

go

SELECT
    *--[Doctor], [Professor], [Singer], [Actor]
FROM
(
    SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) [RowNumber], * FROM OCCUPATIONS
) AS tempTable
PIVOT
(
    max(name) FOR OCCUPATION IN ([Doctor], [Professor], [Singer], [Actor])
) AS pivotTable



select * from
(
 SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) [RowNumber], * FROM OCCUPATIONS
) AS tempTable



============================================================


-- hacker_id, name
--SELECT * FROM HACKERS

-- challenge_id, hacker_id
--SELECT * FROM CHALLENGES

DECLARE @topint int
--DECLARE @ANSWERTABLE TABLE (hacker_id INT, name VARCHAR,count INT)

SET @topint = (SELECT TOP(1) chall.cci FROM
(
SELECT hacker_id AS hi,count(challenge_id) AS cci FROM CHALLENGES cg
GROUP BY hacker_id
) AS chall INNER JOIN HACKERS h ON h.hacker_id = chall.hi
ORDER BY chall.cci DESC)



SELECT chall2.hhid,chall2.hn,chall2.ccci FROM
(
SELECT h.hacker_id AS hhid, h.name AS hn, chall.cci AS ccci FROM
(
SELECT hacker_id AS hi,count(challenge_id) AS cci FROM CHALLENGES cg
GROUP BY hacker_id
) AS chall INNER JOIN HACKERS h ON h.hacker_id = chall.hi
) AS chall2
WHERE chall2.ccci <= @topint 
AND (SELECT COUNT(*) FROM chall2 GROUP BY chall2.ccci) = 1




--AND (SELECT COUNT(*) FROM chall2 WHERE )--
--WHERE (SELECT COUNT(*) FROM CHALLENGES WHERE)


-- SELECT chall.hi AS chi, h.name AS hn, chall.cci AS ccci FROM
-- (
-- SELECT hacker_id AS hi,count(challenge_id) AS cci FROM CHALLENGES cg
-- GROUP BY hacker_id
-- ) AS chall INNER JOIN HACKERS h ON h.hacker_id = chall.hi
-- WHERE ccci < @topint AND (SELECT COUNT(*) FROM chall WHERE chall.cci = )

-- SELECT 
-- (SELECT h.hacker_id AS hhid, h.name AS hhname, chall.cci as ccci FROM
-- (
-- SELECT hacker_id AS hi, COUNT(challenge_id) AS cci FROM CHALLENGES cg
-- GROUP BY hacker_id --hacker_id 로 그룹화 되어서 각 해커들의 challenge_id 의 개수를 알려준다.
-- ) AS chall INNER JOIN HACKERS h ON h.hacker_id = chall.hi) AS TBLANSWER
-- INNER JOIN CHALLENGES cg1 ON TBLANSWER.hhid = cg1.hacker_id
-- WHERE TBLANSWER.ccci <= @topint AND SELECT COUNT(*) FROM 
--INNER JOIN chall ON chall.
--WHERE chall.cci <= @topint AND (SELECT COUNT(*) FROM chall WHERE chall.cci = ccci) = 1




SELECT * FROM USERTBL

SELECT userid FROM USERTBL GROUP BY userid

SELECT userid FROM BUYTBL GROUP BY userid

SELECT * FROM USERTBL

SELECT userid,prodname,groupname,price,amount FROM BUYTBL


SELECT u.userid,b.prodname,b.price,b.amount FROM USERTBL u
	LEFT OUTER JOIN BUYTBL b ON u.userid = b.userid

SELECT u.userid,b.prodname,b.price,b.amount FROM USERTBL u
	RIGHT OUTER JOIN BUYTBL b ON u.userid = b.userid


SELECT * FROM dbo.USERTBL

SELECT * FROM dbo.BUYTBL

SELECT u.userid,b.prodname,b.price,b.amount FROM USERTBL u
	INNER HASH JOIN BUYTBL b ON u.userid = b.userid
	WHERE u.userid = 'BBK' AND b.num = 10





SELECT u.userid,b.prodname  FROM USERTBL u
	INNER JOIN BUYTBL b ON u.userid = b.userid

SELECT u.userid,b.prodname  FROM USERTBL u
	LEFT OUTER JOIN BUYTBL b ON u.userid = b.userid
	
SELECT u.userid,b.prodname  FROM USERTBL u
	LEFT OUTER JOIN BUYTBL b ON u.userid = b.userid


SELECT * FROM USERTBL u 
	LEFT OUTER JOIN BUYTBL b ON u.userid = b.userid

SELECT * FROM USERTBL u 
	INNER JOIN BUYTBL b ON u.userid = b.userid

SELECT * FROM USERTBL u 
	RIGHT OUTER JOIN BUYTBL b ON u.userid = b.userid


SELECT * FROM STDTBL


CREATE TABLE dbo.STDTBL
(
	name nvarchar(5),
	addr nvarchar(10)
)

SELECT * FROM STDTBL

INSERT INTO dbo.STDTBL VALUES ('김범수','경남')
INSERT INTO dbo.STDTBL VALUES ('성시경','서울')
INSERT INTO dbo.STDTBL VALUES ('조용필','경기')
INSERT INTO dbo.STDTBL VALUES ('은지원','경북')
INSERT INTO dbo.STDTBL VALUES ('바비킴','서울')


CREATE TABLE dbo.STDCLUBTBL
(
	seq int IDENTITY(1,1),
	name nvarchar(5),
	dongari nvarchar(10)
)


INSERT INTO dbo.STDCLUBTBL VALUES ('김범수','바둑')
INSERT INTO dbo.STDCLUBTBL VALUES ('김범수','축구')
INSERT INTO dbo.STDCLUBTBL VALUES ('조용필','축구')
INSERT INTO dbo.STDCLUBTBL VALUES ('은지원','축구')
INSERT INTO dbo.STDCLUBTBL VALUES ('은지원','봉사')
INSERT INTO dbo.STDCLUBTBL VALUES ('바비킴','봉사')


DROP TABLE dbo.CLUBTBL

CREATE TABLE dbo.CLUBTBL
(
	dongari nvarchar(10),
	room int
)

INSERT INTO dbo.CLUBTBL VALUES ('수영',101)
INSERT INTO dbo.CLUBTBL VALUES ('바둑',102)
INSERT INTO dbo.CLUBTBL VALUES ('축구',103)
INSERT INTO dbo.CLUBTBL VALUES ('봉사',104)


CREATE TABLE dbo.STDTBL
CREATE TABLE dbo.STDCLUBTBL
CREATE TABLE dbo.CLUBTBL


SELECT * FROM dbo.STDTBL
SELECT * FROM dbo.STDCLUBTBL
SELECT * FROM dbo.CLUBTBL



SELECT * FROM dbo.STDTBL s
	FULL OUTER JOIN dbo.STDCLUBTBL sc ON s.name = sc.name
	FULL OUTER JOIN dbo.CLUBTBL c ON sc.dongari = c.dongari


SELECT * FROM USERTBL
	CROSS JOIN BUYTBL

SELECT * FROM dbo.USERTBL
SELECT * FROM dbo.BUYTBL


SELECT * FROM EMPTBL

SELECT * FROM dbo.EMPTBL e1
	INNER JOIN dbo.EMPTBL e2 ON e1.manager = e2.emp
	WHERE e1.emp = '지사원'




CREATE TABLE dbo.TBLFRUIT1
(
	name NVARCHAR(10),
	cost INT,
	nation NVARCHAR(10)
)

CREATE TABLE dbo.TBLFRUIT2
(
	name NVARCHAR(10),
	cost INT,
	nation NVARCHAR(10)
)


SELECT * FROM dbo.TBLFRUIT

SELECT * FROM TBLFRUIT1
SELECT * FROM TBLFRUIT2

INSERT INTO dbo.TBLFRUIT1 VALUES ('banana',3000,'usa')
INSERT INTO dbo.TBLFRUIT1 VALUES ('mango',2800,'tai')
INSERT INTO dbo.TBLFRUIT1 VALUES ('pineapple',5000,'tai')
INSERT INTO dbo.TBLFRUIT1 VALUES ('strawberry',12000,'kor')


INSERT INTO dbo.TBLFRUIT2 VALUES ('strawberry',12000,'kor')
INSERT INTO dbo.TBLFRUIT2 VALUES ('pineapple',5000,'usa')
INSERT INTO dbo.TBLFRUIT2 VALUES ('orange',8000,'usa')
INSERT INTO dbo.TBLFRUIT2 VALUES ('starfruit',2000,'tai')


SELECT name,cost,nation FROM dbo.TBLFRUIT1
UNION ALL
SELECT name,cost,nation FROM dbo.TBLFRUIT2

SELECT name,cost,nation FROM dbo.TBLFRUIT1
UNION
SELECT name,cost,nation FROM dbo.TBLFRUIT2


SELECT * FROM dbo.TBLINSA
EXCEPT
SELECT * FROM dbo.TBLINSA WHERE buseo IN ('영업부','총무부','개발부')

SELECT * FROM dbo.TBLINSA WHERE buseo NOT IN ('영업부','총무부','개발부')


SELECT * FROM dbo.TBLINSA
INTERSECT
SELECT * FROM dbo.TBLINSA WHERE buseo = '개발부' and jikwi = '대리'



SELECT name,cost,nation FROM dbo.TBLFRUIT
UNION
SELECT name,cost,nation FROM dbo.TBLFRUIT





SELECT * FROM TBLSONG


SELECT * FROM TBLSCORE



SELECT * FROM TBLINSA


DECLARE @hiredate DATETIME -- 입사일
DECLARE @curdate DATETIME --오늘날짜
DECLARE @years INT--근속년수
DECLARE @days INT -- 군무란 일 수

SELECT @hiredate = ibsadate FROM dbo.TBLINSA
	WHERE name = '지수환'

SET @curdate = GETDATE()
SET @years = DATEDIFF(year,@hiredate,@curdate)--날짜의 차이 (년 단위)
SET @days = DATEDIFF(day,@hiredate,@curdate)--날짜의 차이(일단위)

IF (@years > 10) 
BEGIN
	PRINT N'입사한지 ' + CAST(@days AS NCHAR(5)) + N'일 이나 지났네요'
END
ELSE 
BEGIN
	PRINT N'입사한지 ' + CAST(@days AS NCHAR(5)) + N'일 밖에 안지났군요'
END


SELECT * FROM dbo.TBLINSA WHERE name = '지수환'



DECLARE @score INT = 77, @credit NCHAR(1)

IF @score >= 90
	SET @credit = 'A'
ELSE IF @score >= 80
		SET @credit = 'B'
	ELSE IF @score >= 70
			SET @credit = 'C'
		ELSE IF @score >= 60
			SET @credit = 'D'
			ELSE
				SET @credit = 'F'
PRINT N'취득점수 ' + CAST(@score AS NCHAR(2))
PRINT N'취득등급 ' + @CREDIT



DECLARE @score INT = 77, @credit NCHAR(1)

SET @credit =  CASE WHEN (@score >= 90) THEN 'A'
					WHEN (@score >= 80) THEN 'B'
					WHEN (@score >= 70) THEN 'C'
					WHEN (@score >= 60) THEN 'D'
					ELSE 'F'
				END
PRINT N'취득점수 ' + CAST(@score AS NCHAR(2))
PRINT N'취득등급 ' + @CREDIT


SELECT * FROM dbo.USERTBL

SELECT * FROM dbo.BUYTBL

SELECT SUM(price*amount) FROM dbo.BUYTBL WHERE userid  = 'BBK'

SELECT * FROM dbo.BUYTBL WHERE userid  = 'LSG'



SELECT userid,sum(price*amount) FROM dbo.BUYTBL GROUP BY userid


SELECT	u.userid,
		u.name,
		SUM(price*amount) AS [총계], 
		CASE WHEN SUM(price*amount) >= 1500 THEN N'최우수 고객'
			 WHEN SUM(price*amount) >= 1000 THEN N'우수 고객'
			 WHEN SUM(price*amount) >= 1 THEN N'일반고객'
			 ELSE N'유령 고객'
		END AS [고객등급]
		FROM dbo.BUYTBL b
	RIGHT JOIN dbo.USERTBL u ON u.userid = b.userid
	GROUP BY u.userid,u.name
	ORDER BY SUM(price*amount) DESC
	


DECLARE @cycle INT = 1

WHILE @cycle < 20
BEGIN
	PRINT REPLICATE('* ',@cycle)
	SET @cycle = @cycle + 1
END


DECLARE @sum INT = 0,@num INT = 1
WHILE (@num <= 100)
BEGIN
	IF (@num % 7 = 0)
	BEGIN
		PRINT CAST(@num AS NCHAR(3)) + N'은 7의 배수'
		SET @num = @num + 1
		CONTINUE
	END

	SET @sum += @num
	
	IF (@sum > 1000) BREAK
	SET @num += 1
END
PRINT N'총합은 ' + CAST(@sum AS NCHAR(4))


DECLARE @sum INT = 0,@num INT = 1 
WHILE (@num <= 100) 
BEGIN 
	IF (@num % 7 = 0) 
	BEGIN 
		PRINT CAST(@num AS NCHAR(3)) + N'은 7의 배수' 
		SET @num = @num + 1 
		CONTINUE 
	END 
	SET @sum += @num 
	IF (@sum > 1000) GOTO endprint 
	SET @num += 1 
END

endprint: 
PRINT N'총합은 ' + CAST(@sum AS NCHAR(4))



BEGIN
	WAITFOR DELAY '00:00:05';
	PRINT N'5초간 멈춘 후 진행되었음'
END


SELECT * FROM TBLSONG



SELECT * FROM dbo.USERTBL


BEGIN TRY
		INSERT INTO dbo.USERTBL VALUES ('LSG','이상구',1988,'서울',NULL,NULL,170,GETDATE())
		PRINT N'정상적으로 입력되었습니다.'
END TRY

BEGIN CATCH
	PRINT N'***오류가 발생했습니다.***'
	PRINT N'오류번호 : '
	PRINT ERROR_NUMBER()
	PRINT N'오류 메시지 : '
	PRINT ERROR_MESSAGE()
	PRINT N'오류 상태 코드 : '
	PRINT ERROR_STATE()
	PRINT N'오류 심각도'
	PRINT ERROR_SEVERITY()
	PRINT N'오류 발생 행번호 : '
	PRINT ERROR_LINE()
	PRINT N'오류 발생 프로시저/트리거'
	PRINT ERROR_PROCEDURE()
END CATCH


THROW 55555, N'이건 THROW 오류 발생',1



SELECT * FROM dbo.OCCUPATIONS



select  case when occupation = 'Doctor' then 'd'
            when occupation = 'Professor' then 'p'
            when occupation = 'Singer' then 's'
            when occupation = 'Actor' then 'A' end AS np,
        case when occupation = 'Doctor' then name end as Doctor,
        case when occupation = 'Professor' then name end as Professor,
        case when occupation = 'Singer' then name end as Singer,
        case when occupation = 'Actor' then name end as Actor
    from occupations
	order by name


ROW_NUM


GO

SELECT * FROM dbo.OCCUPATIONS



SELECT
	u.userID,
	u.name,
	SUM(b.price * b.amount) as [총계],
	CASE WHEN SUM(b.price * b.amount) >= 1500 THEN '최우수 고객'
		 WHEN SUM(b.price * b.amount) >= 1000 THEN '우수고객'
		 WHEN SUM(b.price * b.amount) >= 1 THEN '우수고객'
		 ELSE '유령고객' END AS [고객분류]
	FROM dbo.USERTBL u
	LEFT OUTER JOIN dbo.BUYTBL b ON u.userid = b.userid
	GROUP BY u.userID,u.name 
	ORDER BY [총계] DESC



	
	
SELECT * FROM dbo.USERTBL

SELECT * FROM dbo.BUYTBL


create procedure testproc1
(
	@buseo varchar(15),
	@jikwi varchar(15)
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	select num,name,buseo,jikwi from dbo.tblinsa where buseo = @buseo and jikwi = @jikwi
return
end

select * from dbo.CLUBTBL


DROP PROCEDURE testprocsh2

create procedure testprocsh2
(
	@num int
)
as
begin
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

begin try
if (@num = 1)
begin
	--insert into dbo.CLUBTBL VALUES ('갓수',105)
	update dbo.CLUBTBL set dongari = '테스트', room = 'asd'
end

else
begin
	--insert into dbo.CLUBTBL VALUES ('갓수','ㅁㄴㅇ')
	update dbo.CLUBTBL set dongari = '테스트', room = 900
end
end try
begin catch
	print ERROR_MESSAGE()
end catch
end

--아 뭐지 진짜 이거 어케 쓰는거지
EXEC testprocsh2 1


drop procedure usp_return

create procedure usp_return
(
	@username nvarchar(10)
	@output output
)
as
	declare @userid char(8)
	select @userid = userid from USERTBL where name = @username;

	if (@userid<>'') return 0;
	else return -1;

select * from USERTBL




exec usp_return 'sd'


declare @num int
set @num = 
print @num
