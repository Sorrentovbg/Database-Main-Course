CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `id_region` int NOT NULL,
  `id_district` int DEFAULT NULL,
  `city` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_country_to_add_idx` (`id_country`),
  KEY `fk_region_country_russia _to_add_idx` (`id_region`),
  KEY `fk_region_district_russia _to_add_idx` (`id_district`),
  CONSTRAINT `fk_from_country_to_add` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_from_district_japan_to_add` FOREIGN KEY (`id_district`) REFERENCES `district_japan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_from_district_russua_to_add` FOREIGN KEY (`id_district`) REFERENCES `district_russia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_from_region_japan_to_add` FOREIGN KEY (`id_region`) REFERENCES `region_japan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_from_region_russua_to_add` FOREIGN KEY (`id_region`) REFERENCES `region_russia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT * FROM lesson_01.address;

CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region_japan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `region_name` text NOT NULL,
  PRIMARY KEY (`id`,`id_country`),
  KEY `fk_from_country_idx` (`id_country`),
  CONSTRAINT `fk_from_country_to_region_japan` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region_russia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `region_name` text NOT NULL,
  PRIMARY KEY (`id`,`id_country`),
  KEY `fk_from_country_to_region_russia_idx` (`id_country`),
  CONSTRAINT `fk_from_country_to_region_russia` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `district_russia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `district_name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_region_to_district_russia_idx` (`id_region`),
  CONSTRAINT `fk_from_region_to_district_russia` FOREIGN KEY (`id_region`) REFERENCES `region_russia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `district_japan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `district_name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_region_to_district_idx` (`id_region`),
  CONSTRAINT `fk_from_region_to_district_japan` FOREIGN KEY (`id_region`) REFERENCES `region_japan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


