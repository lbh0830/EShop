-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity` (
  `id` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `category` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `detail` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `spec` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES ('20180625001','鉛筆盒','配件',70,10,'精美的鉛筆盒，買到賺到哦!!!','黑','1530034371632.JPG'),('20180626003','樂譜','配件',33,3,'吉他譜','A4','1530022831566.png'),('20180626004','正常點','帽子',10,1000,'詳細資訊','規格','1530034331226.JPG');
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `privilege` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'root','123456','12007','internet','12007','rootroot@12007',31),(2,'test','654321','Henry','台北101101樓','0911333999','rrr@yahoo.mail.com',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderext`
--

DROP TABLE IF EXISTS `orderext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderext` (
  `id` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `commodity_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `buyquantity` int(11) DEFAULT NULL,
  `note` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderext`
--

LOCK TABLES `orderext` WRITE;
/*!40000 ALTER TABLE `orderext` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermain`
--

DROP TABLE IF EXISTS `ordermain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordermain` (
  `id` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `mem_id` int(11) DEFAULT NULL,
  `date` varchar(14) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiver` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `addr` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tel` varchar(13) COLLATE utf8mb4_bin DEFAULT NULL,
  `process` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermain`
--

LOCK TABLES `ordermain` WRITE;
/*!40000 ALTER TABLE `ordermain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordermain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-01 22:00:29
