
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Employees.gender,
		Salaries.salary
FROM Employees
INNER JOIN Salaries
ON Salaries.emp_no = Employees.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

	SELECT emp_no, first_name, last_name, hire_date
	FROM Employees
	WHERE DATE_PART('year',hire_date)= 1986
	ORDER BY hire_date ASC

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DISTINCT Departments.dept_no, 
			Departments.dept_name,
			Department_Manager.emp_no,
			Employees.last_name,
			Employees.first_name
FROM Employees
INNER JOIN Department_manager
ON Employees.emp_no = Department_Manager.emp_no
INNER JOIN Departments
ON Department_Manager.dept_no = Departments.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT DISTINCT Department_employee.emp_no,
			Employees.first_name,
			Employees.last_name,
			Departments.dept_name
FROM Department_employee
JOIN Employees
ON Department_Employee.emp_no = Employees.emp_no
JOIN Departments
ON Department_Employee.dept_no = Departments.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT Employees.last_name,
	Employees.first_name,
	Employees.gender
FROM Employees
WHERE Employees.first_name LIKE 'Hercules' 
AND Employees.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT DISTINCT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
JOIN Department_Employee
ON Employees.emp_no = Department_Employee.emp_no
JOIN Departments
ON Departments.dept_no = Department_employee.dept_no
WHERE Departments.dept_name = 'Sales'
ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DISTINCT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
JOIN Department_Employee
ON Employees.emp_no = Department_Employee.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employee.dept_no
WHERE Departments.dept_name = 'Sales'
OR Departments.dept_name = 'Development'
ORDER BY emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Employees.last_name,
	COUNT(Employees.emp_no)
FROM Employees
GROUP BY Employees.last_name
ORDER BY COUNT(Employees.emp_no)
DESC;

