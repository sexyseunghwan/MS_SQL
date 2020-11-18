



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



