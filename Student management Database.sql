-- Task1 : STUDENT MANAGEMENT DATABASE

-- CREATE DATABASE
CREATE DATABASE StudentManagement;

-- USE DATABASE
USE StudentManagement;

-- CREATE STUDENT TABLE
CREATE TABLE Students (
	StudentID INT PRIMARY KEY
 AUTO_INCREMENT,
    Name VARCHAR(50),
	Gender CHAR(1),
	Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
	EnglishScore INT
);

-- INSERT DATA INTO STUDENTS
INSERT INTO Students(Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES
('Aditi','F',18,'A',85,90,88),
('Rahul','M',19,'B',78,82,80),
('Priya','F',18,'A',92,89,95),
('Aman','M',20,'C',65,70,68),
('Sneha','F',19,'B',74,77,79),
('Vikash','M',21,'A',88,85,87),
('Neha','F',20,'B',81,83,82),
('Rohit','M',19,'C',60,65,63),
('Pooja','F',18,'A',90,91,89),
('Karan','M',20,'B',72,75,70);

-- SQL QUERIES

-- 1. SHOW ALL STUDENTS
SELECT * FROM Students;


-- 2. AVERAGE SCORE IN EACH SUBJECT
SELECT
    AVG(MathScore) AS Avg_Math,
    AVG(ScienceScore) AS Avg_Science,
    AVG(EnglishScore) AS Avg_English
FROM Students;

-- 3. TOP PERFORMER
 SELECT Name, (MathScore + ScienceScore + EnglishScore) AS Total
 FROM Students
 ORDER BY Total DESC
LIMIT 1;

-- 4. COUNT STUDENTS PER GRADE
 SELECT Grade, COUNT(*) AS
 Total_Students
 FROM Students
 GROUP BY Grade;

-- 5. AVERAGE SCORE BY GENDER
 SELECT Gender,
	     AVG(MathScore) AS Avg_Math,
         AVG(ScienceScore) AS Avg_Science,
         AVG(EnglishScore) AS Avg_English
FROM Students
GROUP BY Gender;

-- 6. STUDENTS WITH MATH SCORE > 80
SELECT *
FROM Students
WHERE MathScore > 80;

-- 7. UPDATE A STUDENT'S GRADE
UPDATE Students 
Set Grade = 'A'
WHERE Name ='Sneha';
LIMIT 1;

-- END OF TASK1

-- TASK2 : COURSES & ENROLLMENTS

-- CREATE COURSES TABLE
CREATE TABLE Courses (
	id INT PRIMARY KEY,
	name VARCHAR(50)
	);

-- CREATE ENROLLMENTS TABLE
CREATE TABLE Enrollments (
	student_id INT,
	course_id INT,
	grade INT,
	FOREIGN KEY (student_id)
	REFERENCES Students(StudentID),
	FOREIGN KEY (course_id)
	REFERENCES Courses (id)
	);

-- INSERT INTO COURSES
INSERT INTO Courses VALUES
(101,'Math'),
(102,'Science'),
(103,'English');

-- INSERT DATA INTO ENROLLMENTS
INSERT INTO Enrollments VALUES
(1,101,85),
(1,102,78),
(2,101,40),
(2,103,35),
(3,102,90),
(3,103,88),
(4,101,25),
(4,102,30),
(5,103,95);

-- QUERIES

-- 1. LIST STUDENTS IN EACH COURSE
SELECT c.name AS course_name, s.Name AS student_name
FROM Enrollments e
JOIN students s ON e.student_id = s.StudentID
JOIN Courses c ON e.course_id=c.id
ORDER BY c.name;

-- 2. AVERAGE GRADE PER COURSE
SELECT c.name AS course_name,
AVG(e.grade) AS avg_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.id
GROUP BY c.name;

-- 3. TOP 3 STUDENTS OVERALL
SELECT s.Name, AVG(e.grade) AS avg_grade
FROM Enrollments e
JOIN students s ON e.student_id = s. StudentID
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- 4. COUNT STUDENTS WHO FAILED (GRADE < 40)
SELECT COUNT(DISTNICT student_id) AS failed_students
FROM Enrollments
WHERE grade <40;

-- END OF TASK2
