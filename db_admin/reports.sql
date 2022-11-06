--  1. Report:
--  How many rows do we have in each table in the employees database?:


-- 2. Report:
-- How many employees with the first name "Mark" do we have in our company?
SELECT COUNT(first_name)"Employees with first name 'Mark'" 
FROM `employees` 
WHERE first_name = "mark";


-- 3. Report:
-- How many employees with the first name "Eric" and the last name beginning with "A" do we have in our company?
SELECT COUNT(first_name) AS "Count Emplyoees 'Eric A...'"
FROM `employees` 
WHERE first_name = "Eric" 
AND last_name LIKE "A%";


--  4. Report:
--  How many employees do we have that are working for us since 1985 and who are they?
SELECT first_name, last_name, hire_date
FROM `employees` 
WHERE hire_date >= '1985-01-01'
GROUP BY first_name, last_name
ORDER BY hire_date;


--  5. Report:
--  How many employees got hired from 1990 until 1997 and who are they?
SELECT first_name, last_name, hire_date
FROM `employees` 
WHERE hire_date >= '1990-01-01' AND hire_date < '1997-01-01'
#If we want to ignore the multiple hire-dates for one person:
GROUP BY first_name, last_name
ORDER BY first_name;


-- 6. Report:
--  How many employees have salaries higher than EUR 70 000,00 and who are they? 
SSELECT first_name, last_name, salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE salary > 70000
GROUP BY first_name, last_name
ORDER BY first_name;


--  7. Report:
--  How many employees do we have in the Research Department, who are working for us since 1992 and who are they?
SELECT first_name, last_name, dept_emp.from_date AS 'In Research Department since:'
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'research' AND dept_emp.from_date >= '1992-01-01'
GROUP BY first_name, last_name
ORDER BY first_name;



-- 8. Report:
--  How many employees do we have in the Finance Department, who are working for us since 1985 until now and who have salaries higher than EUR 75 000,00 - who are they?
SELECT first_name, last_name, salary, dept_emp.from_date AS 'In Research Dept. since:'
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE departments.dept_name = 'finance' 
AND dept_emp.from_date >= '1985-01-01'
AND CURRENT_DATE() < dept_emp.to_date
AND salary > 75000
GROUP BY first_name, last_name
ORDER BY first_name;



--  9. Report:
--  We need a table with employees, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title and salary.
SELECT employees.emp_no, first_name AS "First name", last_name AS "Last name", 
birth_date AS "Date of birth", gender, hire_date AS "Hire date",
title AS "Title", salary AS "Salary"
FROM employees
LEFT JOIN salaries ON salaries.emp_no = employees.emp_no
LEFT JOIN titles ON titles.emp_no = employees.emp_no
LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date > CURRENT_DATE()
GROUP BY employees.emp_no
ORDER BY first_name;


--  10. Report:
--  We need a table with managers, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title, department name and salary.
SELECT first_name AS "First name", last_name AS "Last name",
birth_date AS "Birthdate", gender AS "Gender", 
hire_date AS "Hire date", dept_manager.to_date, title AS "Title",
dept_name AS "Department", salary AS "Salary"
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date > CURRENT_DATE() AND salaries.to_date > CURRENT_DATE()
GROUP BY first_name, last_name;


--  Bonus query:
--   Create a query that will join all tables and show all data from all tables.

