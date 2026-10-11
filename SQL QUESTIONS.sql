CREATE TABLE STUDENTS (
	STUDENT_ID SERIAL PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL,
	AGE INT,
	GENDER VARCHAR(10),
	CITY VARCHAR(50),
	ENROLLMENT_DATE DATE
);

CREATE TABLE SUBJECTS (
	SUBJECT_ID SERIAL PRIMARY KEY,
	SUBJECT_NAME VARCHAR(100) NOT NULL,
	TEACHER_NAME VARCHAR(100),
	MAX_MARKS INT
);

CREATE TABLE GRADES (
	GRADE_ID SERIAL PRIMARY KEY,
	STUDENT_ID INT REFERENCES STUDENTS (STUDENT_ID),
	SUBJECT_ID INT REFERENCES SUBJECTS (SUBJECT_ID),
	MARKS_OBTAINED INT,
	EXAM_DATE DATE
);

-- EXACT SAMPLE DATA FROM ASSIGNMENT PDF: 10 students, 5 subjects, 30 grades
INSERT INTO
	STUDENTS (NAME, AGE, GENDER, CITY, ENROLLMENT_DATE)
VALUES
	('Aarav Sharma', 17, 'Male', 'Delhi', '2023-04-01'),
	(
		'Priya Gupta',
		16,
		'Female',
		'Mumbai',
		'2023-04-03'
	),
	('Rahul Verma', 18, 'Male', 'Delhi', '2022-06-15'),
	(
		'Sneha Patel',
		15,
		'Female',
		'Lucknow',
		'2023-07-20'
	),
	('Amit Singh', 17, 'Male', 'Jaipur', '2022-09-10'),
	(
		'Divya Nair',
		16,
		'Female',
		'Chennai',
		'2023-01-05'
	),
	('Karan Mehta', 18, 'Male', 'Delhi', '2021-11-22'),
	(
		'Anjali Yadav',
		15,
		'Female',
		'Lucknow',
		'2023-03-18'
	),
	(
		'Vikram Joshi',
		17,
		'Male',
		'Mumbai',
		'2022-08-30'
	),
	(
		'Neha Tiwari',
		16,
		'Female',
		'Delhi',
		'2023-05-14'
	);

INSERT INTO
	SUBJECTS (SUBJECT_NAME, TEACHER_NAME, MAX_MARKS)
VALUES
	('Mathematics', 'Mr. Rajesh Kumar', 100),
	('Science', 'Mrs. Sunita Sharma', 100),
	('English', 'Mr. Anil Verma', 80),
	('History', 'Mrs. Pooja Mishra', 80),
	('Computer', 'Mr. Deepak Singh', 100);

INSERT INTO
	GRADES (STUDENT_ID, SUBJECT_ID, MARKS_OBTAINED, EXAM_DATE)
VALUES
	(1, 1, 88, '2024-03-10'),
	(1, 2, 76, '2024-03-11'),
	(1, 3, 65, '2024-03-12'),
	(2, 1, 92, '2024-03-10'),
	(2, 3, 78, '2024-03-12'),
	(2, 5, 95, '2024-03-14'),
	(3, 2, 55, '2024-03-11'),
	(3, 4, 60, '2024-03-13'),
	(3, 5, 70, '2024-03-14'),
	(4, 1, 45, '2024-03-10'),
	(4, 2, 50, '2024-03-11'),
	(4, 3, 38, '2024-03-12'),
	(5, 1, 80, '2024-03-10'),
	(5, 4, 74, '2024-03-13'),
	(5, 5, 88, '2024-03-14'),
	(6, 2, 91, '2024-03-11'),
	(6, 3, 83, '2024-03-12'),
	(6, 5, 97, '2024-03-14'),
	(7, 1, 33, '2024-03-10'),
	(7, 2, 40, '2024-03-11'),
	(7, 4, 28, '2024-03-13'),
	(8, 1, 72, '2024-03-10'),
	(8, 3, 68, '2024-03-12'),
	(8, 5, 85, '2024-03-14'),
	(9, 2, 60, '2024-03-11'),
	(9, 4, 55, '2024-03-13'),
	(9, 5, 78, '2024-03-14'),
	(10, 1, 95, '2024-03-10'),
	(10, 2, 90, '2024-03-11'),
	(10, 5, 99, '2024-03-14');

