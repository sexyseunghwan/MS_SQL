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


--2. Practice > SQL > Aggregation > The Blunder
-- https://www.hackerrank.com/challenges/the-blunder/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select
    cast(ceiling(avg(cast(salary as float)) - avg(cast(replace(salary,'0','')as float))) as int)
from employees


go


--3. Practice > SQL > Aggregation > Top Earners(***)
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select 
    max(salary*months), count(*) 
from employee 
where salary*months = (select max(salary*months) from employee)


--4. Practice > SQL > Alternative Queries > Draw The Triangle 2(***)
-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

declare @number int
set @number = 1
while @number <= 20
begin
    print replicate('* ',@number)
    set @number = @number + 1
end

--5. Practice > SQL > Aggregation > Weather Observation Station 2
-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
















