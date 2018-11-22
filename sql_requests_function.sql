USE `organization`;

CREATE FUNCTION employee(name VARCHAR(50))
RETURNS TEXT DETERMINISTIC
RETURN (SELECT `id` FROM `employees` WHERE `name` = name);

SELECT * FROM `employees` WHERE `id` = employee('Андрей Боган');

#-----------------------------------------------------------------

CREATE TRIGGER `salary`
AFTER INSERT ON `employees`
FOR EACH ROW
UPDATE `employees` SET `salary` = 10000 WHERE `id` = NEW.`id`;