SELECT
	*
FROM
	STUDENTS
ORDER BY
	STUDENT_ID;

SELECT
	*
FROM
	SUBJECTS
ORDER BY
	SUBJECT_ID;

SELECT
	*
FROM
	GRADES
ORDER BY
	GRADE_ID;

SELECT
	'students' AS TABLE_NAME,
	COUNT(*) AS TOTAL
FROM
	STUDENTS
UNION ALL
SELECT
	'subjects',
	COUNT(*)
FROM
	SUBJECTS
UNION ALL
SELECT
	'grades',
	COUNT(*)
FROM
	GRADES;

                              --SECTION A — BEGINNER LEVEL (Q1 – Q5)--

                   -- Use only: SELECT, WHERE, ORDER BY, DISTINCT, LIKE, LIMIT in this section.



                                -- Q1. students Table — SELECT & WHERE
                           -- Based on the students table, answer the following:


-- a) Retrieve the name, age, and city of all students who are from 'Delhi' and older than 16 years. Sort
-- the result by name in ascending order.
SELECT
	NAME,
	AGE,
	CITY
FROM
	STUDENTS
WHERE
	CITY = 'Delhi'
	AND AGE > 16
ORDER BY
	NAME ASC;

	

-- b) Display all distinct cities from which students have enrolled.
SELECT DISTINCT
	CITY
FROM
	STUDENTS
	
	
-- c) Fetch the complete details of all female students.
SELECT
	*
FROM
	STUDENTS
WHERE
	GENDER = 'Female';


-- d) List all students who enrolled after 1st January 2023, ordered by enrollment_date in descending
-- order.
SELECT
	*
FROM
	STUDENTS
WHERE
	ENROLLMENT_DATE > '2023-01-01'
ORDER BY
	ENROLLMENT_DATE DESC;
	

-- e) Show all students whose age is between 15 and 18 (inclusive).
SELECT
	*
FROM
	STUDENTS
WHERE
	AGE BETWEEN 15 AND 18



	
	                            -- Q2. students Table — DISTINCT & LIKE
	                      -- Based on the students table, answer the following:

						  
	-- a) Retrieve the name and city of all students whose name starts with 'A
	
SELECT
	NAME,
	CITY
FROM
	STUDENTS
WHERE
	NAME LIKE 'A%';


	

-- b) Find all students whose city ends with the letter 'i'.

SELECT
	*
FROM
	STUDENTS
WHERE
	CITY LIKE '%i';


	

-- c) Display all distinct gender values present in the table.

SELECT DISTINCT
	GENDER
FROM
	STUDENTS;

	

-- d) List students whose name contains the word 'Kumar' anywhere.

SELECT
	*
FROM
	STUDENTS
WHERE
	NAME LIKE '%Kumar%';

	

-- e) Retrieve the first 5 students (by student_id) from the table.

SELECT
	*
FROM
	STUDENTS
ORDER BY
	STUDENT_ID
LIMIT
	5;




                                 -- Q3. subjects Table — Filtering & Sorting
                           -- Based on the subjects table, answer the following:



-- a) Retrieve all subjects where max_marks is 100.

SELECT
	*
FROM
	STUDENTS
ORDER BY
	STUDENT_ID
LIMIT
	5;



-- b) Display subject_name and teacher_name sorted alphabetically by subject_name.

SELECT
	SUBJECT_NAME,
	TEACHER_NAME
FROM
	SUBJECTS
ORDER BY
	SUBJECT_NAME



	
	-- c) Find all subjects taught by teachers whose name starts with 'Mr.'.

SELECT
	*
FROM
	SUBJECTS
WHERE
	TEACHER_NAME LIKE 'Mr.%';

	

-- d) List all subjects where max_marks is less than 100.

SELECT
	*
FROM
	SUBJECTS
WHERE
	MAX_MARKS < 100;



-- e) Show all distinct max_marks values available in the subjects table.


SELECT DISTINCT
	MAX_MARKS
