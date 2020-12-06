--1. tblInsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 80년대생 여직원들을 출력하시오.(subquery)
select * from tblInsa
    where basicpay > (select avg(basicpay) from tblInsa
        where substr(ssn, 1, 1) = '8' and substr(ssn, 8, 1) = '1')
				and  substr(ssn, 1, 1) = '8' and substr(ssn, 8, 1) = '2';
                
--2. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력하시오.(join)
select s.name as sname, s.address, s.salary, p.project as pname from tblStaff s
    left outer join tblProject p
            on s.seq = p.staff;

--3. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?(join)
select m.name from tblVideo v
		inner join tblRent r
				on v.seq = r.video
						inner join tblMember m
								on m.seq = r.member
										where v.name = '뽀뽀할까요';

--4. tblInsa. 평균 이상의 월급을 받는 직원들?(subquery)
select * from tblInsa
		where basicpay >= (select avg(basicpay) from tblInsa);

--5. tblStaff, tblProejct. 'TV 광고'을 담당한 직원의 월급?(join)
select s.salary from tblStaff s
		inner join tblProject p
				on s.seq = p.staff
						where p.project = 'tv 광고';

--6. tblMember. 가장 나이가 많은 회원의 주소? (bYear)(subquery)
select address from tblMember
		where byear = (select min(byear) from tblMember);

--7. tblVideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?(join)
select m.name from tblMember m
		inner join tblRent r
				on m.seq = r.member
							inner join tblVideo v
									on v.seq = r.video
											where v.name = '털미네이터';

--8. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의 이름, 월급, 담당프로젝트명을 출력하시오.(join)
select s.name as sname, s.salary, p.project as pname from tblStaff s
		inner join tblProject p
				on s.seq = p.staff
						where s.address <> '서울시';


--9. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의 연락처, 이름, 구매상품명, 수량 출력하시오.(join)
select c.name, c.tel, s.item, s.qty from tblCustomer c
		inner join tblSales s
				on c.seq = s.cseq
						where s.qty >= 2;

--10. tblVideo. 모든 비디오 제목, 보유수량, 대여가격을 출력하시오.(join)
select v.name, v.qty, g.price from tblGenre g
		inner join tblVideo v
				on g.seq = v.genre;

--11. tblVideo. 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격을 가져오시오.(join)
select m.name as mname, v.name as vname, r.rentdate, g.price from tblGenre g
		inner join tblVideo v
				on g.seq = v.genre
							inner join tblRent r
										on v.seq = r.video
												inner join tblMember m
															on m.seq = r.member
																		where to_char(r.rentdate, 'yyyymm') = '200702';

--12. tblVideo. 현재 반납을 안한 회원명과 비디오명, 대여날짜 출력하시오.(join)
select m.name as mname, v.name as vname, r.rentdate from tblVideo v
		inner join tblRent r
					on v.seq = r.video
							inner join tblMember m
										on m.seq = r.member
													where r.retdate is null;

--13. tblInsa. basicpay+sudang가 100만원 미만, 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력하시오.(groupby)
select decode(floor((basicpay+sudang) / 1000000), 0, '100만원 미만', 1, '100만원 이상 ~ 200만원 미만', 2, '200만원 이상') as 급여, count(*) as 인원수 from tblInsa
		group by floor((basicpay+sudang) / 1000000)
				order by floor((basicpay+sudang) / 1000000) asc;


--14. tblInsa. 주민번호를 가지고 생년월일의 년도별 직원수 출력하시오.(group by)
select substr(ssn, 1, 2), count(*) from tblInsa
		group by substr(ssn, 1, 2)
				order by substr(ssn, 1, 2) asc;

--15. tblInsa. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(이름, 주민번호) . SUBSTR() 함수 이용.(orderby)
select name, ssn from tblInsa
		order by substr(ssn, 3, 2) asc, substr(ssn, 1, 2) desc;

--16. tblInsa. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(orderby)
select * from tblInsa
		order by to_char(ibsadate, 'mm') asc
						, to_char(ibsadate, 'yyyy') desc;

--17. tblInsa. 전체인원수, 남자인원수, 여자인원수를 동시 출력하시오.(count+decode)
select
	count(*) as 전체인원수,
	count(decode(substr(ssn, 8, 1), '1', '1')) as 남자인원수,
	count(decode(substr(ssn, 8, 1), '2', '1')) as 여자인원수
		from tblInsa;
        

