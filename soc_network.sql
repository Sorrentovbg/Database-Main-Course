-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: soc_network
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment_db`
--

DROP TABLE IF EXISTS `comment_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_db` (
  `id_comm` varchar(15) NOT NULL,
  `comment_to` varchar(15) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `comm_owner` varchar(15) NOT NULL,
  PRIMARY KEY (`id_comm`),
  KEY `fk_comm_owner_idx` (`comm_owner`),
  KEY `fk_comm_to_idx` (`comment_to`),
  CONSTRAINT `fk_comm_owner` FOREIGN KEY (`comm_owner`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comm_to` FOREIGN KEY (`comment_to`) REFERENCES `photograf_db` (`id_photo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_db`
--

LOCK TABLES `comment_db` WRITE;
/*!40000 ALTER TABLE `comment_db` DISABLE KEYS */;
INSERT INTO `comment_db` VALUES ('comm1','ph1','Beautiful Cat','id3'),('comm2','ph2','Beautiful Dog','id5'),('comm3','ph2','Cute Dog','id2'),('comm4','ph3','Hight mountin','id2');
/*!40000 ALTER TABLE `comment_db` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `comment_db_BEFORE_INSERT` BEFORE INSERT ON `comment_db` FOR EACH ROW BEGIN
SET NEW.id_comm = CONCAT('comm', ((SELECT COUNT(*) FROM comment_db) + 1));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `like_comm`
--

DROP TABLE IF EXISTS `like_comm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_comm` (
  `for_comm` varchar(15) NOT NULL,
  `from_user` varchar(15) NOT NULL,
  PRIMARY KEY (`for_comm`,`from_user`),
  KEY `fk_like_comm_from_idx` (`from_user`),
  CONSTRAINT `fk_comm_for` FOREIGN KEY (`for_comm`) REFERENCES `comment_db` (`id_comm`),
  CONSTRAINT `fk_like_comm_from` FOREIGN KEY (`from_user`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_comm`
--

LOCK TABLES `like_comm` WRITE;
/*!40000 ALTER TABLE `like_comm` DISABLE KEYS */;
INSERT INTO `like_comm` VALUES ('comm1','id1'),('comm2','id2'),('comm2','id3'),('comm3','id5');
/*!40000 ALTER TABLE `like_comm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_photo`
--

DROP TABLE IF EXISTS `like_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_photo` (
  `ph_for` varchar(15) NOT NULL,
  `from_user` varchar(15) NOT NULL,
  PRIMARY KEY (`ph_for`,`from_user`),
  KEY `fk_like_ph_from_idx` (`from_user`),
  CONSTRAINT `fk_like_ph_from` FOREIGN KEY (`from_user`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ph_for` FOREIGN KEY (`ph_for`) REFERENCES `photograf_db` (`id_photo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_photo`
--

LOCK TABLES `like_photo` WRITE;
/*!40000 ALTER TABLE `like_photo` DISABLE KEYS */;
INSERT INTO `like_photo` VALUES ('ph1','id1'),('ph1','id2'),('ph2','id3'),('ph3','id4');
/*!40000 ALTER TABLE `like_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_user`
--

DROP TABLE IF EXISTS `like_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_user` (
  `to_user` varchar(15) NOT NULL,
  `from_user` varchar(15) NOT NULL,
  PRIMARY KEY (`to_user`,`from_user`),
  KEY `fk_from_user_idx` (`from_user`),
  CONSTRAINT `fk_from_user` FOREIGN KEY (`from_user`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_to_user` FOREIGN KEY (`to_user`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_user`
--

LOCK TABLES `like_user` WRITE;
/*!40000 ALTER TABLE `like_user` DISABLE KEYS */;
INSERT INTO `like_user` VALUES ('id2','id1'),('id1','id2'),('id1','id3'),('id1','id4'),('id2','id4'),('id3','id4'),('id1','id5'),('id2','id5');
/*!40000 ALTER TABLE `like_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photograf_db`
--

DROP TABLE IF EXISTS `photograf_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photograf_db` (
  `id_photo` varchar(15) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `photo_owner` varchar(15) NOT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `fk_foto_owner_idx` (`photo_owner`),
  CONSTRAINT `fk_foto_owner` FOREIGN KEY (`photo_owner`) REFERENCES `user_db` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photograf_db`
--

LOCK TABLES `photograf_db` WRITE;
/*!40000 ALTER TABLE `photograf_db` DISABLE KEYS */;
INSERT INTO `photograf_db` VALUES ('ph1','Photo Animal Cat','id1'),('ph2','Photo Animal Dog','id2'),('ph3','Photo Natural Mountin','id4');
/*!40000 ALTER TABLE `photograf_db` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `photograf_db_BEFORE_INSERT` BEFORE INSERT ON `photograf_db` FOR EACH ROW BEGIN
SET NEW.id_photo = CONCAT('ph', ((SELECT COUNT(*) FROM photograf_db) + 1));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `request_one`
--

DROP TABLE IF EXISTS `request_one`;
/*!50001 DROP VIEW IF EXISTS `request_one`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `request_one` AS SELECT 
 1 AS `id_user`,
 1 AS `user_name`,
 1 AS `like_resive`,
 1 AS `like_send`,
 1 AS `like_from`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `request_three_p1`
--

DROP TABLE IF EXISTS `request_three_p1`;
/*!50001 DROP VIEW IF EXISTS `request_three_p1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `request_three_p1` AS SELECT 
 1 AS `id_photo`,
 1 AS `photo_name`,
 1 AS `like_resive`,
 1 AS `like_from`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `request_three_p2`
--

DROP TABLE IF EXISTS `request_three_p2`;
/*!50001 DROP VIEW IF EXISTS `request_three_p2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `request_three_p2` AS SELECT 
 1 AS `id_comm`,
 1 AS `comment_to`,
 1 AS `comment_text`,
 1 AS `like_resive`,
 1 AS `like_from`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `request_two`
--

DROP TABLE IF EXISTS `request_two`;
/*!50001 DROP VIEW IF EXISTS `request_two`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `request_two` AS SELECT 
 1 AS `id_user`,
 1 AS `user_name`,
 1 AS `group_to_user`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_db`
--

DROP TABLE IF EXISTS `user_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_db` (
  `id_user` varchar(15) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_db`
--

LOCK TABLES `user_db` WRITE;
/*!40000 ALTER TABLE `user_db` DISABLE KEYS */;
INSERT INTO `user_db` VALUES ('id1','Georgi'),('id2','Bezalel'),('id3','Parto'),('id4','Chirstian'),('id5','Anneke');
/*!40000 ALTER TABLE `user_db` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_db_BEFORE_INSERT` BEFORE INSERT ON `user_db` FOR EACH ROW BEGIN
SET NEW.id_user = CONCAT('id', ((SELECT COUNT(*) FROM user_db) + 1));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `request_one`
--

/*!50001 DROP VIEW IF EXISTS `request_one`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `request_one` AS select `user_db`.`id_user` AS `id_user`,`user_db`.`user_name` AS `user_name`,(select count(0) from `like_user` where (`like_user`.`to_user` = `user_db`.`id_user`) group by `user_db`.`id_user`) AS `like_resive`,(select count(0) from `like_user` where (`like_user`.`from_user` = `user_db`.`id_user`) group by `user_db`.`id_user`) AS `like_send`,(select group_concat(`like_user`.`from_user` separator ', ') from `like_user` where (`like_user`.`to_user` = `user_db`.`id_user`)) AS `like_from` from `user_db` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `request_three_p1`
--

/*!50001 DROP VIEW IF EXISTS `request_three_p1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `request_three_p1` AS select `photograf_db`.`id_photo` AS `id_photo`,`photograf_db`.`photo_name` AS `photo_name`,(select count(0) from `like_photo` where (`like_photo`.`ph_for` = `photograf_db`.`id_photo`) group by `photograf_db`.`id_photo`) AS `like_resive`,(select group_concat(`like_photo`.`from_user` separator ',') from `like_photo` where (`like_photo`.`ph_for` = `photograf_db`.`id_photo`)) AS `like_from` from `photograf_db` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `request_three_p2`
--

/*!50001 DROP VIEW IF EXISTS `request_three_p2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `request_three_p2` AS select `comment_db`.`id_comm` AS `id_comm`,`comment_db`.`comment_to` AS `comment_to`,`comment_db`.`comment_text` AS `comment_text`,(select count(0) from `like_comm` where (`like_comm`.`for_comm` = `comment_db`.`id_comm`) group by `comment_db`.`id_comm`) AS `like_resive`,(select group_concat(`like_comm`.`from_user` separator ',') from `like_comm` where (`like_comm`.`for_comm` = `comment_db`.`id_comm`)) AS `like_from` from `comment_db` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `request_two`
--

/*!50001 DROP VIEW IF EXISTS `request_two`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `request_two` AS select `user_db`.`id_user` AS `id_user`,`user_db`.`user_name` AS `user_name`,(select group_concat(`like_user`.`to_user` separator ',') from `like_user` where (`like_user`.`from_user` = `user_db`.`id_user`)) AS `group_to_user` from `user_db` having (((`group_to_user` like '%1%') or (`group_to_user` like '%2%')) and (not((`group_to_user` like '%3%')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 15:30:19
