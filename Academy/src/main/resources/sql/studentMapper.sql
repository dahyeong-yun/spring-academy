-- 메인 수강 과목 리스트 3개
select stu_id, lec_id, lec_name, lec_dis
from (select s.stu_id, l.lec_id, l.lec_name, l.lec_dis,
        row_number() over(order by l.lec_id desc) as row_num
      from attend_lecture a
      join student s
      on s.stu_id = a.stu_id
      join lecture l
      on l.lec_id = a.lec_id
      where s.stu_id = 2)
where row_num between 1 and 3;

select * from users;
