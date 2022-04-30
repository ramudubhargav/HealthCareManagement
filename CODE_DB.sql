select count(*) as doc_count 
from doc_schedule, dept 
where doc_schedule.dept_num = dept.id and dept.name_var = 'Gastroenterology';

select count(*) as jun_doc_count 
from doctors 
where id like 'J%';

select patient_id, bed_num 
from admit 
where patient_id='1';

select count(*) as patient_count 
from admit, dept
where admit.dept_num = dept.id and dept.name_var = 'Children Care';

select name_var as dept_name
from dept
where total_workers >= all(select total_workers from dept);

select name_var as dept_name 
from dept
where floor=2;