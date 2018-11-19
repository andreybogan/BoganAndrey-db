USE `organization`;

-- 1. Выбрать среднюю зарплату по отделам.
SELECT `d`.`name`, AVG(`e`.`salary`) FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id` GROUP BY `d`.`id`; 

-- 2. Выбрать максимальную зарплату у сотрудника.
SELECT `name`, `salary` FROM `employees` ORDER BY `salary` DESC LIMIT 1;
-- или
SELECT MAX(`salary`) FROM `employees`;

-- 3. Удалить одного сотрудника, у которого максимальная зарплата.
DELETE FROM `employees` ORDER BY `salary` DESC LIMIT 1;
-- или 
DELETE FROM `employees` WHERE `salary` = (SELECT * FROM (SELECT MAX(`salary`) FROM `employees`) AS `temp`);

-- 4. Посчитать количество сотрудников во всех отделах.
SELECT `d`.`name`, COUNT(`e`.`id`) FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id`  GROUP BY `e`.`department_id`;

-- 4. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
SELECT `d`.`name`, COUNT(`e`.`id`) `count`, SUM(`e`.`salary`) `total` FROM `employees` `e` LEFT JOIN `departments` `d` ON `e`.`department_id` = `d`.`id`  GROUP BY `e`.`department_id`;
