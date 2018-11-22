USE `organization`;

-- 1. Выбрать среднюю зарплату по отделам.
CREATE VIEW `avg_salary` AS
SELECT `d`.`name`, AVG(`e`.`salary`) FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id` GROUP BY `d`.`id`; 
SELECT * FROM `avg_salary`;

-- 2. Выбрать максимальную зарплату у сотрудника.
CREATE VIEW `max_salary` AS
SELECT MAX(`salary`) FROM `employees` ORDER BY `salary`;
SELECT * FROM `max_salary`;

-- 3. Посчитать количество сотрудников во всех отделах.
CREATE VIEW `count_employee_in_department` AS
SELECT `d`.`name`, COUNT(`e`.`id`) FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id`  GROUP BY `e`.`department_id`;
SELECT * FROM `count_employee_in_department`;

-- 4. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
CREATE VIEW `count_get_money_in_department` AS
SELECT `d`.`name`, COUNT(`e`.`id`) `count`, SUM(`e`.`salary`) `total` FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id`  GROUP BY `e`.`department_id`;
SELECT * FROM `count_get_money_in_department`;
