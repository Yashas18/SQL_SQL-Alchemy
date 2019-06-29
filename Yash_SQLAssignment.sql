--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select 
employees.emp_no, 
employees.last_name, 
employees.first_name, 
salaries.salary
from public.employees as employees
left join public.salaries as salaries
on employees.emp_no = salaries.emp_no
order by employees.emp_no;

--2. List employees who were hired in 1986.

select * from public.employees 
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31' 
order by hire_date


--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select 
dept_manager.dept_no, 
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.from_date,
dept_emp.to_date
from public.dept_manager as dept_manager
left join public.departments as departments
on dept_manager.dept_no = departments.dept_no
left join public.employees as employees
on dept_manager.emp_no = employees.emp_no
left join public.dept_emp as dept_emp
on dept_manager.emp_no = dept_emp.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
employees.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
from public.employees as employees
left join public.dept_emp as dept_emp
on employees.emp_no = dept_emp.emp_no
left join public.departments as departments
on dept_emp.dept_no = departments.dept_no
order by employees.emp_no;


--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from public.employees 
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 
employees.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
from public.employees as employees
left join public.dept_emp as dept_emp
on employees.emp_no = dept_emp.emp_no
left join public.departments as departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by employees.emp_no;


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select 
employees.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
from public.employees as employees
left join public.dept_emp as dept_emp
on employees.emp_no = dept_emp.emp_no
left join public.departments as departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name in ('Sales','Development')
order by employees.emp_no;


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select 
last_name, count(last_name) 
from public.employees
group by last_name
order by last_name;
