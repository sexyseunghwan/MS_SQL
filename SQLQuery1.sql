





create table tblSubject(
	
	gd_seq int primary key,
	gd_name nvarchar(20) not null,
	gd_price int not null

)

create sequence seqSubject

drop sequence seqSubject


CREATE SEQUENCE [dbo].[SEQ]
AS [int]     --int ������
START WITH 0 -- ���� �� 0����
INCREMENT BY 1       -- ���� �� +1
MINVALUE -2147483648 --�ּҰ� int ũ��
MAXVALUE 2147483647  --�ִ밪
CACHE
GO


CREATE SEQUENCE [dbo].[shseq]
AS [int]     --int ������
START WITH 0 -- ���� �� 0����
INCREMENT BY 1       -- ���� �� +1
MINVALUE -2147483648 --�ּҰ� int ũ��
MAXVALUE 2147483647  --�ִ밪
CACHE
GO





insert into tblSubject values (next value for shseq, '������', 120000)

insert into tblSubject values (next value for shseq, '������2', 150000)



select * from tblSubject


select count(*) as "asd" from tblSubject where gd_price > 120000



