-- 1)List the following details of each employee: employee number, last name, first name, sex, and salary.
select DISTINCT
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
from employees e
JOIN salaries s
on e.emp_no = s.emp_no;

-- 2)List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
e.first_name, e.last_name, e.hire_date 
FROM employees e
WHERE EXTRACT(year from e.hire_date)=1986;

-- 3)List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select distinct
dp.dept_no
,dp.dept_name
,emp.emp_no
,emp.last_name
,emp.first_name
from dept_manager dm
Inner JOIN departments dp
on dp.dept_no = dm.dept_no
Inner JOIN employees emp
on emp.emp_no = dm.emp_no;

-- 4)List the department of each employee with the following information: 
-- employee number, last name, first name, and department name. 

select distinct e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on de.dept_no=d.dept_no;

-- 5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name,last_name,gender
from employees
where first_name='Hercules' and last_name like 'B%';

-- 6)List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.
select distinct e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on de.dept_no=d.dept_no
where d.dept_name='Sales';

-- 7)List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on de.dept_no=d.dept_no
where d.dept_name in ('Sales','Development');

-- 8)In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

select last_name, count(*) as frequency
from employees
group by last_name
order by frequency desc;

