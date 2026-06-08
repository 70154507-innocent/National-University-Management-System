# 🎓 National University Management System
## 📌 Project Overview
The **National University Management System** is a database-driven application designed to manage university operations efficiently. It stores and manages information related to departments, teachers, students, courses, classrooms, enrollments, attendance, examination results, fee records, and user accounts.

The system provides a centralized database that helps administrators, teachers, and students perform academic and administrative tasks while ensuring data consistency, accuracy, and security.

## 🚀 Features
1. **Create New Table** – Creates new database tables such as Hostel to extend the system.
2. **Insert Data** – Adds new student and university records into the database.
3. **View All Students** – Displays all student records stored in the system.
4. **Search Student** – Finds a specific student using their registration number.
5. **Student-Department Join** – Shows student information along with department details.
6. **Update Student Information** – Modifies existing student records such as semester information.
7. **Delete Student Record** – Removes inactive or unnecessary student records.
8. **Student Count by Department** – Counts the number of students enrolled in each department.
9. **Modify Table Structure** – Adds new attributes such as CGPA to existing tables.
10. **User Access Control** – Manages database permissions and user access rights.

## 🗄️ Database Tables
1. Departments
2. Teachers
3. Students
4. Courses
5. Classrooms
6. Enrollments
7. Attendance
8. Results
9. Fee_Records
10. Users

## 🔗 Database Relationships
* One Department → Many Teachers
* One Department → Many Students
* One Department → Many Courses
* One Teacher → Many Courses
* Many Students ↔ Many Courses (via Enrollments)
* One Student → Many Attendance Records
* One Student → Many Results
* One Student → Many Fee Records

## 🛠️ SQL Commands Used
* CREATE TABLE
* INSERT INTO
* SELECT
* WHERE
* UPDATE
* DELETE
* JOIN
* GROUP BY
* COUNT
* ALTER TABLE
* GRANT

## 🎯 Purpose
This project demonstrates core Database Management System (DBMS) concepts including:
* Database Design
* Relational Modeling
* Primary & Foreign Keys
* SQL Queries
* Data Manipulation (DML)
* Data Definition (DDL)
* Access Control (DCL)

## 👨‍💻 Technologies Used
* MySQL
* SQL
* Relational Database Management System (RDBMS)

## 📷 Output Screenshots
Screenshots demonstrating the execution of all features and SQL queries can be added in this section.

## 📄 License
This project was developed for educational and academic purposes.
