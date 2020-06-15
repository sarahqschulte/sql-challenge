--1. from the case study
CREATE VIEW "Salaries" AS 
	SELECT s.emp_no AS "employee number",
	s.last_name AS "last name",
	s.first_name AS "first name",
	s.sex AS "Sex", 
	cast (e.salary as money) As Salary 
		FROM employees s 
			INNER JOIN salaries e ON s.emp_no=e.emp_no; 
--2. List first name, last name, and hire date for employees who were hired in 1986.
Create view "1986" AS
SELECT e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.hire_date AS "Hire Date"
FROM employees e
WHERE 
	EXTRACT(Year from hire_date) = '1986';
--3.List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no as "Department No"
	,d.dept_name as "Dept Name"
	,d.dept_no as "Manager Emp No"
	,e.first_name as "First Name"
	,e.last_name as "Last Name"
from dept_manager dm 
	inner join departments d on 
	d.dept_no = dm. dept_no
	inner join employees e on 
	e.emp_no = dm.emp_no;
--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no As "Employee No"
	,e.last_name AS "Surname"
	,e.first_name AS "First Name"
	,d.dept_name AS "Dept Name"
from employees e 
	inner join dept_emp de on
	de.emp_no = e.emp_no
	inner join departments d on 
	d.dept_no = de.dept_no;
--fixing the dates
select hire_date from employees;
Alter table employees
	alter column hire_date TYPE date USING hire_date::date;
--5.List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name As "Hercules Club"
	,last_name As "B- Club"
	,sex as "Gender"
from employees
where first_name = 'Hercules'
	and upper (last_name) like 'B%';
--6. List all employees in the Sales department,
--including their employee number, last name, first name, and department name.
select e.last_name as "Last Name"
	,e.first_name as "First Name"
	,s.emp_no as "Employee No"
	,s.dept_no as "Sales Team"
from employees e 
	inner join dept_emp s on 
	s.emp_no = e.emp_no
	inner join departments d on
	d.dept_no = s.dept_no
	and d.dept_name = 'Sales';
--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.last_name as "Last Name"
	,e.first_name as "First Name"
	,s.emp_no as "Employee No"
	,s.dept_no as "Employee ID"
from employees e 
	inner join dept_emp s on 
	s.emp_no = e.emp_no
	inner join departments d on
	d.dept_no = s.dept_no
	and d.dept_name in ('Sales','Development');
--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select last_name as "Last Names"
	,count(last_name) as "Freq" 
	from employees 
	group by last_name 
	order by count (last_name) desc; 
	