USE countries;

ALTER TABLE `countries` 
CHANGE COLUMN `name` `title` VARCHAR(150) NOT NULL;

ALTER TABLE `countries` 
ADD INDEX `title_index` (`title` ASC) VISIBLE;

ALTER TABLE `regions` 
DROP FOREIGN KEY `id_country`;

ALTER TABLE `regions` 
CHANGE COLUMN `id_country` `country_id` INT(11) NOT NULL,
CHANGE COLUMN `name` `title` VARCHAR(150) NOT NULL;

ALTER TABLE `regions` 
ADD CONSTRAINT `id_country`
FOREIGN KEY (`country_id`)
REFERENCES `countries` (`id`);

ALTER TABLE `cities` 
ADD COLUMN `country_id` INT(11) NOT NULL AFTER `id`,
ADD COLUMN `importand` TINYINT(1) NOT NULL AFTER `country_id`,
CHANGE COLUMN `id_region` `region_id` INT(11) NOT NULL,
CHANGE COLUMN `name` `title` VARCHAR(150) NOT NULL;

ALTER TABLE `cities` 
ADD INDEX `title_index` (`title` ASC) VISIBLE;

ALTER TABLE `cities` 
ADD INDEX `country_id_idx` (`country_id` ASC) VISIBLE;

ALTER TABLE `cities` 
ADD CONSTRAINT `country_id`
FOREIGN KEY (`country_id`)
REFERENCES `countries` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;