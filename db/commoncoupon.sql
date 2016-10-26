-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: commoncoupon
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

CREATE DATABASE IF NOT EXISTS commoncoupon;

USE commoncoupon;

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
INSERT INTO `user_roles` VALUES (2,'ROLE_USER',2);
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
  `version` bigint(20) NOT NULL DEFAULT 0,
  `first_name` varchar(255) ,
  `last_name` varchar(255) ,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `account_locked` tinyint(1) NOT NULL DEFAULT '0',
  `account_expired` tinyint(1) NOT NULL DEFAULT '0',
  `credentials_expired` tinyint(1) NOT NULL DEFAULT '0',
   amount bigint(100) default 0,
  `mobile_number` bigint(20),
  `type` varchar(31) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'admin','admin','admin@admin.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,'9573027720','ADMIN');
INSERT INTO `users` VALUES (2,0,'user','user','user@user.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,'9573027720','User');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `payment_request_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_request_response` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `payment_request_id` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sender_email` varchar(100) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `send_sms` varchar(255) DEFAULT NULL,
  `send_email` varchar(255) DEFAULT NULL,
  `sms_status` varchar(255) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `short_url` varchar(255) DEFAULT NULL,
  `long_url` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `webhook` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `modified_at` varchar(255) DEFAULT NULL,
  `allow_repeated_payments` tinyint(1) NOT NULL DEFAULT '0',
  `is_success` varchar(25) NOT NULL DEFAULT '0',
  created_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_paymentId` (`payment_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `payment_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_user_mapping` (
  `sender_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
   list_index int(10)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `user_coupon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupon_mapping` (
  `user_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
   list_index int(10)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `coupon_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_request_id` varchar(255) DEFAULT NULL,
  `is_redeemed` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemed_by` bigint(20) DEFAULT NULL,
  `redeemed_at` datetime DEFAULT NULL,
  `is_dispatched` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_couponId` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `amount` bigint(20),
  buyer_phone varchar(255),
  currency varchar(255),
  fees varchar(255),
  payment_id varchar(255),
  status varchar(255),
  transaction_create_time  varchar(255),
  payment_request_id varchar(255) NOT NULL,
  is_success varchar(50),
  `created_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  buyer_id bigint(20),
  coupon_id varchar(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_paymentId` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `coupons_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons_catalogue` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_b_url` text,
  `image_m_url` text,
  `image_s_url` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-10 17:02:30
