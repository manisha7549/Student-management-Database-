
CREATE DATABASE StudentManagement;
USE StudentManagement;

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

SELECT * FROM Students;

SELECT
    AVG(MathScore) AS Avg_Math,
    AVG(ScienceScore) AS Acg_Science,
    AVG(EnglishScore) AS Avg_English
FROM Students;

 SELECT Name, (MathScore + ScienceScore + EnglishScore) AS Total
 FROM Students
 ORDER BY Total DESC
LIMIT 1;
 
 SELECT Grade, COUNT(*) AS
 Total_Students
 FROM Students
 GROUP BY Grade;
 
 SELECT Gender,
	     AVG(MathScore) AS Avg_Math,
         AVG(ScienceScore) AS Avg_Science,
         AVG(EnglishScore) AS Avg_English
FROM Students
GROUP BY Gender;

SELECT *
FROM Students
WHERE MathScore > 80;

UPDATE Students 
Set Grade = 'A'
WHERE Name LIKE 'Sneha';