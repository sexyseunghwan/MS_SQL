go

-- 1. Practice > SQL > Alternative Queries > Print Prime Numbers(***)
-- https://www.hackerrank.com/challenges/print-prime-numbers/problem

declare @num int, @index int, @answer varchar(1500)
declare @table table (primenum int)
set @num = 2
set @answer = ''
while @num <= 1000
begin
	if not exists (select primenum from @table where @num % primenum = 0)
	begin
		insert into @table values (@num)
		set @answer = @answer + cast(@num as varchar(20)) + '&'
	end
	set @num = @num + 1
end

print substring(@answer,0,len(@answer))


go


-- 2. Practice > SQL > Aggregation > The Blunder
-- https://www.hackerrank.com/challenges/the-blunder/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select
    cast(ceiling(avg(cast(salary as float)) - avg(cast(replace(salary,'0','')as float))) as int)
from employees


go


-- 3. Practice > SQL > Aggregation > Top Earners(***)
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select 
    max(salary*months), count(*) 
from employee 
where salary*months = (select max(salary*months) from employee)


-- 4. Practice > SQL > Alternative Queries > Draw The Triangle 2(***)
-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

declare @number int
set @number = 1
while @number <= 20
begin
    print replicate('* ',@number)
    set @number = @number + 1
end



-- 5. Practice > SQL > Aggregation > Weather Observation Station 2
-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select format(round(sum(lat_n),2),'.##'), format(round(sum(long_w),2),'.##') from station



-- 6. Practice > SQL > Aggregation > Weather Observation Station 13
-- https://www.hackerrank.com/challenges/weather-observation-station-13/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select format(sum(lat_n),'.####') from station where lat_n > 38.7880 and lat_n < 137.2345


-- 7. Practice > SQL > Aggregation > Weather Observation Station 14
-- https://www.hackerrank.com/challenges/weather-observation-station-14/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select format(max(lat_n),'.####') from station where lat_n < 137.2345 



-- 8. Practice > SQL > Aggregation > Weather Observation Station 15
-- https://www.hackerrank.com/challenges/weather-observation-station-15/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select 
    format(long_w,'.####') 
from station 
where id = (select id from station where lat_n = (select max(lat_n) from station where lat_n < 137.2345)) 


-- 9. Practice > SQL > Aggregation > Weather Observation Station 16
-- https://www.hackerrank.com/challenges/weather-observation-station-16/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select format(round(min(lat_n),4),'.####') from station where lat_n > 38.7780


-- 10. Practice > SQL > Aggregation > Weather Observation Station 17
-- https://www.hackerrank.com/challenges/weather-observation-station-17/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--첫번째 방법

select 
    format(round(long_w,4),'.####')
from station
where id = (select id from station where lat_n = (select min(lat_n) from station where lat_n > 38.7780))


--두번째 방법

select
    top 1 format(round(long_w,4),'.####')
from station
where lat_n > 38.7780
order by lat_n asc


-- 11. Practice > SQL > Aggregation > Weather Observation Station 18
-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select 
    format(round(abs(max(lat_n) - min(lat_n)) + abs(max(long_w) - min(long_w)),4),'.####')
from station



-- 12. Practice > SQL > Aggregation > Weather Observation Station 19
-- https://www.hackerrank.com/challenges/weather-observation-station-19/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select
    format(sqrt(square(max(lat_n) - min(lat_n)) + square(max(long_w) - min(long_w))),'.####')
from station

-- 13. Practice > SQL > Aggregation > Weather Observation Station 20
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select 
    format(round(lat_n,4),'.####') 
from station order by lat_n offset (select count(*)/ 2 from station) rows fetch next 1 rows only


-- 14. Practice > SQL > Alternative Queries > Draw The Triangle 1
-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

declare @num int
set @num = 20
while @num >= 1
begin
    print replicate('* ',@num)
    set @num = @num - 1
end


--15. Practice > SQL > Aggregation > Revising Aggregations - The Sum Function
-- https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
select sum(population) from city where district = 'California'



--16 . Practice > SQL > Advanced Select > Type of Triangle
-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem


select
    case when a = b and b = c then 'Equilateral'
         when a + b <= c or a + c <= b or b + c <= a then 'Not A Triangle'
         when a = b or b = c or c = a then 'Isosceles'
         else 'Scalene'
    end
from triangles



17.  Practice > SQL > Advanced Select > The PADS
-- https://www.hackerrank.com/challenges/the-pads/problem?h_r=next-challenge&h_v=zen

select name + '(' + substring(occupation,1,1) + ')' from occupations order by name

