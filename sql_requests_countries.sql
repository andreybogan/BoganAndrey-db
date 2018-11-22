USE `countries`;

CREATE VIEW `sities_info` AS
SELECT * FROM `cities` `c` LEFT JOIN `districts` `d` ON `c`.`district_id` = `d`.`id`
LEFT JOIN `regions` `r` ON `c`.`region_id` = `r`.`id`
LEFT JOIN `countries` `co` ON `c`.`country_id` = `co`.`id`;
SELECT * FROM `sities_info`;

CREATE VIEW `sities_in_region` AS
SELECT `cities`.* FROM `cities` WHERE `region_id` = 1;
SELECT * FROM `sities_in_region`;