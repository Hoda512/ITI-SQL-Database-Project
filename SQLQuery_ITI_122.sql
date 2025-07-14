Create database ITI_122;
Go
use ITI_122;
Go
CREATE TABLE Department (
    dept_id INT PRIMARY KEY IDENTITY(1,1),
    dep_name VARCHAR(100),
    Manager_id INT ,
    Hire_Date DATE
);

CREATE TABLE Students (
    St_id INT PRIMARY KEY IDENTITY(1,1),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    St_address VARCHAR(100),
    St_age INT,
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Instructor (
    ins_id INT PRIMARY KEY IDENTITY(1,1),
    ins_name VARCHAR(100),
    ins_salary FLOAT,
    ins_hourRate FLOAT,
    ins_bouns FLOAT,
    ins_address VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

ALTER TABLE Department
ADD CONSTRAINT FK_Manager FOREIGN KEY (Manager_id) REFERENCES Instructor(ins_id);

CREATE TABLE Topic (
    top_id INT PRIMARY KEY IDENTITY(1,1),
    top_name VARCHAR(100)
);

CREATE TABLE Courses (
    crs_id INT PRIMARY KEY IDENTITY(1,1),
    crs_name VARCHAR(100),
    crs_duration INT,
    crs_Description TEXT,
    top_id INT,
    FOREIGN KEY (top_id) REFERENCES Topic(top_id)
);
CREATE INDEX COURSES_COURSE_ID_INDEX ON Courses(crs_id);

CREATE TABLE Student_Course (
    St_id INT,
    Crs_id INT,
    Grade FLOAT,
    PRIMARY KEY (St_id, Crs_id),
    FOREIGN KEY (St_id) REFERENCES Students(St_id),
    FOREIGN KEY (Crs_id) REFERENCES Courses(crs_id)
);

CREATE TABLE Instructor_Course (
    ins_id INT,
    crs_id INT,
    Evaluation FLOAT,
    PRIMARY KEY (ins_id, crs_id),
    FOREIGN KEY (ins_id) REFERENCES Instructor(ins_id),
    FOREIGN KEY (crs_id) REFERENCES Courses(crs_id)
);

INSERT INTO Topic (top_name) VALUES 
('Programming'),
('Database');

INSERT INTO Department (dep_name, Hire_Date) VALUES 
('Computer Science', '2020-01-01'),
('Information Systems', '2021-05-15');

INSERT INTO Instructor (ins_name, ins_salary, ins_hourRate, ins_bouns, ins_address, dept_id) VALUES 
('Ahmed Mohamed', 8000, 150, 1000, 'Cairo', 1),
('Sara Ali', 8500, 160, 1200, 'Giza', 2);

UPDATE Department SET Manager_id = 1 WHERE dept_id = 1;
UPDATE Department SET Manager_id = 2 WHERE dept_id = 2;

INSERT INTO Students (Fname, Lname, St_address, St_age, Dept_id) VALUES 
('Omar', 'Yasser', 'Nasr City', 21, 1),
('Laila', 'Mostafa', 'Heliopolis', 22, 2);

INSERT INTO Courses (crs_name, crs_duration, crs_Description, top_id) VALUES 
('SQL Basics', 30, 'Introduction to SQL', 2),
('C# Fundamentals', 40, 'Basics of C# language', 1);

INSERT INTO Instructor_Course VALUES 
(1, 1, 4.5),
(2, 2, 4.8);

INSERT INTO Student_Course VALUES 
(1, 1, 90),
(2, 2, 85);

CREATE VIEW View_InstructorCourses AS
SELECT 
    I.ins_name AS InstructorName,
    C.crs_name AS CourseName,
    IC.evaluation AS Evaluation
FROM 
    Instructor I
INNER JOIN 
    Instructor_Course IC ON I.ins_id = IC.ins_id
INNER JOIN 
    Courses C ON IC.crs_id = C.crs_id;

CREATE VIEW View_StudentCourses AS
SELECT 
    S.Fname + ' ' + S.Lname AS StudentName,
    C.crs_name AS CourseName,
    SC.grade AS Grade
FROM 
    Students S
INNER JOIN 
    Student_Course SC ON S.st_id = SC.st_id
INNER JOIN 
    Courses C ON SC.crs_id = C.crs_id;

	CREATE VIEW View_StudentCourses AS
SELECT 
    S.Fname + ' ' + S.Lname AS StudentName,
    C.crs_name AS CourseName,
    SC.grade AS Grade
FROM 
    Students S
INNER JOIN 
    Student_Course SC ON S.st_id = SC.st_id
INNER JOIN 
    Courses C ON SC.crs_id = C.crs_id;

	CREATE PROCEDURE GetStudentCourses
    @StudentID INT
AS
BEGIN
    SELECT 
        S.Fname + ' ' + S.Lname AS StudentName,
        C.crs_name AS CourseName,
        SC.grade AS Grade
    FROM 
        Students S
    INNER JOIN 
        Student_Course SC ON S.st_id = SC.st_id
    INNER JOIN 
        Courses C ON SC.crs_id = C.crs_id
    WHERE
        S.st_id = @StudentID;
END
create	Unique Clistered index View_StudentCourses_index on dbo.View_StudentCourses;
SELECT * FROM Department;
SELECT * FROM Instructor;
SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM Topic;
EXEC GetStudentCourses @StudentID = 2;
SELECT * FROM dbo.View_InstructorCourses;
SELECT * FROM dbo.View_StudentCourses;
