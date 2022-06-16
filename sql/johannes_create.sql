CREATE TABLE `projekt`.`launchergame` (
  `GameID` INT NOT NULL,
  `LauncherID` INT NOT NULL,
  `Link` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`GameID`, `LauncherID`));

CREATE TABLE `projekt`.`besitzt` (
  `UserID` INT NOT NULL,
  `LauncherGame` VARCHAR(45) NOT NULL,
  `PlayTime` INT NULL DEFAULT "0",
  PRIMARY KEY (`UserID`));

CREATE TABLE `projekt`.`launcher` (
  `LauncherID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LauncherID`));