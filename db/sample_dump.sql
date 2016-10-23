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

--
-- Table structure for table `coupon`
--

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
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemed_by` bigint(20) DEFAULT NULL,
  `redeemed_at` datetime DEFAULT NULL,
  `is_dispatched` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_couponId` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (2,'commoncoupon',26,'605809096523776','change.me',0,3,3,10,NULL,'NOT_INITIATED','76a306f90d454ea08024dc0d77219e5e',1,'2016-01-20 18:00:40','2016-01-12 16:02:09','2017-01-26 10:37:27',2,'2017-03-15 08:24:30',0),(3,'commoncoupon',2,'1617468577546240','3g8a1kc6nimo8vli',0,3,3,10,NULL,'NOT_INITIATED','8fdd18b5fcb44358a1b21f8ceae14a58',1,'2017-01-23 06:27:55','2016-01-23 06:27:55','2017-01-26 10:37:27',2,'2017-03-15 08:45:59',0),(4,'commoncoupon',19,'6918671549071360','9j5renaqaqi9via6',0,3,3,10,NULL,'SUCCESS','ac8fcb768e7444f39ab75ec7ee8da062',0,'2016-01-26 06:29:46','2016-01-25 19:48:35','2017-01-26 10:37:27',NULL,NULL,0),(5,'commoncoupon',0,'1838095276179456','3ti5ilgdl2g0ajba',0,3,3,10,NULL,'NOT_INITIATED','c943c994772e4963abb00da16f48843e',0,'2017-01-26 10:22:32','2016-01-26 10:22:32','2017-01-26 10:37:27',NULL,NULL,0),(6,'commoncoupon',0,'6431984108699648','e2v9a8ohn95vnu5b',0,4,3,10,NULL,'NOT_INITIATED','b130065fc0bf491ab0e660aea1f265be',0,'2016-01-26 10:37:27','2016-01-26 10:37:27','2017-01-26 10:37:27',NULL,NULL,0),(7,'commoncoupon',2,'966544741892096','riga0unal2evmdlh',0,3,3,10,NULL,'NOT_INITIATED','2611c78ce9164cc68f6117a45b77ab04',1,'2016-03-15 03:32:46','2016-03-15 03:32:46','2017-03-15 03:32:46',2,'2017-03-15 09:08:07',0),(8,'commoncoupon',2,'6143938905767936','6kfm68ls1j7obea0',0,3,3,10,NULL,'NOT_INITIATED','75258bcde6ef4b80a647da436c6df7a5',1,'2016-03-15 04:09:10','2016-03-15 04:09:10','2017-03-15 04:09:10',2,'2017-03-15 09:41:22',0),(9,'commoncoupon',0,'5620816720953344','7j7usiaik12cmgof',0,3,5,10,NULL,'NOT_INITIATED','34f48903a00647e698da6f37122e5927',0,'2016-03-27 13:18:37','2016-03-27 13:18:37','2017-03-27 13:18:37',NULL,NULL,0),(10,'commoncoupon',0,'356126541479936','j3ajvidjehmvq2b7',0,3,3,10,NULL,'NOT_INITIATED','ee057a3b9a7344c29b3ed3f24f8d58e2',0,'2016-04-03 16:28:34','2016-04-03 16:28:34','2017-04-03 16:28:34',NULL,NULL,0),(11,'commoncoupon',0,'7933337171656704','99i8s1p6afkj4rqo',0,3,3,10,NULL,'NOT_INITIATED','0335a1affe9549fe8c120d5b360a3fce',0,'2016-04-03 16:30:04','2016-04-03 16:30:04','2017-04-03 16:30:04',NULL,NULL,0),(12,'commoncoupon',0,'8529809881694208','2td9dh9rb55fubsg',0,3,3,10,NULL,'NOT_INITIATED','233d972634e646b1b922d9f859b77bc4',0,'2016-04-03 16:39:39','2016-04-03 16:39:39','2017-04-03 16:38:00',NULL,NULL,0),(13,'commoncoupon',0,'6520708469358592','mi2p5352eo7vn22r',0,3,3,10,NULL,'NOT_INITIATED','07ff6d90682149e5962c51779a578c0f',0,'2016-04-03 16:40:22','2016-04-03 16:40:22','2017-04-03 16:40:22',NULL,NULL,0),(14,'commoncoupon',0,'2856421687296000','3bm4rkm7omrn6qh0',0,13,3,4000,NULL,'NOT_INITIATED','27a052e44d9a4dedb79c740d442e8a4b',0,'2016-04-03 16:45:38','2016-04-03 16:45:38','2017-04-03 16:45:38',NULL,NULL,0),(15,'commoncoupon',0,'6946254365917184','2msvgf9jdrhja4r5',0,3,3,10,NULL,'NOT_INITIATED','52c00e4f86374619b78ff5b89aa1cfee',0,'2016-04-03 16:52:30','2016-04-03 16:52:30','2017-04-03 16:52:30',NULL,NULL,0),(16,'commoncoupon',0,'5298217432383488','n0kqnqt1cc2shn2n',0,3,3,10,NULL,'NOT_INITIATED','55c93be3e45e45478a0121241aed4b3b',0,'2016-04-03 17:08:53','2016-04-03 17:08:53','2017-04-03 17:08:53',NULL,NULL,0),(17,'commoncoupon',1,'2483908973166592','vool21tev6vho7oa',0,3,3,10,NULL,'SUCCESS','0a67e48c3faf4ea0badaabe3f3ebf9b3',0,'2016-04-03 17:22:35','2016-04-03 17:22:35','2017-04-03 17:22:35',NULL,NULL,0),(18,'commoncoupon',0,'2546191904538624','h3pi3ag1oli6iuvq',0,15,14,1000,NULL,'NOT_INITIATED','f743804b88954a76a6001dbf3c1244db',0,'2016-04-03 17:39:08','2016-04-03 17:39:08','2017-04-03 17:39:08',NULL,NULL,0),(19,'commoncoupon',0,'1689967625502720','bmlbv1noc4k92i68',0,16,3,10,NULL,'NOT_INITIATED','6df59267203c46b496d2dda4b65f4adb',0,'2016-04-03 18:19:17','2016-04-03 18:19:17','2017-04-03 18:19:16',NULL,NULL,0),(20,'commoncoupon',0,'2048141188661248','dukl0dldn1gk023u',0,17,3,10,NULL,'NOT_INITIATED','5ea3c9351cd6454b873ea2c40a34daf0',0,'2016-04-03 18:23:35','2016-04-03 18:23:35','2017-04-03 18:23:35',NULL,NULL,0),(21,'commoncoupon',0,'6319237995954176','ur4fpdo1c2000vg7',0,3,3,10,NULL,'NOT_INITIATED','3c12b30c6edf4dabbb50a81ee800851e',0,'2016-04-24 13:47:01','2016-04-24 13:47:01','2017-04-24 13:47:01',NULL,NULL,0),(22,'commoncoupon',0,'7477032329936896','1ros24atuqt1o523',0,3,3,10,NULL,'NOT_INITIATED','e7f01a3a1a944179bfbb167a6535bfea',0,'2016-04-24 13:54:45','2016-04-24 13:54:45','2017-04-24 13:54:45',NULL,NULL,0),(23,'commoncoupon',1,'5557227045781504','f915uc7ascv07139',0,3,3,10,NULL,'SUCCESS','fe8e7a37dfb44d4f97238ec76f452b3b',0,'2016-04-24 14:00:07','2016-04-24 14:00:07','2017-04-24 14:00:07',NULL,NULL,0),(24,'commoncoupon',0,'6201702457802752','bupft1998bb4afsg',0,3,3,10,NULL,'NOT_INITIATED','186c48eaa0204d7ca9a66f12c6684245',0,'2016-04-29 03:06:19','2016-04-29 03:06:19','2017-04-29 03:06:19',NULL,NULL,0),(25,'commoncoupon',1,'1953835249565696','quq6kjvp6k1kv5o3',0,3,3,10,NULL,'SUCCESS','c69e12ef722b4ad2b24324077eabf839',0,'2016-04-29 03:11:09','2016-04-29 03:11:09','2017-04-29 03:11:09',NULL,NULL,0),(26,'othercoupon',0,NULL,NULL,0,2,2,100,'FLIPKART',NULL,NULL,NULL,'2016-05-01 09:33:58','2016-05-01 09:33:58','0000-00-00 00:00:00',NULL,NULL,0),(27,'othercoupon',0,NULL,NULL,0,2,2,0,'AMAZON',NULL,NULL,NULL,'2016-05-01 09:34:01','2016-05-01 09:34:01','0000-00-00 00:00:00',NULL,NULL,0),(28,'othercoupon',0,NULL,NULL,0,2,2,200,'MYNTRA',NULL,NULL,NULL,'2016-05-01 09:34:03','2016-05-01 09:34:03','0000-00-00 00:00:00',NULL,NULL,0),(29,'othercoupon',0,NULL,NULL,0,2,2,0,'SHOPCLUES',NULL,NULL,NULL,'2016-05-01 09:34:06','2016-05-01 09:34:06','0000-00-00 00:00:00',NULL,NULL,0),(30,'othercoupon',0,NULL,NULL,0,2,2,200,'FLIPKART',NULL,NULL,NULL,'2016-05-01 09:38:38','2016-05-01 09:38:38','0000-00-00 00:00:00',NULL,NULL,0),(31,'othercoupon',0,NULL,NULL,0,2,2,100,'AMAZON',NULL,NULL,NULL,'2016-05-01 09:38:40','2016-05-01 09:38:40','0000-00-00 00:00:00',NULL,NULL,0),(32,'commoncoupon',0,'2454619712126976','ui0i7j31hmtku8mg',0,3,3,10,NULL,'NOT_INITIATED','acb8fc19dba54e25bc9212d96f74575e',0,'2016-05-01 10:05:21','2016-05-01 10:05:21','2017-05-01 10:05:21',NULL,NULL,0),(33,'commoncoupon',0,'226419200229376','5qsk8p2efqlmd6np',0,3,3,10,NULL,'NOT_INITIATED','3cdb79913cd94b5eafa7230688860a51',0,'2016-05-01 10:08:00','2016-05-01 10:08:00','2017-05-01 10:08:00',NULL,NULL,0),(34,'commoncoupon',3,'6818300310847488','k2jc44lumvv356g8',0,3,3,10,NULL,'SUCCESS','9fdf3d80f4a3418f9d8a5450c92893f5',1,'2016-05-01 10:11:06','2016-05-01 10:11:06','2017-05-01 10:11:06',2,'2017-05-01 15:43:33',0),(35,'commoncoupon',0,'1718309980471296','c4cv7ikl3rtj0g7l',0,3,3,25,NULL,'NOT_INITIATED','da117d6eb78d405891f9105ae022a8f2',0,'2016-05-01 10:27:05','2016-05-01 10:27:05','2017-05-01 10:27:05',NULL,NULL,0),(36,'commoncoupon',0,'1685224907866112','h1jdv99644i2c6d3',0,3,3,10,NULL,'NOT_INITIATED','6b9c08006ebb402e95e3465eddb52f07',0,'2016-05-01 11:24:26','2016-05-01 11:24:26','2017-05-01 11:24:26',NULL,NULL,0),(37,'commoncoupon',0,'8095957518385152','df5toot8k9ik8jq2',0,3,3,10,NULL,'NOT_INITIATED','f88ddc107df6495895f8436adec2acb2',0,'2016-05-01 11:33:06','2016-05-01 11:33:06','2017-05-01 11:33:06',NULL,NULL,0),(38,'commoncoupon',0,'4421014117154816','8i2ibri22drms6op',0,3,3,10,NULL,'NOT_INITIATED','2483a0bc0b084222acadf8c5e3ffca02',0,'2016-05-01 12:51:21','2016-05-01 12:51:21','2017-05-01 12:51:21',NULL,NULL,0),(39,'commoncoupon',0,'6459279699607552','9n4ba3e6qk65j6a4',0,3,3,10,NULL,'NOT_INITIATED','4fe4ca95e7b64394ad48c9a751ca9d20',0,'2016-05-01 12:52:18','2016-05-01 12:52:18','2017-05-01 12:52:18',NULL,NULL,0),(40,'commoncoupon',0,'2860817317888000','3ibksqnttvb469b0',0,3,3,10,NULL,'NOT_INITIATED','61dd0810c9a344db89cdf4027daa53fa',0,'2016-05-01 12:54:07','2016-05-01 12:54:07','2017-05-01 12:54:07',NULL,NULL,0),(41,'commoncoupon',0,'8159811870916608','rtb5nckh37e9q1d2',0,3,3,10,NULL,'NOT_INITIATED','ae8c6daff9aa4295bfa8ce1412448c19',0,'2016-05-01 12:55:15','2016-05-01 12:55:15','2017-05-01 12:55:15',NULL,NULL,0),(42,'commoncoupon',0,'1812557937508352','bbkikdso6ardsb7h',0,3,3,10,NULL,'NOT_INITIATED','4fb40572aab945de87e3de2d707e2a01',0,'2016-05-01 12:56:54','2016-05-01 12:56:54','2017-05-01 12:56:54',NULL,NULL,0),(43,'commoncoupon',0,'5324753887821824','g50c011uqkf5kjjk',0,3,3,10,NULL,'NOT_INITIATED','f13f9f6c24d74901a1a8f902c059e9c6',0,'2016-05-01 12:58:11','2016-05-01 12:58:11','2017-05-01 12:58:11',NULL,NULL,0),(44,'commoncoupon',0,'7319678149984256','r5ano4f4r6g9l81n',0,3,3,10,NULL,'NOT_INITIATED','47351c1a350a409db2acc39cdcd0b527',0,'2016-05-01 12:58:59','2016-05-01 12:58:59','2017-05-01 12:58:59',NULL,NULL,0),(45,'commoncoupon',0,'8247940304863232','qeof3bt07o3eph2e',0,3,3,10,NULL,'NOT_INITIATED','75753dc9f9554f3796c604fc56392c71',0,'2016-05-01 13:00:08','2016-05-01 13:00:08','2017-05-01 13:00:08',NULL,NULL,0),(46,'commoncoupon',0,'626498021097472','3m6tobpu112n4fhc',0,3,3,10,NULL,'NOT_INITIATED','df3602a8d5e74d12b95967818ae61190',0,'2016-05-01 13:01:02','2016-05-01 13:01:02','2017-05-01 13:01:02',NULL,NULL,0),(47,'commoncoupon',0,'8688032181911552','94lmnju62r57m700',0,3,3,10,NULL,'NOT_INITIATED','7c7416b8dc2d4f708ed7ec7c3113881c',0,'2016-05-01 13:03:42','2016-05-01 13:03:42','2017-05-01 13:03:42',NULL,NULL,0),(48,'commoncoupon',0,'3642414661107712','as76tq275ellbrr6',0,3,3,10,NULL,'NOT_INITIATED','ed620125c0344e84804120f6f3158d9f',0,'2016-05-01 13:05:38','2016-05-01 13:05:38','2017-05-01 13:05:38',NULL,NULL,0),(49,'commoncoupon',0,'8927246827913216','ugg96p4rmh2vgk5r',0,3,3,10,NULL,'NOT_INITIATED','018b300207c64852ba39376c6417231b',0,'2016-05-01 13:06:13','2016-05-01 13:06:13','2017-05-01 13:06:13',NULL,NULL,0),(50,'commoncoupon',0,'6746763335565312','a9i5kh013pgtpa1e',0,3,3,10,NULL,'NOT_INITIATED','4132340c94bf4eb2bde6024dd3009a08',0,'2016-05-01 13:36:47','2016-05-01 13:36:47','2017-05-01 13:36:47',NULL,NULL,0),(51,'commoncoupon',0,'7304477723852800','h0vj43jkk0oln38c',0,3,3,10,NULL,'NOT_INITIATED','d1a5124026da4c3cbe96a0b761f280f8',0,'2016-05-01 13:40:30','2016-05-01 13:40:30','2017-05-01 13:40:30',NULL,NULL,0),(52,'commoncoupon',0,'1930348757778432','7leje1ot2e74hkn9',0,3,3,10,NULL,'NOT_INITIATED','03fc1bae0e86447eb4c3f9784d4f544c',0,'2016-05-01 13:45:03','2016-05-01 13:45:03','2017-05-01 13:45:03',NULL,NULL,0),(53,'othercoupon',0,NULL,NULL,0,2,2,100,'AMAZON',NULL,NULL,NULL,'2016-05-01 15:50:40','2016-05-01 15:50:40','0000-00-00 00:00:00',NULL,NULL,0),(54,'commoncoupon',0,'3526145064566784','cl6ucgflmkle6kov',0,3,3,10,NULL,'NOT_INITIATED','3c9670166af0420da108a6f835fcc93d',0,'2016-05-07 15:58:38','2016-05-07 15:58:38','2017-05-07 15:58:38',NULL,NULL,0),(55,'commoncoupon',0,'6384924688908288','qtu9l97adr93s2ft',0,3,3,10,NULL,'NOT_INITIATED','7ed2c779eca942cb8ae3333a1d53c125',0,'2016-06-10 05:04:59','2016-06-10 05:04:59','2017-06-10 05:04:59',NULL,NULL,0),(56,'commoncoupon',0,'4140186875199488','srj3sdgttkgsqdvc',0,20,19,9000,NULL,'NOT_INITIATED','d0e851592168415a8bfa3898cdf6b3a5',0,'2016-06-10 05:24:51','2016-06-10 05:24:51','2017-06-10 05:24:51',NULL,NULL,0),(57,'commoncoupon',1,'3072111455240192','biukgnj8fi8b28rr',0,20,19,9000,NULL,'SUCCESS','01dbb161f51342eeb87486020a23ced8',0,'2016-06-10 05:29:51','2016-06-10 05:29:51','2017-06-10 05:29:51',NULL,NULL,0),(58,'commoncoupon',0,'3581667448979456','1pp0470hhnrt6cnb',0,20,19,6000,NULL,'NOT_INITIATED','634f17cea8ee45578dcb54cfd842cf4d',0,'2016-06-10 05:34:53','2016-06-10 05:34:53','2017-06-10 05:34:53',NULL,NULL,0),(59,'commoncoupon',0,'791926471131136','3i81p1gdkooj2dpe',0,20,19,6000,NULL,'NOT_INITIATED','d6d303bd0f01462e9e81596f0cb214fd',0,'2016-06-10 05:37:54','2016-06-10 05:37:54','2017-06-10 05:37:54',NULL,NULL,0),(60,'commoncoupon',1,'7794779379204096','har01vsng1n819ok',0,20,19,6000,NULL,'SUCCESS','a53e7bc0d0b94f97aacd56e99cf99c78',0,'2016-06-10 05:42:14','2016-06-10 05:42:14','2017-06-10 05:42:14',NULL,NULL,0),(61,'commoncoupon',0,'4225486536310784','jkmbj8kr4alt69fj',0,3,3,100,NULL,'NOT_INITIATED','5cf52289817b4c85b3c1a12065af27d7',0,'2016-07-30 15:48:26','2016-07-30 15:48:26','2017-07-30 15:48:26',NULL,NULL,0),(62,'commoncoupon',0,'6089654277242880','8v1appn79e4qv9vs',0,3,3,10,NULL,'NOT_INITIATED','c809dff1f63f4ade8cf9f9463a2bae51',0,'2016-10-21 01:59:12','2016-10-21 01:59:12','2017-10-21 01:59:12',NULL,NULL,0),(63,'commoncoupon',0,'3545305182109696','3v68c6kuaf52hm34',0,3,3,10,NULL,'NOT_INITIATED','7ac57e88e9c1425fbf487f96d3cfe848',0,'2016-10-22 06:57:04','2016-10-22 06:57:04','2017-10-22 06:57:04',NULL,NULL,0);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons_catalogue`
--

DROP TABLE IF EXISTS `coupons_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons_catalogue` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `image_b_url` text,
  `image_m_url` text,
  `image_s_url` text,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons_catalogue`
