create database FTT_iips;
use FTT_iips;

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(20) NOT NULL
);
CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_name VARCHAR(255) NOT NULL
);
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
);
CREATE TABLE semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_no VARCHAR(10) NOT NULL
);
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_code VARCHAR(20) NOT NULL,
    subject_name VARCHAR(255) NOT NULL,
    faculty_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
CREATE TABLE Batch_Year (
	Batch_ID INT PRIMARY KEY,
    BatchYear INT NOT NULL
);
CREATE TABLE timetable (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_id INT NOT NULL,
    subject_id INT NOT NULL,
    semester_id INT NOT NULL,
    course_id INT NOT NULL,
    Batch_ID INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (Batch_ID) REFERENCES Batch_Year(Batch_ID)
);


-- Insert rooms\
INSERT INTO rooms (room_id, room_number) VALUES
(201, 'Room-201'),
(202, 'Room-202'),
(203, 'Room-203'),
(204, 'Room-204'),
(1, 'Lab-1'),
(2, 'Lab-2'),
(3, 'Lab-3'),
(4, 'Elex Lab');
INSERT INTO rooms (room_id, room_number) VALUES
(207, 'Room-207'),
(208, 'Room-208');

-- Insert faculty
INSERT INTO faculty (faculty_id, faculty_name) VALUES
(1, 'Ms. Shraddha Soni'),
(2, 'Ms. Kirti Vijayvergia'),
(3, 'Dr. Rupesh Sendre'),
(4, 'Dr. Naresh Patel'),
(5, 'Dr. Pushpendra Dubey'),
(6, 'Mr. Dheeraj Upadhyay'),
(7, 'Mr. Rajesh Verma'),
(8, 'Ms. Poonam Mangwani'),
(9, 'Dr. Nitin Nagar'),
(10, 'Dr. Monalisa Khatre'),
(11, 'Dr. Ramesh Thakur'),
(12, 'Dr. Yasmin Shaikh'),
(13, 'Dr. Shaligram Prajapat'),
(14, 'Dr. Jugendra Dongre'),
(15, 'Dr. Rahul Singhai'),
(16, 'Dr. Kirti Mathur'),
(17, 'Dr. Pradeep Jatav'),
(18, 'Dr. Vivek Shrivastava'),
(19, 'Dr. Basant Namdeo'),
(20, 'Mr. Manju Suchdeo'),
(21, 'Visiting Faculty'),
(22, 'Project Faculty');

-- Insert courses
INSERT INTO courses (course_id, course_name) VALUES (1, 'MCA Sec-A'), (2, 'MCA Sec-B');

-- Insert semesters
INSERT INTO semesters (semester_id, semester_no) VALUES
(1, 'II'),
(2, 'IV'),
(3, 'VI'),
(4, 'VIII');

-- Insert subjects
select * from subjects;
INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(1, 'IC-205C', 'Object Oriented Programming Using C++', 1),
(2,'IC-202C', 'Internet & Web Programming', 2),
(3, 'IC-204B', 'Digital Computer Organization', 3),
(4, 'IC-201', 'Mathematics-II', 4),
(5, 'IC-206D', 'Hindi', 5),
(6, 'IC-209D', 'C++ Lab', 1),
(7, 'IC-210E', 'IWP Lab', 6),
(8, 'IC-209D', 'C++ Lab', 21),
(9, 'IC-210E', 'IWP Lab', 6),
(10, 'IC-403D', 'Programming with Java', 8),
(11, 'IC-402A', 'Discrete Mathematics', 9),
(12, 'IC-405A', 'Unix OS', 3),
(13, 'IC-401C', 'Data & Computer Communication', 7),
(14, 'IC-406D', 'Entrepreneurship', 10),
(15, 'IC-408C', 'Prog with Java Lab', 8),
(16, 'IC-411C', 'Unix OS Lab', 3),
(17, 'IC-408C', 'Prog with Java Lab', 6),
(18, 'IC-411C', 'Unix OS Lab', 21),
(20, 'IC-601', 'Intro to Cloud Computing', 18),
(21, 'IC-602', 'Human Computer Interface', 17),
(22, 'IC-603', 'System Analysis & Design', 15),
(23, 'IC-604', 'Operating Systems', 16),
(24, 'IC-606', 'Android Programming Lab', 6),
(25, 'IC-604', 'Operating Systems', 19),
(26, 'IC-811B', 'Data Mining & Warehousing', 13),
(27, 'IC-801B', 'Mobile & Wireless Computing', 20),
(28, 'IC-812', 'Theory of Computation', 12),
(29, 'IC-802B', 'Enterprise Computing Technique', 11),
(30, 'IC-812A', 'Soft Computing', 14),
(31, 'IC-810D', 'ECT Lab', 21),
(32, 'IC-813', 'M&WCLab', 21),
(33, 'IC-605', 'Project', 22);

INSERT INTO Batch_Year (Batch_ID,BatchYear) VALUES
(2025, 2025);

-- Insert timetable entries
INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES

-- MCA Semester II (Section A)
('Monday', '11:00:00', '12:00:00', 1, 6, 1, 1, 2025),
('Monday', '12:00:00', '13:00:00', 1, 6, 1, 1, 2025),
('Monday', '13:00:00', '14:00:00', 201, 1, 1, 1, 2025),
('Monday', '14:00:00', '15:00:00', 201, 3, 1, 1, 2025),
('Monday', '15:00:00', '16:00:00', 201, 5, 1, 1, 2025),
('Monday', '16:00:00', '17:00:00', 201, 2, 1, 1, 2025),

('Tuesday', '11:00:00', '12:00:00', 1, 6, 1, 1, 2025),
('Tuesday', '13:00:00', '14:00:00', 1, 6, 1, 1, 2025),
('Tuesday', '14:00:00', '15:00:00', 201, 3, 1, 1, 2025),
('Tuesday', '15:00:00', '16:00:00', 201, 5, 1, 1, 2025),
('Tuesday', '16:00:00', '17:00:00', 201, 2, 1, 1, 2025),

('Wednesday', '13:00:00', '14:00:00', 201, 1, 1, 1, 2025),
('Wednesday', '14:00:00', '15:00:00', 201, 3, 1, 1, 2025),
('Wednesday', '15:00:00', '16:00:00', 201, 2, 1, 1, 2025),
('Wednesday', '16:00:00', '17:00:00', 201, 4, 1, 1, 2025),

('Thursday', '13:00:00', '14:00:00', 201, 1, 1, 1, 2025),
('Thursday', '14:00:00', '15:00:00', 201, 3, 1, 1, 2025),
('Thursday', '15:00:00', '16:00:00', 201, 2, 1, 1, 2025),
('Thursday', '16:00:00', '17:00:00', 201, 4, 1, 1, 2025),

('Friday', '13:00:00', '14:00:00', 1, 7, 1, 1, 2025),
('Friday', '14:00:00', '15:00:00', 1, 7, 1, 1, 2025),
('Friday', '15:00:00', '16:00:00', 201, 4, 1, 1, 2025),
('Friday', '16:00:00', '17:00:00', 201, 5, 1, 1, 2025),

('Saturday', '13:00:00', '14:00:00', 1, 7, 1, 1, 2025),
('Saturday', '14:00:00', '15:00:00', 1, 7, 1, 1, 2025),
('Saturday', '15:00:00', '16:00:00', 201, 4, 1, 1, 2025),
('Saturday', '16:00:00', '17:00:00', 201, 5, 1, 1, 2025),

-- MCA Semester II (Section B)
('Monday', '13:00:00', '14:00:00', 1, 8, 1, 2, 2025),
('Monday', '14:00:00', '15:00:00', 1, 8, 1, 2, 2025),
('Monday', '15:00:00', '16:00:00', 202, 2, 1, 2, 2025),
('Monday', '16:00:00', '17:00:00', 202, 4, 1, 2, 2025),

('Tuesday', '13:00:00', '14:00:00', 1, 8, 1, 2, 2025),
('Tuesday', '14:00:00', '15:00:00', 1, 8, 1, 2, 2025),
('Tuesday', '15:00:00', '16:00:00', 202, 2, 1, 2, 2025),
('Tuesday', '16:00:00', '17:00:00', 202, 4, 1, 2, 2025),

('Wednesday', '11:00:00', '12:00:00', 1, 7, 1, 2, 2025),
('Wednesday', '12:00:00', '13:00:00', 1, 7, 1, 2, 2025),
('Wednesday', '13:00:00', '14:00:00', 202, 3, 1, 2, 2025),
('Wednesday', '14:00:00', '15:00:00', 202, 1, 1, 2, 2025),
('Wednesday', '15:00:00', '16:00:00', 202, 5, 1, 2, 2025),
('Wednesday', '16:00:00', '17:00:00', 202, 2, 1, 2, 2025),


('Thursday', '11:00:00', '12:00:00', 1, 7, 1, 2, 2025),
('Thursday', '12:00:00', '13:00:00', 1, 7, 1, 2, 2025),
('Thursday', '13:00:00', '14:00:00', 202, 3, 1, 2, 2025),
('Thursday', '14:00:00', '15:00:00', 202, 1, 1, 2, 2025),
('Thursday', '15:00:00', '16:00:00', 202, 5, 1, 2, 2025),
('Thursday', '16:00:00', '17:00:00', 202, 2, 1, 2, 2025),

('Friday', '13:00:00', '14:00:00', 201, 3, 1, 2, 2025),
('Friday', '14:00:00', '15:00:00', 201, 1, 1, 2, 2025),
('Friday', '15:00:00', '16:00:00', 202, 5, 1, 2, 2025),
('Friday', '16:00:00', '17:00:00', 202, 4, 1, 2, 2025),

('Saturday', '13:00:00', '14:00:00', 201, 3, 1, 2, 2025),
('Saturday', '14:00:00', '15:00:00', 201, 1, 1, 2, 2025),
('Saturday', '15:00:00', '16:00:00', 202, 5, 1, 2, 2025),
('Saturday', '16:00:00', '17:00:00', 202, 4, 1, 2, 2025),


