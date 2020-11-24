


/* ���� ���ν���(Stored Procedure)

- �������ν��� : �������ν����� �������� �������� � ������ �ϰ� ó���� �� ���ȴ�. ���� ���Ǵ� �Ϲ����� ������ ����ϴ� �ͺ��ٴ� �̰��� ���ȭ ���Ѽ� �ʿ��� ������ ȣ�⸸ �ϸ� �ξ� ���ϰ� SQL Server �� ��� �� �ִ�.


*/



CREATE TABLE dbo.USERTBL -- ȸ�� ���̺�
( userID   CHAR(8) NOT NULL PRIMARY KEY, -- ����ھ��̵�
  name     NVARCHAR(10) NOT NULL, -- �̸�
  birthYear   INT NOT NULL,  -- ����⵵
  addr    NCHAR(2) NOT NULL, -- ����(���,����,�泲 ������ 2���ڸ��Է�)
  mobile1 CHAR(3), -- �޴����� ����(011, 016, 017, 018, 019, 010 ��)
  mobile2 CHAR(8), -- �޴����� ������ ��ȭ��ȣ(����������)
  height     SMALLINT,  -- Ű
  mDate     DATE  -- ȸ�� ������
);
GO

select * from dbo.userTbl with(nolock)

CREATE TABLE dbo.BUYTBL -- ȸ�� ���� ���̺�
(  num   INT IDENTITY NOT NULL PRIMARY KEY, -- ����(PK)
   userID   CHAR(8) NOT NULL --���̵�(FK)
  FOREIGN KEY REFERENCES userTbl(userID),
   prodName  NCHAR(6) NOT NULL, --  ��ǰ��
   groupName  NCHAR(4)  , -- �з�
   price      INT  NOT NULL, -- �ܰ�
   amount     SMALLINT  NOT NULL -- ����
);
GO
INSERT INTO userTbl VALUES('LSG', '�̽±�', 1987, '����', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '�����', 1979, '�泲', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '���ȣ', 1971, '����', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '������', 1950, '���', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '������', 1969, '�泲', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');
GO

INSERT INTO buyTbl VALUES('KBS', '�ȭ', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', '�����', '����', 200,  1);
INSERT INTO buyTbl VALUES('BBK', '�����', '����', 200,  5);
INSERT INTO buyTbl VALUES('KBS', 'û����', '�Ƿ�', 50,   3);
INSERT INTO buyTbl VALUES('BBK', '�޸�', '����', 80,  10);
INSERT INTO buyTbl VALUES('SSK', 'å'    , '����', 15,   5);
INSERT INTO buyTbl VALUES('EJW', 'å'    , '����', 15,   2);
INSERT INTO buyTbl VALUES('EJW', 'û����', '�Ƿ�', 50,   1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('EJW', 'å'    , '����', 15,   1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL   , 30,   2);
GO

-- ������ testDB ��� �����ϸ� �ȴ�.

-- 1.1 �Է¸Ű������� �ִ� ���� ���ν����� ��������

use ADMIN -- ��� DB�� �������� �����Ѵ�
GO
CREATE procedure test1pd
	@username nvarchar(10)
AS
	select * from dbo.USERTBL where name = @username;
GO

--������ �غ���

exec test1pd '�̽±�'

-- 1.2 �ΰ��� �Ű������� �ִ� ���� ���ν����� ��������
use ADMIN
go
create procedure test2pd
	@userBirth int,
	@userHeight int
AS
	select * from dbo.USERTBL where birthYear > @userBirth and height > @userHeight
go

exec test2pd 1970, 170


-- 1.3 �Ű����� ������ ������� ȣ���ϰ� �ʹٸ� @�Ű����� �� �Ἥ ȣ���ϸ� �ȴ�.
exec test2pd @userHeight=170,@userBirth=1970

-- 1.4 ����Ʈ �Ű������� ����������
use ADMIN
go
create procedure test3pd
	@userBirth int = 1970,
	@userHeight int = 170
AS
	select * from dbo.USERTBL where birthYear > @userBirth and height > @userHeight
go

exec test3pd--�̷������� �׳� ���ָ� ����Ʈ���� ���� ȣ���̵ȴٰ� �����ϸ�ȴ�

exec test3pd 1970,180-- �̷������� ���� �־��ְ� �Ǹ� �ش簪�� �޾Ƽ� ���ν����� ȣ���ϰ� �ȴ�.


--1.5  
go
create procedure test4pd
	@txtvalue nchar(10),
	@outvalue int output
as
	insert into dbo.TESTTBL values (@txtvalue);
	select @outvalue = IDENT_CURRENT('TESTTBL');
go

create table dbo.TESTTBL (id INT IDENTITY, txt NCHAR(10)) -- �̷������� ���̺��� ���ν��� �ڿ� �����ص� ������ �ȴ� �̰��� "������ �̸� Ȯ��" �̶�� �θ���.

go

--������ ������ ���ν����� ����غ���
declare @myvalue int;--���⼭ output ���� �ʱ�ȭ���ػ��� -> output ���� ���� �׸��� ���� ���¶�� �����ϸ� �ȴ�.
exec test4pd 'test value',@myvalue output;
print '���� �Է��� ID ��' + CAST(@myvalue as char(5));

select * from dbo.TESTTBL with(nolock) -- ���������� �� ���� �ȴ�.
