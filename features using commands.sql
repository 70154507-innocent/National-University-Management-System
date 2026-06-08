-- ============================================================
-- EXECUTION OF THE 10 FEATURES WITH DIRECT OUTPUT TABLES
-- ============================================================

-- FEATURE 1: Create New Table (DDL - CREATE)
CREATE TABLE Hostel (
    hostel_id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_name VARCHAR(100) NOT NULL,
    capacity INT
);
INSERT INTO Hostel (hostel_name, capacity) VALUES ('Jinnah Hall', 150);

SELECT '--- OUTPUT FOR FEATURE 1: CREATE TABLE (HOSTEL) ---' AS Message;
SELECT * FROM Hostel;


-- FEATURE 2: Insert Data (DML - INSERT)
INSERT INTO Students (reg_no, full_name, email, phone, dept_id, semester, status)
VALUES ('NU-001', 'Ahsan Malik', 'ahsan@gmail.com', '03001234567', 1, 3, 'Active');

SELECT '--- OUTPUT FOR FEATURE 2: INSERT DATA (NEW STUDENT ADDEED) ---' AS Message;
SELECT * FROM Students WHERE reg_no = 'NU-001';


-- FEATURE 3: View All Students (DML - SELECT)
SELECT '--- OUTPUT FOR FEATURE 3: VIEW ALL STUDENTS ---' AS Message;
SELECT * FROM Students;


-- FEATURE 4: Search Student (SELECT + WHERE)
SELECT '--- OUTPUT FOR FEATURE 4: SEARCH STUDENT (NU-001) ---' AS Message;
SELECT * FROM Students WHERE reg_no = 'NU-001';


-- FEATURE 5: Join Query (DML - JOIN)
SELECT '--- OUTPUT FOR FEATURE 5: JOIN QUERY (STUDENTS WITH DEPARTMENTS) ---' AS Message;
SELECT s.student_id, s.full_name, d.dept_name
FROM Students s
INNER JOIN Departments d ON s.dept_id = d.dept_id;


-- FEATURE 6: Update Data (DML - UPDATE)
UPDATE Students SET semester = 4 WHERE reg_no = 'NU-001';

SELECT '--- OUTPUT FOR FEATURE 6: UPDATE DATA (AHSAN SEMESTER CHANGED TO 4) ---' AS Message;
SELECT student_id, full_name, semester FROM Students WHERE reg_no = 'NU-001';


-- FEATURE 7: Delete Data (DML - DELETE)
DELETE FROM Students WHERE status = 'Inactive';

SELECT '--- OUTPUT FOR FEATURE 7: DELETE DATA (INACTIVE STUDENTS REMOVED) ---' AS Message;
SELECT * FROM Students;


-- FEATURE 8: Aggregate Query (COUNT + GROUP BY)
SELECT '--- OUTPUT FOR FEATURE 8: AGGREGATE QUERY (STUDENTS COUNT PER DEPT) ---' AS Message;
SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;


-- FEATURE 9: Modify Table Structure (DDL - ALTER)
ALTER TABLE Students ADD cgpa DECIMAL(3,2);

SELECT '--- OUTPUT FOR FEATURE 9: ALTER TABLE (NEW CGPA COLUMN ADDED) ---' AS Message;
-- Kuch columns select kar rahe hain taake cgpa ka naya column end mein saaf dikhe
SELECT student_id, full_name, semester, cgpa FROM Students;


-- FEATURE 10: Grant Permissions (DCL - GRANT)
-- Note: Online compilers mein agar GRANT command block kare toh bas is akhiri section ko delete kar dena.
GRANT SELECT, INSERT, UPDATE ON *.* TO 'teacher_user'@'localhost';

SELECT '--- OUTPUT FOR FEATURE 10: GRANT PERMISSIONS SUCCESSFUL ---' AS Message;