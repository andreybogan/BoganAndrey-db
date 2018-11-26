USE `organization`;

SET AUTOCOMMIT=0;

BEGIN;
SELECT @a := MAX(`salary`) FROM `employees`;
UPDATE `employees` SET `salary`= @a - 10000 WHERE `salary`= @a;
COMMIT;

BEGIN;
SELECT @a := MIN(`salary`) FROM `employees`;
UPDATE `employees` SET `salary`= @a + 10000 WHERE `salary`= @a;
COMMIT;

SET AUTOCOMMIT=1;
