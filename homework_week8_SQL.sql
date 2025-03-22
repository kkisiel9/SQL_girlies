CREATE DATABASE  IF NOT EXISTS `week8_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `week8_v2`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: week8_v2
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressLine1` varchar(100) DEFAULT NULL,
  `AddressLine2` varchar(100) DEFAULT NULL,
  `Town` varchar(50) DEFAULT NULL,
  `County` varchar(50) DEFAULT NULL,
  `PostCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123','Maple Street','London','Greater London','SW27 HG8'),(2,'789','Pine Road','Warsaw','NA','E14 5FD'),(3,'101','Birch Lane','York','NA','EH7 8LH'),(4,'202','Cedar Drive','Ayr','NA','SW11 9GF'),(5,'456','Oak Avenue','London','Greater London','W32 98H'),(6,'404','Spruce Boulevard','Prague','NA','DE3 8NG'),(7,'505','Willow Way','Edinburgh','West Lothian','EH3 3HD'),(8,'606','Aspen Place','Edinburgh','West Lothian','EH3 3HD'),(9,'707','Redwood Terrace','Edinburgh','West Lothian','EH3 3HD'),(10,'303','Elm Court','Edinburgh','West Lothian','EH3 3HD');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `CopiesAvailable` int DEFAULT NULL,
  `GenreKey` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `GenreKey` (`GenreKey`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`GenreKey`) REFERENCES `genre` (`GenreKey`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'978-3-16-148410-0','Julia Donaldson','The Whispering Shadows',2,4,4),(2,'978-1-86197-876-9','Alexandra Harper','Echoes of Eternity',3,5,5),(3,'978-0-7432-7356-5','Benjamin Clarke','The Lost Chronicles',11,3,3),(4,'978-0-14-044913-6','Catherine Mitchell','Mysteries of the Deep',3,3,3),(5,'978-0-307-26353-8','David Reynolds','The Enchanted Forest',0,3,3),(6,'978-1-250-03092-1','Eleanor Brooks','Journey to the Unknown',0,2,2),(7,'978-0-06-112008-4','Frederick Hayes','Secrets of the Past',0,7,7),(8,'978-0-525-47546-7','Gabriella Foster','The Hidden Realm',2,8,8),(9,'978-1-5011-8756-3','Henry Lawson','Tales of the Forgotten',1,8,8),(10,'978-0-316-01792-3','Isabella Turner','The Last Adventure',0,1,1),(11,'978-0-316-01712-3','James Whitman','None & Gone',1,9,9);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreKey` int NOT NULL,
  `GenreName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GenreKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Sports'),(2,'Romance'),(3,'Fiction'),(4,'Science-Fiction'),(5,'Historical Romance'),(6,'Crime'),(7,'Thriller'),(8,'Comedy'),(9,'Fantasy'),(10,'Non-Fiction');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `LibraryMemberID` int DEFAULT NULL,
  `BookID` int DEFAULT NULL,
  `LoanDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  KEY `LibraryMemberID` (`LibraryMemberID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`LibraryMemberID`) REFERENCES `person` (`LibraryMemberID`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logindetails` (
  `login_ID` int NOT NULL AUTO_INCREMENT,
  `LibraryMemberID` int DEFAULT NULL,
  `Login` varchar(100) DEFAULT NULL,
  `Password_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_ID`),
  KEY `LibraryMemberID` (`LibraryMemberID`),
  CONSTRAINT `logindetails_ibfk_1` FOREIGN KEY (`LibraryMemberID`) REFERENCES `person` (`LibraryMemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logindetails`
--

LOCK TABLES `logindetails` WRITE;
/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` VALUES (1,98991234,'panda','*****'),(2,98991234,'1home','******'),(3,54424524,'rainy3','****'),(4,98778349,'koko882','******'),(5,55555333,'mandel34','********'),(6,55634221,'gek233','************'),(7,44234233,'bndm2','***'),(8,96364239,'lucia3','*********'),(9,90909887,'hung54','*****'),(10,90000430,'00oik','*********');
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `LibraryMemberID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `AddressID` int DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `PreferredGenre` int DEFAULT NULL,
  PRIMARY KEY (`LibraryMemberID`),
  KEY `AddressID` (`AddressID`),
  KEY `PreferredGenre` (`PreferredGenre`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`PreferredGenre`) REFERENCES `genre` (`GenreKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (42445462,'Luiza','Rakowski','lr@comm.ie',5,'0987654321',1),(44234233,'Skye','Deed','skyed@uk.com',6,'3322110099',7),(54424524,'Marie','Curie','polon@onet.pl',2,'1122334455',9),(55555333,'Dan','Long','long@gmail.com',4,'5544332211',2),(55634221,'Maella','Gerafe','gmm@gmail.com',10,'4433221100',7),(90000430,'Hazel','Fenrt','hazelnut@son.com',9,'0099887766',8),(90909887,'Gina','Holly','gully@gmail.com',8,'1100998877',2),(96364239,'Paula','Manikowska','fan@uk.com',7,'2211009988',3),(98778349,'Inna','Grant','hfhuo@gmail.com',3,'6677889900',3),(98991234,'Anna','Wong','wa@co.uk',1,'1234567890',1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferredgenre`
--

DROP TABLE IF EXISTS `preferredgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferredgenre` (
  `LibraryMemberID` int DEFAULT NULL,
  `PreferredGenre` int DEFAULT NULL,
  KEY `LibraryMemberID` (`LibraryMemberID`),
  KEY `PreferredGenre` (`PreferredGenre`),
  CONSTRAINT `preferredgenre_ibfk_1` FOREIGN KEY (`LibraryMemberID`) REFERENCES `person` (`LibraryMemberID`),
  CONSTRAINT `preferredgenre_ibfk_2` FOREIGN KEY (`PreferredGenre`) REFERENCES `genre` (`GenreKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferredgenre`
--

LOCK TABLES `preferredgenre` WRITE;
/*!40000 ALTER TABLE `preferredgenre` DISABLE KEYS */;
INSERT INTO `preferredgenre` VALUES (98991234,1),(98991234,9),(54424524,7),(98778349,3),(55555333,4),(55634221,7),(44234233,7),(96364239,5),(90909887,10),(90000430,8);
/*!40000 ALTER TABLE `preferredgenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'week8_v2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 13:26:37
