use emp_272;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);
select * from departments;
select * from employees;
select * from salaries;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT NOT NULL, 
    hire_date DATE NOT NULL,
    country VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE salaries (
    employee_id INT NOT NULL,
    salary_amount DECIMAL(10, 2),
    salary_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'),
       (2, 'Engineering'),
       (3, 'Sales'),
       (4, 'Marketing'),
       (5, 'Finance');

INSERT INTO employees (employee_id, employee_name, department_id, hire_date, country)
VALUES (1, 'Amit Sharma', 1, '2020-01-15', 'India'),
       (2, 'Neha Singh', 2, '2019-03-10', 'India'),
       (3, 'Rahul Kumar', 3, '2021-06-20', 'India'),
       (4, 'Sanjay Gupta', 4, '2018-07-25', 'India'),
       (5, 'Ravi Verma', 5, '2017-12-05', 'India'),
       (6, 'John Doe', 1, '2018-04-25', 'USA'),
       (7, 'Jane Smith', 2, '2022-02-18', 'UK'),
       (8, 'Linda Johnson', 3, '2019-11-23', 'USA'),
       (9, 'David Brown', 4, '2020-05-19', 'UK'),
       (10, 'Chris Evans', 5, '2021-09-17', 'Australia'),
       (11, 'Anil Kumble', 1, '2021-03-13', 'India'),
       (12, 'Priya Darshini', 2, '2020-08-21', 'India'),
       (13, 'Manoj Tiwari', 3, '2018-01-30', 'India'),
       (14, 'Vijay Rao', 4, '2019-06-27', 'India'),
       (15, 'Pooja Patel', 5, '2021-10-15', 'India'),
       (16, 'Suresh Raina', 1, '2017-02-22', 'India'),
       (17, 'Sunil Gavaskar', 2, '2016-11-03', 'India'),
       (18, 'Kapil Dev', 3, '2021-01-09', 'India'),
       (19, 'Rohit Sharma', 4, '2020-04-29', 'India'),
       (20, 'Virat Kohli', 5, '2019-08-14', 'India'),
       (21, 'Mark Taylor', 1, '2018-07-15', 'Australia'),
       (22, 'Allan Border', 2, '2017-05-12', 'Australia'),
       (23, 'Steve Smith', 3, '2019-12-18', 'Australia'),
       (24, 'Ricky Ponting', 4, '2020-10-21', 'Australia'),
       (25, 'Adam Gilchrist', 5, '2021-03-24', 'Australia'),
       (26, 'Kevin Pietersen', 1, '2016-09-28', 'UK'),
       (27, 'Andrew Strauss', 2, '2015-08-16', 'UK'),
       (28, 'Michael Vaughan', 3, '2018-12-02', 'UK'),
       (29, 'Alastair Cook', 4, '2019-11-07', 'UK'),
       (30, 'Ben Stokes', 5, '2020-07-31', 'UK');

INSERT INTO salaries (employee_id, salary_amount, salary_date)
VALUES (1, 50000, '2023-01-01'),
       (1, 52000, '2023-02-01'),
       (2, 60000, '2023-01-01'),
       (2, 62000, '2023-02-01'),
       (3, 70000, '2023-01-01'),
       (3, 72000, '2023-02-01'),
       (4, 80000, '2023-01-01'),
       (4, 82000, '2023-02-01'),
       (5, 90000, '2023-01-01'),
       (5, 92000, '2023-02-01'),
       (6, 50000, '2023-01-01'),
       (6, 52000, '2023-02-01'),
       (7, 60000, '2023-01-01'),
       (7, 62000, '2023-02-01'),
       (8, 70000, '2023-01-01'),
       (8, 72000, '2023-02-01'),
       (9, 80000, '2023-01-01'),
       (9, 82000, '2023-02-01'),
       (10, 90000, '2023-01-01'),
       (10, 92000, '2023-02-01'),
       (11, 50000, '2023-01-01'),
       (11, 52000, '2023-02-01'),
       (12, 60000, '2023-01-01'),
       (12, 62000, '2023-02-01'),
       (13, 70000, '2023-01-01'),
       (13, 72000, '2023-02-01'),
       (14, 80000, '2023-01-01'),
       (14, 82000, '2023-02-01'),
       (15, 90000, '2023-01-01'),
       (15, 92000, '2023-02-01'),
       (16, 50000, '2023-01-01'),
       (16, 52000, '2023-02-01'),
       (17, 60000, '2023-01-01'),
       (17, 62000, '2023-02-01'),
       (18, 70000, '2023-01-01'),
       (18, 72000, '2023-02-01'),
       (19, 80000, '2023-01-01'),
       (19, 82000, '2023-02-01'),
       (20, 90000, '2023-01-01'),
       (20, 92000, '2023-02-01'),
       (21, 50000, '2023-01-01'),
       (21, 52000, '2023-02-01'),
       (22, 60000, '2023-01-01'),
       (22, 62000, '2023-02-01'),
       (23, 70000, '2023-01-01'),
       (23, 72000, '2023-02-01'),
       (24, 80000, '2023-01-01'),
       (24, 82000, '2023-02-01'),
       (25, 90000, '2023-01-01'),
       (25, 92000, '2023-02-01'),
       (26, 50000, '2023-01-01'),
       (26, 52000, '2023-02-01'),
       (27, 60000, '2023-01-01'),
       (27, 62000, '2023-02-01'),
       (28, 70000, '2023-01-01'),
       (28, 72000, '2023-02-01'),
       (29, 80000, '2023-01-01'),
       (29, 82000, '2023-02-01'),
       (30, 90000, '2023-01-01'),
       (30, 92000, '2023-02-01');

select * from departments;
select * from employees;
select * from salaries;

--1--

select e.employee_name, d.department_name,s2.salary_amount from employees e join departments d
on e.department_id = d.department_id
join
(
select s1.employee_id, s1.salary_amount from salaries s1 join
(select employee_id,max(salary_date) as latest_salary_Date from salaries group by employee_id) s
on s.employee_id = s1.employee_id AND s.latest_salary_Date = s1.salary_date
)s2  on e.employee_id = s2.employee_id


--------------------------------------------------------------------------------------------3

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    author_country VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author_id INT,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    book_id INT,
    borrower_name VARCHAR(100),
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO authors (author_id, author_name, author_country) VALUES
(1, 'Jane Austen', 'United Kingdom'),
(2, 'Mark Twain', 'United States'),
(3, 'Fyodor Dostoevsky', 'Russia'),
(4, 'Haruki Murakami', 'Japan'),
(5, 'Gabriel Garcia Marquez', 'Colombia');


INSERT INTO books (book_id, book_title, author_id, publication_date) VALUES
(1, 'Pride and Prejudice', 1, '1813-01-28'),
(2, 'Adventures of Huckleberry Finn', 2, '1884-12-10'),
(3, 'Crime and Punishment', 3, '1866-01-01'),
(4, 'Norwegian Wood', 4, '1987-09-04'),
(5, 'One Hundred Years of Solitude', 5, '1967-06-05');

INSERT INTO borrowers (borrower_id, book_id, borrower_name, borrow_date, return_date) VALUES
(6, 1, 'Gupta', '2024-01-15', '2024-02-15'),
(1, 1, 'Alice Johnson', '2024-01-15', '2024-02-15'),
(2, 2, 'Bob Smith', '2024-02-01', '2024-03-01'),
(3, 3, 'Charlie Brown', '2024-02-20', '2024-03-20'),
(4, 4, 'Diana Prince', '2024-03-05', '2024-04-05'),
(5, 5, 'Edward Norton', '2024-03-10', '2024-04-10');


select * from authors;
select * from books;
select * from borrowers;

select b1.book_title, a.author_name, b2.borrower_name, b2.borrow_date, b2.return_date
from authors a
join books b1 on a.author_id = b1.author_id
join borrowers b2 on b2.book_id = b1.book_id


----------------------------------------------------------------------------------4

CREATE TABLE students1(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    student_major VARCHAR(100)
);

CREATE TABLE courses1(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_department VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students1(student_id),
    FOREIGN KEY (course_id) REFERENCES courses1(course_id)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    enrollment_id INT,
    grade_value DECIMAL(5, 2),
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);


INSERT INTO students1 (student_id, student_name, student_major) VALUES
(1, 'Alice Johnson', 'Computer Science'),
(2, 'Bob Smith', 'Mathematics'),
(3, 'Charlie Brown', 'Physics'),
(4, 'Diana Prince', 'Engineering'),
(5, 'Edward Norton', 'Biology'),
(6, 'Fiona Apple', 'Chemistry'),
(7, 'George Washington', 'History'),
(8, 'Hannah Montana', 'Music'),
(9, 'Ian McKellen', 'Drama'),
(10, 'Jane Doe', 'Literature');

INSERT INTO courses1(course_id, course_name, course_department) VALUES
(1, 'Introduction to Computer Science', 'Computer Science'),
(2, 'Calculus I', 'Mathematics'),
(3, 'General Physics', 'Physics'),
(4, 'Engineering Mechanics', 'Engineering'),
(5, 'Biology 101', 'Biology'),
(6, 'Organic Chemistry', 'Chemistry'),
(7, 'World History', 'History'),
(8, 'Music Theory', 'Music'),
(9, 'Acting Basics', 'Drama'),
(10, 'Shakespearean Literature', 'Literature');


INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-01-10'),
(2, 2, 2, '2024-01-11'),
(3, 3, 3, '2024-01-12'),
(4, 4, 4, '2024-01-13'),
(5, 5, 5, '2024-01-14'),
(6, 6, 6, '2024-01-15'),
(7, 7, 7, '2024-01-16'),
(8, 8, 8, '2024-01-17'),
(9, 9, 9, '2024-01-18'),
(10, 10, 10, '2024-01-19'),
(11, 1, 2, '2024-01-20'),
(12, 2, 3, '2024-01-21');


INSERT INTO grades (grade_id, enrollment_id, grade_value) VALUES
(1, 1, 85.50),
(2, 2, 90.00),
(3, 3, 78.50),
(4, 4, 88.00),
(5, 5, 92.50),
(6, 6, 75.00),
(7, 7, 83.00),
(8, 8, 89.50),
(9, 9, 91.00),
(10, 10, 87.50),
(11, 11, 82.00),
(12, 12, 80.00);


----Write a SQL query to calculate the average grade for each course.

select * from grades
select * from enrollments
select * from courses1
select * from students1


select C.course_id, s.course_name, s.average from courses1 C 
join students1 s1 on s1.student_major = C.course_department
join
(select c.course_name,avg(g.grade_value)as average from courses1 c
join  enrollments e on c.course_id = e.course_id
join grades g on g.enrollment_id = e.enrollment_id
group by (c.course_name)
) s on C.course_name=s.course_name order by (course_id)


-----------------------------------------------------------------------------------------------------------------5


