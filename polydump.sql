-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: poly
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `code` varchar(250) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `intake` bigint(20) NOT NULL DEFAULT '0',
  `display_order` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_styles`
--

DROP TABLE IF EXISTS `custom_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_styles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `display_color` varchar(50) NOT NULL,
  `home_page_box` varchar(50) NOT NULL,
  `home_page_box_border` varchar(50) NOT NULL,
  `title_color` varchar(50) NOT NULL,
  `body_light` varchar(50) NOT NULL,
  `body_dark` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_styles`
--

LOCK TABLES `custom_styles` WRITE;
/*!40000 ALTER TABLE `custom_styles` DISABLE KEYS */;
INSERT INTO `custom_styles` VALUES (1,0,'#299a0b','#eff8da','#dcecce','#def2b4','#c3deac','#E5F5C3'),(2,0,'#3f4c6b','#f6f6f6','#cfd3d3','#e4e6e6','#e6e8e8','#eef0f0'),(3,0,'#4096ee','#F3F7FA','#D7E3F7','#D1EDFF','#BBD6E7','#F2F6FC');
/*!40000 ALTER TABLE `custom_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `display_order` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'ECE',1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `tab` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_key` (`tab`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (1,0,'ADMINISTRATION','- Page Under Construction -'),(2,0,'CITIZEN_CHARTER','- Page Under Construction -'),(3,0,'CONTACT_US','- Page Under Construction -'),(4,0,'STAFF_DETAILS','- Page Under Construction -'),(5,2,'INFRASTRUCTURE','<p><strong>National Institute of Technology, Warangal is a federally funded technical institute in India. It is located on either side of Hyderabad - Warangal highway at a distance of 5 km from kazipet Railway Station and 12 km from Warangal Railway Station.</strong></p>'),(6,0,'HOSTEL','- Page Under Construction -');
/*!40000 ALTER TABLE `descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_configs`
--

DROP TABLE IF EXISTS `home_page_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_page_configs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `about_college` text,
  `mission` text,
  `vision` text,
  `header_text` varchar(255) NOT NULL DEFAULT 'Government Polytechnic',
  `header_city` varchar(50) DEFAULT NULL,
  `logo_name` varchar(2056) DEFAULT NULL,
  `principal_image_name` varchar(2056) DEFAULT NULL,
  `principal_name` varchar(50) NOT NULL DEFAULT 'Principal Name',
  `principal_qualification` varchar(50) NOT NULL DEFAULT 'Qualification',
  `custom_style_id` bigint(20) NOT NULL DEFAULT '3',
  `show_image_slider` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_configs`
--

LOCK TABLES `home_page_configs` WRITE;
/*!40000 ALTER TABLE `home_page_configs` DISABLE KEYS */;
INSERT INTO `home_page_configs` VALUES (1,1,'National Institute of Technology, Warangal is a federally funded technical institute in India. It is located on either side of Hyderabad - Warangal highway at a distance of 5 km from kazipet Railway Station and 12 km from Warangal Railway Station.','National Institute of Technology, Warangal is a federally funded technical institute in India. It is located on either side of Hyderabad - Warangal highway at a distance of 5 km from kazipet Railway Station and 12 km from Warangal Railway Station.','National Institute of Technology, Warangal is a federally funded technical institute in India. It is located on either side of Hyderabad - Warangal highway at a distance of 5 km from kazipet Railway Station and 12 km from Warangal Railway Station.','Government Polytechnic Warangal','warangal',NULL,NULL,'Nageshwar Rao','Ph.d',1,1);
/*!40000 ALTER TABLE `home_page_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_board_links`
--

DROP TABLE IF EXISTS `notice_board_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_board_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `display_text` varchar(250) NOT NULL,
  `hyperlink` varchar(250) DEFAULT NULL,
  `new_flag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_board_links`
--

LOCK TABLES `notice_board_links` WRITE;
/*!40000 ALTER TABLE `notice_board_links` DISABLE KEYS */;
INSERT INTO `notice_board_links` VALUES (1,3,'Exams','http://www.dte.telangana.gov.in',1);
/*!40000 ALTER TABLE `notice_board_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_related_links`
--

DROP TABLE IF EXISTS `other_related_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_related_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `display_text` varchar(250) NOT NULL,
  `hyperlink` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_key` (`hyperlink`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_related_links`
--

LOCK TABLES `other_related_links` WRITE;
/*!40000 ALTER TABLE `other_related_links` DISABLE KEYS */;
INSERT INTO `other_related_links` VALUES (1,0,'Test display name','http://www.google.com');
/*!40000 ALTER TABLE `other_related_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `display_name` text,
  `file_name` varchar(2056) DEFAULT NULL,
  `tab` varchar(256) NOT NULL,
  `description` text,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `qualification` varchar(250) DEFAULT NULL,
  `phone_number` varchar(250) DEFAULT NULL,
  `subjects` text,
  `photo_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_details`
--

LOCK TABLES `staff_details` WRITE;
/*!40000 ALTER TABLE `staff_details` DISABLE KEYS */;
INSERT INTO `staff_details` VALUES (1,0,'SURYAPRAKASH RAO',1,'SR LECTURER','M.TECH','','',NULL);
/*!40000 ALTER TABLE `staff_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC16F46AB5DA4D87` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ROLE_ADMIN',1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `account_locked` tinyint(1) NOT NULL DEFAULT '0',
  `account_expired` tinyint(1) NOT NULL DEFAULT '0',
  `credentials_expired` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(31) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,'ADMIN');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-05  0:35:32
