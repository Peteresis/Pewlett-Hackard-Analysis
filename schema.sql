-- Sections 7.0.1 to 7.2.1 do not generate SQL code


-- ********************************
-- Section 7.2.2
-- ********************************
-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);
create table employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);
create table dept_emp (
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
create table managers (
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);
create table titles (
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, from_date)
);

select * from departments;
select * from dept_emp;
select * from employees;
select * from managers;
select * from salaries;
select * from titles;

-- ********************************
-- Sections 7.2.3 & 7.2.4 do not generte SQL code
-- ********************************

 
-- ********************************
-- Section 7.3.1
-- ********************************

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Count employees
SELECT COUNT(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';



-- Employees who were born in 1952
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Employees who were born in 1953
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';


-- Employees who were born in 1954
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';


-- Employees who were born in 1955
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Count Retirement eligibility employees
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a new table to save the retirement info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Show retirement_info
SELECT * FROM retirement_info;


-- Create a new table to save the retirement info
SELECT first_name, last_name, birth_date, hire_date
INTO retirement_info2
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Show retirement_info
SELECT * FROM retirement_info2;


-- Create a new table to save the retirement info
SELECT emp_no, first_name, last_name, birth_date, hire_date
INTO retirement_info3
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Show retirement_info
SELECT * FROM retirement_info3;

-- Show dept_emp
SELECT * FROM dept_emp;


-- ********************************
-- Section 7.3.3
-- ********************************

-- Example of left join
-- SELECT column_name(s)
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column_name = table2.column_name;

-- Left join retirement_info3 (left) and dept_emp (right)
SELECT retirement_info3.emp_no,
dept_emp.dept_no,
retirement_info3.first_name,
retirement_info3.last_name,
retirement_info3.birth_date,
retirement_info3.hire_date
FROM retirement_info3
LEFT JOIN dept_emp ON retirement_info3.emp_no = dept_emp.emp_no;



-- Joining retirement_info and dept_emp tables
SELECT retirement_info3.emp_no,
    retirement_info3.first_name,
retirement_info3.last_name,
    dept_emp.to_date
FROM retirement_info3
LEFT JOIN dept_emp
ON retirement_info3.emp_no = dept_emp.emp_no;

-- Practice with Aliases
-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info3 as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    de.dept_no,
	ri.first_name,
    ri.last_name,
    ri.birth_date,
    ri.hire_date,
    de.to_date
INTO current_emp
FROM retirement_info3 as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Show current_emp
SELECT * FROM current_emp;

-- ********************************
-- Section 7.3.4
-- ********************************

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- ********************************
-- Section 7.3.5
-- ********************************

-- Part 1: Employee Information: A list of employees containing their unique employee number,
-- their last name, first name, gender, and salary

SELECT emp_no, first_name, last_name
INTO retirement_info4
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info4;

SELECT emp_no, first_name, last_name
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM emp_info;

-- Same thing with Aliases and two JOIN statements
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info2
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info2;

-- Part 2: Management: A list of managers for each department, including the department number,
-- name, and the manager's employee number, last name, first name, and the starting and
-- ending employment dates

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM managers AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT * FROM manager_info;


-- Part 3: Department Retirees: An updated current_emp list that includes everything it currently has,
-- but also the employee's departments

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);


-- ********************************
-- Section 7.3.6
-- ********************************
-- ********************************
-- SKILL DRILL #1
-- ********************************
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- ********************************
-- SKILL DRILL #2
-- ********************************
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
ce.birth_date,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY d.dept_name, ce.last_name ASC;


SELECT ce.emp_no,
ce.first_name,
ce.last_name,
ce.birth_date,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY d.dept_name, ce.last_name ASC;

SELECT * FROM dept_info;

-- Count how many people in each dept
SELECT dept_name, COUNT(dept_name)
FROM dept_info
GROUP BY dept_name;












































































