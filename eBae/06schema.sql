CREATE DATABASE  IF NOT EXISTS `ebae` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ebae`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ebae
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  KEY `userID` (`userID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `app_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `cID` int NOT NULL,
  `userID` int NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`cID`,`userID`,`status`),
  KEY `userID` (`userID`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `computers` (`cID`),
  CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `end_user` (`endUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (14151788,47924896,'Outbidded'),(14151788,57169242,'Outbidded'),(14151788,87133013,'Outbidded');
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `userID` int NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'admin','admin','admin@auction.com'),(1111,'customer_rep_1','123','help@auction.com'),(10323737,'mo','mo','mo@ebae.com'),(29753430,'steverep','password123','help@auction.com'),(37737470,'cusrep','1234','help@auction.com'),(47924896,'steve','steve','steve@ebae.com'),(57169242,'vedant','vedant','vedant@ebae.com'),(60285047,'repre','repre1','help@auction.com'),(87133013,'krishna','krishna','krishna@ebae.com'),(95605980,'mos','mo','mo@ebae.com');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `minPrice` float(8,2) DEFAULT NULL,
  `maxBid` float(10,2) DEFAULT NULL,
  `userID` int NOT NULL,
  `cID` int NOT NULL,
  `closing` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`,`cID`),
  KEY `cID` (`cID`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `app_user` (`userID`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (150.00,690.00,10323737,14151788,'2022-12-27 09:00:00'),(200.00,400.00,57169242,88850447,'2022-12-27 09:00:00');
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `initBid` float(8,2) NOT NULL,
  `upperLimit` float(10,2) DEFAULT NULL,
  `userID` int NOT NULL,
  `cID` int NOT NULL,
  PRIMARY KEY (`userID`,`cID`,`initBid`),
  KEY `cID` (`cID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `app_user` (`userID`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (680.00,NULL,47924896,14151788),(400.00,NULL,47924896,88850447),(650.00,NULL,57169242,14151788),(690.00,NULL,57169242,14151788);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `cID` int NOT NULL,
  `descript` varchar(200) DEFAULT NULL,
  `compname` varchar(30) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,'idk','idk',1),(10511345,'12 inch surface tablet for sale','Mo',1),(14125502,'Gently used Mac','Mo',1),(14151788,'selling my old mac','Mac V12',1),(17207057,'small mac','sam',1),(17969700,'Black surface tablet for sale','Krish',1),(22004926,'medium mac for sale','amy',1),(23595789,'Gently used Mac','joe',1),(30715549,'im selling my old mac','mac v12',1),(31533251,'my old windows laptop is for sale','Hp ',1),(37890238,'Chromebook for sale','Vedant',1),(37892482,'Chromebook for sale','Steve',1),(37925722,'macfor sale','sam',1),(49883545,'Selling old PC','Kevin',1),(50506882,'Dell for sale','Stephen',1),(53480012,'selling my old mac','maanini',1),(55167596,'Chromebook for sale','Jess',1),(73050401,'Dell for sale','Hamad',1),(78554413,'Chromebook for sale','Stephen',1),(80388853,'tablet for sale','surface 4',1),(84988941,'Chromebook for sale','Stephen',1),(87233467,'Windows for sale','Vatsal',1),(88850447,'selling my spare laptop','dell xps',1),(92444511,'13 inch tablet for sale. ','HP',1),(95745558,'old gaming pc','HP',1),(99870199,'Dell for sale','stanley',2);
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_rep`
--

DROP TABLE IF EXISTS `customer_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_rep` (
  `repUserID` int NOT NULL,
  PRIMARY KEY (`repUserID`),
  CONSTRAINT `customer_rep_ibfk_1` FOREIGN KEY (`repUserID`) REFERENCES `app_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rep`
--

LOCK TABLES `customer_rep` WRITE;
/*!40000 ALTER TABLE `customer_rep` DISABLE KEYS */;
INSERT INTO `customer_rep` VALUES (1111),(29753430),(37737470),(60285047);
/*!40000 ALTER TABLE `customer_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desktops`
--

DROP TABLE IF EXISTS `desktops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desktops` (
  `size` varchar(10) DEFAULT NULL,
  `ram` varchar(15) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `desktopsID` int NOT NULL,
  PRIMARY KEY (`desktopsID`),
  CONSTRAINT `desktops_ibfk_1` FOREIGN KEY (`desktopsID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desktops`
--

LOCK TABLES `desktops` WRITE;
/*!40000 ALTER TABLE `desktops` DISABLE KEYS */;
INSERT INTO `desktops` VALUES ('small','16','null',14151788);
/*!40000 ALTER TABLE `desktops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_user`
--

DROP TABLE IF EXISTS `end_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `end_user` (
  `endUserID` int NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `bankac` varchar(20) DEFAULT NULL,
  `balance` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`endUserID`),
  CONSTRAINT `end_user_ibfk_1` FOREIGN KEY (`endUserID`) REFERENCES `app_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_user`
--

LOCK TABLES `end_user` WRITE;
/*!40000 ALTER TABLE `end_user` DISABLE KEYS */;
INSERT INTO `end_user` VALUES (10323737,'mo','mo','mo@ebae.com','741',1000.00),(47924896,'steve','steve','steve@ebae.com','315',1000.00),(57169242,'vedant','vedant','vedant@ebae.com','123',1000.00),(87133013,'krishna','krishna','krishna@ebae.com','456',1000.00),(95605980,'mosef','mo','mo@ebae.com','123456',1000.00);
/*!40000 ALTER TABLE `end_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptops`
--

DROP TABLE IF EXISTS `laptops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptops` (
  `size` int DEFAULT NULL,
  `laptoptype` varchar(20) DEFAULT NULL,
  `laptopsID` int NOT NULL,
  PRIMARY KEY (`laptopsID`),
  CONSTRAINT `laptops_ibfk_1` FOREIGN KEY (`laptopsID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptops`
--

LOCK TABLES `laptops` WRITE;
/*!40000 ALTER TABLE `laptops` DISABLE KEYS */;
INSERT INTO `laptops` VALUES (13,'windows',31533251),(15,'windows',88850447),(13,'windows',92444511);
/*!40000 ALTER TABLE `laptops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionID` int NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (27677183,'Can you please change my name to Mosef? Thanks.','Yes. '),(79539184,'hello, is your website running today?','Hi, yes it should be working fine today!');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablets`
--

DROP TABLE IF EXISTS `tablets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablets` (
  `size` double DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `tabletsID` int NOT NULL,
  PRIMARY KEY (`tabletsID`),
  CONSTRAINT `tablets_ibfk_1` FOREIGN KEY (`tabletsID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablets`
--

LOCK TABLES `tablets` WRITE;
/*!40000 ALTER TABLE `tablets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `buyer` int NOT NULL,
  `seller` int NOT NULL,
  `final_price` float(8,2) DEFAULT NULL,
  `cID` int NOT NULL,
  PRIMARY KEY (`cID`,`buyer`,`seller`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `end_user` (`endUserID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`seller`) REFERENCES `end_user` (`endUserID`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`cID`) REFERENCES `computers` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (57169242,10323737,690.00,14151788),(47924896,57169242,400.00,88850447);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 22:52:05
