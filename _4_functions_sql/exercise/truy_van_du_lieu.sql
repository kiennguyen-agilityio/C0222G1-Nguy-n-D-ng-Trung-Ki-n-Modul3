use quan_ly_sinh_vien ;
INSERT into class  (class_name,start_date, `status`) values ("A1", "2008-12-20",1);
INSERT into class  (class_name,start_date , `status`) values ("A2", "2008-12-22",1);
INSERT into class  (class_name,start_date , `status`) values ("B3", current_date(),0);

INSERT into student (student_name, address, phone, `status`, id_class) values ("Hung","Ha Noi","0912113113",true,1);
INSERT into student (student_name, address, phone, `status`, id_class) values ("Hoa","Hai Phong",null,true,1);
INSERT into student (student_name, address, phone, `status`, id_class) values ("Manh","HCM","0123123123",false,2);

INSERT into `subject`  (sub_name,credit, `status`) values ("CF", 5,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("C", 6,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("HDJ", 5,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("RDBMS",10,1);

INSERT into mark (id_sub, id_student, mark, exam_times) values (1,1,8,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (1,2,10,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (1,3,12,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (3,1,15,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (2,2,20,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (2,3,5,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (2,1,9,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (3,2,8,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (3,3,7,1);

-- yêu cầu 1--
select *
from `Subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

-- yêu cầu 2--
select *
from Mark m1
join `subject` s on m1.id_sub=s.id_sub
WHERE m1.mark = (SELECT MAX(m.mark) FROM mark m) ;

-- yêu cầu 3 --
select
s.id_student,s.student_name,
avg(m.mark) as diem_tb
from student s
join mark m on s.id_student=m.id_student
group by s.id_student
order by diem_tb desc;
