-- practice1
-- q1-q10
select*
from professor;

select*
from department;

select `STU_FNAME`, `STU_LNAME`
from student;

    -- columns names "Firstname" and "Lastname"
select STU_FNAME As Firstname, STU_LNAME As Lastname
from student;
    
    -- unique from class table
select distinct `COURSE_CODE`
from class;

	-- unique course code and classroom from class table
select distinct `COURSE_CODE`, `CLASS_ROOM`
from class;

select `COURSE_CODE`, `CRS_CREDIT`
from course;

select `CLASS_CODE`, `COURSE_CODE`, `CLASS_TIME`, `CLASS_ROOM`
from class;

    -- q9 top 5 classroom numbers and the courses (code) taught in the classrooms.  
select `CLASS_ROOM`, `COURSE_CODE`
from class
group by course_code
limit 5;

    -- q10 professors' employee numbers and their teaching courses (remove some duplicates if applicable)
select distinct emp_num, course_code
from class;

    -- q11 
select `EMP_FNAME` as 'Firstname', `EMP_LNAME` as 'Lastname', `EMP_DOB` as 'DoB'
from professor
limit 10;

    -- q12 
select `EMP_FNAME` as 'Firstname', `EMP_LNAME` as 'Lastname', year(EMP_DOB) As 'Birthyear'
from professor
limit 10;

    -- q13
select `EMP_FNAME` as 'Firstname', `EMP_LNAME` as 'Lasrname', Year(CURDATE())-Year(EMP_DOB) as 'DoB'
from professor
limit 10;

    -- q14
select*
from course
order by `CRS_CREDIT` asc;

    -- q15
select stu_fname, stu_lname, stu_gpa
from student
order by stu_gpa DESC
limit 3 ;

    -- q16
select `STU_FNAME` , `STU_LNAME`,`STU_GPA` 
from student
where `STU_GPA` > 3.50;
    
    -- q17
select `STU_FNAME`, `STU_LNAME` ,`STU_GPA` 
from student
where stu_gpa<3.50 and stu_gpa>3.25;

    -- q18
select `STU_FNAME` ,`STU_LNAME` , `STU_GPA` 
from student
where stu_gpa<1.80 and stu_gpa>1.50;

    -- q19
select `STU_FNAME` as 'Firstname' , `STU_LNAME` as 'lastname' ,`STU_GPA` as 'GPA'
from student
where stu_gpa<2.0 and stu_gpa>1.8;

    -- q20 have no gpa reported
select `STU_FNAME`, `STU_LNAME`
from student
where stu_gpa is null;

    -- q21
select `STU_FNAME`, `STU_LNAME`
from student 
where Year(stu_dob) between 1970 and 1979;

    -- q22
select `DEPT_CODE`
from department
order by `DEPT_CODE` asc;

    -- q23
select `STU_NUM`, `STU_FNAME`, `STU_LNAME`, `STU_DOB`, `STU_CLASS`, `STU_GPA`, `DEPT_CODE`, `EMP_NUM`
from student
where `EMP_NUM` = '209';

    -- q24
select `EMP_FNAME`, `EMP_LNAME`, `DEPT_CODE`
from professor
where dept_code = "CIS" or dept_code = "MATH"
order by dept_code ASC;

    -- q25
select `STU_NUM`, `STU_FNAME`, `STU_LNAME`, `STU_DOB`, `STU_CLASS`, `STU_GPA`, `DEPT_CODE`, `EMP_NUM`
from student
where dept_code = "CIS" and stu_fname like "A%";

   -- q26
select `STU_NUM`, `STU_FNAME`, `STU_LNAME`, `STU_DOB`, `STU_CLASS`, `STU_GPA`, `DEPT_CODE`, `EMP_NUM`
from student
where STU_LNAME like "%son";

   -- q27
select `COURSE_CODE`, `COURSE_NAME`, `CRS_CREDIT`, `DEPT_CODE`
from course
where `COURSE_NAME` like "Intro.%";

   -- q28
select `COURSE_CODE`, `COURSE_NAME`, `CRS_CREDIT`, `DEPT_CODE`
from course
where  COURSE_NAME not like "Intro%";

   -- q29
select `COURSE_CODE`, `COURSE_NAME`, `CRS_CREDIT`, `DEPT_CODE`
from course
where dept_code = "ACCT" or dept_code= "ECON/FIN"or dept_code = "MKT/MGT";

   -- q30
select `COURSE_CODE`, `COURSE_NAME`, `CRS_CREDIT`, `DEPT_CODE`
from course
where  course_code like "%3__";

   -- q31
select class_code, course_code,class_time
from class
where class_time like "MWF%" and CLASS_SECTION = 2;

   -- q32
select class_code, course_code,class_time
from class
where class_time like "%10:00-10:50 a.m." and CLASS_SECTION = 1;

   -- q33
select class_code, course_code,class_time
from class
where class_time like "%p.m." and CLASS_SECTION = 3;

   -- q34
select CLASS_CODE, COURSE_CODE, CLASS_SECTION, CLASS_TIME, CLASS_ROOM, EMP_NUM
from class
where emp_num like "1_5" 
order by emp_num ASC;

   -- q35
select course_code,course_name,dept_code
from course
where dept_code = "CIS" or dept_code = "MATH" or dept_code = "ENG"
order by dept_code asc;

   -- q36
