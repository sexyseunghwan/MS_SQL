


--ms sql 연습문제

go

-- 1. Practice > SQL > Alternative Queries > Print Prime Numbers
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