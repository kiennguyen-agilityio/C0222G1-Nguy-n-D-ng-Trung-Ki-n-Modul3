select* 
from student s 
where (select substring_index(StudentName, ' ', -1)) like 'H%' ;

select* 
from class c 
where Month (StartDate)=12; 

select*
from `subject`
where credit in (3,4,5);

SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET ClassID = 2 WHERE StudentName like "%Hung";
select*
from student;

select s.StudentName,sub.SubName,m.Mark
from student s join Mark m on s.StudentID=m.StudentID 
join Subject sub on sub.SubID=m.SubID 
order by m.Mark desc , s.StudentName asc;