FROM
	SUBJECTS;



	

                                       -- Q4. grades Table — Basic Queries
                                -- Based on the grades table, answer the following:


-- a) Retrieve all grade records where marks_obtained > 80.

SELECT
	*
FROM
	GRADES
WHERE
	MARKS_OBTAINED > 80;

	

-- b) Display all records where marks_obtained < 50 (failing students).

SELECT
	*
FROM
	GRADES
WHERE
	MARKS_OBTAINED < 50;
	

-- c) Fetch all grade records for exam_date '2024-03-10'.

SELECT
	*
FROM
	GRADES
WHERE
	EXAM_DATE = '2024-03-10';



-- d) List all grade records where marks_obtained is between 60 and 90.

SELECT
	*
FROM
	GRADES
WHERE
	MARKS_OBTAINED BETWEEN 60 AND 90;



-- e) Show all grade records ordered by marks_obtained descending. Display only the top 5.

SELECT
	*
FROM
	GRADES
ORDER BY
	MARKS_OBTAINED DESC
LIMIT
	5;




                                -- Q5. students Table — ORDER BY & LIMIT
                           -- Based on the students table, answer the following:


-- a) Retrieve the name and enrollment_date of the 3 most recently enrolled students.

SELECT
	NAME,
	ENROLLMENT_DATE
FROM
	STUDENTS
ORDER BY
	ENROLLMENT_DATE DESC
LIMIT
	3;

	

-- b) Display all male students from 'Delhi', sorted by age descending.

SELECT
	*
FROM
	STUDENTS
WHERE
	GENDER = 'Male'
	AND CITY = 'Delhi'
ORDER BY
	AGE DESC;

	

-- c) List all students whose age is NOT 17.

SELECT
	*
FROM
	STUDENTS
WHERE
	AGE <> 17;

	

-- d) Show students from either 'Mumbai' or 'Lucknow'.
 
 SELECT
	*
FROM
	STUDENTS
WHERE
	CITY IN ('Mumbai', 'Lucknow');

	

-- e) Write a query to display all students where city is NULL.

SELECT
	*
FROM
	STUDENTS
WHERE
	CITY IS NULL;










                            -- SECTION B — INTERMEDIATE BEGINNER (Q6 – Q10)
                        -- Use: COUNT, SUM, AVG, MAX, MIN, GROUP BY, HAVING in this section.



						
                               -- Q6. grades Table — Aggregate Functions
                            -- Based on the grades table, answer the following:



-- a) Find the total number of grade records in the table.

SELECT
	COUNT(*) AS TOTAL_RECORDS
FROM
	GRADES;

	

-- b) Calculate the average marks_obtained across all records.

SELECT
	AVG(MARKS_OBTAINED) AS AVG_MARKS
FROM
	GRADES;

	

-- c) Find the highest marks_obtained in the entire table.

SELECT
	MAX(MARKS_OBTAINED) AS HIGHEST
FROM
	GRADES;

	

-- d) Find the lowest marks_obtained in the entire table.

SELECT
	MIN(MARKS_OBTAINED) AS LOWEST
FROM
	GRADES;
	

-- e) Calculate the sum of marks_obtained for student_id = 2.

SELECT
	SUM(MARKS_OBTAINED) AS TOTAL_MARKS
FROM
	GRADES
WHERE
	STUDENT_ID = 2;






                                       -- Q7. grades Table — GROUP BY
                                  -- Based on the grades table, use GROUP BY:


-- a) Find the total marks scored by each student (group by student_id).

SELECT
	STUDENT_ID,
	SUM(MARKS_OBTAINED) AS TOTAL_MARKS
FROM
	GRADES
GROUP BY
	STUDENT_ID




	-- b) Find the average marks scored per subject (group by subject_id).
	
SELECT
	SUBJECT_ID,
	AVG(MARKS_OBTAINED) AS AVG_MARKS
FROM
	GRADES
GROUP BY
	SUBJECT_ID
	

	
	-- c) Count how many exams each student has appeared in.

SELECT
	STUDENT_ID,
	COUNT(*) AS EXAMS_GIVEN
FROM
	GRADES
GROUP BY
	STUDENT_ID;


	

