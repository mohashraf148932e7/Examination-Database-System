create database project ;
use project;

CREATE TABLE student (
	id int  primary key,
	fname varchar(50) NOT NULL,
	lname varchar(50) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	st_password varchar(50) NOT NULL,
	st_level enum("1","2", "3", "4") default "1",
	faculty varchar(50) NOT NULL,
	graduation_status enum("undergraduate","postgraduate") default "undergraduate"
);

INSERT INTO student (id, fname, lname, username, st_password, st_level, faculty, graduation_status)
VALUES
(1, 'Ahmed', 'Hassan', 'ahmed.hassan', 'pass123', '3', 'Engineering', 'undergraduate'),
(2, 'Mona', 'Ali', 'mona.ali', 'secure456', '4', 'Science', 'undergraduate'),
(3, 'Omar', 'Adel', 'omar.adel', 'mypassword', '2', 'Arts', 'undergraduate'),
(4, 'Sara', 'Youssef', 'sara.youssef', 'strongpass', '1', 'Business', 'undergraduate'),
(5, 'Khaled', 'Ibrahim', 'khaled.ibrahim', 'pass789', '2', 'Engineering', 'postgraduate'),
(6, 'Yasmine', 'Nour', 'yasmine.nour', 'yasminepass', '3', 'Medicine', 'undergraduate'),
(7, 'Tamer', 'Mohamed', 'tamer.mohamed', 'medpass', '2', 'Law', 'undergraduate'),
(8, 'Heba', 'Saad', 'heba.saad', 'hebapass', '4', 'Engineering', 'undergraduate'),
(9, 'Karim', 'Fathy', 'karim.fathy', 'mathpass', '1', 'Mathematics', 'undergraduate'),
(10, 'Nourhan', 'Tawfik', 'nourhan.tawfik', 'nourhanpass', '3', 'Science', 'undergraduate'),
(11, 'Mahmoud', 'Ashraf', 'mahmoud.ashraf', 'ashrafpass', '4', 'Arts', 'undergraduate'),
(12, 'Laila', 'Samir', 'laila.samir', 'samirpass', '2', 'Engineering', 'postgraduate'),
(13, 'Hossam', 'Zaki', 'hossam.zaki', 'zakipass', '3', 'Computer Science', 'postgraduate'),
(14, 'Amira', 'Shawky', 'amira.shawky', 'shawky123', '1', 'Engineering', 'undergraduate'),
(15, 'Mohamed', 'Farouk', 'mohamed.farouk', 'faroukpass', '2', 'Medicine', 'postgraduate'),
(16, 'Aya', 'Gamal', 'aya.gamal', 'gamalpass', '4', 'Business', 'undergraduate');


create table department(
	id int primary key,
    dept_name varchar(50),
    mng_id int
);
INSERT INTO department (id, dept_name,mng_id)
VALUES
(1, 'Engineering', 101),
(2, 'Medicine', 102),
(3, 'Law', 103),
(4, 'Science', 104),
(5, 'Business Administration', 105),
(6, 'Arts', 106),
(7, 'Computer Science', 107),
(8, 'Mathematics', 108),
(9, 'Physics', 109),
(10, 'Biology', 110);

create table professor(
	id int primary key,
    fname varchar(50) NOT NULL,
	lname varchar(50) NOT NULL,
    scientific_deg varchar(50) not null,
    dept_id int,
    foreign key (dept_id) references department(id)
);
INSERT INTO professor (id, fname, lname, scientific_deg, dept_id)
VALUES
(101, 'Ahmed', 'Hassan', 'Professor', 1), 
(102, 'Mona', 'Ali', 'Associate Professor', 2), 
(103, 'Omar', 'Adel', 'Lecturer', 3), 
(104, 'Sara', 'Youssef', 'Professor', 4), 
(105, 'Khaled', 'Ibrahim', 'Assistant Professor', 5), 
(106, 'Yasmine', 'Nour', 'Professor', 6), 
(107, 'Tamer', 'Mohamed', 'Lecturer', 7), 
(108, 'Heba', 'Saad', 'Professor', 8), 
(109, 'Karim', 'Fathy', 'Assistant Professor', 9), 
(110, 'Nourhan', 'Tawfik', 'Professor', 10); 