-- MCA Semester IV (Section A)
('Monday', '13:00:00', '14:00:00', 203, 12, 2, 1, 2025),
('Monday', '14:00:00', '15:00:00', 203, 13, 2, 1, 2025),
('Monday', '15:00:00', '16:00:00', 203, 11, 2, 1, 2025),
('Monday', '16:00:00', '17:00:00', 203, 14, 2, 1, 2025),
('Tuesday', '13:00:00', '14:00:00', 203, 12, 2, 1, 2025),
('Tuesday', '14:00:00', '15:00:00', 203, 13, 2, 1, 2025),
('Tuesday', '15:00:00', '16:00:00', 203, 11, 2, 1, 2025),
('Tuesday', '16:00:00', '17:00:00', 203, 14, 2, 1, 2025),

('Wednesday', '13:00:00', '14:00:00', 203, 10, 2, 1, 2025),
('Wednesday', '14:00:00', '15:00:00', 203, 14, 2, 1, 2025),
('Wednesday', '15:00:00', '16:00:00', 1, 16, 2, 1, 2025),
('Wednesday', '16:00:00', '17:00:00', 1, 16, 2, 1, 2025),
('Thursday', '13:00:00', '14:00:00', 203, 10, 2, 1, 2025),
('Thursday', '14:00:00', '15:00:00', 203, 14, 2, 1, 2025),
('Thursday', '15:00:00', '16:00:00', 1, 16, 2, 1, 2025),
('Thursday', '16:00:00', '17:00:00', 1, 16, 2, 1, 2025),

('Friday', '11:00:00', '12:00:00', 1, 15, 2, 1, 2025),
('Friday', '12:00:00', '13:00:00', 1, 15, 2, 1, 2025),
('Friday', '13:00:00', '14:00:00', 203, 11, 2, 1, 2025),
('Friday', '14:00:00', '15:00:00', 203, 10, 2, 1, 2025),
('Friday', '15:00:00', '16:00:00', 203, 12, 2, 1, 2025),
('Friday', '16:00:00', '17:00:00', 203, 13, 2, 1, 2025),
('Saturday', '11:00:00', '12:00:00', 1, 15, 2, 1, 2025),
('Saturday', '12:00:00', '13:00:00', 1, 15, 2, 1, 2025),
('Saturday', '13:00:00', '14:00:00', 203, 11, 2, 1, 2025),
('Saturday', '14:00:00', '15:00:00', 203, 10, 2, 1, 2025),
('Saturday', '15:00:00', '16:00:00', 203, 12, 2, 1, 2025),
('Saturday', '16:00:00', '17:00:00', 203, 13, 2, 1, 2025),


-- MCA Semester IV (Section B)
('Monday', '13:00:00', '14:00:00', 204, 11, 2, 2, 2025),
('Monday', '14:00:00', '15:00:00', 204, 10, 2, 2, 2025),
('Monday', '15:00:00', '16:00:00', 204, 14, 2, 2, 2025),
('Monday', '16:00:00', '17:00:00', 204, 13, 2, 2, 2025),
('Tuesday', '13:00:00', '14:00:00', 204, 11, 2, 2, 2025),
('Tuesday', '14:00:00', '15:00:00', 204, 10, 2, 2, 2025),
('Tuesday', '15:00:00', '16:00:00', 204, 14, 2, 2, 2025),
('Tuesday', '16:00:00', '17:00:00', 204, 13, 2, 2, 2025),

('Wednesday', '11:00:00', '12:00:00', 3, 17, 2, 2, 2025),
('Wednesday', '12:00:00', '13:00:00', 3, 17, 2, 2, 2025),
('Wednesday', '13:00:00', '14:00:00', 204, 12, 2, 2, 2025),
('Wednesday', '14:00:00', '15:00:00', 204, 10, 2, 2, 2025),
('Wednesday', '15:00:00', '16:00:00', 1, 13, 2, 2, 2025),
('Wednesday', '16:00:00', '17:00:00', 1, 14, 2, 2, 2025),
('Thursday', '11:00:00', '12:00:00', 3, 17, 2, 2, 2025),
('Thursday', '12:00:00', '13:00:00', 3, 17, 2, 2, 2025),
('Thursday', '13:00:00', '14:00:00', 204, 12, 2, 2, 2025),
('Thursday', '14:00:00', '15:00:00', 204, 10, 2, 2, 2025),
('Thursday', '15:00:00', '16:00:00', 1, 13, 2, 2, 2025),
('Thursday', '16:00:00', '17:00:00', 1, 14, 2, 2, 2025),

('Friday', '13:00:00', '14:00:00', 204, 12, 2, 2, 2025),
('Friday', '14:00:00', '15:00:00', 204, 11, 2, 2, 2025),
('Friday', '15:00:00', '16:00:00', 204, 18, 2, 2, 2025),
('Friday', '16:00:00', '17:00:00', 204, 18, 2, 2, 2025),
('Saturday', '13:00:00', '14:00:00', 204, 12, 2, 2, 2025),
('Saturday', '14:00:00', '15:00:00', 204, 11, 2, 2, 2025),
('Saturday', '15:00:00', '16:00:00', 204, 18, 2, 2, 2025),
('Saturday', '16:00:00', '17:00:00', 204, 18, 2, 2, 2025),


-- MCA Semester VI (Section A)

('Monday', '10:00:00', '11:00:00', 203, 21, 3, 1, 2025),
('Monday', '11:00:00', '12:00:00', 203, 20, 3, 1, 2025),
('Monday', '12:00:00', '13:00:00', 203, 22, 3, 1, 2025),
('Monday', '13:00:00', '14:00:00', 203, 33, 3, 1, 2025),
('Monday', '14:00:00', '15:00:00', 203, 33, 3, 1, 2025),
('Tuesday', '10:00:00', '11:00:00', 203, 21, 3, 1, 2025),
('Tuesday', '11:00:00', '12:00:00', 203, 20, 3, 1, 2025),
('Tuesday', '12:00:00', '13:00:00', 203, 22, 3, 1, 2025),
('Tuesday', '13:00:00', '14:00:00', 203, 33, 3, 1, 2025),
('Tuesday', '14:00:00', '15:00:00', 203, 33, 3, 1, 2025),

('Wednesday', '09:00:00', '10:00:00', 1, 24, 3, 1, 2025),
('Wednesday', '10:00:00', '11:00:00', 1, 24, 3, 1, 2025),
('Wednesday', '11:00:00', '12:00:00', 203, 23, 3, 1, 2025),
('Wednesday', '12:00:00', '13:00:00', 203, 22, 3, 1, 2025),
('Wednesday', '13:00:00', '14:00:00', 203, 33, 3, 1, 2025),
('Wednesday', '14:00:00', '15:00:00', 203, 33, 3, 1, 2025),
('Thursday', '09:00:00', '10:00:00', 1, 24, 3, 1, 2025),
('Thursday', '10:00:00', '11:00:00', 1, 24, 3, 1, 2025),
('Thursday', '11:00:00', '12:00:00', 203, 23, 3, 1, 2025),
('Thursday', '12:00:00', '13:00:00', 203, 22, 3, 1, 2025),
('Thursday', '13:00:00', '14:00:00', 203, 33, 3, 1, 2025),
('Thursday', '14:00:00', '15:00:00', 203, 33, 3, 1, 2025),

('Friday', '10:00:00', '11:00:00', 203, 23, 3, 1, 2025),
('Friday', '11:00:00', '12:00:00', 203, 20, 3, 1, 2025),
('Friday', '12:00:00', '13:00:00', 203, 21, 3, 1, 2025),
('Saturday', '10:00:00', '11:00:00', 203, 23, 3, 1, 2025),
('Saturday', '11:00:00', '12:00:00', 203, 20, 3, 1, 2025),
('Saturday', '12:00:00', '13:00:00', 203, 21, 3, 1, 2025),

-- MCA Semester VI (Section B)

('Monday', '10:00:00', '11:00:00', 204, 20, 3, 2, 2025),
('Monday', '11:00:00', '12:00:00', 204, 22, 3, 2, 2025),
('Monday', '12:00:00', '13:00:00', 204, 25, 3, 2, 2025),
('Monday', '13:00:00', '14:00:00', 204, 33, 3, 2, 2025),
('Tuesday', '10:00:00', '11:00:00', 204, 20, 3, 2, 2025),
('Tuesday', '11:00:00', '12:00:00', 204, 22, 3, 2, 2025),
('Tuesday', '12:00:00', '13:00:00', 204, 25, 3, 2, 2025),
('Tuesday', '13:00:00', '14:00:00', 204, 33, 3, 2, 2025),

('Wednesday', '11:00:00', '12:00:00', 204, 21, 3, 2, 2025),
('Wednesday', '12:00:00', '13:00:00', 204, 20, 3, 2, 2025),
('Wednesday', '13:00:00', '14:00:00', 1, 24, 3, 2, 2025),
('Wednesday', '14:00:00', '15:00:00', 1, 24, 3, 2, 2025),
('Thursday', '11:00:00', '12:00:00', 204, 21, 3, 2, 2025),
('Thursday', '12:00:00', '13:00:00', 204, 20, 3, 2, 2025),
('Thursday', '13:00:00', '14:00:00', 1, 24, 3, 2, 2025),
('Thursday', '14:00:00', '15:00:00', 1, 24, 3, 2, 2025),

('Friday', '10:00:00', '11:00:00', 204, 22, 3, 2, 2025),
('Friday', '11:00:00', '12:00:00', 204, 21, 3, 2, 2025),
('Friday', '12:00:00', '13:00:00', 204, 25, 3, 2, 2025),
('Friday', '13:00:00', '14:00:00', 204, 33, 3, 2, 2025),
('Saturday', '10:00:00', '11:00:00', 204, 22, 3, 2, 2025),
('Saturday', '11:00:00', '12:00:00', 204, 21, 3, 2, 2025),
('Saturday', '12:00:00', '13:00:00', 204, 25, 3, 2, 2025),
('Saturday', '13:00:00', '14:00:00', 204, 33, 3, 2, 2025),


-- MCA Semester VIII (Section A)
('Monday', '10:00:00', '11:00:00', 201, 26, 4, 1, 2025),
('Monday', '11:00:00', '12:00:00', 201, 26, 4, 1, 2025),
('Monday', '12:00:00', '13:00:00', 201, 27, 4, 1, 2025),
('Monday', '13:00:00', '14:00:00', 4, 32, 4, 1, 2025),
('Monday', '14:00:00', '15:00:00', 4, 32, 4, 1, 2025),
('Tuesday', '10:00:00', '11:00:00', 201, 26, 4, 1, 2025),
('Tuesday', '11:00:00', '12:00:00', 201, 26, 4, 1, 2025),
('Tuesday', '12:00:00', '13:00:00', 201, 27, 4, 1, 2025),
('Tuesday', '13:00:00', '14:00:00', 4, 32, 4, 1, 2025),
('Tuesday', '14:00:00', '15:00:00', 4, 32, 4, 1, 2025),

