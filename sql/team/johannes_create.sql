-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: projekt
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `besitzt`
--

DROP TABLE IF EXISTS `besitzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `besitzt` (
  `UserID` int NOT NULL,
  `LauncherGame` int NOT NULL,
  `PlayTime` int DEFAULT '0',
  PRIMARY KEY (`UserID`),
  KEY `LauncherGameID_idx` (`LauncherGame`),
  CONSTRAINT `LauncherGameID` FOREIGN KEY (`LauncherGame`) REFERENCES `launchergame` (`LauncherGameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besitzt`
--

LOCK TABLES `besitzt` WRITE;
/*!40000 ALTER TABLE `besitzt` DISABLE KEYS */;
/*!40000 ALTER TABLE `besitzt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `launcher`
--

DROP TABLE IF EXISTS `launcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launcher` (
  `LauncherID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Company` varchar(45) NOT NULL,
  PRIMARY KEY (`LauncherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launcher`
--

LOCK TABLES `launcher` WRITE;
/*!40000 ALTER TABLE `launcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `launcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `launchergame`
--

DROP TABLE IF EXISTS `launchergame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launchergame` (
  `LauncherGameID` int NOT NULL AUTO_INCREMENT,
  `GameID` int NOT NULL,
  `LauncherID` int NOT NULL,
  `Link` mediumtext NOT NULL,
  PRIMARY KEY (`LauncherGameID`,`GameID`),
  KEY `LauchnerID_idx` (`LauncherID`),
  CONSTRAINT `LauchnerID` FOREIGN KEY (`LauncherID`) REFERENCES `launcher` (`LauncherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launchergame`
--

LOCK TABLES `launchergame` WRITE;
/*!40000 ALTER TABLE `launchergame` DISABLE KEYS */;
/*!40000 ALTER TABLE `launchergame` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-16 17:08:24