select course_code,course_name,dept_code
from course
where course_name like "%Application%";

    -- 37
select dept_name, DEPT_ADDRESS 
from department
where DEPT_ADDRESS like "BBG%";

	-- 38
select `DEPT_NAME`, `DEPT_ADDRESS` 
from department
where `DEPT_ADDRESS` not like "BBG%" and `DEPT_ADDRESS` not like "KLR%" ;

     -- 39
select `CLASS_CODE`, `COURSE_CODE`, `EMP_NUM`
from class
where `EMP_NUM` like "1_4" or `EMP_NUM` like "1_5" or `EMP_NUM` like "1_6" or `EMP_NUM` like "155" 
order by `EMP_NUM` asc;

    -- 40
select emp_num, course_code, class_time
from class
where class_time like "MWF%" and class_room like "KLR%" and course_code like "%3__";

    -- 41
select EMP_NUM,concat(lower(EMP_FNAME),".",SUBSTRING(lower(EMP_LNAME),1,3),"@tinycollege.edu") as email 
from professor 
where DEPT_CODE = "ACCT";

    -- 42
select `STU_NUM`, `STU_FNAME`, `STU_LNAME`, `STU_DOB`, `STU_CLASS`, `STU_GPA`, `DEPT_CODE`, emp_num
from student
where month(`STU_DOB`) = 11
order by dept_code asc;

    -- 43
select `STU_NUM`, `STU_FNAME`, `STU_LNAME`, `STU_DOB`, `STU_CLASS`, `STU_GPA`, `DEPT_CODE`, emp_num
from student
where dayofweek(`STU_DOB`) = 5;

   -- 44 
select emp_fname,emp_lname, year(curdate())-year(emp_dob) As "Age"
from professor
where year(curdate())-year(emp_dob)> 75 
order by year(curdate())-year(emp_dob) desc;

   -- 45 highest age
select MAX(year(curdate())-year(stu_dob)) as 'age'
from student;

   -- 46 avg gpa with 2 deci in class 2
select round(avg(stu_gpa),2) As "Avg"
from student
where stu_class = 2;

   -- 47 avg gpa with 2 deci in each class
select stu_class, round(avg(stu_gpa),2)
from student
group by stu_class
order by stu_class;

   -- 48 avg gpa with 2 deci in each department and sorted by dept_code
select `DEPT_CODE`, round(avg(stu_gpa),2) as 'avgGPA'
from student
group by `DEPT_CODE`
order by `DEPT_CODE` asc;

   -- 49 find number of student in each class
select stu_class, count(stu_num) as 'num_stu'
from student
group by stu_class
order by stu_class asc;

   -- 50 range of gpa - min,max of student in each class and sorted by std_class 
   -- concat = ต่อ
select stu_class, Concat("[",Min(stu_gpa),",",max(stu_gpa),"]") As "gpa_range"
from student
group by stu_class
order by stu_class asc;

   -- 51 num of stu in each department and sort by dept_code alphabetically
select dept_code, count(stu_num) as 'num_stu'
from student
group by dept_code
order by dept_code asc;

    -- 52 the list of departments (department codes) and the total numbers of professors with at least 2 professors. 
    -- Sort the result by the total number of professors ascendingly
select dept_code, count(EMP_NUM) As "num_prof"
from professor
group by dept_code
having count(emp_num) > 1  -- having การกรองหลังจัดกลุ่ม must use haing after 
order by count(EMP_NUM) asc;

    -- 53 list dept_code; have > 1 student with gpa at least 3.00
select dept_code, count(stu_num) As "num_stu"
from student
where stu_gpa >= 3.00
group by dept_code
having count(stu_num) > 1;

    -- 54 list course(course_code) that provide > 2 classes
select course_code, count(class_section) as "num_class"
from class
group by course_code
having count(class_section) > 2;

    -- 55 list department(dept_code) that offer = 1 course
select dept_code, count(course_name) as "num_course"
from course
group by dept_code
having count(course_name) = 1;

     -- 56 top 8 prof. 
     -- their departments information (professor first name, last name, department code, department name, and department address)
     -- เรียกว่าจะตัวซ้ำจากtableไหน
select `EMP_FNAME`, `EMP_LNAME`, d.dept_code, dept_name, DEPT_ADDRESS
from professor P
inner join department d
ON d.dept_code = P.dept_code
limit 8;

     -- 57 
select stu_fname, stu_lname, class_code
from student s 
inner join enroll e 
on e.stu_num = s.stu_num
where GRADE = "A" and dept_code = "cis"
order by stu_fname ASC;

    -- 58
select stu_fname, stu_lname, count(grade) 
from student s
inner join enroll e
on e.stu_num = s.stu_num
where GRADE = "A" and dept_code = "cis"
group by stu_fname
order by stu_fname ASC;

   -- 59 
select `EMP_FNAME`, `EMP_LNAME`, count(stu_num)
from professor p
inner join student s
on s.EMP_NUM = p.EMP_NUM  
group by emp_fname
having count(stu_num)>3
order by emp_fname asc; 
     
	-- 60 List all professors (professor first names and last names) who teach more than 3 classes of the 3-credit courses.
select emp_fname, emp_lname, count(*)
from professor p
inner join class c on p.emp_num = c.emp_num
inner join course co on co.course_code = c.course_code
where crs_credit = 3
group by p.emp_num
having count(c.class_code) > 3;