('Wednesday', '10:00:00', '11:00:00', 201, 26, 4, 1, 2025),
('Wednesday', '11:00:00', '12:00:00', 201, 30, 4, 1, 2025),
('Wednesday', '12:00:00', '13:00:00', 201, 27, 4, 1, 2025),
('Wednesday', '13:00:00', '14:00:00', 207, 28, 4, 1, 2025),
('Thursday', '10:00:00', '11:00:00', 201, 26, 4, 1, 2025),
('Thursday', '11:00:00', '12:00:00', 201, 30, 4, 1, 2025),
('Thursday', '12:00:00', '13:00:00', 201, 27, 4, 1, 2025),
('Thursday', '13:00:00', '14:00:00', 207, 28, 4, 1, 2025),

('Friday', '09:00:00', '10:00:00', 1, 31, 4, 1, 2025),
('Friday', '10:00:00', '11:00:00', 1, 31, 4, 1, 2025),
('Friday', '11:00:00', '12:00:00', 201, 30, 4, 1, 2025),
('Friday', '12:00:00', '13:00:00', 201, 29, 4, 1, 2025),
('Friday', '13:00:00', '14:00:00', 207, 28, 4, 1, 2025),
('Saturday', '09:00:00', '10:00:00', 1, 31, 4, 1, 2025),
('Saturday', '10:00:00', '11:00:00', 1, 31, 4, 1, 2025),
('Saturday', '11:00:00', '12:00:00', 201, 30, 4, 1, 2025),
('Saturday', '12:00:00', '13:00:00', 201, 29, 4, 1, 2025),
('Saturday', '13:00:00', '14:00:00', 207, 28, 4, 1, 2025),

-- MCA Semester VIII (Section B)
('Monday', '10:00:00', '11:00:00', 202, 30, 4, 2, 2025),
('Monday', '11:00:00', '12:00:00', 202, 27, 4, 2, 2025),
('Monday', '12:00:00', '13:00:00', 202, 29, 4, 2, 2025),
('Monday', '13:00:00', '14:00:00', 207, 28, 4, 2, 2025),
('Tuesday', '10:00:00', '11:00:00', 202, 30, 4, 2, 2025),
('Tuesday', '11:00:00', '12:00:00', 202, 27, 4, 2, 2025),
('Tuesday', '12:00:00', '13:00:00', 202, 29, 4, 2, 2025),
('Tuesday', '13:00:00', '14:00:00', 207, 28, 4, 2, 2025),

('Wednesday', '08:00:00', '09:00:00', 4, 32, 4, 2, 2025),
('Wednesday', '09:00:00', '10:00:00', 4, 32, 4, 2, 2025),
('Wednesday', '10:00:00', '11:00:00', 202, 26, 4, 2, 2025),
('Wednesday', '11:00:00', '12:00:00', 202, 29, 4, 2, 2025),
('Wednesday', '12:00:00', '13:00:00', 202, 28, 4, 2, 2025),
('Thursday', '08:00:00', '09:00:00', 4, 32, 4, 2, 2025),
('Thursday', '09:00:00', '10:00:00', 4, 32, 4, 2, 2025),
('Thursday', '10:00:00', '11:00:00', 202, 26, 4, 2, 2025),
('Thursday', '11:00:00', '12:00:00', 202, 29, 4, 2, 2025),
('Thursday', '12:00:00', '13:00:00', 202, 28, 4, 2, 2025),

('Friday', '09:00:00', '10:00:00', 1, 31, 4, 2, 2025),
('Friday', '10:00:00', '11:00:00', 1, 31, 4, 2, 2025),
('Friday', '11:00:00', '12:00:00', 202, 26, 4, 2, 2025),
('Friday', '12:00:00', '13:00:00', 202, 27, 4, 2, 2025),
('Friday', '13:00:00', '14:00:00', 208, 30, 4, 2, 2025),
('Saturday', '09:00:00', '10:00:00', 1, 31, 4, 2, 2025),
('Saturday', '10:00:00', '11:00:00', 1, 31, 4, 2, 2025),
('Saturday', '11:00:00', '12:00:00', 202, 26, 4, 2, 2025),
('Saturday', '12:00:00', '13:00:00', 202, 27, 4, 2, 2025),
('Saturday', '13:00:00', '14:00:00', 208, 30, 4, 2, 2025);


INSERT INTO rooms (room_id, room_number) VALUES
(205, 'Room-205'),
(206, 'Room-206'),
(210, 'Room-210');


INSERT INTO faculty (faculty_id, faculty_name) VALUES
(23, 'Ms. Jasneet Kaur'),
(24, 'Dr. Naresh Dembla'),
(25, 'Dr. Divya Dembla'),
(26, 'Mr. Akshay Patidar'),
(27, 'Mr. Jayesh Yadav'),
(28, 'Dr. Anil Gupta'),
(29, 'Ms. Sonali Korone');


INSERT INTO courses (course_id, course_name) VALUES (3, 'M.Tech'), (4, 'M.Tech Sec-A'), (5, 'M.Tech Sec-B');


INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(34, 'IT-204A', 'DCC', 8),
(35, 'IT-206C' , 'C++', 2),
(36, 'IT-201A', 'Chemistry', 25),
(37, 'IT-203A', 'DCO', 26),
(38, 'IT-201', 'Maths-2', 24),
(39, 'IT-207B', 'C++ Programming Lab', 2),
(40, 'IT-204A', 'DCC', 7),
(41, 'IT-203A', 'DCO', 27),
(42, 'IT-207B', 'C++ Programming Lab', 23),
(43, 'IT-401', 'Computer Architecture', 1),
(44, 'IT-402A', 'Numerical Analysis & Design', 13),
(45, 'IT-403B', 'Database Management Systems', 15),
(46, 'IT-404', 'System Programming', 16),
(47, 'IT-405', 'Python Programming', 19),
(48, 'IT-407B', 'Database Management Systems Lab (Lab3)', 27),
(49, 'IT-407D', 'Python Programming Lab Batch I (Lab2)', 27),
(50, 'IT-407D', 'Python Programming Lab Batch II (Lab2)', 19),
(51, 'IT-601A', 'Theory of Computation', 28),
(52, 'IT-602', 'Software Engineering', 16),
(53, 'IT-605A', 'Analysis and Design of Algorithms', 29),
(54, 'IT-610', 'Advanced Java', 9),
(55, 'IT-603A', 'UNIX OS', 18),
(56, 'IT-608E', 'UNIX OS Lab Batch I (Lab3)', 18),
(57, 'IT-608E', 'UNIX OS Lab Batch II (Lab2)', 17),
(58, 'IT-609A', 'Advanced Java Lab Batch I (Lab2)', 29),
(59, 'IT-609A', 'Advanced Java Lab Batch II (Lab2)', 9),
(60, 'IT-801B', 'Principles of Programming Language', 23),
(61, 'IT-802A', 'Data Mining and Warehousing', 12),
(62, 'IT-803B', 'Artificial Intelligence', 14),
(63, 'IT-804B', 'Mobile and Wireless Computing', 17),
(64, 'IT-805A', 'Enterprise Computing Techniques', 11),
(65, 'IT-811A', 'Parallel Computing', 20);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES

-- M.Tech Semester II (Section A)

('Monday', '13:00:00', '14:00:00', 205, 34, 1, 4, 2025),
('Monday', '14:00:00', '15:00:00', 205, 35, 1, 4, 2025),
('Monday', '15:00:00', '16:00:00', 205, 36, 1, 4, 2025),
('Monday', '16:00:00', '17:00:00', 205, 37, 1, 4, 2025),

('Tuesday', '13:00:00', '14:00:00', 205, 34, 1, 4, 2025),
('Tuesday', '14:00:00', '15:00:00', 205, 35, 1, 4, 2025),
('Tuesday', '15:00:00', '16:00:00', 205, 36, 1, 4, 2025),
('Tuesday', '16:00:00', '17:00:00', 205, 37, 1, 4, 2025),

('Wednesday', '13:00:00', '14:00:00', 205, 35, 1, 4, 2025),
('Wednesday', '14:00:00', '15:00:00', 205, 38, 1, 4, 2025),
('Wednesday', '15:00:00', '16:00:00', 3, 2, 1, 4, 2025),
('Wednesday', '16:00:00', '17:00:00', 3, 2, 1, 4, 2025),

('Thursday', '13:00:00', '14:00:00', 205, 35, 1, 4, 2025),
('Thursday', '14:00:00', '15:00:00', 205, 38, 1, 4, 2025),
('Thursday', '15:00:00', '16:00:00', 3, 2, 1, 4, 2025),
('Thursday', '16:00:00', '17:00:00', 3, 2, 1, 4, 2025),

('Friday', '13:00:00', '14:00:00', 205, 34, 1, 4, 2025),
('Friday', '14:00:00', '15:00:00', 205, 36, 1, 4, 2025),
('Friday', '15:00:00', '16:00:00', 205, 38, 1, 4, 2025),
('Friday', '16:00:00', '17:00:00', 205, 37, 1, 4, 2025),

('Saturday', '13:00:00', '14:00:00', 205, 34, 1, 4, 2025),
('Saturday', '14:00:00', '15:00:00', 205, 36, 1, 4, 2025),
('Saturday', '15:00:00', '16:00:00', 205, 38, 1, 4, 2025),
('Saturday', '16:00:00', '17:00:00', 205, 37, 1, 4, 2025),

-- M.Tech Semester II (Section B)
('Monday', '11:00:00', '13:00:00', 2, 42, 1, 5, 2025),
('Monday', '13:00:00', '14:00:00', 206, 35, 1, 5, 2025),
('Monday', '14:00:00', '15:00:00', 206, 36, 1, 5, 2025),
('Monday', '15:00:00', '16:00:00', 206, 24, 1, 5, 2025),

