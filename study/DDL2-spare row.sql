



-- ���Ľ� ���� ���ؼ� �˾ƺ���
-- ���Ľ����̶� : null ���� ����ȭ �Ǿ��ִ� ����Ұ� �ִ� �Ϲ� ���� �����Ҽ� �ִ�!
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

--���� null���� �������� ������������ SPARSE �� �־��ָ� ��������� �ξ��� �Ƴ��� �ִ�



