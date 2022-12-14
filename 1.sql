USE test;
-- create
-- constraint = cac rang buoc vd default, not null. 
CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY (student_id)
);
-- insert
INSERT INTO student(name, major) VALUES( 'Chie', 'Biology');
INSERT INTO student(name, major) VALUES( 'Chie1', 'Sociology');
INSERT INTO student(name, major) VALUES( 'Chie2' ,'Sociology');
INSERT INTO student(name, major) VALUES( 'Chie3', 'Biology');
INSERT INTO student(name, major) VALUES( 'Chie4', 'Computer Science');

-- read - drop table
SELECT * FROM student;
DROP TABLE student;

-- delete
DELETE FROM student 
WHERE name = 'Chie' AND major = 'Bio';

-- update
UPDATE student 
SET major = 'Bio'
WHERE major ='Biology';

-- sort ( basic queries)
SELECT * FROM student ORDER BY  major, student_id ASC;

SELECT * 
FROM student  
ORDER BY student_id ASC
LIMIT 2;

SELECT *  from student where  major IN('Biology', 'Chemistry') and student_id > 2;
-- 