('Tuesday', '11:00:00', '13:00:00', 2, 42, 1, 5, 2025),
('Tuesday', '13:00:00', '14:00:00', 206, 35, 1, 5, 2025),
('Tuesday', '14:00:00', '15:00:00', 206, 36, 1, 5, 2025),
('Tuesday', '15:00:00', '16:00:00', 206, 24, 1, 5, 2025),

('Wednesday', '13:00:00', '14:00:00', 206, 40, 1, 5, 2025),
('Wednesday', '14:00:00', '15:00:00', 206, 35, 1, 5, 2025),
('Wednesday', '15:00:00', '16:00:00', 206, 38, 1, 5, 2025),
('Wednesday', '16:00:00', '17:00:00', 206, 41, 1, 5, 2025),

('Thursday', '13:00:00', '14:00:00', 206, 40, 1, 5, 2025),
('Thursday', '14:00:00', '15:00:00', 206, 35, 1, 5, 2025),
('Thursday', '15:00:00', '16:00:00', 206, 38, 1, 5, 2025),
('Thursday', '16:00:00', '17:00:00', 206, 41, 1, 5, 2025),

('Friday', '14:00:00', '15:00:00', 206, 40, 1, 5, 2025),
('Friday', '15:00:00', '16:00:00', 206, 36, 1, 5, 2025),
('Friday', '16:00:00', '17:00:00', 206, 41, 1, 5, 2025),

('Saturday', '14:00:00', '15:00:00', 206, 40, 1, 5, 2025),
('Saturday', '15:00:00', '16:00:00', 206, 36, 1, 5, 2025),
('Saturday', '16:00:00', '17:00:00', 206, 41, 1, 5, 2025),

-- M.Tech Semester IV 
('Monday', '13:00:00', '14:00:00', 210, 44, 2, 3, 2025), -- IT-402A NAD
('Monday', '14:00:00', '15:00:00', 210, 43, 2, 3, 2025), -- IT-401 CA
('Monday', '15:00:00', '16:00:00', 210, 47, 2, 3, 2025), -- IT-405 Python Prog

('Tuesday', '13:00:00', '14:00:00', 210, 44, 2, 3, 2025), -- IT-402A NAD
('Tuesday', '14:00:00', '15:00:00', 210, 43, 2, 3, 2025), -- IT-401 CA
('Tuesday', '15:00:00', '16:00:00', 210, 47, 2, 3, 2025), -- IT-405 Python Prog


('Wednesday', '11:00:00', '13:00:00', 210, 49, 2, 3, 2025), -- IT-407D Python Lab B1
('Wednesday', '13:00:00', '14:00:00', 210, 46, 2, 3, 2025), -- IT-404 Sys. Prog.
('Wednesday', '14:00:00', '15:00:00', 210, 44, 2, 3, 2025), -- IT-402A NAD
('Wednesday', '15:00:00', '16:00:00', 210, 45, 2, 3, 2025), -- IT-403B DBMS
('Wednesday', '16:00:00', '17:00:00', 210, 47, 2, 3, 2025), -- IT-405 Python Prog

('Thursday', '11:00:00', '13:00:00', 210, 49, 2, 3, 2025), -- IT-407D Python Lab B1
('Thursday', '13:00:00', '14:00:00', 210, 46, 2, 3, 2025), -- IT-404 Sys. Prog.
('Thursday', '14:00:00', '15:00:00', 210, 44, 2, 3, 2025), -- IT-402A NAD
('Thursday', '15:00:00', '16:00:00', 210, 45, 2, 3, 2025), -- IT-403B DBMS
('Thursday', '16:00:00', '17:00:00', 210, 47, 2, 3, 2025), -- IT-405 Python Prog

('Friday', '11:00:00', '13:00:00', 210, 50, 2, 3, 2025), -- IT-407D Python Lab B2
('Friday', '13:00:00', '14:00:00', 210, 46, 2, 3, 2025), -- IT-404 Sys. Prog.
('Friday', '14:00:00', '15:00:00', 210, 45, 2, 3, 2025), -- IT-403B DBMS
('Friday', '15:00:00', '16:00:00', 210, 43, 2, 3, 2025), -- IT-401 CA

('Saturday', '11:00:00', '13:00:00', 210, 50, 2, 3, 2025), -- IT-407D Python Lab B2
('Saturday', '13:00:00', '14:00:00', 210, 46, 2, 3, 2025), -- IT-404 Sys. Prog.
('Saturday', '14:00:00', '15:00:00', 210, 45, 2, 3, 2025), -- IT-403B DBMS
('Saturday', '15:00:00', '16:00:00', 210, 43, 2, 3, 2025), -- IT-401 CA

-- M.Tech VI
-- Monday
('Monday', '10:00:00', '11:00:00', 210, 53, 3, 3, 2025),  -- IT-605A (ADA)
('Monday', '11:00:00', '12:00:00', 210, 52, 3, 3, 2025),  -- IT-602 (SE)
('Monday', '12:00:00', '13:00:00', 210, 52, 3, 3, 2025),  -- IT-602 (SE)
('Monday', '13:00:00', '15:00:00', 3, 56, 3, 3, 2025),  -- IT-608E (UNIX Lab BII)

('Tuesday', '10:00:00', '11:00:00', 210, 53, 3, 3, 2025),  -- IT-605A (ADA)
('Tuesday', '11:00:00', '12:00:00', 210, 52, 3, 3, 2025),  -- IT-602 (SE)
('Tuesday', '12:00:00', '13:00:00', 210, 52, 3, 3, 2025),  -- IT-602 (SE)
('Tuesday', '13:00:00', '15:00:00', 3, 56, 3, 3, 2025),  -- IT-608E (UNIX Lab BII)

-- Wednesday
('Wednesday', '10:00:00', '11:00:00', 210, 53, 3, 3, 2025),  -- IT-605A (ADA)
('Wednesday', '11:00:00', '12:00:00', 210, 55, 3, 3, 2025),  -- IT-603A (UNIX)
('Wednesday', '12:00:00', '13:00:00', 210, 54, 3, 3, 2025),  -- IT-610 (Advanced Java)
('Wednesday', '13:00:00', '15:00:00', 2, 59, 3, 3, 2025),  -- IT-609A (Advanced Java Lab BII)

('Thursday', '10:00:00', '11:00:00', 210, 53, 3, 3, 2025),  -- IT-605A (ADA)
('Thursday', '11:00:00', '12:00:00', 210, 55, 3, 3, 2025),  -- IT-603A (UNIX)
('Thursday', '12:00:00', '13:00:00', 210, 54, 3, 3, 2025),  -- IT-610 (Advanced Java)
('Thursday', '13:00:00', '15:00:00', 2, 59, 3, 3, 2025),  -- IT-609A (Advanced Java Lab BII)

-- Friday
('Friday', '08:00:00', '10:00:00', 210, 51, 3, 3, 2025),  -- IT-601A (TOC)
('Friday', '10:00:00', '11:00:00', 210, 51, 3, 3, 2025),  -- IT-601A (TOC)
('Friday', '11:00:00', '12:00:00', 210, 54, 3, 3, 2025),  -- IT-610 (Advanced Java)
('Friday', '12:00:00', '13:00:00', 210, 55, 3, 3, 2025),	-- IT-603A (UNIX)
('Friday', '13:00:00', '15:00:00', 3, 57, 3, 3, 2025),  
('Friday', '13:00:00', '15:00:00', 2, 58, 3, 3, 2025),  -- IT-609A (Advanced Java Lab BII & UNIX Lab BII)

('Saturday', '08:00:00', '10:00:00', 210, 51, 3, 3, 2025),  -- IT-601A (TOC)
('Saturday', '10:00:00', '11:00:00', 210, 51, 3, 3, 2025),  -- IT-601A (TOC)
('Saturday', '11:00:00', '12:00:00', 210, 54, 3, 3, 2025),  -- IT-610 (Advanced Java)
('Saturday', '12:00:00', '13:00:00', 210, 55, 3, 3, 2025),	-- IT-603A (UNIX)
('Saturday', '13:00:00', '15:00:00', 3, 57, 3, 3, 2025),  
('Saturday', '13:00:00', '15:00:00', 2, 58, 3, 3, 2025),  -- IT-609A (Advanced Java Lab BII & UNIX Lab BII)



-- M.Tech VIII
('Monday', '09:00:00', '10:00:00', 206, 61, 4, 3, 2025),  -- IT-802A (DMW)
('Monday', '10:00:00', '11:00:00', 206, 64, 4, 3, 2025),  -- IT-805A (ECT)
('Monday', '11:00:00', '12:00:00', 206, 63, 4, 3, 2025),  -- IT-804B (MWC)
('Monday', '12:00:00', '13:00:00', 208, 62, 4, 3, 2025),  -- IT-803B (AI) (Room-209)

('Tuesday', '09:00:00', '10:00:00', 206, 61, 4, 3, 2025),  -- IT-802A (DMW)
('Tuesday', '10:00:00', '11:00:00', 206, 64, 4, 3, 2025),  -- IT-805A (ECT)
('Tuesday', '11:00:00', '12:00:00', 206, 63, 4, 3, 2025),  -- IT-804B (MWC)
('Tuesday', '12:00:00', '13:00:00', 208, 62, 4, 3, 2025),  -- IT-803B (AI) (Room-209)

-- Wednesday
('Wednesday', '10:00:00', '11:00:00', 206, 60, 4, 3, 2025),  -- IT-801B (PPL)
('Wednesday', '11:00:00', '12:00:00', 206, 65, 4, 3, 2025),  -- IT-811A (Parallel Computing)
('Wednesday', '12:00:00', '13:00:00', 206, 63, 4, 3, 2025),  -- IT-804B (MWC)
('Wednesday', '13:00:00', '14:00:00', 208, 62, 4, 3, 2025),  -- IT-803B (AI) (Room-209)

('Thursday', '10:00:00', '11:00:00', 206, 60, 4, 3, 2025),  -- IT-801B (PPL)
('Thursday', '11:00:00', '12:00:00', 206, 65, 4, 3, 2025),  -- IT-811A (Parallel Computing)
('Thursday', '12:00:00', '13:00:00', 206, 63, 4, 3, 2025),  -- IT-804B (MWC)
('Thursday', '13:00:00', '14:00:00', 208, 62, 4, 3, 2025),  -- IT-803B (AI) (Room-209)


