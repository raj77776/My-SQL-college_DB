CREATE DATABASE college;
USE college;

CREATE TABLE student (
rollno int primary key,
name varchar(50),
marks INT not null,
grade varchar(1),
city varchar(20)
);
CREATE TABLE department (
id int primary key,
name varchar(50) not null
);

INSERT INTO department
(id,name)
VALUES
(101,"Maths"),
(102,"English");

UPDATE department
SET id = 296
WHERE id = 102;



SELECT * FROM department;
CREATE TABLE teacher(
id int primary key,
name varchar(50) not null,
subid int,
FOREIGN KEY (subid) REFERENCES department(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);
INSERT INTO teacher
(id,name,subid)
VALUES
(101,"Viraj",101),
(102,"Ganesh",102),
(103,"Prathamesh",102),
(104,"Goel",101),
(105,"Mithun",102);

SELECT * FROM teacher;




INSERT INTO student 
(rollno,name,marks,grade,city)
VALUES
(101,"anil",45,"C","Pune"),
(102,"bhumika",45,"A","Mumbai"),
(103,"chetan",88,"A","Delhi"),
(104,"trevor",91,"A","Delhi"),
(105,"okoye",98,"A","Gujarat"),
(106,"farah",35,"F","Karad");

SELECT * FROM student;

SELECT upper(city) FROM student;

UPDATE student
SET city = upper(city);

SET SQL_SAFE_UPDATES = 0;

USE college;

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN grade;

DELETE FROM student
WHERE marks<50;

DROP TABLE student

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "D"
WHERE marks BETWEEN 20 AND 50;

DELETE FROM student
WHERE marks>50;




SET SQL_SAFE_UPDATES = 0;

USE college;
SELECT marks, count(marks)
FROM student
GROUP BY marks
HAVING max(marks)>90

DROp TABLE student;


SELECT grade,name, count(name)
FROM  student
GROUP BY grade,name
ORDER BY grade,name


SELECT count(name) FROM student;


SELECT * FROM student;
SELECT DISTINCT city from student;

 SELECT * FROM student WHERE marks > 80 OR city = "Jaipur";
SELECT * FROM student WHERE marks BETWEEN 20 AND 90;
SELECT * FROM student WHERE city IN ("Mumbai","Noida");
SELECT * FROM student WHERE city NOT IN ("Mumbai", "Delhi");
SELECT * FROM student where marks>30
LIMIT 2;
SELECT * FROM student 
ORDER BY name asc;

SELECT * FROM student 
ORDER BY marks desc
limit 3;

SELECT max(marks) from student;
SELECT avg(marks) from student;
SELECT count(rollno) from student;

SELECT count(grade) from student
group by grade;

SELECT city, count(grade) FROM student
group by city;

DROP TABLE student

USE college;

CREATE TABLE company (
id int auto_increment primary key,
name varchar(60) not null,
age tinyint unsigned,
city varchar(100),
salary int
);

INSERT INTO company
(name,age,city,salary)
VALUES
("Sarfraj Patel", 24,"Delhi", 25000),
("Vikas Yadav",42,"Delhi",35000),
("Golu Kumar",52,"Mumbai", 55000),
("Rohit Advani",55,"Banglore",50000),
("Bhanu Sharma",24,"Pune",25000), 
("Mohd Kaif",42,"Delhi",25000),
("Hrithik Kashyap",24,"Gujarat",75000),
("Akash Singh",42,"Delhi",25000),
("Rohit Dagla", 24,"Pune",25000),
("Karthik Singh",44,"Chennai",25000),
("Sarfraj",39,"Kochi",95000),
("Mohit Yadav",65,"Thiruvantapuram",100000),
("Ajay Tanwar",63, "Mumbai",150000),
("Diksha Madaan",63,"Mumbai",200000);

ALTER TABLE company 
ADD COLUMN attendance int not null;

ALTER TABLE organization
CHANGE COLUMN salary payscale int not null;

ALTER TABLE company
ADD COLUMN address varchar(250);

ALTER TABLE organization
MODIFY payscale int unique;

ALTER TABLE company
DROP COLUMN attendance;

SELECT * FROM organization;

ALTER TABLE company
RENAME TO organization;

SELECT age,city, count(salary)
from company
group by age,city;


CREATE TABLE isoton (
id int primary key auto_increment,
name varchar(55) unique,
age varchar(2),
city varchar(50) not null
);

INSERT INTO isoton
(name,age,city)
VALUES
("Albert",24,"San Francisko"),
("Ronnie",45,"Chicago"),
("Vikas",50,"Texas"),
("Ramesh",32,"Australia")

SELECT * FROM google

ALTER TABLE google
CHANGE COLUMN name fullname varchar(50) not null;

ALTER TABLE isoton
ADD COLUMN salary int not null;

ALTER TABLE isoton
RENAME TO google

ALTER TABLE google
CHANGE COLUMN salary payscale int 

INSERT INTO google 
(name,age,city)
VALUES
("Remy",101,"Congo");

TRUNCATE TABLE google;

SELECT * FROM google;


ALTER TABLE google
MODIFY COLUMN age varchar(3);

USE college;


CREATE TABLE capegemini (
emp_id int unique,
name varchar(65) not null,
age int,
salary int
);

INSERT INTO capegemini
(emp_id,name,age,salary)
VALUES
(101,"Shrirang",38,25000),
(102,"Gaurav",42,50000),
(103,"Aditya",39,25000),
(104,"Vikas",52,90000),
(256,"Rohit",39,80000),
(455,"Vijay",44,65000);

DROP TABLE capegemini

SELECT * FROM capegemini;

CREATE TABLE posting(
job_id int not null,
name varchar(65)
);

INSERT INTO posting
(job_id,name)
VALUES
(101, "Software Developer"),
(104, "Database Admin"),
(102, "Sales Dept"),
(106, "HR Dept"),
(103, "Cybersecurity Analyst"),
(105, "Technical Support Engineer");

SELECT * FROM capegemini as c
LEFT JOIN posting as p
ON c.emp_id = p.job_id
UNION
SELECT * FROM capegemini as c
RIGHT JOIN posting as p
ON c.emp_id = p.job_id 

USE  college;


CREATE TABLE amazon (
emp_id int not null,
name varchar(50),
manager_id int
);

INSERT INTO amazon 
(emp_id,name,manager_id)
VALUES
(1,"ALI",4),
(2,"HAMZA",4),
(3,"AZHAR",5),
(4,"SHAIKH",6),
(5,"NASIR",NULL),
(6,"KHAN",NULL);

SELECT * FROM amazon;

SELECT a.name as employee, b.name as manager
FROM amazon as a
LEFT JOIN amazon as b
ON a.manager_id = b.emp_id;



DROP TABLE amazon;

CREATE TABLE isoton (
emp_id int not null,
name varchar(55),
manager_id int
);

INSERT INTO isoton
(emp_id,name,manager_id)
VALUES
(101,"Arif",103),
(102,"Shadab",103),
(103,"Ahmed",105),
(104,"Rafik",106),
(105,"Muskan",NULL),
(106,"Sarfraj",NULL),
(107,"Sarfraj",NULL);

SELECT * FROM isoton

SELECT a.name as employee,b.name  as manager
FROM isoton as a
INNER JOIN isoton as b
ON a.manager_id = b.emp_id;



DROP TABLE isoton;

SELECT name FROM isoton
UNION ALL
SELECT name FROM isoton;

SELECT * FROM isoton
UNION ALL
SELECT * FROM amazon;

CREATE TABLE infosys (
rollno int auto_increment PRIMARY KEY,
name varchar(55) not null,
marks int,
city varchar(55)
);

INSERT INTO infosys 
(name,marks,city)
VALUES
("Sarfraj",78,"Pune"),
("Vinay",86,"Mumbai"),
("Rohit",95,"Mumbai"),
("Gaurav",92,"Delhi"),
("Sahil",55,"Delhi"),
("Minakshi",48,"Delhi"),
("Aryan",100,"Delhi");

USE college;

SELECT name, count(rollno)
FROM infosys 
GROUP BY name;

SELECT marks FROM student
ORDER BY marks desc
LIMIT 2;



SELECT * FROM infosys;

DELETE  FROM infosys
WHERE city NOT IN ("Delhi", "Mumbai");

SELECT avg(marks) FROM infosys;

SELECT marks,name
FROM infosys
WHERE marks > (SELECT avg(marks) FROM infosys);

SELECT marks,name 
FROM infosys
WHERE rollno % 2 = 0;

SELECT name 
FROM infosys
WHERE marks IN (SELECT marks FROM infosys WHERE rollno % 2 = 0);

ALTER TABLE infosys 
ADD COLUMN city varchar(50) not null;

SELECT max(marks) FROM student WHERE city IN ("Delhi");

CREATE VIEW sales as
SELECT name,city FROM infosys;

DROP TABLE infosys; 

USE college;

SELECT * FROM sales;

DESCRIBE infosys;

DROP VIEW sales;

SHOW INDEX FROM infosys;

EXPLAIN infosys;

EXPLAIN SELECT * FROM infosys WHERE marks = 100;

SELECT * FROM capegemini;

SHOW INDEX FROM capegemini;

CREATE INDEX sort_salary ON capegemini(salary);

EXPLAIN SELECT * FROM capegemini 
WHERE salary = 65000;

SELECT name,age FROM capegemini
WHERE salary = 65000;

ALTER TABLE capegemini
DROP INDEX sort_salary;



























DROP table company;