-- d) Find the maximum marks scored by each student across all subjects.

SELECT
	STUDENT_ID,
	MAX(MARKS_OBTAINED) AS BEST_MARKS
FROM
	GRADES
GROUP BY
	STUDENT_ID;

	

-- e) Find the minimum marks scored in each subject.
 
 SELECT
	SUBJECT_ID,
	MIN(MARKS_OBTAINED) AS LOWEST_MARKS
FROM
	GRADES
GROUP BY
	SUBJECT_ID;






                                      -- Q8. grades Table — HAVING Clause
                                  -- Based on the grades table, use GROUP BY + HAVING:


-- a) Find all students whose total marks are greater than 200.SELECT student_id, SUM(marks_obtained) AS total

SELECT
student_id,
SUM(marks_obtained) AS total

FROM
	GRADES
GROUP BY
	STUDENT_ID
HAVING
	SUM(MARKS_OBTAINED) > 200;



-- b) Find subjects where the average marks are above 70.

SELECT
	SUBJECT_ID,
	AVG(MARKS_OBTAINED) AS AVG_MARKS
FROM
	GRADES
GROUP BY
	SUBJECT_ID
HAVING
	AVG(MARKS_OBTAINED) > 70;


-- c) List students who have appeared in more than 2 exams.

SELECT
	STUDENT_ID,
	COUNT(*) AS EXAMS_GIVEN
FROM
	GRADES
GROUP BY
	STUDENT_ID
HAVING
	COUNT(*) > 2

	

	
	-- d) Find subjects where the maximum marks scored is greater than 90.
	
SELECT
	SUBJECT_ID,
	MAX(MARKS_OBTAINED) AS HIGHEST
FROM
	GRADES
GROUP BY
	SUBJECT_ID
HAVING
	MAX(MARKS_OBTAINED) > 90


	
	-- e) Find students whose average marks across all subjects is less than 60.

SELECT
	STUDENT_ID,
	AVG(MARKS_OBTAINED) AS AVG_MARKS
FROM
	GRADES
GROUP BY
	STUDENT_ID
HAVING
	AVG(MARKS_OBTAINED) < 60;
	



                           -- Q9. subjects Table — COUNT & AVG
                        -- Based on the subjects table, answer the following:


-- a) Count the total number of subjects available.

SELECT
	COUNT(*) AS TOTAL_SUBJECTS
FROM
	SUBJECTS;
	
	

-- b) Find the average max_marks across all subjects.

SELECT
	AVG(MAX_MARKS) AS AVG_MAX_MARKS
FROM
	SUBJECTS




	-- c) Find the subject with the highest max_marks.

SELECT
	SUBJECT_NAME,
	MAX_MARKS
FROM
	SUBJECTS
WHERE
	MAX_MARKS = (
		SELECT
			MAX(MAX_MARKS)
		FROM
			SUBJECTS
	);

	

-- d) Count how many subjects have max_marks = 100.

SELECT
	COUNT(*) AS SUBJECTS_WITH_100
FROM
	SUBJECTS
WHERE
	MAX_MARKS = 100



	
	-- e) List each teacher name and count how many subjects they teach.
	
SELECT
	TEACHER_NAME,
	COUNT(*) AS SUBJECTS_TAUGHT
FROM
	SUBJECTS
GROUP BY
	TEACHER_NAME;

	

                           -- Q10. students Table — Aggregates + Filters
                         -- Based on the students table, answer the following:


-- a) Count the total number of students enrolled.

SELECT
	COUNT(*) AS TOTAL_STUDENTS
FROM
	STUDENTS;

	

-- b) Count students grouped by city.

SELECT
	CITY,
	COUNT(*) AS STUDENTS
FROM
	STUDENTS
GROUP BY
	CITY;


-- c) Count students grouped by gender.

SELECT
	GENDER,
	COUNT(*) AS STUDENTS
FROM
	STUDENTS
GROUP BY
	GENDER;

	

-- d) Find the average age of all students.

SELECT
	AVG(AGE) AS AVG_AGE
FROM
	STUDENTS;

	

-- e) Find all cities that have more than 2 students enrolled.

