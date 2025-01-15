# Examination Database System

## Project Overview

The **Examination Database System** is a structured database designed to manage and analyze various entities involved in an academic environment. This project facilitates the management of students, professors, courses, departments, exams, questions, evaluations, and related associations. It supports tracking academic performance, course evaluations, and professor ratings.

---

## Features

### 1. **Student Management**
- Maintains student records including names, levels, faculties, and graduation status.

### 2. **Course Management**
- Tracks course details and the departments offering them.

### 3. **Professor Management**
- Maintains professor details, including scientific degrees and assigned departments.

### 4. **Examinations**
- Stores exam information linked to courses and tracks student performance.

### 5. **Evaluation System**
- Captures evaluations of professors and courses provided by students.

### 6. **Queries for Insights**
- View student results per course.
- Evaluate courses and professors for each department.
- Identify the top 10 scores per course.
- Determine the highest-rated professor teaching the same course.

---

## Database Schema

### Tables
1. **`student`**
   - Tracks student details like name, username, level, faculty, and graduation status.

2. **`department`**
   - Stores department information, including managers linked to professors.

3. **`professor`**
   - Records professor details and their assigned departments.

4. **`course`**
   - Contains course details, linked to departments.

5. **`exam`**
   - Stores exam information associated with courses.

6. **`question`**
   - Contains question data, answers, and correct answers for courses.

7. **`std_exam_quest`**
   - Links student answers and grades to specific exam questions.

8. **`std_evaluate_prof`**
   - Tracks student evaluations of professors.

9. **`std_evaluate_course`**
   - Records student evaluations of courses.

10. **`student_course`**
    - Manages the relationship between students and their enrolled courses.

11. **`professor_teach_course`**
    - Links professors to the courses they teach.

---

## Sample Queries

### 1. **Student Results Per Course**
```sql
SELECT 
    SUM(grade) AS total_grade,
    CONCAT(fname, ' ', lname) AS fullname,
    c_name
FROM
    std_exam_quest
JOIN
    student ON student.id = std_exam_quest.std_id
JOIN
    exam ON std_exam_quest.ex_code = exam.ex_code
JOIN
    course ON course.id = exam.course_id
GROUP BY fullname, c_name;
```

### 2. **Course and Professor Evaluations**
```sql
SELECT	
    CONCAT(P.fname, ' ', P.lname) AS fullname,
    AVG(PR.rate) AS 'Professor rate',
    AVG(CR.rate) AS 'Course rate'
FROM
    std_evaluate_prof PR
JOIN 
    professor P ON P.id = PR.prof_id
JOIN
    department D ON D.mng_id = P.id
JOIN 
    course C ON D.id = C.dept_id
JOIN 
    std_evaluate_course CR ON CR.course_id = C.id
GROUP BY fullname;
```

### 3. **Top 10 High Scores Per Course**
```sql
SELECT
    MAX(grade) AS highest_grade,
    CONCAT(fname, ' ', lname) AS fullname,
    c_name
FROM
    std_exam_quest
JOIN
    student ON std_exam_quest.std_id = student.id
JOIN
    exam ON std_exam_quest.ex_code = exam.ex_code
JOIN
    course ON course.id = exam.course_id
GROUP BY fullname, c_name;
```

### 4. **Highest Rated Professor Teaching the Same Course**
```sql
SELECT 
    CONCAT(P.fname, ' ', P.lname) AS fullname,
    MAX(PR.rate) AS 'Professor rate'
FROM 
    std_evaluate_prof PR
JOIN 
    professor P ON PR.prof_id = P.id
GROUP BY fullname;
```

---

## Setup Instructions

1. **Create the Database**
   ```sql
   CREATE DATABASE project;
   USE project;
   ```

2. **Run the Schema Script**
   - Execute the provided SQL script to create the necessary tables and relationships.

3. **Insert Sample Data**
   - Populate the database with sample data using the given `INSERT` statements.

4. **Run Queries**
   - Use the provided queries to retrieve insights and evaluate the database functionality.

---

## Future Enhancements
- Implement user interfaces for real-time interactions.
- Add data validation and security features.
- Integrate role-based access control for better database security.

---

## Authors:
1. Nadia Ahmed
2. Mohamed Hassan
3. Mohamed Ashraf
4. Mohamed Emad
5. Mohamed Loai

   
This project is developed as part of an academic exercise to demonstrate SQL skills and database design.
