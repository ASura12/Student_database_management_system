
CREATE DATABASE student_management;
USE student_management;


CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL,
    gender VARCHAR(1),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(100),
    depart_id INT,
    FOREIGN KEY (depart_id) REFERENCES department(id)
);


CREATE TABLE enrollment (
    std_id INT,
    course_id INT,
    grade VARCHAR(2),  -- Changed to VARCHAR(2) in case of grades like "A+"
    PRIMARY KEY(std_id, course_id),
    FOREIGN KEY (std_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);


INSERT INTO department (id, dept_name) VALUES
(201, 'Computer Science Engineering'),
(202, 'Arts and Humanities'),
(203, 'B.Sc in Nursing');


INSERT INTO student (id, name, age, gender, dept_id) VALUES
(101, 'Ashish', 21, 'M', 201),
(102, 'Navya', 20, 'F', 202),
(103, 'Ashutosh', 20, 'M', 203);


INSERT INTO courses (id, course_name, depart_id) VALUES
(1, 'B.Tech', 201),
(2, 'B.A', 202),
(3, 'B.Sc in Radiology', 203);


INSERT INTO enrollment (std_id, course_id, grade) VALUES
(101, 1, 'A'),
(102, 2, 'B'),
(103, 3, 'A');


SELECT s.name, d.dept_name
FROM student s
JOIN department d ON s.dept_id = d.id;


SELECT s.name, c.course_name
FROM student s
JOIN enrollment e ON s.id = e.std_id
JOIN courses c ON e.course_id = c.id;


SELECT 
    c.course_name,
    AVG(CASE e.grade 
            WHEN 'A' THEN 4.0
            WHEN 'B' THEN 3.0
            WHEN 'C' THEN 2.0
            WHEN 'D' THEN 1.0
            ELSE 0.0
        END) AS avg_grade
FROM enrollment e
JOIN courses c ON e.course_id = c.id
GROUP BY c.course_name;


SELECT name 
FROM student 
WHERE id NOT IN (SELECT std_id FROM enrollment);
