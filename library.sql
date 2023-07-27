-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: Library_Management
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (2,'Samruddhi Phadnis','Samruddhi.sunbeam@gmail.com','7654985324','2023-07-22 10:37:07','Admin','omnitrix'),(3,'Manjusha Nikam','Manjusha.sunbeam@gmail.com','5214963575','2023-07-22 11:05:28','Librarian','sunbeam');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Category`
--

DROP TABLE IF EXISTS `Book_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Category`
--

LOCK TABLES `Book_Category` WRITE;
/*!40000 ALTER TABLE `Book_Category` DISABLE KEYS */;
INSERT INTO `Book_Category` VALUES (1,'Horror'),(2,'Sci-Fi');
/*!40000 ALTER TABLE `Book_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Books` (
  `idBooks` int NOT NULL AUTO_INCREMENT,
  `booksName` varchar(45) DEFAULT NULL,
  `bookAuthor` varchar(45) DEFAULT NULL,
  `bookPrice` double DEFAULT NULL,
  `bookDesc` varchar(225) DEFAULT NULL,
  `bookImg` int DEFAULT NULL,
  `idCategory` int DEFAULT NULL,
  `available_copies` int DEFAULT NULL,
  PRIMARY KEY (`idBooks`),
  KEY `fk_Books_1_idx` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (3,'The Exorcist','William Peter Blatty',1000,'It follows the demonic possession of an 11-year-old girl named Regan',4,1,87),(15,'Frankenstein','Mary Shelley',7890,'this is Horror Book',4,1,180),(18,'Dune','Frank Herbert',500,' Dune is a 1965 epic science fiction novel by American author Frank Herbert, originally published as two separate serials in Analog magazine.',4,2,45),(19,'The Silent Patient','Frank Herbert',500,'The Silent Patient is a 2019 psychological thriller novel written by British–Cypriot author Alex Michaelides.',3,3,60),(20,'The Silent Patient','Frank Herbert',500,'The Silent Patient is a 2019 psychological thriller novel written by British–Cypriot author Alex Michaelides.',3,3,60);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `idbooks_taken` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `issue_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` date DEFAULT NULL,
  `returned_date` timestamp NULL DEFAULT NULL,
  `fine_amount` double DEFAULT NULL,
  PRIMARY KEY (`idbooks_taken`),
  KEY `fk_books_taken_1_idx` (`user_id`),
  KEY `fk_books_taken_2_idx` (`book_id`),
  CONSTRAINT `books_fk` FOREIGN KEY (`book_id`) REFERENCES `Books` (`idBooks`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`idusers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3,1,15,'2023-07-22 03:17:54','2023-07-27','2023-07-21 18:30:00',NULL),(9,2,3,'2023-07-22 05:01:58','2023-08-27','2023-07-22 06:18:03',NULL),(10,3,3,'2023-07-22 05:53:58','2023-08-27','2023-07-21 18:30:00',NULL),(13,4,19,'2023-07-22 11:14:27','2023-08-27','2023-07-22 11:16:03',NULL),(15,1,15,'2023-07-22 11:48:31','2023-08-26',NULL,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `uName` varchar(45) NOT NULL,
  `uEmail` varchar(45) DEFAULT NULL,
  `uContact` varchar(45) DEFAULT NULL,
  `uCreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uPassword` varchar(45) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Bhumika','bagavebhumika1999@gmail.com','9834529123','2023-07-05 11:42:29','bhumi123'),(2,'Tejashree Labhsetwar','LabhsetwarTejashree1999@gmail.com','7588447920','2023-07-05 11:44:14','teja123'),(3,'Sneha Dongare','DongareSneha1999@gmail.com','9422374260','2023-07-05 11:45:10','sneha123'),(4,'Lawrence Grimes','Law1999@gmail.com','8975056328','2023-07-05 16:21:44','bhumi'),(7,'Tom','tom@gmail.com','98743510','2023-07-22 12:13:51','tom');
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

-- Dump completed on 2023-07-25 16:37:42
