create database student_management;
use student_management;

create table student(
 id int primary key,
 name varchar(50),
 age int not null,
 gender varchar(1),
 dept_id int,
 foreign key (dept_id) references department(id)
);

create table department(
 id int primary key,
 dept_name varchar(50)
);

create table courses(
 id int primary key,
 course_name varchar(100),
 depart_id int,
 foreign key (depart_id) references department(id)
 );
 
 create table enrollment(
  std_id int,
  course_id int,
  grade varchar(1),
  primary key(std_id,course_id),
  foreign key (std_id) references student(id),
  foreign key (course_id) references courses(id),
 );
 
 insert into department
 (id,dept_name)
 values
 (201,"Computer Science Engineering"),
 (202,"Computer Science Engineering"),
 (203,"B.Sc in Nursing");
 
 insert into student
 (id,name,age,gender,dept_id)
 values
 (101,"Ashish",21,"M",201),
 (102,"Navya",20,"F",202),
 (103,"Ashutosh",20,"M",203);
 
 insert into courses
 (id,course_name,depart_id)
 values
 (1,"B.Tech",201),
 (2,"B.A",202),
 (3,"B.Sc in Radiology",203);
 
 insert into enrollment
 (std_id,course_id,grade)
 values
 (101,1,"A"),
 (102,2,"B"),
 (103,3,"A");
 
 select s.name,d.dept_name from student s
 join department d on s.dept_id = d.id;
 
 select s.name, c.course_name from student s
 join enrollment e on s.id = e.std_id
 join courses c on e.course_id = c.id;
 
 select c.course_name, avg(cast(e.grade as float)) as avggrade
 from enrollment e join courses c on e.course_id = c .id
 group by c.course_name;
 
 select name from student 
 where id not in (select std_id from enrollment);
