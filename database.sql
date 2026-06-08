-- ============================================================
--   NATIONAL UNIVERSITY MANAGEMENT SYSTEM DATABASE
-- ============================================================

-- TABLE 1: Departments
CREATE TABLE Departments (
    dept_id      INT PRIMARY KEY AUTO_INCREMENT,
    dept_name    VARCHAR(100) NOT NULL,
    dept_code    VARCHAR(10) UNIQUE NOT NULL,
    hod_name     VARCHAR(100),
    established  YEAR
);

-- TABLE 2: Teachers
CREATE TABLE Teachers (
    teacher_id   INT PRIMARY KEY AUTO_INCREMENT,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE NOT NULL,
    phone        VARCHAR(20),
    dept_id      INT,
    designation  VARCHAR(50),
    joining_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- TABLE 3: Students
CREATE TABLE Students (
    student_id   INT PRIMARY KEY AUTO_INCREMENT,
    reg_no       VARCHAR(20) UNIQUE NOT NULL,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE NOT NULL,
    phone        VARCHAR(20),
    dept_id      INT,
    semester     INT CHECK (semester BETWEEN 1 AND 8),
    dob          DATE,
    gender       ENUM('Male', 'Female', 'Other'),
    address      TEXT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    status       ENUM('Active', 'Inactive', 'Graduated', 'Expelled') DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- TABLE 4: Courses
CREATE TABLE Courses (
    course_id    INT PRIMARY KEY AUTO_INCREMENT,
    course_code  VARCHAR(15) UNIQUE NOT NULL,
    course_name  VARCHAR(150) NOT NULL,
    credit_hours INT DEFAULT 3,
    dept_id      INT,
    teacher_id   INT,
    semester     INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- TABLE 5: Classrooms
CREATE TABLE Classrooms (
    room_id      INT PRIMARY KEY AUTO_INCREMENT,
    room_no      VARCHAR(20) UNIQUE NOT NULL,
    building     VARCHAR(50),
    capacity     INT,
    has_projector BOOLEAN DEFAULT FALSE
);

-- TABLE 6: Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id    INT NOT NULL,
    course_id     INT NOT NULL,
    enroll_date   DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE (student_id, course_id)
);

-- TABLE 7: Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id    INT NOT NULL,
    course_id     INT NOT NULL,
    att_date      DATE NOT NULL,
    status        ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- TABLE 8: Results
CREATE TABLE Results (
    result_id     INT PRIMARY KEY AUTO_INCREMENT,
    student_id    INT NOT NULL,
    course_id     INT NOT NULL,
    marks_obtained DECIMAL(5,2),
    total_marks    DECIMAL(5,2) DEFAULT 100,
    grade          CHAR(2),
    exam_type      ENUM('Midterm', 'Final', 'Quiz') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- TABLE 9: Fee_Records
CREATE TABLE Fee_Records (
    fee_id       INT PRIMARY KEY AUTO_INCREMENT,
    student_id   INT NOT NULL,
    amount       DECIMAL(10,2) NOT NULL,
    paid_date    DATE,
    due_date     DATE NOT NULL,
    status       ENUM('Paid', 'Unpaid', 'Partial') DEFAULT 'Unpaid',
    semester     INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- TABLE 10: Users
CREATE TABLE Users (
    user_id      INT PRIMARY KEY AUTO_INCREMENT,
    username     VARCHAR(50) UNIQUE NOT NULL,
    password     VARCHAR(255) NOT NULL,
    role         ENUM('Admin', 'Teacher', 'Student') NOT NULL,
    linked_id    INT,
    is_active    BOOLEAN DEFAULT TRUE
);

-- PRE-REQUISITE SAMPLE DATA (Taake tables khali na rahein aur features sahi chalein)
-- ============================================================
INSERT INTO Departments (dept_name, dept_code, hod_name, established) VALUES
('Computer Science', 'CS', 'Dr. Kamran', 2015),
('Electrical Engineering', 'EE', 'Dr. Zain', 2018);

INSERT INTO Students (reg_no, full_name, email, phone, dept_id, semester, status) VALUES
('NU-999', 'Zeeshan Khan', 'zeeshan@gmail.com', '03112223344', 1, 2, 'Inactive');
