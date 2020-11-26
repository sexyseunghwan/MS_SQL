

--�ε��� ��ĵ�� ���ؼ� 


set nocount on

--drop table tmp_myfan


CREATE TABLE tmp_myfan

(

     fan_id   INT          NOT NULL                                           -- ������

   , fan_name NVARCHAR(20) NOT NULL                                           -- �������ϴ¿��л���

   , fan_feel FLOAT        NOT NULL DEFAULT 0                                 -- ȣ������

   , fan_gift NVARCHAR(30)     NULL                                           -- �׳���̳����Ѽ���

   , fan_date VARCHAR(8)   NOT NULL DEFAULT CONVERT(CHAR(8), GETDATE(), 112)  -- ����������¥

   , cr_date  DATETIME              DEFAULT GETDATE()                         -- �Է³�¥

);

 
 
 


CREATE UNIQUE CLUSTERED INDEX ix_tmp_myfan ON tmp_myfan(fan_id, cr_date);  --fan_id �� cr_date �� clustered index �� �������ذ��̴�.

 
 select * from tmp_myfan

 select fan_id , cr_date from tmp_myfan where fan_id = 110 and cr_date = '2020-11-26 23:27:35.387'

 select fan_id , cr_date from tmp_myfan


INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(143, '�̳���', 99, '�귺���ð�');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(154, '�� ��', 93, '������ī');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(111, '�ں���', 90, 'NOTEBOOK');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(122, '������', 91, '�ູ�Ѵ���');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(110, '���ٿ�', 95, 'Ÿ���Ӹ���');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(125, '������', 88, '����Ű�Ź�');


select * from tmp_myfan


select cr_date from tmp_myfan where fan_id = 110


select fan_name , fan_feel from tmp_myfan where fan_id = 110 --> �̷��� �ϸ� �ε��� �˻��� �ǳ�?? select �ڿ� �� ���� �ε��� ���� ���صа��̰� where �ڿ� fan_id �� Ŭ�������� �ε����� �������ذ��̴�.




select fan_name , fan_feel from tmp_myfan where fan_id = 110--�̷��� �ϸ� �ε��� �˻��� �ǳ�??



SELECT fan_id, cr_date FROM tmp_myfan WHERE fan_id = 110; -- �̷������� �˻��� �ϸ� clustered index �� ���°� �����ǰ� �ȴ�.


SELECT fan_id FROM tmp_myfan WHERE fan_feel > 95;


CREATE INDEX ix_non_tmp_myfan ON tmp_myfan(fan_feel);




-- Ŭ������ �ε����� �������
-- ��Ŭ������ �ε����� ã�ƺ���!! �� ������ڱ���;;;



create table dbo.MIXEDTBL
(
	userID varchar(30) not null,
	name varchar(30) not null,
	addr varchar(40)
)

--���̺� ��ĵ�� �Ͼ��?
select name from dbo.MIXEDTBL where userID = 'YJS'

select addr from dbo.MIXEDTBL where userID = 'YJS'




-- ���̺� ��ĵ�� �� �� �Ͼ�°��� �� �𸣰ڴµ� ���� ���� ���� 

create index IDX__MIXEDTBL__USER_ID on dbo.MIXEDTBL (userID)

create clustered index IDX__MIXEDTBL__NAME on dbo.MIXEDTBL (name)

drop table dbo.MIXEDTBL


select * from dbo.MIXEDTBL


truncate table dbo.MIXEDTBL


insert into dbo.MIXEDTBL values ('LSG','LEE SUNG KEE','SEOUL')
insert into dbo.MIXEDTBL values ('KBS','KIM BUM SOO','KN')
insert into dbo.MIXEDTBL values ('KKH','KIM KYOUNG HO','JN')
insert into dbo.MIXEDTBL values ('JYP','JHO YONG PHIL','KK')
insert into dbo.MIXEDTBL values ('SSK','SUMG SI KYOUNG','SEOUL')
insert into dbo.MIXEDTBL values ('LJB','LIM JAE BEOM','SEOUL')
insert into dbo.MIXEDTBL values ('YJS','YOON JONG SHIN','KN')
insert into dbo.MIXEDTBL values ('EJW','EUN JI WON','KB')
insert into dbo.MIXEDTBL values ('JKW','JHO KWAN WOO','KK')
insert into dbo.MIXEDTBL values ('BBK','BA BI KIM','SEOUL')


drop table dbo.TBLSONG

create table dbo.TBLSONG(
	song_no int identity(1,1),
	song_name varchar(30) not null,
	song_like int not null,
	song_singer varchar(20) not null
)

insert into dbo.TBLSONG values ('����ʹ�',1293,'KKH')
insert into dbo.TBLSONG values ('��ģ���',12593,'SSK')
insert into dbo.TBLSONG values ('������ �Ϻ�����',79893,'EJW')
insert into dbo.TBLSONG values ('������ �׸���',987853,'JYP')
insert into dbo.TBLSONG values ('�Ѽ�',45478,'JYP')
insert into dbo.TBLSONG values ('���',9978,'KKH')

-- �̷��Ը� ���� ���� �����ǵ�
-- ���� ��Ʊ��� ����� 

select mt.userID from dbo.MIXEDTBL mt with(force seek) inner join
	dbo.TBLSONG ts with(FORCESEEK) on mt.userID = ts.song_singer 


select mt.userID from dbo.MIXEDTBL mt option()


