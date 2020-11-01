





create table tblSubject(
	
	gd_seq int primary key,
	gd_name nvarchar(20) not null,
	gd_price int not null

)

create sequence seqSubject

drop sequence seqSubject


CREATE SEQUENCE [dbo].[SEQ]
AS [int]     --int 정수형
START WITH 0 -- 시작 값 0부터
INCREMENT BY 1       -- 증가 값 +1
MINVALUE -2147483648 --최소값 int 크기
MAXVALUE 2147483647  --최대값
CACHE
GO


CREATE SEQUENCE [dbo].[shseq]
AS [int]     --int 정수형
START WITH 0 -- 시작 값 0부터
INCREMENT BY 1       -- 증가 값 +1
MINVALUE -2147483648 --최소값 int 크기
MAXVALUE 2147483647  --최대값
CACHE
GO





insert into tblSubject values (next value for shseq, '맨투맨', 120000)

insert into tblSubject values (next value for shseq, '맨투맨2', 150000)



select * from tblSubject


select count(*) as "asd" from tblSubject where gd_price > 120000