create table course(
	id int primary key,
    c_name varchar(50) NOT NULL,
    dept_id int,
    foreign key (dept_id) references department(id)
);
INSERT INTO course (id, c_name, dept_id)
VALUES
(1, 'Engineering Mathematics', 1), 
(2, 'Thermodynamics', 1),
(3, 'Human Anatomy', 2), 
(4, 'Pharmacology', 2), 
(5, 'Criminal Law', 3), 
(6, 'Civil Law', 3), 
(7, 'Organic Chemistry', 4), 
(8, 'Physics Basics', 4), 
(9, 'Financial Accounting', 5), 
(10, 'Management Principles', 5); 


ALTER TABLE department
ADD CONSTRAINT fk_professor
FOREIGN KEY (mng_id) REFERENCES professor(id);

create table exam(
	ex_code varchar(50) primary key,
    ex_name varchar(50) NOT NULL,
    course_id int,
    foreign key (course_id) references course(id)
);

INSERT INTO exam (ex_code, ex_name, course_id)
VALUES
('EX101', 'Midterm Exam - Engineering Mathematics', 1), 
('EX102', 'Final Exam - Engineering Mathematics', 1), 
('EX103', 'Midterm Exam - Thermodynamics', 2), 
('EX104', 'Final Exam - Thermodynamics', 2), 
('EX201', 'Midterm Exam - Human Anatomy', 3), 
('EX202', 'Final Exam - Human Anatomy', 3), 
('EX203', 'Midterm Exam - Pharmacology', 4), 
('EX204', 'Final Exam - Pharmacology', 4), 
('EX301', 'Midterm Exam - Criminal Law', 5), 
('EX302', 'Final Exam - Criminal Law', 5); 


create table question(
	q_num int primary key,
    answer enum("a","b","c","d"),
    right_answer varchar(50) not null,
    course_id int,
    foreign key (course_id) references course(id)
);
INSERT INTO question (q_num, answer, right_answer, course_id)
VALUES
(1, 'a', 'Matrix Multiplication', 1),
(2, 'b', 'First Law of Thermodynamics', 2), 
(3, 'c', 'Human Heart Anatomy', 3), 
(4, 'd', 'Functions of Hormones', 4),
(5, 'a', 'Difference Between Civil and Criminal Law', 5),
(6, 'b', 'Elements of a Contract', 6), 
(7, 'c', 'Organic Compounds and Reactions', 7), 
(8, 'd', 'Newton’s Laws of Motion', 8), 
(9, 'a', 'Double-Entry Accounting System', 9),
(10, 'b', 'Principles of Leadership', 10); 

create table std_exam_quest 
(
	ex_code varchar(50) not null,
	std_id int not null,
	quest_num int not null,
	grade int not null ,
	std_answer varchar(50),
	primary key (ex_code, std_id, quest_num),
	foreign key (ex_code) references exam(ex_code),
	foreign key (std_id) references student(id),
	foreign key (quest_num) references question(q_num)
);
INSERT INTO std_exam_quest (ex_code, std_id, quest_num, grade, std_answer)
VALUES
('EX101', 1, 1, 10, 'a'),
('EX101', 1, 2, 8, 'b'), 
('EX102', 2, 3, 9, 'c'), 
('EX102', 2, 4, 7, 'd'), 
('EX103', 3, 5, 10, 'a'), 
('EX103', 3, 6, 8, 'b'), 
('EX104', 4, 7, 9, 'c'), 
('EX104', 4, 8, 10, 'd'), 
('EX201', 5, 9, 10, 'a'), 
('EX201', 5, 10, 9, 'b'); 

create table std_evaluate_prof 
(
	std_id int not null,
	prof_id int not null,
	rate int not null ,
	feedback text,
	primary key (std_id, prof_id),
	foreign key (std_id) references student(id),
	foreign key (prof_id) references professor(id)
);
INSERT INTO std_evaluate_prof (std_id, prof_id, rate, feedback)
VALUES
(1, 101, 5, 'Excellent teaching, very clear explanations.'),
(2, 102, 4, 'Good teaching, but could provide more examples in class.'), 
(3, 103, 5, 'Great professor! Engaging and knowledgeable.'), 
(4, 104, 3, 'Could improve class organization and time management.'), 
(5, 105, 4, 'Well structured course, but sometimes lectures are too fast.'), 
(1, 102, 4, 'Professor is good, but class discussions can be better.'), 
(3, 101, 5, 'Wonderful experience, highly recommend the course!'), 
(4, 103, 3, 'Needs to improve on providing feedback for assignments.'), 
(2, 104, 4, 'Decent professor, would appreciate more interactive sessions.'), 
(5, 102, 5, 'Excellent, detailed explanations and feedback on assignments.'); 