-- Friday
('Friday', '09:00:00', '10:00:00', 206, 60, 4, 3, 2025),  -- IT-801B (PPL)
('Friday', '10:00:00', '11:00:00', 206, 65, 4, 3, 2025),  -- IT-811A (Parallel Computing)
('Friday', '11:00:00', '12:00:00', 206, 64, 4, 3, 2025),  -- IT-805A (ECT)
('Friday', '12:00:00', '13:00:00', 206, 61, 4, 3, 2025),  -- IT-802A (DMW

('Saturday', '09:00:00', '10:00:00', 206, 60, 4, 3, 2025),  -- IT-801B (PPL)
('Saturday', '10:00:00', '11:00:00', 206, 65, 4, 3, 2025),  -- IT-811A (Parallel Computing)
('Saturday', '11:00:00', '12:00:00', 206, 64, 4, 3, 2025),  -- IT-805A (ECT)
('Saturday', '12:00:00', '13:00:00', 206, 61, 4, 3, 2025);  -- IT-802A (DMW)






-- MBA (Entrepreneurship) 2Yrs
INSERT INTO rooms (room_id, room_number) VALUES
(19, 'Room-LH-9'),
(13, 'Room-LH-3');
select * from rooms;


INSERT INTO faculty (faculty_id, faculty_name) VALUES
(31, 'Dr. Kuldeep Agnihotri'),
(32, 'Mr. Franklin Manuel'),
(33, 'Dr. Ravi Bunkar'),
(34, 'Dr. Surendra Malviya'),
(35, 'Mr. Atul Bharat'),
(36, 'Dr. Muskan Karamchandani'),
(37, 'Mr. Kuldeep Chouhan'),
(38, 'Dr. Manminder Singh'),
(39, 'Dr. B.K. Tripathi');

INSERT INTO courses (course_id, course_name) VALUES (6, 'MBA (Entrepreneurship) 2Yrs');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(116, 'ES-401A', 'Business Legislation', 31),
(66, 'ES-404A', 'International Business', 32),
(67, 'ES-408A', 'Logistics and Supply Chain Management', 10),
(68, 'ES-410', 'Management Information Systems', 33),
(69, 'ES-411', 'Business Analytics', 34),
(70, 'ES-412', 'Business Model Development', 35);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Monday - Tuesday
('Monday', '09:00:00', '11:00:00', 19, 67, 2, 6, 2025),
('Monday', '11:00:00', '13:00:00', 19, 70, 2, 6, 2025),
('Tuesday', '09:00:00', '11:00:00', 19, 67, 2, 6, 2025),
('Tuesday', '11:00:00', '13:00:00', 19, 70, 2, 6, 2025),

-- Wednesday - Thursday
('Wednesday', '09:00:00', '11:00:00', 19, 116, 2, 6, 2025),
('Thursday', '09:00:00', '11:00:00', 19, 116, 2, 6, 2025),
('Wednesday', '11:00:00', '13:00:00', 19, 69, 2, 6, 2025),
('Thursday', '11:00:00', '13:00:00', 19, 69, 2, 6, 2025),

-- Friday - Saturday
('Friday', '08:30:00', '10:30:00', 19, 66, 2, 6, 2025),
('Saturday', '08:30:00', '10:30:00', 19, 66, 2, 6, 2025),
('Friday', '11:00:00', '13:00:00', 19, 68, 2, 6, 2025),
('Saturday', '11:00:00', '13:00:00', 19, 68, 2, 6, 2025);


INSERT INTO faculty (faculty_id, faculty_name) VALUES
(40, 'Dr. Jyoti Sharma'),
(41, 'Dr. Prerna Kumar'),
(42, 'Dr. Shilpa Bhagdare'),
(43, 'Dr. Sonali Jain'),
(44, 'Dr. Anshu Bhati'),
(65, 'Dr. Pooja Jain'),
(45, 'Ms. Jayesh Nagar'),
(46, 'Mr. Jaideep Girnar'),
(47, 'Col. Pramod Deogirkar'),
(48, 'Ms. Saloni Agrawal'),
(49, 'Mr. Sohail'),
(50, 'Ms. Ananya Dubey'),
(51, 'Mr. Sandeep Handa');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(71, 'ES-201A', 'Social Entrepreneurship', 44),
(72, 'ES-202B', 'Business Ethics', 65),
(73, 'ES-203A', 'Fundamentals of Finance- II', 36),
(74, 'ES-205A', 'Service Management', 37),
(75, 'ES-208A', 'Emerging Trends in Business Environment', 38),
(76, 'ES-211', 'Human Resource Management', 39);

-- UPDATE subjects SET faculty_id = 65 WHERE subject_id = 72;


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Monday - Tuesday
('Monday', '15:00:00', '17:00:00', 19, 75, 1, 6, 2025),
('Tuesday', '15:00:00', '17:00:00', 19, 75, 1, 6, 2025),
('Monday', '17:00:00', '19:00:00', 19, 71, 1, 6, 2025),
('Tuesday', '17:00:00', '19:00:00', 19, 71, 1, 6, 2025),

-- Wednesday - Thursday
('Wednesday', '15:00:00', '17:00:00', 19, 72, 1, 6, 2025),
('Thursday', '15:00:00', '17:00:00', 19, 72, 1, 6, 2025),
('Wednesday', '17:00:00', '19:00:00', 19, 74, 1, 6, 2025),
('Thursday', '17:00:00', '19:00:00', 19, 74, 1, 6, 2025),

-- Friday - Saturday
('Friday', '15:00:00', '17:00:00', 19, 76, 1, 6, 2025),
('Saturday', '15:00:00', '17:00:00', 19, 76, 1, 6, 2025),
('Friday', '17:00:00', '19:00:00', 19, 73, 1, 6, 2025),
('Saturday', '17:00:00', '19:00:00', 19, 73, 1, 6, 2025);




-- MBA (APR) 2Yrs
INSERT INTO rooms (room_id, room_number) VALUES
(106, 'Room-106');

INSERT INTO courses (course_id, course_name) VALUES (7, 'MBA (APR) 2Yrs');


INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(77, 'APR-406A', 'BCPD', 40),
(78, 'APR-403', 'DM EM', 41),
(79, 'APR-401A', 'Rural & Retail Marketing', 42),
(80, 'APR-415', 'Audio Visual Production', 43),
(81, 'APR-408', 'Brand Management', 44),
(82, 'APR-402B', 'Marketing Strategies', 45);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '11:00', '13:00', 13, 78, 2, 7, 2025),  -- DMEM
('Tuesday', '11:00', '13:00', 13, 78, 2, 7, 2025),  -- DMEM
('Wednesday', '08:30', '10:30', 13, 80, 2, 7, 2025), -- Audio Visual Production
('Wednesday', '11:00', '13:00', 13, 79, 2, 7, 2025), -- Rural & Retail Marketing
('Wednesday', '13:00', '15:00', 13, 81, 2, 7, 2025), -- Tutorial by Dr. Anshu Bhati
('Thursday', '08:30', '10:30', 13, 80, 2, 7, 2025), -- Audio Visual Production
('Thursday', '11:00', '13:00', 13, 79, 2, 7, 2025), -- Rural & Retail Marketing
('Thursday', '13:00', '15:00', 13, 81, 2, 7, 2025), -- Tutorial by Dr. Anshu Bhati
('Friday', '08:30', '10:30', 13, 82, 2, 7, 2025), -- Marketing Strategies
('Friday', '11:00', '13:00', 13, 81, 2, 7, 2025), -- Brand Management
('Friday', '13:00', '15:00', 13, 77, 2, 7, 2025), -- BCPD
('Saturday', '08:30', '10:30', 13, 82, 2, 7, 2025), -- Marketing Strategies
('Saturday', '11:00', '13:00', 13, 81, 2, 7, 2025), -- Brand Management
('Saturday', '13:00', '15:00', 13, 77, 2, 7, 2025); -- BCPD



INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(83, 'APR-201', 'Media Planning', 46),
(84, 'APR-201A', 'Public Relations', 44),
(85, 'APR-202A', 'Advertising and PR Research', 40),
(86, 'APR-203', 'Creative Writing', 47),
(87, 'APR-206', 'Digital Marketing', 48), 
(88, 'APR-209', 'Mass Communication', 50),
(89, 'APR-212', 'Client Servicing and Account Planning', 51);

INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '08:30', '10:30', 106, 83, 1, 6, 2025),  -- Media Planning
('Monday', '11:00', '13:00', 106, 86, 1, 6, 2025),  -- Creative Writing
('Monday', '13:00', '15:00', 106, 85, 1, 6, 2025),  -- Advertising & PR Research
('Tuesday', '08:30', '10:30', 106, 83, 1, 6, 2025),  -- Media Planning
('Tuesday', '11:00', '13:00', 106, 86, 1, 6, 2025),  -- Creative Writing
('Tuesday', '13:00', '15:00', 106, 85, 1, 6, 2025),  -- Advertising & PR Research
('Wednesday', '08:30', '10:30', 106, 89, 1, 6, 2025), -- Client Servicing & Account Planning
('Wednesday', '11:00', '13:00', 106, 84, 1, 6, 2025), -- Public Relations
('Thursday', '08:30', '10:30', 106, 89, 1, 6, 2025),  -- Client Servicing & Account Planning
('Thursday', '11:00', '13:00', 106, 84, 1, 6, 2025),  -- Public Relations
('Friday', '08:30', '10:30', 106, 88, 1, 6, 2025),  -- Mass Communication
('Friday', '11:00', '13:00', 106, 87, 1, 6, 2025),  -- Digital Marketing
('Saturday', '08:30', '10:30', 106, 88, 1, 6, 2025),  -- Mass Communication
('Saturday', '11:00', '13:00', 106, 87, 1, 6, 2025); -- Digital Marketing




-- Master of Business Admistration (MS) 2Yrs
INSERT INTO rooms (room_id, room_number) VALUES
(108, 'Room-108'),
(107, 'Room-107'),
(102, 'Room-102'),
(105, 'Room-105'),
(104, 'Room-104'),
(12, 'Room-LT-2');

INSERT INTO courses (course_id, course_name) VALUES (8, 'Master of Business Admistration (MS) 2Yrs');

