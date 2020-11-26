

--인덱스 스캔에 대해서 


set nocount on

--drop table tmp_myfan


CREATE TABLE tmp_myfan

(

     fan_id   INT          NOT NULL                                           -- 고유값

   , fan_name NVARCHAR(20) NOT NULL                                           -- 날조아하는여학생명

   , fan_feel FLOAT        NOT NULL DEFAULT 0                                 -- 호감지수

   , fan_gift NVARCHAR(30)     NULL                                           -- 그녀들이내게한선물

   , fan_date VARCHAR(8)   NOT NULL DEFAULT CONVERT(CHAR(8), GETDATE(), 112)  -- 선물받은날짜

   , cr_date  DATETIME              DEFAULT GETDATE()                         -- 입력날짜

);

 
 
 


CREATE UNIQUE CLUSTERED INDEX ix_tmp_myfan ON tmp_myfan(fan_id, cr_date);  --fan_id 와 cr_date 에 clustered index 를 적용해준것이다.

 
 select * from tmp_myfan

 select fan_id , cr_date from tmp_myfan where fan_id = 110 and cr_date = '2020-11-26 23:27:35.387'

 select fan_id , cr_date from tmp_myfan


INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(143, '이나영', 99, '룰렉스시계');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(154, '유 이', 93, '스포츠카');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(111, '박보영', 90, 'NOTEBOOK');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(122, '김혜진', 91, '행복한눈물');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(110, '문근영', 95, '타워팰리스');

INSERT INTO tmp_myfan(fan_id, fan_name, fan_feel, fan_gift) VALUES(125, '이지아', 88, '나이키신발');


select * from tmp_myfan


select cr_date from tmp_myfan where fan_id = 110


select fan_name , fan_feel from tmp_myfan where fan_id = 110 --> 이렇게 하면 인덱스 검색이 되네?? select 뒤에 두 건은 인덱스 설정 안해둔것이고 where 뒤에 fan_id 는 클러스터형 인덱스로 설정해준것이다.




select fan_name , fan_feel from tmp_myfan where fan_id = 110--이렇게 하면 인덱스 검색이 되네??



SELECT fan_id, cr_date FROM tmp_myfan WHERE fan_id = 110; -- 이런식으로 검색을 하면 clustered index 의 형태가 생성되게 된다.


SELECT fan_id FROM tmp_myfan WHERE fan_feel > 95;


CREATE INDEX ix_non_tmp_myfan ON tmp_myfan(fan_feel);




-- 클러스터 인덱스는 영어사전
-- 비클러스터 인덱스는 찾아보기!! 꼭 기억하자구나;;;



create table dbo.MIXEDTBL
(
	userID varchar(30) not null,
	name varchar(30) not null,
	addr varchar(40)
)

--테이블 스캔이 일어나네?
select name from dbo.MIXEDTBL where userID = 'YJS'

select addr from dbo.MIXEDTBL where userID = 'YJS'




-- 테이블 스캔은 또 왜 일어나는건지 잘 모르겠는데 뭐지 뭐지 뭐지 

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

insert into dbo.TBLSONG values ('보고싶다',1293,'KKH')
insert into dbo.TBLSONG values ('미친사랑',12593,'SSK')
insert into dbo.TBLSONG values ('빙수야 팥빙수야',79893,'EJW')
insert into dbo.TBLSONG values ('가슴아 그만해',987853,'JYP')
insert into dbo.TBLSONG values ('한숨',45478,'JYP')
insert into dbo.TBLSONG values ('기대',9978,'KKH')

-- 이렇게만 봐도 정말 어려운건데
-- 정말 어렵구나 어려워 

select mt.userID from dbo.MIXEDTBL mt with(force seek) inner join
	dbo.TBLSONG ts with(FORCESEEK) on mt.userID = ts.song_singer 


select mt.userID from dbo.MIXEDTBL mt option()