SELECT
	CITY,
	COUNT(*) AS STUDENTS
FROM
	STUDENTS
GROUP BY
	CITY
HAVING
	COUNT(*) > 2;





                               -- 	SECTION C — INTERMEDIATE (Q11 – Q12)
                        -- Use INNER JOIN, LEFT JOIN, and 3-table JOINs in this section.


                                    -- Q11. JOIN — students + grades
                        -- Perform JOIN operations between the students and grades tables:


-- a) Display each student's name along with their marks_obtained and exam_date. (INNER JOIN)

SELECT
	S.NAME,
	G.MARKS_OBTAINED,
	G.EXAM_DATE
FROM
	STUDENTS S
	INNER JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID;

	

-- b) List all students and their total marks. Include students with no grade records. (LEFT JOIN)

SELECT
	S.NAME,
	SUM(G.MARKS_OBTAINED) AS TOTAL_MARKS
FROM
	STUDENTS S
	LEFT JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
GROUP BY
	S.STUDENT_ID,
	S.NAME;

	

-- c) Find the name of the student who scored the highest marks_obtained overall.

SELECT
	S.NAME,
	G.MARKS_OBTAINED
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
ORDER BY
	G.MARKS_OBTAINED DESC
LIMIT
	1;

	

-- d) Show all students from 'Delhi' along with their marks iN EACH EXAM.

SELECT S.NAME,
G.MARKS_OBTAINED,
G.EXAM_DATE
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
WHERE
	S.CITY = 'Delhi';

	

-- e) Count the number of exams each student appeared in, and show the student name alongside the
-- count.

SELECT
	S.NAME,
	COUNT(G.GRADE_ID) AS EXAMS_GIVEN
FROM
	STUDENTS S
	LEFT JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
GROUP BY
	S.STUDENT_ID,
	S.NAME;





                         -- Q12. JOIN — students + grades + subjects (3-table JOIN)
                    -- Perform 3-table JOIN operations across students, grades, and subjects:


-- a) Display each student's name, subject_name, and marks_obtained.

SELECT
	S.NAME,
	SUB.SUBJECT_NAME,
	G.MARKS_OBTAINED
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
	JOIN SUBJECTS SUB ON G.SUBJECT_ID = SUB.SUBJECT_ID;

	

-- b) Find all students who scored more than 80 in 'Mathematics'. Show student name and marks.

SELECT
	S.NAME,
	G.MARKS_OBTAINED
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
	JOIN SUBJECTS SUB ON G.SUBJECT_ID = SUB.SUBJECT_ID
WHERE
	SUB.SUBJECT_NAME = 'Mathematics'
	AND G.MARKS_OBTAINED > 80;

	

-- c) List all subjects along with the average marks scored by students in that subject.

SELECT
	SUB.SUBJECT_NAME,
	ROUND(AVG(G.MARKS_OBTAINED), 2) AS AVG_MARKS
FROM
	SUBJECTS SUB
	LEFT JOIN GRADES G ON SUB.SUBJECT_ID = G.SUBJECT_ID
GROUP BY
	SUB.SUBJECT_ID,
	SUB.SUBJECT_NAME;

	

-- d) Show names of students who scored above the average marks in 'Computer'.

SELECT
	S.NAME,
	G.MARKS_OBTAINED
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
	JOIN SUBJECTS SUB ON G.SUBJECT_ID = SUB.SUBJECT_ID
WHERE
	SUB.SUBJECT_NAME = 'Computer'
	AND G.MARKS_OBTAINED > (
		SELECT
			AVG(G2.MARKS_OBTAINED)
		FROM
			GRADES G2
			JOIN SUBJECTS S2 ON G2.SUBJECT_ID = S2.SUBJECT_ID
		WHERE
			S2.SUBJECT_NAME = 'Computer'
	);



	

-- e) Display full result: student name, subject name, marks obtained, exam date — sorted by student
-- name, then subject name.

SELECT
	S.NAME,
	SUB.SUBJECT_NAME,
	G.MARKS_OBTAINED,
	G.EXAM_DATE