INSERT INTO faculty (faculty_id, faculty_name) VALUES
(52, 'Dr. Geeta Nema'),
(53, 'Dr. Ravindra Yadav'),
(54, 'CA Manmeet S. Arora'),
(55, 'Ms. Pooja Menghani'),
(56, 'Dr. Geeta Sharma'),
(57, 'Dr. Manish Sitlani'),
(58, 'Dr. Yamini Karmarkar'),
(59, 'Dr. Sanjay Katiyal'),
(60, 'Dr. Navneet Bhatia'),
(61, 'Dr. Gaurav Purohit'),
(62, 'CA Hemant Ramchandani'),
(63, 'Ms. Ojaswini Shekhawat'),
(64, 'Mr. Charanjeet S. Madan');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(90, 'FT 201', 'Principles of MarketingMgt.', 52),
(91, 'FT 202A', 'Interpersonal & Org. Behavior', 53),
(92, 'FT 203B', 'Business Economics (Macro)', 54),
(93, 'FT 210A', 'Research Methodology', 55),
(94, 'FT 205', 'Financial Management', 56),
(95, 'FT 215', 'Business Accounting II', 57),
(96, 'FT-209A', 'E-Business and Database Management', 34),
(97, 'FT-2017', 'E-Business and Database Management LAB', 34),
(98, 'FT 216', 'Lab: Research Tools', 21);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '08:30:00', '10:30:00', 108, 98, 1, 8, 2025),
('Monday', '11:00:00', '13:00:00', 108, 93, 1, 8, 2025),
('Monday', '13:00:00', '15:00:00', 108, 96, 1, 8, 2025),
('Tuesday', '08:30:00', '10:30:00', 108, 98, 1, 8, 2025),
('Tuesday', '11:00:00', '13:00:00', 108, 93, 1, 8, 2025),
('Tuesday', '13:00:00', '15:00:00', 108, 96, 1, 8, 2025),
('Wednesday', '08:30:00', '10:30:00', 108, 92, 1, 8, 2025),
('Wednesday', '11:00:00', '13:00:00', 108, 91, 1, 8, 2025),
('Wednesday', '13:00:00', '15:00:00', 107, 95, 1, 8, 2025),
('Wednesday', '15:00:00', '17:00:00', 108, 97, 1, 8, 2025),
('Thursday', '08:30:00', '10:30:00', 108, 92, 1, 8, 2025),
('Thursday', '11:00:00', '13:00:00', 108, 91, 1, 8, 2025),
('Thursday', '13:00:00', '15:00:00', 107, 95, 1, 8, 2025),
('Friday', '08:30:00', '10:30:00', 108, 98, 1, 8, 2025),
('Friday', '11:00:00', '13:00:00', 108, 90, 1, 8, 2025),
('Friday', '13:00:00', '15:00:00', 108, 94, 1, 8, 2025),
('Friday', '15:00:00', '17:00:00', 108, 93, 1, 8, 2025),
('Saturday', '08:30:00', '10:30:00', 108, 98, 1, 8, 2025),
('Saturday', '11:00:00', '13:00:00', 108, 90, 1, 8, 2025),
('Saturday', '13:00:00', '15:00:00', 108, 94, 1, 8, 2025);



INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(99, 'FT-401C', 'Business Ethics and Sustainable Development', 58),
(100, 'FT-416MA', 'Product and Brand Management', 52),
(101, 'FT-405MA', 'Marketing Strategies', 56),
(102, 'FT-418MA', 'Service Marketing', 42),
(103, 'FT-416FA', 'International Finance', 56),
(104, 'FT-419FA', 'Taxation for Managers', 59),
(105, 'FT-413FA', 'Project Management & Project Finance', 59),
(106, 'FT-417HA', 'Performance Planning and Appraisal', 59),
(107, 'FT-418HA', 'Industrial Relations and Labour Law', 60),
(108, 'FT-405C', 'Organisation Development', 61),
(109, 'FT-406FB', 'Corporate Valuation & Restructuring', 57),
(110, 'FT-405FB', 'Financial Planning and Wealth Management', 62),
(111, 'FT-418BA', 'Predictive Modeling and Pattern Discovery', 63),
(112, 'FT-415BA', 'Big Data Technologies', 64),
(113, 'FT-418BA', 'LAB: Digital Analytics', 34),
(114, 'FT-416FB', 'Banking Management', 56),
(115, 'FT-416BA', 'Digital Analytics', 34);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '08:30:00', '10:30:00', 102, 100, 2, 8, 2025),
('Monday', '11:00:00', '13:00:00', 107, 102, 2, 8, 2025),
('Monday', '13:00:00', '15:00:00', 107, 101, 2, 8, 2025),
('Monday', '15:00:00', '17:00:00', 104, 106, 2, 8, 2025),

('Tuesday', '08:30:00', '10:30:00', 107, 100, 2, 8, 2025),
('Tuesday', '11:00:00', '13:00:00', 107, 108, 2, 8, 2025),
('Tuesday', '13:00:00', '15:00:00', 107, 104, 2, 8, 2025),
('Tuesday', '15:00:00', '17:00:00', 105, 105, 2, 8, 2025),

('Wednesday', '08:30:00', '10:30:00', 107, 100, 2, 8, 2025),
('Wednesday', '11:00:00', '13:00:00', 108, 99, 2, 8, 2025),
('Wednesday', '13:00:00', '15:00:00', 107, 111, 2, 8, 2025),
('Wednesday', '15:00:00', '17:00:00', 12, 111, 2, 8, 2025),

('Thursday', '08:30:00', '10:30:00', 107, 100, 2, 8, 2025),
('Thursday', '11:00:00', '13:00:00', 108, 99, 2, 8, 2025),
('Thursday', '13:00:00', '15:00:00', 107, 111, 2, 8, 2025),
('Thursday', '15:00:00', '17:00:00', 12, 111, 2, 8, 2025),

('Friday', '08:30:00', '10:30:00', 107, 103, 2, 8, 2025),
('Friday', '11:00:00', '13:00:00', 105, 107, 2, 8, 2025),
('Friday', '13:00:00', '15:00:00', 12, 113, 2, 8, 2025),
('Friday', '15:00:00', '17:00:00', 105, 104, 2, 8, 2025),

('Saturday', '08:30:00', '10:30:00', 107, 103, 2, 8, 2025),
('Saturday', '11:00:00', '13:00:00', 105, 107, 2, 8, 2025),
('Saturday', '13:00:00', '15:00:00', 12, 113, 2, 8, 2025),
('Saturday', '15:00:00', '17:00:00', 105, 104, 2, 8, 2025);




-- B.Com. Hons.
INSERT INTO rooms (room_id, room_number) VALUES
(22, 'Room-LH-2'),
(101, 'Room-101'),
(23, 'Room-LT-3'),
(24, 'Room-LT-4');

INSERT INTO courses (course_id, course_name) VALUES (9, 'B.Com. Hons.');


INSERT INTO faculty (faculty_id, faculty_name) VALUES
(67, 'Mr. Amitabh Shukla'),
(68, 'Mr. Ajay Chhabria'),
(69, 'Mr. Harshvardhan Barve'),
(70, 'Dr. Prabhakar Singh'),
(71, 'Ms. Soniya Chinnani'),
(72, 'Ms. Harshita Keswani'),
(74, 'CS. Shruti Jain'),
(75, 'CS. Urvashi Agrawal'),
(76, 'Ms. Mahee Dhankani'),
(77, 'Dr. Sona Kanungo'),
(78, 'CS. Harshvardhan Barve'),
(79, 'CA. Monti Viswakarma'),
(80, 'Dr. Rishi Mishra'),
(81, 'Mr. Koutilya Dagaonkar'),
(82, 'CA. Abhinay Namdeo'),
(83, 'Dr. Sujata Parwani'),
(84, 'Dr. Suresh Patidar'),
(85, 'Mr. Burhanuddin Bhandari');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(117, 'IB-201N', 'Financial Accounting-II', 67),
(118, 'IB-207N', 'Management Accounting-I', 68),
(119, 'IB-203N', 'Business Law', 69),
(120, 'IB-208N', 'Human Resource Management', 70),
(121, 'IB-209NE', 'Business Communication and Personality Development', 71),
(122, 'IB-210NE', 'Business Environment', 72),
(123, 'IB-211NE', 'Financial Literacy', 60);

INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '13:00', '14:00', 22, 118, 1, 9, 2025),
('Monday', '14:00', '15:00', 22, 119, 1, 9, 2025),
('Monday', '15:30', '16:30', 22, 123, 1, 9, 2025),
('Monday', '16:30', '17:30', 22, 120, 1, 9, 2025),

('Tuesday', '13:00', '14:00', 22, 121, 1, 9, 2025),
('Tuesday', '14:00', '15:00', 22, 119, 1, 9, 2025),
('Tuesday', '15:30', '16:30', 22, 123, 1, 9, 2025),
('Tuesday', '16:30', '17:30', 22, 118, 1, 9, 2025),

('Wednesday', '13:00', '14:00', 22, 121, 1, 9, 2025),
('Wednesday', '14:00', '15:00', 22, 117, 1, 9, 2025),
('Wednesday', '15:30', '16:30', 22, 123, 1, 9, 2025),
('Wednesday', '16:30', '17:30', 22, 118, 1, 9, 2025),

('Thursday', '13:00', '14:00', 22, 121, 1, 9, 2025),
('Thursday', '14:00', '15:00', 22, 117, 1, 9, 2025),
('Thursday', '15:30', '16:30', 22, 123, 1, 9, 2025),
('Thursday', '16:30', '17:30', 22, 120, 1, 9, 2025),

('Friday', '13:00', '14:00', 22, 121, 1, 9, 2025),
('Friday', '14:00', '15:00', 22, 117, 1, 9, 2025),
('Friday', '15:30', '16:30', 22, 119, 1, 9, 2025),
('Friday', '16:30', '17:30', 22, 120, 1, 9, 2025);

INSERT INTO faculty (faculty_id, faculty_name) VALUES
(101, 'Not Alloted');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(124, 'IB-401N', 'Corporate Accounting-I', 67),
(125, 'IB-402N', 'Indirect Taxes', 74),
(126, 'IB-403N', 'Company Law', 75),
(127, 'IB-404N', 'Entrepreneurship', 76),
(128, 'IB-405NE', 'Accounting Information System and Packages', 77),
(129, 'IB-406NE', 'Operations Research', 101),
(130, 'IB-407NE', 'Secretarial Practice', 78);

INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '13:00', '14:00', 106, 127, 2, 9, 2025),
('Monday', '14:00', '15:00', 106, 128, 2, 9, 2025),
('Monday', '15:30', '16:30', 106, 130, 2, 9, 2025),
('Monday', '16:30', '17:30', 106, 126, 2, 9, 2025),

('Tuesday', '13:00', '14:00', 106, 127, 2, 9, 2025),
('Tuesday', '14:00', '15:00', 106, 128, 2, 9, 2025),
('Tuesday', '15:30', '16:30', 106, 130, 2, 9, 2025),
('Tuesday', '16:30', '17:30', 106, 126, 2, 9, 2025),

('Wednesday', '13:00', '14:00', 106, 124, 2, 9, 2025),
('Wednesday', '14:00', '15:00', 106, 125, 2, 9, 2025),
('Wednesday', '15:30', '16:30', 106, 130, 2, 9, 2025),
('Wednesday', '16:30', '17:30', 106, 126, 2, 9, 2025),

('Thursday', '13:00', '14:00', 106, 124, 2, 9, 2025),
('Thursday', '14:00', '15:00', 106, 128, 2, 9, 2025),
('Thursday', '15:30', '16:30', 106, 130, 2, 9, 2025),
('Thursday', '16:30', '17:30', 106, 125, 2, 9, 2025),

('Friday', '13:00', '14:00', 106, 124, 2, 9, 2025),
('Friday', '14:00', '15:00', 106, 128, 2, 9, 2025),
('Friday', '15:30', '16:30', 106, 127, 2, 9, 2025),
('Friday', '16:30', '17:30', 106, 125, 2, 9, 2025);



INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(131, 'IB-601N', 'Advanced Accounting', 79),
(132, 'IB-602N', 'Financial Management-II', 80),
(133, 'IB-603NE', 'International Business', 81),
(134, 'IB-604NE', 'Auditing', 82),
(135, 'IB-605NA', 'Public Finance And Treasury', 83),
(136, 'IB-606NE', 'Corporate Tax', 84),
(137, 'IB-607NE', 'Internship', 101);

INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '08:30', '10:30', 12, 133, 3, 9, 2025),
('Monday', '11:00', '13:00', 12, 135, 3, 9, 2025),

('Tuesday', '08:30', '10:30', 12, 133, 3, 9, 2025),
('Tuesday', '11:00', '13:00', 12, 135, 3, 9, 2025),

('Wednesday', '08:30', '10:30', 12, 131, 3, 9, 2025),
('Wednesday', '11:00', '13:00', 12, 132, 3, 9, 2025),

('Thursday', '08:30', '09:30', 12, 131, 3, 9, 2025),
('Thursday', '09:30', '10:30', 12, 132, 3, 9, 2025);


INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(138, 'IB-701N', 'Strategic Financial Management', 36),
(139, 'IB-702N', 'Entrepreneurial Finance', 85),
(140, 'IB-703NE', 'Dissertation', 101),
(141, 'IB-704NE', 'Field Project / Internship / Research Project / Apprenticeship', 101);

INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
('Monday', '08:30', '10:30', 22, 139, 4, 9, 2025),
('Monday', '11:00', '12:00', 22, 138, 4, 9, 2025),

('Tuesday', '09:30', '10:30', 22, 139, 4, 9, 2025),
('Tuesday', '11:00', '13:00', 22, 138, 4, 9, 2025),

('Wednesday', '08:30', '10:30', 22, 138, 4, 9, 2025),

('Thursday', '08:30', '10:30', 22, 140, 4, 9, 2025),

('Friday', '08:30', '10:30', 22, 140, 4, 9, 2025);




-- MBA (MS) 5Yrs
INSERT INTO courses (course_id, course_name) VALUES (10, 'MBA (MS) 5Yrs Sec-A'), (11, 'MBA (MS) 5Yrs Sec-B'), (12, 'MBA (MS) 5Yrs');

-- select * from faculty;

INSERT INTO faculty (faculty_id, faculty_name) VALUES
(87, 'Dr. Bhavna Sharma'),
(88, 'Dr. Naynee Hablani'),
(89, 'Ms. Savita Patidar'),
(90, 'Dr. Brahmjot Bagga'),
(91, 'Dr. Nirmala Sawan'),
(92, 'Dr. Prema Kumar'),
(93, 'Dr. Gaurav Sethia'),
(94, 'Dr. Jyoti Pandey'),
(95, 'Dr. Kapil Jain'),
(96, 'CA Yogesh Goyal'),
(97, 'Dr. Naresh Dembla'),
(98, 'Dr. Anshul Mishra'),
(99, 'Dr. Sunnet Khurana'),
(100, 'Mr. Mitesh Tarvani');

INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(142, 'IM-203', 'Cost Accounting', 60),
(143, 'IM-20A', 'Business Mathematics-II', 33),
(144, 'IM-210B', 'Programming Using C++', 87),
(145, 'IM-214', 'Business Law', 88),
(146, 'IM-217', 'Marketing Management', 89),
(147, 'IM-219A', 'Business Communication and Personality Development', 90);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Section A (Room 101)
('Monday', '13:00', '14:00', 101, 145, 1, 10, 2025), -- Business Law
('Monday', '14:00', '15:00', 101, 142, 1, 10, 2025), -- Cost Accounting
('Monday', '15:30', '16:30', 101, 146, 1, 10, 2025), -- Marketing Management
('Monday', '16:30', '17:30', 101, 147, 1, 10, 2025), -- BCPD

('Tuesday', '13:00', '14:00', 101, 145, 1, 10, 2025),
('Tuesday', '14:00', '15:00', 101, 142, 1, 10, 2025),
('Tuesday', '15:30', '16:30', 101, 146, 1, 10, 2025),
('Tuesday', '16:30', '17:30', 101, 147, 1, 10, 2025),

('Wednesday', '13:00', '14:00', 101, 142, 1, 10, 2025),
('Wednesday', '14:00', '15:00', 101, 143, 1, 10, 2025),
('Wednesday', '15:30', '16:30', 101, 146, 1, 10, 2025),
('Wednesday', '16:30', '17:30', 101, 144, 1, 10, 2025),

('Thursday', '13:00', '14:00', 101, 142, 1, 10, 2025),
('Thursday', '14:00', '15:00', 101, 143, 1, 10, 2025),
('Thursday', '15:30', '16:30', 101, 146, 1, 10, 2025),
('Thursday', '16:30', '17:30', 101, 144, 1, 10, 2025),

('Friday', '13:00', '14:00', 101, 145, 1, 10, 2025),
('Friday', '14:00', '15:00', 101, 143, 1, 10, 2025),
('Friday', '15:30', '16:30', 101, 144, 1, 10, 2025),
('Friday', '16:30', '17:30', 101, 147, 1, 10, 2025),

('Saturday', '13:00', '14:00', 101, 145, 1, 10, 2025),
('Saturday', '14:00', '15:00', 101, 143, 1, 10, 2025),
('Saturday', '15:30', '16:30', 101, 144, 1, 10, 2025),
('Saturday', '16:30', '17:30', 101, 147, 1, 10, 2025),

-- Section B (Room 107)
('Monday', '13:00', '14:00', 107, 142, 1, 11, 2025),
('Monday', '14:00', '15:00', 107, 145, 1, 11, 2025),
('Monday', '15:30', '16:30', 107, 147, 1, 11, 2025),
('Monday', '16:30', '17:30', 107, 146, 1, 11, 2025),

('Tuesday', '13:00', '14:00', 107, 142, 1, 11, 2025),
('Tuesday', '14:00', '15:00', 107, 145, 1, 11, 2025),
('Tuesday', '15:30', '16:30', 107, 147, 1, 11, 2025),
('Tuesday', '16:30', '17:30', 107, 146, 1, 11, 2025),

('Wednesday', '13:00', '14:00', 107, 143, 1, 11, 2025),
('Wednesday', '14:00', '15:00', 107, 142, 1, 11, 2025),
('Wednesday', '15:30', '16:30', 107, 144, 1, 11, 2025),
('Wednesday', '16:30', '17:30', 107, 146, 1, 11, 2025),

('Thursday', '13:00', '14:00', 107, 143, 1, 11, 2025),
('Thursday', '14:00', '15:00', 107, 142, 1, 11, 2025),
('Thursday', '15:30', '16:30', 107, 144, 1, 11, 2025),
('Thursday', '16:30', '17:30', 107, 146, 1, 11, 2025),

('Friday', '13:00', '14:00', 107, 143, 1, 11, 2025),
('Friday', '14:00', '15:00', 107, 145, 1, 11, 2025),
('Friday', '15:30', '16:30', 107, 147, 1, 11, 2025),
('Friday', '16:30', '17:30', 107, 144, 1, 11, 2025),

('Saturday', '13:00', '14:00', 107, 143, 1, 11, 2025),
('Saturday', '14:00', '15:00', 107, 145, 1, 11, 2025),
('Saturday', '15:30', '16:30', 107, 147, 1, 11, 2025),
('Saturday', '16:30', '17:30', 107, 144, 1, 11, 2025);


INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(148, 'IM-406B', 'Macro Economics', 83),
(149, 'IM-114', 'Financial Management-I', 36),
(150, 'IM-416A', 'Business Statistics-II', 91),
(151, 'IM-401D', 'Marketing Strategies', 92),
(152, 'IM-420', 'Purchase and Materials Management', 93),
(153, 'IM-421', 'E-Business Fundamentals', 94);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Section A (Room LT3)
('Monday', '13:00', '14:00', 23, 150, 2, 10, 2025), 
('Monday', '14:00', '15:00', 23, 149, 2, 10, 2025), 
('Monday', '15:30', '16:30', 23, 148, 2, 10, 2025), 
('Monday', '16:30', '17:30', 23, 152, 2, 10, 2025), 

('Tuesday', '13:00', '14:00', 23, 150, 2, 10, 2025),
('Tuesday', '14:00', '15:00', 23, 149, 2, 10, 2025),
('Tuesday', '15:30', '16:30', 23, 148, 2, 10, 2025),
('Tuesday', '16:30', '17:30', 23, 152, 2, 10, 2025),