--18. tblInsa. 개발부, 영업부, 총무부 인원수 출력하시오.(count+decode)
select
	count(decode(buseo, '개발부', 1)) as 개발부,
	count(decode(buseo, '영업부', 1)) as 영업부,
	count(decode(buseo, '총무부', 1)) as 총무부
		from tblInsa;

--19. tblInsa. 서울 사람의 남자와 여자의 기본급합을 출력하시오.(decode+group by)
select decode(substr(ssn, 8, 1), '1', '남자', '2', '여자') as 성별, sum(basicpay) as 급여합 from tblInsa
		where city = '서울'
				group by decode(substr(ssn, 8, 1), '1', '남자', '2', '여자');
                

--20. tblInsa. 부서별 남자와 여자 인원수를 출력하시오.(decode+group by)
select
		buseo,
		count(decode(substr(ssn, 8, 1), '1', '1')) as 남자인원수,
		count(decode(substr(ssn, 8, 1), '2', '1')) as 여자인원수
	from tblInsa
		group by buseo;
        
        

--21. employees. 총 사원 수 및 2003, 2004, 2005, 2006 년도 별 고용된 사원들의 총 수를 가져오시오.(groupby+subquery)
select 
    (select count(*) from hr.employees), 
    to_char(hire_date, 'yyyy'), 
    count(*) 
from hr.employees
	group by to_char(hire_date, 'yyyy');
    
--22. tblInsa. 남자 급여(기본급+수당)을 (내림차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery)
select a.*, rownum from (select name, buseo, jikwi, (basicpay + sudang) as salary 
        from tblInsa
            where substr(ssn, 8, 1) = '1'
                order by (basicpay + sudang) desc) a;
                                                        
--23. tblInsa. 여자 급여(기본급+수당)을 (오름차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery)
select a.*, rownum from (select name, buseo, jikwi, (basicpay + sudang) as salary 
        from tblInsa
            where substr(ssn, 8, 1) = '2'
                order by (basicpay + sudang) asc) a;
                                                        
                                                        
--24. tblInsa. 여자 인원수가 (가장 많은 부서 및 인원수) 가져오시오.(rownum+subquery+groupby)
select * from (select buseo, count(*) as cnt from tblinsa where substr(ssn, 8, 1) = '2'
	group by buseo order by count(*) desc) where rownum = 1;

--25. tblInsa. 지역별 인원수 (내림차순)순위를 가져오시오.(city, 인원수)(subquery+groupby)
select city, count(*) as cnt from tblinsa
	group by city order by count(*) desc;
    
--26. tblInsa. 부서별 인원수가 가장 많은 부서 및원수 출력하시오.(rownum+subquery+groupby)
select * from (select buseo, count(*) as cnt from tblinsa
	group by buseo order by count(*) desc) where rownum = 1;
    
    
--27. tblInsa. 남자 급여(기본급+수당)을 (내림차순) 3~5등까지 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery+groupby)
select * from (select a.*, rownum as rnum from (select name, buseo, jikwi, (basicpay + sudang) as salary from tblinsa 	order by (basicpay + sudang) desc) a) where rnum between 3 and 5;



--28. tblInsa. 입사일이 빠른 순서로 5순위까지만 가져오시오.(rownum+subquery)
select * from (select * from tblinsa order by ibsadate asc) where rownum <= 5;


--29. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 가져오시오.(rownum+subquery)
select * from (select * from tblhousekeeping
	order by (price * qty) desc) where rownum <= 3;
    
    
--30. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 가져오시오.(rownum+subquery+groupby)
select * from (select a.*, rownum as rnum from (select buseo, avg(basicpay) from tblinsa
	group by buseo
		order by avg(basicpay) desc) a) where rnum = 2;
        
        
    select 
        * 
    from tblinsa
    where buseo = (select b.buseo from
    (select a.* ,rownum r from
    (select
        buseo
    from tblinsa
    group by buseo
    order by avg(basicpay) desc) a)b
    where r = 2);
        
--31. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 가져오시오.(rownum+subquery)
select a.*, round((completedate - adddate) * 24 * 60) || '분' from (select * from tbltodo
	order by (completedate - adddate) asc) a where rownum <= 5;


--32. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마인가?
select 
	(select basicpay from (select basicpay, rownum as rnum from (select basicpay from tblinsa where substr(ssn, 8, 1) = '1' order by basicpay desc)) where rnum = 3)
	-
	(select basicpay from (select basicpay, rownum as rnum from (select basicpay from tblinsa where substr(ssn, 8, 1) = '1' order by basicpay desc)) where rnum = 9) as "급여 차액"
from dual;