--

LOCK TABLES `coupons_catalogue` WRITE;
/*!40000 ALTER TABLE `coupons_catalogue` DISABLE KEYS */;
INSERT INTO `coupons_catalogue` VALUES (1,0,'FLIPKART','http://1.bp.blogspot.com/-_yEt_txzm5s/VKv2cHM8d6I/AAAAAAAAAg8/J4Jhm8DeAkI/s1600/url.jpg','http://1.bp.blogspot.com/-_yEt_txzm5s/VKv2cHM8d6I/AAAAAAAAAg8/J4Jhm8DeAkI/s1600/url.jpg','http://1.bp.blogspot.com/-_yEt_txzm5s/VKv2cHM8d6I/AAAAAAAAAg8/J4Jhm8DeAkI/s1600/url.jpg',NULL),(2,0,'AMAZON','http://www.hmlglaw.com/uploads/images/amazon-icon.png','http://www.hmlglaw.com/uploads/images/amazon-icon.png','http://www.hmlglaw.com/uploads/images/amazon-icon.png',NULL),(3,0,'MYNTRA','https://pbs.twimg.com/profile_images/579899136339652608/OOJiqQPu.png','https://pbs.twimg.com/profile_images/579899136339652608/OOJiqQPu.png','https://pbs.twimg.com/profile_images/579899136339652608/OOJiqQPu.png',NULL),(4,0,'SHOPCLUES','http://www.iamwire.com/wp-content/uploads/2011/12/Shopclues1.jpg','http://www.iamwire.com/wp-content/uploads/2011/12/Shopclues1.jpg','http://www.iamwire.com/wp-content/uploads/2011/12/Shopclues1.jpg',NULL);
/*!40000 ALTER TABLE `coupons_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_request_response`
--

DROP TABLE IF EXISTS `payment_request_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_request_response` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_paymentId` (`payment_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_request_response`
--

LOCK TABLES `payment_request_response` WRITE;
/*!40000 ALTER TABLE `payment_request_response` DISABLE KEYS */;
INSERT INTO `payment_request_response` VALUES (2,0,'76a306f90d454ea08024dc0d77219e5e','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/76a306f90d454ea08024dc0d77219e5e','http://www.google.com',NULL,'2016-01-12T16:02:15.999Z','2016-01-12T16:02:15.999Z',0,'true','2016-01-12 16:02:09'),(3,0,'8fdd18b5fcb44358a1b21f8ceae14a58','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/8fdd18b5fcb44358a1b21f8ceae14a58','http://www.google.com',NULL,'2016-01-23T06:27:59.177Z','2016-01-23T06:27:59.177Z',0,'true','2016-01-23 06:27:55'),(4,0,'ac8fcb768e7444f39ab75ec7ee8da062','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/ac8fcb768e7444f39ab75ec7ee8da062','http://www.google.com',NULL,'2016-01-25T19:48:43.352Z','2016-01-25T19:48:43.358Z',0,'true','2016-01-25 19:48:35'),(5,0,'c943c994772e4963abb00da16f48843e','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/c943c994772e4963abb00da16f48843e','http://www.google.com',NULL,'2016-01-26T10:22:41.428Z','2016-01-26T10:22:41.428Z',0,'true','2016-01-26 10:22:32'),(6,0,'f5820ca5ada343e6904804347d0b2eb1','+919573072270','volamsaraswathi@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/f5820ca5ada343e6904804347d0b2eb1','http://www.google.com',NULL,'2016-01-26T10:35:09.378Z','2016-01-26T10:35:09.378Z',0,'true','2016-01-26 10:35:01'),(7,0,'b130065fc0bf491ab0e660aea1f265be','+919581235772','volamsaraswathi@gmail.com','saraswathivolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/b130065fc0bf491ab0e660aea1f265be','http://www.google.com',NULL,'2016-01-26T10:37:36.433Z','2016-01-26T10:37:36.433Z',0,'true','2016-01-26 10:37:27'),(8,0,'2611c78ce9164cc68f6117a45b77ab04','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/2611c78ce9164cc68f6117a45b77ab04','http://www.google.com',NULL,'2016-03-15T03:33:10.352Z','2016-03-15T03:33:10.352Z',0,'true','2016-03-15 03:32:46'),(9,0,'75258bcde6ef4b80a647da436c6df7a5','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/75258bcde6ef4b80a647da436c6df7a5','http://www.google.com',NULL,'2016-03-15T04:09:33.579Z','2016-03-15T04:09:33.579Z',0,'true','2016-03-15 04:09:09'),(10,0,'34f48903a00647e698da6f37122e5927','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/34f48903a00647e698da6f37122e5927','http://www.google.com',NULL,'2016-03-27T13:19:19.179Z','2016-03-27T13:19:19.179Z',0,'true','2016-03-27 13:18:37'),(11,0,'ee057a3b9a7344c29b3ed3f24f8d58e2','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/ee057a3b9a7344c29b3ed3f24f8d58e2','http://www.google.com',NULL,'2016-04-03T16:29:27.791Z','2016-04-03T16:29:27.791Z',0,'true','2016-04-03 16:28:34'),(12,0,'0335a1affe9549fe8c120d5b360a3fce','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/0335a1affe9549fe8c120d5b360a3fce','http://www.google.com',NULL,'2016-04-03T16:30:57.244Z','2016-04-03T16:30:57.244Z',0,'true','2016-04-03 16:30:04'),(13,0,'233d972634e646b1b922d9f859b77bc4','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/233d972634e646b1b922d9f859b77bc4','http://www.google.com',NULL,'2016-04-03T16:38:14.927Z','2016-04-03T16:38:14.927Z',0,'true','2016-04-03 16:37:56'),(14,0,'07ff6d90682149e5962c51779a578c0f','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/07ff6d90682149e5962c51779a578c0f','http://www.google.com',NULL,'2016-04-03T16:41:15.217Z','2016-04-03T16:41:15.217Z',0,'true','2016-04-03 16:40:22'),(15,0,'27a052e44d9a4dedb79c740d442e8a4b','+919666163331','Varunponugoti.123@gmail.com','VarunP','4000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/27a052e44d9a4dedb79c740d442e8a4b','http://www.google.com',NULL,'2016-04-03T16:46:31.312Z','2016-04-03T16:46:31.312Z',0,'true','2016-04-03 16:45:38'),(16,0,'52c00e4f86374619b78ff5b89aa1cfee','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/52c00e4f86374619b78ff5b89aa1cfee','http://www.google.com',NULL,'2016-04-03T16:53:23.410Z','2016-04-03T16:53:23.410Z',0,'true','2016-04-03 16:52:30'),(17,0,'55c93be3e45e45478a0121241aed4b3b','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/55c93be3e45e45478a0121241aed4b3b','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-03T17:09:44.425Z','2016-04-03T17:09:44.425Z',0,'true','2016-04-03 17:08:53'),(18,0,'0a67e48c3faf4ea0badaabe3f3ebf9b3','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/0a67e48c3faf4ea0badaabe3f3ebf9b3','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-03T17:23:26.989Z','2016-04-03T17:23:26.989Z',0,'true','2016-04-03 17:22:35'),(19,0,'f743804b88954a76a6001dbf3c1244db','+919440580002','nishanthvolam@gmail.com','NISHANTHVOLAM','1000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/f743804b88954a76a6001dbf3c1244db','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-03T17:40:01.826Z','2016-04-03T17:40:01.826Z',0,'true','2016-04-03 17:39:08'),(20,0,'6df59267203c46b496d2dda4b65f4adb','+919573072270','testaas@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/6df59267203c46b496d2dda4b65f4adb','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-03T18:20:07.552Z','2016-04-03T18:20:07.552Z',0,'true','2016-04-03 18:19:16'),(21,0,'5ea3c9351cd6454b873ea2c40a34daf0','+919573072270','testaas1@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/5ea3c9351cd6454b873ea2c40a34daf0','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-03T18:24:23.227Z','2016-04-03T18:24:23.227Z',0,'true','2016-04-03 18:23:35'),(22,0,'3c12b30c6edf4dabbb50a81ee800851e','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/3c12b30c6edf4dabbb50a81ee800851e','http://103.206.115.61/saveTransactionDetails',NULL,'2016-04-24T13:48:24.899Z','2016-04-24T13:48:24.899Z',0,'true','2016-04-24 13:47:01'),(23,0,'e7f01a3a1a944179bfbb167a6535bfea','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/e7f01a3a1a944179bfbb167a6535bfea','http://103.206.115.42/saveTransactionDetails',NULL,'2016-04-24T13:56:08.819Z','2016-04-24T13:56:08.819Z',0,'true','2016-04-24 13:54:45'),(24,0,'fe8e7a37dfb44d4f97238ec76f452b3b','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/fe8e7a37dfb44d4f97238ec76f452b3b','http://103.206.115.42/saveTransactionDetails',NULL,'2016-04-24T14:01:31.354Z','2016-04-24T14:01:31.354Z',0,'true','2016-04-24 14:00:07'),(25,0,'186c48eaa0204d7ca9a66f12c6684245','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/186c48eaa0204d7ca9a66f12c6684245','http://103.206.115.49/saveTransactionDetails',NULL,'2016-04-29T03:07:48.907Z','2016-04-29T03:07:48.907Z',0,'true','2016-04-29 03:06:19'),(26,0,'c69e12ef722b4ad2b24324077eabf839','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/c69e12ef722b4ad2b24324077eabf839','http://103.206.115.49/saveTransactionDetails',NULL,'2016-04-29T03:12:39.009Z','2016-04-29T03:12:39.009Z',0,'true','2016-04-29 03:11:09'),(27,0,'acb8fc19dba54e25bc9212d96f74575e','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/acb8fc19dba54e25bc9212d96f74575e','http://103.206.115.49/saveTransactionDetails',NULL,'2016-05-01T10:06:54.510Z','2016-05-01T10:06:54.510Z',0,'true','2016-05-01 10:05:21'),(28,0,'3cdb79913cd94b5eafa7230688860a51','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/3cdb79913cd94b5eafa7230688860a51','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T10:09:33.595Z','2016-05-01T10:09:33.595Z',0,'true','2016-05-01 10:08:00'),(29,0,'9fdf3d80f4a3418f9d8a5450c92893f5','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/9fdf3d80f4a3418f9d8a5450c92893f5','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T10:12:39.555Z','2016-05-01T10:12:39.555Z',0,'true','2016-05-01 10:11:06'),(30,0,'da117d6eb78d405891f9105ae022a8f2','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','25','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/da117d6eb78d405891f9105ae022a8f2','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T10:28:38.254Z','2016-05-01T10:28:38.254Z',0,'true','2016-05-01 10:27:05'),(31,0,'6b9c08006ebb402e95e3465eddb52f07','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/6b9c08006ebb402e95e3465eddb52f07','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T11:25:58.410Z','2016-05-01T11:25:58.411Z',0,'true','2016-05-01 11:24:26'),(32,0,'f88ddc107df6495895f8436adec2acb2','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/f88ddc107df6495895f8436adec2acb2','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T11:34:37.883Z','2016-05-01T11:34:37.883Z',0,'true','2016-05-01 11:33:05'),(33,0,'2483a0bc0b084222acadf8c5e3ffca02','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/2483a0bc0b084222acadf8c5e3ffca02','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:52:54.623Z','2016-05-01T12:52:54.623Z',0,'true','2016-05-01 12:51:21'),(34,0,'4fe4ca95e7b64394ad48c9a751ca9d20','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/4fe4ca95e7b64394ad48c9a751ca9d20','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:53:51.937Z','2016-05-01T12:53:51.937Z',0,'true','2016-05-01 12:52:18'),(35,0,'61dd0810c9a344db89cdf4027daa53fa','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/61dd0810c9a344db89cdf4027daa53fa','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:55:41.001Z','2016-05-01T12:55:41.001Z',0,'true','2016-05-01 12:54:07'),(36,0,'ae8c6daff9aa4295bfa8ce1412448c19','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/ae8c6daff9aa4295bfa8ce1412448c19','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:56:47.419Z','2016-05-01T12:56:47.419Z',0,'true','2016-05-01 12:55:15'),(37,0,'4fb40572aab945de87e3de2d707e2a01','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/4fb40572aab945de87e3de2d707e2a01','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:58:28.081Z','2016-05-01T12:58:28.081Z',0,'true','2016-05-01 12:56:54'),(38,0,'f13f9f6c24d74901a1a8f902c059e9c6','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/f13f9f6c24d74901a1a8f902c059e9c6','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T12:59:45.074Z','2016-05-01T12:59:45.074Z',0,'true','2016-05-01 12:58:11'),(39,0,'47351c1a350a409db2acc39cdcd0b527','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/47351c1a350a409db2acc39cdcd0b527','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:00:32.661Z','2016-05-01T13:00:32.661Z',0,'true','2016-05-01 12:58:59'),(40,0,'75753dc9f9554f3796c604fc56392c71','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/75753dc9f9554f3796c604fc56392c71','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:01:41.184Z','2016-05-01T13:01:41.184Z',0,'true','2016-05-01 13:00:08'),(41,0,'df3602a8d5e74d12b95967818ae61190','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/df3602a8d5e74d12b95967818ae61190','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:02:35.563Z','2016-05-01T13:02:35.563Z',0,'true','2016-05-01 13:01:02'),(42,0,'7c7416b8dc2d4f708ed7ec7c3113881c','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/7c7416b8dc2d4f708ed7ec7c3113881c','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:05:14.848Z','2016-05-01T13:05:14.848Z',0,'true','2016-05-01 13:03:42'),(43,0,'ed620125c0344e84804120f6f3158d9f','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/ed620125c0344e84804120f6f3158d9f','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:07:11.126Z','2016-05-01T13:07:11.126Z',0,'true','2016-05-01 13:05:37'),(44,0,'018b300207c64852ba39376c6417231b','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/018b300207c64852ba39376c6417231b','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:07:46.538Z','2016-05-01T13:07:46.538Z',0,'true','2016-05-01 13:06:13'),(45,0,'4132340c94bf4eb2bde6024dd3009a08','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/4132340c94bf4eb2bde6024dd3009a08','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:38:20.104Z','2016-05-01T13:38:20.104Z',0,'true','2016-05-01 13:36:46'),(46,0,'d1a5124026da4c3cbe96a0b761f280f8','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/d1a5124026da4c3cbe96a0b761f280f8','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:42:03.945Z','2016-05-01T13:42:03.945Z',0,'true','2016-05-01 13:40:30'),(47,0,'03fc1bae0e86447eb4c3f9784d4f544c','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/03fc1bae0e86447eb4c3f9784d4f544c','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-01T13:46:36.382Z','2016-05-01T13:46:36.382Z',0,'true','2016-05-01 13:45:03'),(48,0,'3c9670166af0420da108a6f835fcc93d','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/3c9670166af0420da108a6f835fcc93d','http://103.206.115.84/saveTransactionDetails',NULL,'2016-05-07T16:00:20.027Z','2016-05-07T16:00:20.027Z',0,'true','2016-05-07 15:58:38'),(49,0,'7ed2c779eca942cb8ae3333a1d53c125','+919573072270','volamshabarinath@gmail.com','shabarinath volam','10','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/7ed2c779eca942cb8ae3333a1d53c125','http://103.206.115.84/saveTransactionDetails',NULL,'2016-06-10T05:07:30.530Z','2016-06-10T05:07:30.530Z',0,'true','2016-06-10 05:04:58'),(50,0,'d0e851592168415a8bfa3898cdf6b3a5','+919292309599','vadlakonda.ravikiran@gmail.com','ravikiran','9000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/d0e851592168415a8bfa3898cdf6b3a5','http://103.206.115.8/saveTransactionDetails',NULL,'2016-06-10T05:27:22.878Z','2016-06-10T05:27:22.878Z',0,'true','2016-06-10 05:24:51'),(51,0,'01dbb161f51342eeb87486020a23ced8','+919292309599','vadlakonda.ravikiran@gmail.com','ravikiran','9000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/01dbb161f51342eeb87486020a23ced8','http://103.206.115.8/saveTransactionDetails',NULL,'2016-06-10T05:32:22.906Z','2016-06-10T05:32:22.906Z',0,'true','2016-06-10 05:29:51'),(52,0,'634f17cea8ee45578dcb54cfd842cf4d','+919292309599','vadlakonda.ravikiran@gmail.com','Ravikiran','6000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/634f17cea8ee45578dcb54cfd842cf4d','http://103.206.115.8/saveTransactionDetails',NULL,'2016-06-10T05:37:25.383Z','2016-06-10T05:37:25.383Z',0,'true','2016-06-10 05:34:53'),(53,0,'d6d303bd0f01462e9e81596f0cb214fd','+919292309599','vadlakonda.ravikiran@gmail.com','ravikiran','6000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/d6d303bd0f01462e9e81596f0cb214fd','http://103.206.115.8/saveTransactionDetails',NULL,'2016-06-10T05:40:26.086Z','2016-06-10T05:40:26.086Z',0,'true','2016-06-10 05:37:54'),(54,0,'a53e7bc0d0b94f97aacd56e99cf99c78','+919292309599','vadlakonda.ravikiran@gmail.com','ravikiran','6000','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/a53e7bc0d0b94f97aacd56e99cf99c78','http://103.206.115.8/saveTransactionDetails',NULL,'2016-06-10T05:44:45.719Z','2016-06-10T05:44:45.719Z',0,'true','2016-06-10 05:42:14'),(55,0,'5cf52289817b4c85b3c1a12065af27d7','+919573072270','volamshabarinath@gmail.com','shabrinathvolam','100.00','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/5cf52289817b4c85b3c1a12065af27d7','http://103.206.115.8/saveTransactionDetails',NULL,'2016-07-30T15:52:10.422625Z','2016-07-30T15:52:10.422651Z',0,'true','2016-07-30 15:48:26'),(56,0,'c809dff1f63f4ade8cf9f9463a2bae51','+919573072270','volamshabarinath@gmail.com','shabarivolam','10.00','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/c809dff1f63f4ade8cf9f9463a2bae51','http://103.206.115.8/saveTransactionDetails',NULL,'2016-10-21T02:00:04.455394Z','2016-10-21T02:00:04.455418Z',0,'true','2016-10-21 01:59:11'),(57,0,'7ac57e88e9c1425fbf487f96d3cfe848','+919573072270','volamshabarinath@gmail.com','shabarinathvolam','10.00','Payment For Gift Card','Pending','false','false',NULL,NULL,NULL,'https://www.instamojo.com/@shabarinath/7ac57e88e9c1425fbf487f96d3cfe848','http://103.206.115.8/saveTransactionDetails',NULL,'2016-10-22T06:57:58.207960Z','2016-10-22T06:57:58.208004Z',0,'true','2016-10-22 06:57:04');
/*!40000 ALTER TABLE `payment_request_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_user_mapping`
--

DROP TABLE IF EXISTS `payment_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_user_mapping` (
  `sender_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
  `list_index` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_user_mapping`
--

LOCK TABLES `payment_user_mapping` WRITE;
/*!40000 ALTER TABLE `payment_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `amount` bigint(20) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `fees` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_create_time` varchar(255) DEFAULT NULL,
  `payment_request_id` varchar(255) NOT NULL,
  `is_success` varchar(50) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_paymentId` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,0,10,'volamshabarinath@gmail.com','shabarinathvolam','9573072270','INR','0.19','MOJO6125005J42409470','Credit','2016-01-25T19:48:57.377Z','ac8fcb768e7444f39ab75ec7ee8da062','1','2016-01-25 19:53:25'),(2,0,10,'volamshabarinath@gmail.com','shabarinathvolam','9573072270','INR','0.19','MOJO6403005J38261046','Credit','2016-04-03T17:23:56.761Z','0a67e48c3faf4ea0badaabe3f3ebf9b3','1','2016-04-03 17:24:21'),(3,0,10,'volamshabarinath@gmail.com','shabarinathvolam','9573072270','INR','0.19','MOJO6424005J92575337','Credit','2016-04-24T14:01:39.129Z','fe8e7a37dfb44d4f97238ec76f452b3b','1','2016-04-24 14:01:37'),(4,0,10,'volamshabarinath@gmail.com','shabarinathvolam','+919573072270','INR','0.19','MOJO6429005J74692561','Credit','2016-04-29T03:12:47.860Z','c69e12ef722b4ad2b24324077eabf839','1','2016-04-29 03:12:25'),(5,0,10,'volamshabarinath@gmail.com','shabarinathvolam','+919573072270','INR','0.19','MOJO6501005J40827318','Credit','2016-05-01T10:12:48.444Z','9fdf3d80f4a3418f9d8a5450c92893f5','1','2016-05-01 10:12:19'),(6,0,9000,'vadlakonda.ravikiran@gmail.com','ravikiran','+919292309599','INR','171.00','MOJO6610005J97104275','Credit','2016-06-10T05:32:32.005Z','01dbb161f51342eeb87486020a23ced8','1','2016-06-10 05:32:59'),(7,0,6000,'vadlakonda.ravikiran@gmail.com','ravikiran','+919292309599','INR','114.00','MOJO6610005J97104450','Credit','2016-06-10T05:44:53.087Z','a53e7bc0d0b94f97aacd56e99cf99c78','1','2016-06-10 05:44:37');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupon_mapping`
--

DROP TABLE IF EXISTS `user_coupon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupon_mapping` (
  `user_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `list_index` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon_mapping`
--

LOCK TABLES `user_coupon_mapping` WRITE;
/*!40000 ALTER TABLE `user_coupon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_coupon_mapping` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ROLE_ADMIN',1),(2,'ROLE_USER',2),(3,'ROLE_USER',12),(4,'ROLE_USER',17),(5,'ROLE_USER',18),(6,'ROLE_USER',19),(7,'ROLE_USER',20);
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
  `version` bigint(20) NOT NULL DEFAULT '0',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `account_locked` tinyint(1) NOT NULL DEFAULT '0',
  `account_expired` tinyint(1) NOT NULL DEFAULT '0',
  `credentials_expired` tinyint(1) NOT NULL DEFAULT '0',
  `amount` bigint(100) DEFAULT '0',
  `mobile_number` bigint(20) DEFAULT NULL,
  `type` varchar(31) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'admin','admin','admin@admin.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9573027720,'ADMIN'),(2,49,'user','user','user@user.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,610,9573027720,'User'),(3,105,'shabarinath','volam','volamshabarinath@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9573072270,'User'),(4,1,'saraswathi','volam','volamsaraswathi@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9581235772,'User'),(5,0,NULL,NULL,'prakashrao.87@gmail.com',NULL,1,0,0,0,0,NULL,'User'),(7,0,NULL,NULL,'volam.shabarinath@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,NULL,'User'),(8,0,NULL,NULL,'shabarinath.volam@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,NULL,'User'),(9,0,NULL,NULL,'test@yahoo.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,NULL,'User'),(10,0,NULL,NULL,'volamshaba.rinath@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,NULL,'User'),(11,0,'Shabarinath ','volam','vola.mshabarinath@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9573072270,'User'),(12,0,'shabarinath','volam','testing@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9573072270,'User'),(13,0,'Varun','P','Varunponugoti.123@gmail.com','hhi9rgq4ltibui4j2buj2v13cd',1,0,0,0,0,9666163331,'User'),(14,0,NULL,NULL,'nishanth.wa36@gmail.com',NULL,1,0,0,0,0,NULL,'User'),(15,0,'NISHANTH','VOLAM','nishanthvolam@gmail.com','cc24bfeoj6fieae9lf53u8jr5',1,0,0,0,0,9440580002,'User'),(16,0,'shabarinath','volam','testaas@gmail.com','cakbp9ikjd16kdg7un6kou3esg',1,0,0,0,0,9573072270,'User'),(17,0,'shabarinath','volam','testaas1@gmail.com','83958o2ts4mpvh55gojdvm895g',1,0,0,0,0,9573072270,'User'),(18,0,'shabarinath','volam','newuser@gmail.com','cfed2815f33f81ed7c13f8fc0ce28714',1,0,0,0,0,9573072270,'User'),(19,6,NULL,NULL,'vadla.konda.ravikiran@gmail.com',NULL,1,0,0,0,0,NULL,'User'),(20,6,'ravi','kiran','vadlakonda.ravikiran@gmail.com','j7hq6oatm7i0o7enll5m449e2j',1,0,0,0,0,9292309599,'User');
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

-- Dump completed on 2016-10-23 18:24:37
