# ITI SQL Database Project

This is a relational database project built during the ITI SQL training program. It simulates an academic management system that stores and manages data related to:

- Students  
- Departments (Tracks)  
- Courses  
- Topics  
- Instructors  

## Project Features

- Designed using Microsoft SQL Server  
- Normalized relational schema with clear relationships  
- Many-to-Many relationships using junction tables like Student_Course and Instructor_Course  
- Implementation of constraints such as:
  - Primary Key
  - Foreign Key
  - Unique Key
  - Composite Key  
- Use of Views for reporting
- Use of CTEs and Transactions
- Indexes added to improve performance

## Main SQL Files

- `CreateTables.sql` – Contains table creation scripts  
- `InsertData.sql` – Contains sample data for testing  
- `Views.sql` – Contains views such as:
  - `View_StudentCourses`
  - `View_InstructorCourses`  
- `Indexes.sql` – Includes performance tuning using indexes  

## Example Views

- `View_StudentCourses`: Shows each student’s name, course name, and grade  
- `View_InstructorCourses`: Shows each instructor’s name, courses taught, and evaluations  

## Topics Learned

- SQL Basics: DDL, DML, TCL, DCL  
- ERD design and relational modeling  
- Working with Joins: INNER, LEFT, RIGHT, FULL  
- Aggregate functions and subqueries  
- Indexes (Clustered and Non-Clustered)  
- Normalization principles  
- Backup and Restore  
- Using Views and CTEs  
- Transactions for safe data control  

## Future Enhancements

- Adding stored procedures for business logic  
- Implementing user roles and data validation  
- Expanding sample data to simulate real scenarios  
- Integrating this database into a front-end application

---

Built during my training at ITI as part of hands-on learning in database design and SQL Server.

