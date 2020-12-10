
-- Request from DB 1

SELECT 
    _cities.title, _cities.region_id, _countries.title
FROM
    _cities
        JOIN
    _countries ON _cities.country_id = _countries.id
HAVING _cities.title LIKE 'Воронеж'

-- Request from DB 2

SELECT 
    region_id, title
FROM
    _cities
WHERE 
    region_id = 1053480

-- Request from DB 3

SELECT 
    departments.dept_no,
    departments.dept_name,
    AVG(salaries.salary) AS AVG_Dept
FROM
    departments
        JOIN
    salaries
GROUP BY dept_name

-- Request from DB 4
-- Version 1

SELECT 
    first_name, last_name, salaries.salary
FROM
    employees
        JOIN
    salaries ON salaries.emp_no = employees.emp_no
ORDER BY salaries.salary DESC
LIMIT 1

-- Version 2

SELECT 
    *
FROM
    employees
WHERE
    emp_no = (SELECT 
            emp_no
        FROM
            salaries
        ORDER BY salary DESC LIMIT 1)




-- Request from DB 5

DELETE employees . * FROM employees 
WHERE
    emp_no = (SELECT 
        emp_no
    FROM
        salaries
    ORDER BY salary DESC
    LIMIT 1)


-- Request from DB 6

SELECT 
   departments.dept_no, departments.dept_name, COUNT(dept_emp.dept_no) as count_emp
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
GROUP BY departments.dept_name
ORDER BY departments.dept_no


-- Request from DB 7

SELECT 
   departments.dept_no, departments.dept_name, COUNT(dept_emp.dept_no) as count_emp, COUNT(salaries.salary) as count_mon
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
		JOIN
	salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY departments.dept_name
ORDER BY departments.dept_no
