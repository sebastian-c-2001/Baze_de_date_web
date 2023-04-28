-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: tema_3
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `asociere`
--

DROP TABLE IF EXISTS `asociere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asociere` (
  `idasociere` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idautori` bigint unsigned DEFAULT NULL,
  `idproiecte` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`idasociere`),
  KEY `fk_asociere_1_idx` (`idautori`),
  KEY `fk_asociere_2_idx` (`idproiecte`),
  CONSTRAINT `fk_asociere_1` FOREIGN KEY (`idautori`) REFERENCES `autori` (`idautori`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_asociere_2` FOREIGN KEY (`idproiecte`) REFERENCES `proiecte` (`idproiecte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asociere`
--

LOCK TABLES `asociere` WRITE;
/*!40000 ALTER TABLE `asociere` DISABLE KEYS */;
INSERT INTO `asociere` VALUES (1,1,2),(2,1,3),(3,2,1),(4,3,4);
/*!40000 ALTER TABLE `asociere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autori`
--

DROP TABLE IF EXISTS `autori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori` (
  `idautori` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `varsta` int DEFAULT NULL,
  PRIMARY KEY (`idautori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori`
--

LOCK TABLES `autori` WRITE;
/*!40000 ALTER TABLE `autori` DISABLE KEYS */;
INSERT INTO `autori` VALUES (1,'Ionut','Ciprian','Ploiesti',35),(2,'Andrei','George','Bucuresti',45),(3,'Ana','Maria','Constanta',36),(4,'Popescu','Marin','Pitesti',28);
/*!40000 ALTER TABLE `autori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proiecte`
--

DROP TABLE IF EXISTS `proiecte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proiecte` (
  `idproiecte` bigint unsigned NOT NULL AUTO_INCREMENT,
  `denumire` varchar(45) DEFAULT NULL,
  `tematica` varchar(45) DEFAULT NULL,
  `termen_limita` date DEFAULT NULL,
  PRIMARY KEY (`idproiecte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiecte`
--

LOCK TABLES `proiecte` WRITE;
/*!40000 ALTER TABLE `proiecte` DISABLE KEYS */;
INSERT INTO `proiecte` VALUES (1,'Revolutia','Istorie','2024-12-02'),(2,'Comunismul','Istorie','2023-12-05'),(3,'Colorat','Colorat','2025-08-01'),(4,'Python','Programare','2023-06-22');
/*!40000 ALTER TABLE `proiecte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23 10:26:12