FROM
	STUDENTS S
	JOIN GRADES G ON S.STUDENT_ID = G.STUDENT_ID
	JOIN SUBJECTS SUB ON G.SUBJECT_ID = SUB.SUBJECT_ID
ORDER BY
	S.NAME,
	SUB.SUBJECT_NAME;




	

                               
							   
							   -- SECTION D — THINK & BUILD (Q13 – Q15)

                   -- No table is given. You must: (1) Design & CREATE the table (2) INSERT sample data (3) Write the queries.



                                    -- Q13. Library Records System
                     -- A school library wants to maintain a record of books borrowed by students — including which book was taken, when
                     -- it was borrowed, and when it was returned.


-- a) Design a suitable table (e.g. library_records) with appropriate columns and data types. Write the
-- CREATE TABLE statement.

CREATE TABLE LIBRARY_RECORDS (
	RECORD_ID SERIAL PRIMARY KEY,
	STUDENT_NAME VARCHAR(100) NOT NULL,
	BOOK_TITLE VARCHAR(150) NOT NULL,
	BORROW_DATE DATE NOT NULL,
	RETURN_DATE DATE
);



-- b) Insert at least 6 sample records into your table.

INSERT INTO
	LIBRARY_RECORDS (
		STUDENT_NAME,
		BOOK_TITLE,
		BORROW_DATE,
		RETURN_DATE
	)
VALUES
	(
		'Rahul Verma',
		'Wings of Fire',
		'2024-03-01',
		'2024-03-10'
	),
	(
		'Rahul Verma',
		'Python Basics',
		'2024-03-12',
		NULL
	),
	(
		'Rahul Verma',
		'Discovery of India',
		'2024-03-15',
		NULL
	),
	(
		'Rahul Verma',
		'Maths Magic',
		'2024-03-18',
		'2024-03-25'
	),
	(
		'Priya Gupta',
		'Harry Potter',
		'2024-03-02',
		'2024-03-09'
	),
	(
		'Priya Gupta',
		'Gitanjali',
		'2024-03-11',
		'2024-03-20'
	),
	(
		'Aarav Sharma',
		'Science Today',
		'2024-03-05',
		NULL
	);





	

-- c) Retrieve all books that are currently borrowed and not yet returned.

SELECT
	*
FROM
	LIBRARY_RECORDS
WHERE
	RETURN_DATE IS NULL;


	

-- d) Find all books borrowed by a student named 'Rahul'.


SELECT
	*
FROM
	LIBRARY_RECORDS
WHERE
	STUDENT_NAME LIKE 'Rahul%';


	

-- e) Count how many books each student has borrowed. Show only students who borrowed more than
-- 2 books.

SELECT
	STUDENT_NAME,
	COUNT(*) AS BOOKS_BORROWED
FROM
	LIBRARY_RECORDS
GROUP BY
	STUDENT_NAME
HAVING
	COUNT(*) > 2;



	

                                   -- Q14. Student Attendance System
                    -- A school wants to track daily attendance of students for each subject. The record should capture the student,
                    -- subject, date, and whether the student was Present or Absent.


-- a) Design a suitable table (e.g. attendance) with appropriate columns. Write the CREATE TABLE
-- statement.

CREATE TABLE ATTENDANCE (
	ATTENDANCE_ID SERIAL PRIMARY KEY,
	STUDENT_ID INT REFERENCES STUDENTS (STUDENT_ID),
	SUBJECT_ID INT REFERENCES SUBJECTS (SUBJECT_ID),
	ATTENDANCE_DATE DATE NOT NULL,
	STATUS VARCHAR(10) CHECK (STATUS IN ('Present', 'Absent'))
);




-- b) Insert at least 8 sample records (mix of Present and Absent).

INSERT INTO
	ATTENDANCE (STUDENT_ID, SUBJECT_ID, ATTENDANCE_DATE, STATUS)
VALUES
	(1, 1, '2024-04-01', 'Present'),
	(1, 1, '2024-04-02', 'Present'),
	(1, 1, '2024-04-03', 'Absent'),
	(2, 1, '2024-04-01', 'Present'),
	(2, 1, '2024-04-02', 'Absent'),
	(2, 1, '2024-04-03', 'Absent'),
	(2, 1, '2024-04-04', 'Absent'),
	(3, 2, '2024-04-01', 'Present'),
	(3, 2, '2024-04-02', 'Present'),
	(3, 2, '2024-04-03', 'Present');



	

