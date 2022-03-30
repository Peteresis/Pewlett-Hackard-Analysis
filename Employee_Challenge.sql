-- Use Dictinct with Orderby to remove duplicate rows
SELECT emp_no, first_name, last_name
-- INTO nameyourtable
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';





-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