select 'There are a total of ' + cast(count(*) as varchar(20)) + ' ' + lower(occupation) + 's.' from occupations group by occupation order by count(*)


18 . Practice > SQL > Advanced Join > Symmetric Pairs

-- 첫번째 풀이(해당방식으로 풀면... 오류가능성이 존재한다...)
declare @index int,@count int, @max int, @x1 int, @y1 int, @x2 int, @y2 int
declare @table table (newx int, newy int)
set @max = (select count(*) from functions)
set @count = 0
set @index = 1
while @count < @max
begin
    set @index = 1
    set @x1 = (select x from functions order by x offset @count rows fetch next 1 rows only)
    set @y1 = (select y from functions order by x offset @count rows fetch next 1 rows only)
    
    while @index < @max
    begin
        set @x2 = (select x from functions order by x offset (@count + @index) rows fetch next 1 rows only)
        set @y2 = (select y from functions order by x offset (@count + @index) rows fetch next 1 rows only)
        
        if (@x1 = @y2 and @x2 = @y1)
        begin
            insert into @table values (@x1, @y1) 
        end
        
        set @index = @index + 1  
    end
    set @count = @count + 1 
end

select * from @table


--두번째 풀이(정석적인 풀이)
-- 근데 좀 와닿지가 않음 -> 많은 연습이 필요하다

select f1.x, f1.y from functions as f1 
where f1.x = f1.y and (select count(*) from functions where x = f1.x and y = f1.y) > 1
union
select f1.x,f1.y from functions as f1, functions as f2
where f1.x <> f1.y and f1.x = f2.y and f1.y = f2.x and f1.x < f2.x
order by x

19.  Practice > SQL > Basic Join > The Report
-- https://www.hackerrank.com/challenges/the-report/problem

--첫번째 방법
select 
    case when a.grade >= 8 then a.name
        else NULL
    end,
    a.grade,
    a.marks  
    from (select sts.name, 
                 sts.marks, 
                 (case when sts.marks >= gr.min_mark and sts.marks <= gr.max_mark then gr.grade
                        else 0
                  end) as grade 
            from students sts,grades gr) as a 
    where a.grade <> 0 order by a.grade desc, a.name



-- 두번째 방법
-- join 을 응용하는 방법
select case when g.grade < 8 then NULL else s.name end as name,
    g.grade,
    s.marks
from students as s
    inner join grades as g on s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.name, s.marks


--여기는 아직 해결 못한 문제 
====================임시저장============================
-- select a.hacker_id from
-- (select ss.hacker_id,ss.challenge_id,max(ss.score) from submissions ss group by ss.hacker_id,ss.challenge_id,ss.score) as a


select m.* from
(select hacker_id,challenge_id,max(score) as  score from submissions group by hacker_id, challenge_id) as m

--alias 달고 안달고의 차이가 왜 나는거지?


-- SELECT m.hacker_id FROM
-- (SELECT hacker_id, challenge_id, MAX(score) AS score FROM Submissions GROUP BY hacker_id, challenge_id) AS m


--select * from submissions

--select ss.submission_id from submissions ss group by ss.submission_id


--select name,count(*) from hackers group by name


--select * from submissions
--select * from hackers

--select hk.hacker_id,hk.name,ss.challenge_id,ss.score from hackers hk inner join
-- select hk.hacker_id, hk.name, ss.challenge_id from hackers hk inner join
--       submissions ss on hk.hacker_id = ss.hacker_id
        --group by hk.hacker_id
        --group by hk.hacker_id
        --where hk.hacker_id = 69832
            --group by ss.challenge_id

--
-- select ss.challenge_id,hk.name,max(ss.score) from hackers hk inner join
--       submissions ss on hk.hacker_id = ss.hacker_id
--         group by hk.hacker_id, ss.challenge_id, hk.name
--             order by hk.hacker_id 
 
-- declare @asd varchar(30)
-- set @asd = '---------------'
-- print @asd

-- select hk.hacker_id, hk.name, ss.challenge_id from hackers hk inner join
--       submissions ss on hk.hacker_id = ss.hacker_id

-- select b.* from
-- (select score from submissions) as b 


-- 1. 점수에 따라 차등
-- select a.* from
-- (select ss.challenge_id,hk.name,max(ss.score) from hackers hk inner join
--       submissions ss on hk.hacker_id = ss.hacker_id
--         group by hk.hacker_id, ss.challenge_id, hk.name) as a


--select * from submissions group by score
-- select * from submissions as ss group by ss.hacker_id, ss.challenge_id


====================임시저장============================





