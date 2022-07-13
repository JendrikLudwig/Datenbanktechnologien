-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: Datenbanktechnologien_GroJägLud
-- ------------------------------------------------------
-- Server version	8.0.26

--
-- Table structure for table `befreundet_mit`
--
DROP DATABASE IF EXISTS `Datenbanktechnologien_GroJägLud`;

CREATE SCHEMA `Datenbanktechnologien_GroJägLud`;
USE `Datenbanktechnologien_GroJägLud`;

DROP TABLE IF EXISTS `befreundet_mit`;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `LanguageID` int NOT NULL AUTO_INCREMENT,
  `LanguageName` varchar(255) NOT NULL,
  PRIMARY KEY (`LanguageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `CountryID` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(255) NOT NULL,
  PRIMARY KEY (`CountryID`),
  UNIQUE KEY `CountryName_UNIQUE` (`CountryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `Mail` varchar(255) NOT NULL UNIQUE,
  `Password` varchar(255) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DateOfBirth` datetime NOT NULL,
  `CountryID` int NOT NULL,
  `LanguageID` int NOT NULL,
  `LatestActivity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfilePicture` varchar(255),
  PRIMARY KEY (`UserID`),
  KEY `language_fk_idx` (`LanguageID`),
  KEY `country_fk_idx` (`CountryID`),
  CONSTRAINT `country_fk` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON UPDATE CASCADE,
  CONSTRAINT `language_fk` FOREIGN KEY (`LanguageID`) REFERENCES `language` (`LanguageID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `befreundet_mit` (
  `FirstUserID` int NOT NULL,
  `SecondUserID` int NOT NULL,
  `FriendsSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FirstUserID`,`SecondUserID`),
  KEY `seconduser_fk_idx` (`SecondUserID`),
  CONSTRAINT `firstuser_fk` FOREIGN KEY (`FirstUserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seconduser_fk` FOREIGN KEY (`SecondUserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `befreundet_mit`
--

LOCK TABLES `befreundet_mit` WRITE;
/*!40000 ALTER TABLE `befreundet_mit` DISABLE KEYS */;
/*!40000 ALTER TABLE `befreundet_mit` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `DeveloperID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`DeveloperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`GenreID`),
  UNIQUE KEY `GenreID_UNIQUE` (`GenreID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `PublisherID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `GameID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Genre` int NOT NULL,
  `FSK` enum('0','6','12','16','18') NOT NULL,
  `Developer` int NOT NULL,
  `Publisher` int NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Description` longtext,
  `Features` tinytext NOT NULL,
  PRIMARY KEY (`GameID`),
  UNIQUE KEY `ID_UNIQUE` (`GameID`),
  KEY `genre_fk_idx` (`Genre`),
  KEY `developer_fk_idx` (`Developer`),
  KEY `publisher_fk_idx` (`Publisher`),
  CONSTRAINT `developer_fk` FOREIGN KEY (`Developer`) REFERENCES `developer` (`DeveloperID`) ON UPDATE CASCADE,
  CONSTRAINT `genre_fk` FOREIGN KEY (`Genre`) REFERENCES `genre` (`GenreID`) ON UPDATE CASCADE,
  CONSTRAINT `publisher_fk` FOREIGN KEY (`Publisher`) REFERENCES `publisher` (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `launcher`
--

DROP TABLE IF EXISTS `launcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launcher` (
  `LauncherID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Company` varchar(255) NOT NULL,
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
  PRIMARY KEY (`LauncherGameID`),
  KEY `launcher_fk_idx` (`LauncherID`),
  KEY `game_fk_idx` (`GameID`),
  CONSTRAINT `game_fk` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `launcher_fk` FOREIGN KEY (`LauncherID`) REFERENCES `launcher` (`LauncherID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launchergame`
--

LOCK TABLES `launchergame` WRITE;
/*!40000 ALTER TABLE `launchergame` DISABLE KEYS */;
/*!40000 ALTER TABLE `launchergame` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`UserID`,`LauncherGame`),
  KEY `LauncherGameID_idx` (`LauncherGame`),
  CONSTRAINT `LauncherGameID` FOREIGN KEY (`LauncherGame`) REFERENCES `launchergame` (`LauncherGameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_fk` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besitzt`
--

LOCK TABLES `besitzt` WRITE;
/*!40000 ALTER TABLE `besitzt` DISABLE KEYS */;
/*!40000 ALTER TABLE `besitzt` ENABLE KEYS */;
UNLOCK TABLES;


CREATE PROCEDURE `getFriendsOfUser`(
    IN SearchedUserID INT,
    OUT FriendsUserID INT
)
BEGIN

SELECT FirstUserID as FriendsOfUser, FriendsSince
FROM befreundet_mit
WHERE SecondUserID = SearchedUserID

UNION

SELECT SecondUserID, FriendsSince 
FROM befreundet_mit
WHERE FirstUserID = SearchedUserID

ORDER BY FriendsOfUser ASC;
    
END;

CREATE PROCEDURE `getOwnedGamesOfUser`(
    IN SearchedUserID INT,
    OUT GameName VARCHAR(50)
)
BEGIN

SELECT 
    b.title as GameTitle
FROM
    besitzt
        JOIN
    launchergame a ON LauncherGame = LauncherGameID
        JOIN
    game b ON a.GameID = b.GameID
WHERE
    UserID = SearchedUserID

ORDER BY b.title ASC;
    
END;

CREATE PROCEDURE `getUserByCountry`(
    IN SearchedCountry VARCHAR(50),
    OUT SearchedUser VARCHAR(50)
)
BEGIN

    SELECT UserName
    FROM user a
    JOIN country b ON a.CountryID = b.CountryID
    WHERE CountryName = SearchedCountry
    
    ORDER BY UserName ASC;
    
END;

CREATE PROCEDURE `getUserByLauncherGame`(
    IN SearchedUserID INT,
    IN LauncherGameID INT,
    OUT UserID INT
)
BEGIN

SELECT UserID as besitzenAuch from besitzt
WHERE UserID IN (
    SELECT FirstUserID FROM befreundet_mit
    WHERE SecondUserID = SearchedUserID

    UNION

    SELECT SecondUserID FROM befreundet_mit
    WHERE FirstUserID = SearchedUserID
)
AND LauncherGame = LauncherGameID;

END;

CREATE FUNCTION `getGameCountOfUser`(
    SearchedUserID INT
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN

    DECLARE GameCount INT;
    
SELECT
    count(distinct title)
FROM
    besitzt b
        JOIN
    launchergame l ON b.LauncherGame = l.LauncherGameID
        JOIN
    game g ON l.GameID = g.GameID
WHERE
    UserID = SearchedUserID INTO GameCount;
    
RETURN (GameCount);

END;

CREATE FUNCTION `PlayTimeOfUser`(
    SearchedUserID INT
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN

    DECLARE PlayTimeInHours INT;
    
    SELECT (sum(PlayTime)/60)
    INTO PlayTimeInHours
    FROM besitzt
    WHERE UserID = SearchedUserID;
    
RETURN (PlayTimeInHours);

END;

CREATE 
    ALGORITHM = UNDEFINED 
    SQL SECURITY DEFINER
VIEW `nonexplicitgames` AS
    SELECT 
        `game`.`GameID` AS `GameID`,
        `game`.`Title` AS `Title`,
        `game`.`Genre` AS `Genre`,
        `game`.`FSK` AS `FSK`,
        `game`.`Developer` AS `Developer`,
        `game`.`Publisher` AS `Publisher`,
        `game`.`ReleaseDate` AS `ReleaseDate`,
        `game`.`Description` AS `Description`,
        `game`.`Features` AS `Features`
    FROM
        `game`
    WHERE
        (`game`.`FSK` < '18')
    ORDER BY `game`.`FSK`;