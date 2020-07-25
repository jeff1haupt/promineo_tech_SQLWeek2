-- 1. I want to know how many employees with each title were born after 1965-01-01.

select count(*) as "Number of Employees", t.title 
from employees e, titles t 
where e.emp_no = t.emp_no 
and e.birth_date > '1965-01-01'
group by t.title;

-- 2. I want to know the average salary per title.

select AVG(salary) as "Average Salary", t.title 
from salaries s, titles t 
where s.emp_no = t.emp_no 
group by t.title;

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?

select sum(s.salary), d.dept_name 
from salaries s, departments d, dept_emp de 
where s.emp_no = de.emp_no 
and d.dept_no = de.dept_no 
and d.dept_name = 'Marketing'
and year(s.from_date) <= 1992 and year(s.to_date) >= 1990;
