CREATE SCHEMA `geodata` ;

ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `country_id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`country_id`);
;

ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL;

ALTER TABLE `geodata`.`_countries` 
ADD INDEX `title` (`title` ASC) VISIBLE;
;


ALTER TABLE `geodata`.`_countries` 
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`;


ALTER TABLE `geodata`.`_regions` 
CHANGE COLUMN `region_id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `geodata`.`_regions` 
ADD INDEX `fk_country_id_idx` (`country_id` ASC) VISIBLE;
;

ALTER TABLE `geodata`.`_regions` 
ADD CONSTRAINT `fk_country_id`
  FOREIGN KEY (`country_id`)
  REFERENCES `geodata`.`_countries` (`country_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


ALTER TABLE `geodata`.`_regions` 
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`,
DROP COLUMN `title_ru`;

ALTER TABLE `geodata`.`_regions` 
ADD COLUMN `title` VARCHAR(150) NOT NULL AFTER `country_id`;

ALTER TABLE `geodata`.`_regions` 
ADD INDEX `title` (`title` ASC) VISIBLE;
ALTER TABLE `geodata`.`_regions` ALTER INDEX `fk_country_id_idx` VISIBLE;

ALTER TABLE `geodata`.`_cities` 
DROP COLUMN `region_cz`,
DROP COLUMN `area_cz`,
DROP COLUMN `title_cz`,
DROP COLUMN `region_lv`,
DROP COLUMN `area_lv`,
DROP COLUMN `title_lv`,
DROP COLUMN `region_lt`,
DROP COLUMN `area_lt`,
DROP COLUMN `title_lt`,
DROP COLUMN `region_ja`,
DROP COLUMN `area_ja`,
DROP COLUMN `title_ja`,
DROP COLUMN `region_pl`,
DROP COLUMN `area_pl`,
DROP COLUMN `title_pl`,
DROP COLUMN `region_it`,
DROP COLUMN `area_it`,
DROP COLUMN `title_it`,
DROP COLUMN `region_fr`,
DROP COLUMN `area_fr`,
DROP COLUMN `title_fr`,
DROP COLUMN `region_de`,
DROP COLUMN `area_de`,
DROP COLUMN `title_de`,
DROP COLUMN `region_pt`,
DROP COLUMN `area_pt`,
DROP COLUMN `title_pt`,
DROP COLUMN `region_es`,
DROP COLUMN `area_es`,
DROP COLUMN `title_es`,
DROP COLUMN `region_en`,
DROP COLUMN `area_en`,
DROP COLUMN `title_en`,
DROP COLUMN `region_be`,
DROP COLUMN `area_be`,
DROP COLUMN `title_be`,
DROP COLUMN `region_ua`,
DROP COLUMN `area_ua`,
DROP COLUMN `title_ua`,
DROP COLUMN `region_ru`,
DROP COLUMN `area_ru`,
;

ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `region_id` `region_id` INT NULL ,
CHANGE COLUMN `title_ru` `title` VARCHAR(150) NULL ,
ADD PRIMARY KEY (`id`);
;
ALTER TABLE `geodata`.`_cities` 
ADD CONSTRAINT `fk_city`
  FOREIGN KEY (`country_id`)
  REFERENCES `geodata`.`_countries` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `title` `title` VARCHAR(150) NOT NULL ;

ALTER TABLE `geodata`.`_cities` 
ADD INDEX `title` (`title` ASC) VISIBLE;
;

SET SQL_SAFE_UPDATES = 0;
UPDATE `geodata`.`_cities` SET `region_id` = '0' WHERE `region_id` IS NULL;

ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `region_id` `region_id` INT NOT NULL ;

!!!INSERT INTO `geodata`.`_countries` (`id`, `title`) VALUES ('0', '-');
!!!UPDATE `geodata`.`_countries` SET `id` = '0' WHERE (`id` = '236');

!!!INSERT INTO `geodata`.`_regions` (`id`, `country_id`, `title`) VALUES ('0', '0', '-');
!!!UPDATE `geodata`.`_regions` SET `id` = '0' WHERE (`id` = '5468687');

ALTER TABLE `geodata`.`_cities` 
ADD INDEX `fk_region_idx` (`region_id` ASC) VISIBLE;
;
ALTER TABLE `geodata`.`_cities` 
ADD CONSTRAINT `fk_region`
  FOREIGN KEY (`region_id`)
  REFERENCES `geodata`.`_regions` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

