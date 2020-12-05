



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



select * from occupations
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


select * from dbo.TBLSCORE


select 


go


select grade,sum(score) from dbo.TBLSCORE group by grade


select * from dbo.TBLSCORE

select grade,[1반],[2반],[3반],[4반],[5반] from dbo.TBLSCORE
pivot (max(score) for class in ([1반],[2반],[3반],[4반],[5반])) as pvt



go

select * from dbo.TBLSCORE
pivot (max(score) for grade in ([1학년],[2학년],[3학년])) as pvt






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