('Wednesday', '13:00', '14:00', 23, 151, 2, 10, 2025), 
('Wednesday', '14:00', '15:00', 23, 149, 2, 10, 2025),
('Wednesday', '15:30', '16:30', 23, 152, 2, 10, 2025),
('Wednesday', '16:30', '17:30', 23, 153, 2, 10, 2025), 

('Thursday', '13:00', '14:00', 23, 151, 2, 10, 2025),
('Thursday', '14:00', '15:00', 23, 149, 2, 10, 2025),
('Thursday', '15:30', '16:30', 23, 152, 2, 10, 2025),
('Thursday', '16:30', '17:30', 23, 153, 2, 10, 2025),

('Friday', '13:00', '14:00', 23, 151, 2, 10, 2025),
('Friday', '14:00', '15:00', 23, 150, 2, 10, 2025),
('Friday', '15:30', '16:30', 23, 153, 2, 10, 2025),
('Friday', '16:30', '17:30', 23, 148, 2, 10, 2025),

('Saturday', '13:00', '14:00', 23, 151, 2, 10, 2025),
('Saturday', '14:00', '15:00', 23, 150, 2, 10, 2025),
('Saturday', '15:30', '16:30', 23, 153, 2, 10, 2025),
('Saturday', '16:30', '17:30', 23, 148, 2, 10, 2025),

-- Section B (Room LT4)
('Monday', '13:00', '14:00', 24, 149, 2, 11, 2025),
('Monday', '14:00', '15:00', 24, 150, 2, 11, 2025),
('Monday', '15:30', '16:30', 24, 152, 2, 11, 2025),
('Monday', '16:30', '17:30', 24, 148, 2, 11, 2025),

('Tuesday', '13:00', '14:00', 24, 149, 2, 11, 2025),
('Tuesday', '14:00', '15:00', 24, 150, 2, 11, 2025),
('Tuesday', '15:30', '16:30', 24, 152, 2, 11, 2025),
('Tuesday', '16:30', '17:30', 24, 148, 2, 11, 2025),

('Wednesday', '13:00', '14:00', 24, 149, 2, 11, 2025),
('Wednesday', '14:00', '15:00', 24, 151, 2, 11, 2025),
('Wednesday', '15:30', '16:30', 24, 153, 2, 11, 2025),
('Wednesday', '16:30', '17:30', 24, 152, 2, 11, 2025),

('Thursday', '13:00', '14:00', 24, 149, 2, 11, 2025),
('Thursday', '14:00', '15:00', 24, 151, 2, 11, 2025),
('Thursday', '15:30', '16:30', 24, 153, 2, 11, 2025),
('Thursday', '16:30', '17:30', 24, 152, 2, 11, 2025),

('Friday', '13:00', '14:00', 24, 150, 2, 11, 2025),
('Friday', '14:00', '15:00', 24, 151, 2, 11, 2025),
('Friday', '15:30', '16:30', 24, 148, 2, 11, 2025),
('Friday', '16:30', '17:30', 24, 152, 2, 11, 2025),

('Saturday', '13:00', '14:00', 24, 150, 2, 11, 2025),
('Saturday', '14:00', '15:00', 24, 151, 2, 11, 2025),
('Saturday', '15:30', '16:30', 24, 148, 2, 11, 2025),
('Saturday', '16:30', '17:30', 24, 153, 2, 11, 2025);



INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(154, 'IM-602B', 'Research Methodology', 95),
(155, 'IM-604B', 'Indirect Taxes', 96),
(156, 'IM-603A', 'Forecasting Techniques', 91),
(157, 'IM-601E', 'Operations Research', 97),
(158, 'IM-613', 'Business Environment', 38),
(159, 'IM-606E', 'Project Management', 98);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Section A (Room LT3)
('Monday', '09:00', '11:00', 23, 155, 3, 10, 2025), -- Indirect Taxes
('Monday', '11:00', '13:00', 23, 156, 3, 10, 2025), -- Forecasting Techniques

('Tuesday', '09:00', '11:00', 23, 155, 3, 10, 2025), -- Indirect Taxes
('Tuesday', '11:00', '13:00', 23, 156, 3, 10, 2025), -- Forecasting Techniques

('Wednesday', '09:00', '11:00', 23, 158, 3, 10, 2025), -- Business Environment
('Wednesday', '11:00', '13:00', 23, 154, 3, 10, 2025), -- Research Methodology

('Thursday', '09:00', '11:00', 23, 158, 3, 10, 2025), -- Business Environment
('Thursday', '11:00', '13:00', 23, 154, 3, 10, 2025), -- Research Methodology

('Friday', '09:00', '11:00', 23, 159, 3, 10, 2025), -- Project Management
('Friday', '11:00', '13:00', 23, 157, 3, 10, 2025), -- Operations Research

('Saturday', '09:00', '11:00', 23, 159, 3, 10, 2025), -- Project Management
('Saturday', '11:00', '13:00', 23, 157, 3, 10, 2025), -- Operations Research

-- Section B (Room LT4)
('Monday', '09:00', '11:00', 24, 159, 3, 11, 2025), -- Project Management
('Monday', '11:00', '13:00', 24, 157, 3, 11, 2025), -- Operations Research

('Tuesday', '09:00', '11:00', 24, 159, 3, 11, 2025), -- Project Management
('Tuesday', '11:00', '13:00', 24, 157, 3, 11, 2025), -- Operations Research

('Wednesday', '09:00', '11:00', 24, 155, 3, 11, 2025), -- Indirect Taxes
('Wednesday', '11:00', '13:00', 24, 156, 3, 11, 2025), -- Forecasting Techniques

('Thursday', '09:00', '11:00', 24, 155, 3, 11, 2025), -- Indirect Taxes
('Thursday', '11:00', '13:00', 24, 156, 3, 11, 2025), -- Forecasting Techniques

('Friday', '09:00', '11:00', 24, 158, 3, 11, 2025), -- Business Environment
('Friday', '11:00', '13:00', 24, 154, 3, 11, 2025), -- Research Methodology

('Saturday', '09:00', '11:00', 24, 158, 3, 11, 2025), -- Business Environment
('Saturday', '11:00', '13:00', 24, 154, 3, 11, 2025); -- Research Methodology



INSERT INTO subjects (subject_id, subject_code, subject_name, faculty_id) VALUES
(160, 'IM-801B', 'Core: Quality Management', 53),
(161, 'IM-815MA', 'MA: Product & Brand Management', 52),
(162, 'IM-816MA', 'MA: Strategies & Modelling in Marketing', 65),
(163, 'IM-817MA', 'MA: Service Marketing', 92),
(164, 'IM-815FA', 'FA: International Finance', 99),
(165, 'IM-816FA', 'FA: Project Finance', 100),
(166, 'IM-818FA', 'FA: Corporate Tax', 82),
(167, 'IM-820FB', 'FB: Corporate Valuation and Restructuring', 57),
(168, 'IM-822FB', 'FB: Financial Planning and Wealth Management', 62),
(169, 'IM-815HA', 'HA: OD', 40),
(170, 'IM-816HA', 'HA: Performance Planning & Appraisal', 39),
(171, 'IM-817HA', 'HA: IR and Labour Laws', 53),
(172, 'IM-810C', 'BA: Digital Analytics', 34),
(173, 'IM-814BA', 'BA: Predictive Modelling and Pattern Discovery', 63),
(174, 'IM-812BA', 'BA: Big Data Technologies', 64);


INSERT INTO timetable (day_of_week, start_time, end_time, room_id, subject_id, semester_id, course_id, Batch_ID) VALUES
-- Monday-Tuesday
('Monday', '08:30', '10:30', 102, 174, 4, 12, 2025), -- Big Data Technologies
('Monday', '11:00', '13:00', 101, 160, 4, 12, 2025), -- Core: Quality Management
('Monday', '13:00', '15:00', 19, 161, 4, 12, 2025), -- MA: Product & Brand Management
('Monday', '15:00', '17:00', 19, 170, 4, 12, 2025), -- HA: Performance Planning & Appraisal

('Tuesday', '08:30', '10:30', 102, 174, 4, 12, 2025), -- Big Data Technologies
('Tuesday', '11:00', '13:00', 101, 160, 4, 12, 2025), -- Core: Quality Management
('Tuesday', '13:00', '15:00', 104, 167, 4, 12, 2025), -- FB: Corporate Valuation and Restructuring
('Tuesday', '15:00', '17:00', 19, 165, 4, 12, 2025), -- FA: Project Finance

-- Wednesday-Thursday
('Wednesday', '08:30', '10:30', 101, 166, 4, 12, 2025), -- FA: Corporate Tax
('Wednesday', '11:00', '13:00', 101, 162, 4, 12, 2025), -- MA: Strategies & Modelling in Marketing
('Wednesday', '13:00', '15:00', 19, 169, 4, 12, 2025), -- HA: OD
('Wednesday', '15:00', '17:00', 104, 171, 4, 12, 2025), -- HA: IR and Labour Laws

('Thursday', '08:30', '10:30', 101, 166, 4, 12, 2025), -- FA: Corporate Tax
('Thursday', '11:00', '13:00', 101, 162, 4, 12, 2025), -- MA: Strategies & Modelling in Marketing
('Thursday', '13:00', '15:00', 12, 173, 4, 12, 2025), -- BA: Predictive Modelling and Pattern Discovery (LAB)
('Thursday', '15:00', '17:00', 12, 173, 4, 12, 2025), -- BA: Predictive Modelling and Pattern Discovery (LAB)

-- Friday-Saturday
('Friday', '08:30', '10:30', 101, 164, 4, 12, 2025), -- FA: International Finance
('Friday', '11:00', '13:00', 101, 163, 4, 12, 2025), -- MA: Service Marketing
('Friday', '13:00', '15:00', 12, 172, 4, 12, 2025), -- BA: Digital Analytics
('Friday', '15:00', '17:00', 104, 168, 4, 12, 2025), -- FB: Financial Planning and Wealth Management

('Saturday', '08:30', '10:30', 101, 164, 4, 12, 2025), -- FA: International Finance
('Saturday', '11:00', '13:00', 101, 163, 4, 12, 2025), -- MA: Service Marketing
('Saturday', '13:00', '15:00', 12, 172, 4, 12, 2025), -- BA: Digital Analytics (LAB)
('Saturday', '15:00', '17:00', 104, 168, 4, 12, 2025); -- FB: Financial Planning and Wealth Management





