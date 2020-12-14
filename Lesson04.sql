-- 1.Создать на основе запросов, которые вы сделали в ДЗ к уроку 3, VIEW.

USE `employees`;
CREATE OR REPLACE VIEW `salary_and_dept` AS
    SELECT 
        departments.dept_no, departments.dept_name, salaries.salary
    FROM
        departments
            JOIN
        dept_emp ON dept_emp.dept_no = departments.dept_no
            JOIN
        salaries ON salaries.emp_no = dept_emp.emp_no;

-- 2.Создать функцию, которая найдет менеджера по имени и фамилии.

USE `employees`;
DROP function IF EXISTS `get_manager_id`;

DELIMITER $$
USE `employees`$$
CREATE FUNCTION `get_manager_id` (first_name_manager VARCHAR(14), last_name_manager VARCHAR(16))
RETURNS INTEGER DETERMINISTIC
BEGIN
DECLARE result INT;
SELECT 
    employees.emp_no
INTO result FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
WHERE
    employees.first_name LIKE first_name_manager
        AND employees.last_name LIKE last_name_manager;
RETURN result;
END$$

DELIMITER ;

-- 3.Создать триггер, который при добавлении нового сотрудника будет выплачивать 
--	ему вступительный бонус, занося запись в таблицу salary.

CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`employees_AFTER_INSERT` 
DELIMITER $$
USE `employees`$$
CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`employees_AFTER_INSERT` 
AFTER INSERT ON `employees` 
FOR EACH ROW
BEGIN
INSERT salaries(emp_no, salary, from_date, to_date) VALUES (NEW.emp_no, 8000, NEW.hire_date, NEW.hire_date);
END$$
DELIMITER ;




