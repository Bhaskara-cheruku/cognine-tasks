use emp_272;

---------------------------------------1-------------------------------------
---Write a SQL query to retrieve the names of employees along with their department names and the latest salary amount.--

select e.employee_name, d.department_name,s2.salary_amount from employees e join departments d
on e.department_id = d.department_id
join
(
select s1.employee_id, s1.salary_amount from salaries s1 join
(select employee_id,max(salary_date) as latest_salary_Date from salaries group by employee_id) s
on s.employee_id = s1.employee_id AND s.latest_salary_Date = s1.salary_date
)s2  on e.employee_id = s2.employee_id


---------------------------------------2-------------------------------------
---Write a SQL query to find out the total revenue generated from each category in the last month ---

select c.category_name, sum(o.quantity * p.price) as revenue from categories c
join products p on p.category_id = c.category_id
join orders o on o.product_id = o.product_id
where o.order_date >= DATEADD(month,-1,getdate()) 
group by c.category_name

---------------------------------------3-------------------------------------
---Write a SQL query to list all books along with their authors and the borrowers who borrowed them, including the borrow and return dates ---

select b1.book_title, a.author_name, b2.borrower_name, b2.borrow_date, b2.return_date
from authors a
join books b1 on a.author_id = b1.author_id
join borrowers b2 on b2.book_id = b1.book_id

---------------------------------------4-------------------------------------
---Write a SQL query to calculate the average grade for each course.---

select C.course_id, s.course_name, s.average from courses1 C 
join
(select c.course_name,avg(g.grade_value)as average from courses1 c
join  enrollments e on c.course_id = e.course_id
join grades g on g.enrollment_id = e.enrollment_id
group by (c.course_name)
) s on C.course_name=s.course_name order by (course_id)


---------------------------------------5-------------------------------------
--- Write a SQL query to find out the total revenue generated from customers in each country. ---

select c.customer_country, sum(o.order_quantity * p.product_price) from customers c
join orders2 o on o.customer_id = c.customer_id
join products2 p on p.product_id=o.product_id
group by c.customer_country