-- c) Count the total number of days each student was Present.

SELECT
	S.NAME,
	COUNT(*) AS PRESENT_DAYS
FROM
	ATTENDANCE A
	JOIN STUDENTS S ON A.STUDENT_ID = S.STUDENT_ID
WHERE
	A.STATUS = 'Present'
GROUP BY
	S.NAME;


	

-- d) Find all students who were Absent more than 2 times.


SELECT
	S.NAME,
	COUNT(*) AS ABSENT_DAYS
FROM
	ATTENDANCE A
	JOIN STUDENTS S ON A.STUDENT_ID = S.STUDENT_ID
WHERE
	A.STATUS = 'Absent'
GROUP BY
	S.NAME
HAVING
	COUNT(*) > 2;


	

-- e) Display the attendance percentage of each student. (Present days ÷ Total days × 100)


SELECT
	S.NAME,
	ROUND(
		100.0 * SUM(
			CASE
				WHEN A.STATUS = 'Present' THEN 1
				ELSE 0
			END
		) / COUNT(*),
		2
	) AS ATTENDANCE_PERCENTAGE
FROM
	ATTENDANCE A
	JOIN STUDENTS S ON A.STUDENT_ID = S.STUDENT_ID
GROUP BY
	S.STUDENT_ID,
	S.NAME;



	

                                     -- Q15. Fee Management System

                    -- A school wants to track fee payment records of students, including the amount paid, payment date, mode of
                    -- payment (Cash / Online / Cheque), and payment status (Paid / Pending).


-- a) Design a suitable table (e.g. fee_records) with appropriate columns and data types. Write the
-- CREATE TABLE statement.

CREATE TABLE FEE_RECORDS (
	FEE_ID SERIAL PRIMARY KEY,
	STUDENT_ID INT REFERENCES STUDENTS (STUDENT_ID),
	AMOUNT_PAID NUMERIC(10, 2) NOT NULL,
	PAYMENT_DATE DATE,
	PAYMENT_MODE VARCHAR(10) CHECK (PAYMENT_MODE IN ('Cash', 'Online', 'Cheque')),
	STATUS VARCHAR(10) CHECK (STATUS IN ('Paid', 'Pending'))
);




-- b) Insert at least 7 sample records into your table.

INSERT INTO
	FEE_RECORDS (
		STUDENT_ID,
		AMOUNT_PAID,
		PAYMENT_DATE,
		PAYMENT_MODE,
		STATUS
	)
VALUES
	(1, 5000, '2024-04-05', 'Cash', 'Paid'),
	(2, 5000, '2024-04-06', 'Online', 'Paid'),
	(3, 0, NULL, NULL, 'Pending'),
	(4, 2500, '2024-04-10', 'Cheque', 'Paid'),
	(4, 2500, '2024-05-10', 'Online', 'Paid'),
	(5, 0, NULL, NULL, 'Pending'),
	(6, 5000, '2024-04-12', 'Online', 'Paid');



	

-- c) Find all students whose fee status is 'Pending'.

SELECT
	S.NAME,
	F.STATUS
FROM
	FEE_RECORDS F
	JOIN STUDENTS S ON F.STUDENT_ID = S.STUDENT_ID
WHERE
	F.STATUS = 'Pending';


	


-- d) Calculate the total fee collected so far (sum of amount_paid where status = 'Paid').

SELECT
	SUM(AMOUNT_PAID) AS TOTAL_COLLECTED
FROM
	FEE_RECORDS
WHERE
	STATUS = 'Paid';

	

-- e) Display each student's total amount paid. Sort by total amount descending.

SELECT
	S.NAME,
	SUM(F.AMOUNT_PAID) AS TOTAL_PAID
FROM
	FEE_RECORDS F
	JOIN STUDENTS S ON F.STUDENT_ID = S.STUDENT_ID
GROUP BY
	S.STUDENT_ID,
	S.NAME
ORDER BY
	TOTAL_PAID DESC;













	