create table std_evaluate_course 
(
	std_id int not null,
	course_id int not null,
	rate int not null ,
	feedback text,
	primary key (std_id, course_id),
	foreign key (std_id) references student(id),
	foreign key (course_id) references course(id)
);
INSERT INTO std_evaluate_course (std_id, course_id, rate, feedback)
VALUES
(1, 1, 5, 'This course is very well-structured, and the materials provided were excellent.'), 
(2, 2, 4, 'The course was informative but could benefit from more practical examples.'), 
(3, 3, 5, 'I learned a lot in this course, and the professor made it very engaging.'), 
(4, 4, 3, 'The course content was a bit difficult to follow and needed more examples.'), 
(5, 5, 4, 'Good course but would appreciate more detailed discussions in class.'), -- Student 5 evaluating Course 5
(1, 2, 4, 'The material was solid but the pace of the course was a bit too fast for me.'), -- Student 1 evaluating Course 2
(3, 1, 5, 'Great introductory course! Very helpful and well-explained.'), -- Student 3 evaluating Course 1
(4, 3, 3, 'It was an okay course, but the examples provided did not fully clarify the concepts.'), -- Student 4 evaluating Course 3
(2, 4, 4, 'The course was quite informative, but the assignments could have been better structured.'), -- Student 2 evaluating Course 4
(5, 2, 5, 'I enjoyed this course, and the professor provided lots of helpful insights.' ); -- Student 5 evaluating Course 2


create table student_course(
	std_id int not null,
    course_id int not null,
    primary key (std_id, course_id),
	foreign key (std_id) references student(id),
	foreign key (course_id) references course(id)
);
INSERT INTO student_course (std_id, course_id)
VALUES
(1, 1), 
(1, 2),
(2, 2), 
(2, 3),
(3, 3), 
(3, 1), 
(4, 4), 
(4, 5), 
(5, 5), 
(5, 2); 


create table professor_teach_course(
	prof_id int not null,
    course_id int not null,
    primary key (prof_id, course_id),
	foreign key (prof_id) references professor(id),
	foreign key (course_id) references course(id)
);
INSERT INTO professor_teach_course (prof_id, course_id)
VALUES
(101, 1),
(102, 2), 
(103, 3), 
(104, 4), 
(105, 5),
(101, 2), 
(102, 3), 
(103, 4), 
(104, 5), 
(105, 1); 
#(1)Write a query that enables the students to view their results per course

SELECT 
	SUM(grade),
    concat(fname,' ',lname) as fullname,
    c_name
FROM
	std_exam_quest
JOIN
	student
ON
	student.id = std_exam_quest.std_id
JOIN
	exam
ON
	std_exam_quest.ex_code= exam.ex_code
JOIN
	course
ON
	course.id= exam.course_id
GROUP BY fullname , c_name;

#(2)Write a query that enables the head of department to see evaluation of each course and professor.
	SELECT	
        concat(P.fname,' ',P.lname) as fullname,
        AVG(PR.rate) AS 'Professor rate',
        AVG(CR.rate) AS 'Course rate'
	FROM
		std_evaluate_prof PR
	JOIN 
		professor P
    ON 
		P.id = PR.prof_id
    JOIN
		department D
	ON 
		D.mng_id = P.id
    JOIN 
		course C
    ON 
		D.id = C.dept_id
    JOIN 
		std_evaluate_course CR
    ON 
		CR.course_id = C.id
    GROUP BY fullname
	;
#(3)Write a query that enables you to get top 10 high scores per course.
	SELECT
		max(grade),
		concat(fname,' ',lname) as fullname,
		c_name
	FROM
		std_exam_quest 
	JOIN
		student
	ON
		std_exam_quest.std_id=student.id
	JOIN
		exam
	ON
		std_exam_quest.ex_code= exam.ex_code
	JOIN
		course
	ON
			course.id= exam.course_id
	GROUP BY fullname , c_name;
#(4)Write a query to get the highest evaluation professor from the set of professors teaching the same course
SELECT 
	concat(P.fname,' ',P.lname) AS fullname,
	Max(PR.rate) AS 'Professor rate'
FROM 
	std_evaluate_prof PR
JOIN 
	professor P
ON 
	PR.prof_id = P.id
GROUP BY fullname;