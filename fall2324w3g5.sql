-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: fall2324w3g5
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'public',
  PRIMARY KEY (`collection_id`),
  KEY `FK_collection_user` (`user_id`),
  CONSTRAINT `FK_collection_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'2024-01-06 21:06:57','2024-01-06 21:06:57','newCollection',2,0,'public'),(2,'2024-01-06 21:20:44','2024-01-06 21:20:44','newCollection',1,0,'public');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_collection`
--

DROP TABLE IF EXISTS `collection_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_collection` (
  `collection_collection_id` int NOT NULL AUTO_INCREMENT,
  `collection_id_1` int NOT NULL,
  `collection_id_2` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_collection_id`),
  KEY `FK_collection_collection_collection_1` (`collection_id_1`),
  KEY `FK_collection_collection_collection_2` (`collection_id_2`),
  CONSTRAINT `FK_collection_collection_collection_1` FOREIGN KEY (`collection_id_1`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `FK_collection_collection_collection_2` FOREIGN KEY (`collection_id_2`) REFERENCES `collection` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_collection`
--

LOCK TABLES `collection_collection` WRITE;
/*!40000 ALTER TABLE `collection_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_pen`
--

DROP TABLE IF EXISTS `collection_pen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_pen` (
  `collection_pen_id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int NOT NULL,
  `pen_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_pen_id`),
  KEY `fk_colletion_pen_pen` (`pen_id`),
  KEY `fk_colletion_pen_collection` (`collection_id`),
  CONSTRAINT `fk_colletion_pen_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `fk_colletion_pen_pen` FOREIGN KEY (`pen_id`) REFERENCES `pen` (`pen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_pen`
--

LOCK TABLES `collection_pen` WRITE;
/*!40000 ALTER TABLE `collection_pen` DISABLE KEYS */;
INSERT INTO `collection_pen` VALUES (1,1,1,'2024-01-06 21:07:04','2024-01-06 21:07:04'),(2,1,3,'2024-01-06 21:07:16','2024-01-06 21:07:16'),(3,2,1,'2024-01-06 21:20:49','2024-01-06 21:20:49');
/*!40000 ALTER TABLE `collection_pen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_table`
--

DROP TABLE IF EXISTS `comment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_table` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `collection_id` int DEFAULT NULL,
  `pen_id` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pen',
  `reply` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_table_user` (`user_id`),
  KEY `FK_comment_table_pen` (`pen_id`),
  KEY `FK_comment_table_collection` (`collection_id`),
  KEY `FK_comment_comment` (`reply`),
  KEY `FK_comment_porject` (`project_id`),
  CONSTRAINT `FK_comment_porject` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_comment_table_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `FK_comment_table_pen` FOREIGN KEY (`pen_id`) REFERENCES `pen` (`pen_id`),
  CONSTRAINT `FK_comment_table_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_comment_user_reply` FOREIGN KEY (`reply`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_table`
--

LOCK TABLES `comment_table` WRITE;
/*!40000 ALTER TABLE `comment_table` DISABLE KEYS */;
INSERT INTO `comment_table` VALUES (1,1,NULL,1,'quá xịn','2024-01-06 21:16:00','2024-01-06 21:16:00','pen',NULL,0,NULL),(2,1,NULL,2,'đẳng cấp','2024-01-06 21:16:23','2024-01-06 21:16:38','pen',NULL,0,NULL);
/*!40000 ALTER TABLE `comment_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `folder_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_id` int NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_table`
--

DROP TABLE IF EXISTS `follow_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_table` (
  `follow_id` int NOT NULL AUTO_INCREMENT,
  `user_id_1` int NOT NULL,
  `user_id_2` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`follow_id`),
  KEY `fk_like_user_1` (`user_id_1`),
  KEY `fk_like_user_2` (`user_id_2`),
  CONSTRAINT `fk_like_user_1` FOREIGN KEY (`user_id_1`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_like_user_2` FOREIGN KEY (`user_id_2`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_table`
--

LOCK TABLES `follow_table` WRITE;
/*!40000 ALTER TABLE `follow_table` DISABLE KEYS */;
INSERT INTO `follow_table` VALUES (1,3,2,'2024-01-06 21:09:36','2024-01-06 21:09:36'),(2,1,2,'2024-01-06 21:18:03','2024-01-06 21:18:03');
/*!40000 ALTER TABLE `follow_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likeCollection`
--

DROP TABLE IF EXISTS `likeCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likeCollection` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `collection_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `collection_id` (`collection_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likeCollection_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `likeCollection_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likeCollection`
--

LOCK TABLES `likeCollection` WRITE;
/*!40000 ALTER TABLE `likeCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `likeCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_table`
--

DROP TABLE IF EXISTS `like_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_table` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `collection_id` int DEFAULT NULL,
  `pen_id` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pen',
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `FK_like_table_user` (`user_id`),
  KEY `FK_like_table_pen` (`pen_id`),
  KEY `FK_like_table_collection` (`collection_id`),
  KEY `FK_like_porject` (`project_id`),
  CONSTRAINT `FK_like_porject` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_like_table_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `FK_like_table_pen` FOREIGN KEY (`pen_id`) REFERENCES `pen` (`pen_id`),
  CONSTRAINT `FK_like_table_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_table`
--

LOCK TABLES `like_table` WRITE;
/*!40000 ALTER TABLE `like_table` DISABLE KEYS */;
INSERT INTO `like_table` VALUES (1,3,NULL,1,'2024-01-06 21:09:42','2024-01-06 21:09:42','pen',NULL),(2,3,NULL,3,'2024-01-06 21:09:44','2024-01-06 21:09:44','pen',NULL),(3,3,NULL,4,'2024-01-06 21:09:46','2024-01-06 21:09:46','pen',NULL),(4,3,NULL,2,'2024-01-06 21:09:48','2024-01-06 21:09:48','pen',NULL),(5,3,NULL,5,'2024-01-06 21:11:30','2024-01-06 21:11:30','pen',NULL),(6,1,NULL,3,'2024-01-06 21:21:06','2024-01-06 21:21:06','pen',NULL),(7,1,NULL,4,'2024-01-06 21:21:08','2024-01-06 21:21:08','pen',NULL);
/*!40000 ALTER TABLE `like_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pen`
--

DROP TABLE IF EXISTS `pen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pen` (
  `pen_id` int NOT NULL AUTO_INCREMENT,
  `html_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `js_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `css_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'public',
  `type_css` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'css',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Untitle',
  PRIMARY KEY (`pen_id`),
  KEY `FK_pen_user` (`user_id`),
  CONSTRAINT `FK_pen_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pen`
--

LOCK TABLES `pen` WRITE;
/*!40000 ALTER TABLE `pen` DISABLE KEYS */;
INSERT INTO `pen` VALUES (1,'<input type=\"checkbox\" name=\"rotation\" id=\"rx\" checked>\n<input type=\"checkbox\" name=\"rotation\" id=\"ry\" checked>\n<input type=\"checkbox\" name=\"rotation\" id=\"rz\" checked>\n\n<div class=\"xyz cuboid\">\n    <div class=\"side\">\n        <label for=\"rx\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\"></div>\n    <div class=\"side\"></div>\n    <div class=\"side\">\n        <label for=\"ry\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\">\n        <label for=\"rz\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\"></div>\n</div>\n\n<div class=\"content\">\n\n    <div class=\"rotate-x\">\n        <div class=\"rotate-y\">\n            <div class=\"rotate-z\">\n                <div class=\"cuboid\">\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                </div>\n            </div>\n        </div>\n    </div>\n\n</div>','',':root {\n    --bounce: linear(0 0%, 0 2.27%, 0.02 4.53%, 0.04 6.8%, 0.06 9.07%, 0.1 11.33%, 0.14 13.6%, 0.25 18.15%, 0.39 22.7%, 0.56 27.25%, 0.77 31.8%, 1 36.35%, 0.89 40.9%, 0.85 43.18%, 0.81 45.45%, 0.79 47.72%, 0.77 50%, 0.75 52.27%, 0.75 54.55%, 0.75 56.82%, 0.77 59.1%, 0.79 61.38%, 0.81 63.65%, 0.85 65.93%, 0.89 68.2%, 1 72.7%, 0.97 74.98%, 0.95 77.25%, 0.94 79.53%, 0.94 81.8%, 0.94 84.08%, 0.95 86.35%, 0.97 88.63%, 1 90.9%, 0.99 93.18%, 0.98 95.45%, 0.99 97.73%, 1 100%);\n    --speed: 6s;\n}\n\n* {\n    transform-style: preserve-3d;\n    box-sizing: border-box;\n}\n\nbody {\n    margin: 0;\n    padding: 0;\n    width: 100vw;\n    height: 100vh;\n    overflow: hidden;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    perspective: 500vmin;\n    background: radial-gradient(circle at 50% 0, #555, #333, #000);\n}\n\n.content {\n    width: 36vmin;\n    height: 36vmin;\n    background: #f000;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    /*transform: rotate3d(1,1,1,45deg);*/\n    margin-top: 22vmin;\n}\n\n.cuboid {\n    --height: 36;\n    --width: 36;\n    --depth: 36;\n    --hue: 225;\n    --sat: 20%;\n    height: calc(var(--height) * 1vmin);\n    width: calc(var(--width) * 1vmin);\n    position: absolute;\n    transform: translate3d(0vmin, 0vmin, 0vmin);\n}\n\n.cuboid > .side {\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    height: 100%;\n    width: 100%;\n    border-radius: 2px;\n    perspective: 100vmin;\n}\n\n\n.cuboid > .side:nth-of-type(1) {\n    transform: translate3d(-50%, -50%, calc(var(--depth) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 50%);\n}\n.cuboid > .side:nth-of-type(2) {\n    transform: translate3d(-50%, -50%, calc(var(--depth) * -0.5vmin)) rotateY(180deg);\n    background: hsl(var(--hue), var(--sat), 30%);\n}\n.cuboid > .side:nth-of-type(3) {\n    width: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateY(90deg)	translate3d(0, 0, calc(var(--width) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 65%);\n}\n.cuboid > .side:nth-of-type(4) {\n    width: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateY(-90deg) translate3d(0, 0, calc(var(--width) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 40%);\n}\n.cuboid > .side:nth-of-type(5) {\n    height: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateX(90deg) translate3d(0, 0, calc(var(--height) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 75%);\n}\n.cuboid > .side:nth-of-type(6) {\n    height: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateX(-90deg) translate3d(0, 0, calc(var(--height) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 25%);\n}\n\n\n\n\n\n\n\n[class^=\"rotate-\"], [class*=\"rotate-\"] {\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    position: absolute;\n    width: 100%;\n    height: 100%;\n}\n\n\n\n.rotate-x,\n.rotate-y, \n.rotate-z {\n    animation: rot-x var(--speed) linear 0s infinite;\n    animation-play-state: paused;\n}\n.rotate-y {\n    animation-name: rot-y;\n}\n.rotate-z {\n    animation-name: rot-z;\n}\n\n#rx:checked ~ .content .rotate-x,\n#ry:checked ~ .content .rotate-y, \n#rz:checked ~ .content .rotate-z {\n    animation-play-state: running;\n}\n\n@keyframes rot-x {\n    100% { transform: rotateX(360deg); }\n}\n@keyframes rot-y {\n    100% { transform: rotateY(360deg); }\n}\n@keyframes rot-z {\n    100% { transform: rotateZ(-360deg); }\n}\n\n\n\n\n\n\nlabel {\n    position: absolute;\n    top: 10vmin;\n    left: 50%;\n    width: 8vmin;\n    height: 8vmin;\n    background-color: rgba(255, 0, 0, 0.192);\n    cursor: pointer;\n    left: 2vmin;\n    top: 2vmin;\n}\n\ninput {\n    display: none;\n}\n\n.cuboid.xyz {\n    position: absolute;\n    --width: 12;\n    --height: 12;\n    --depth: 12;\n    --hue: 125;\n    background-color: #00f4;\n    top: 10vmin;\n    transform: rotateX(-45deg) rotateY(48deg) rotateZ(4deg);\n    transform-origin: 50% 50%;\n    perspective: 10000vmin;\n}\n\n.xyz.cuboid > .side {\n    --clr: #667399;\n    background: linear-gradient(0deg, var(--clr) 13%, #fff0 0% 87%, var(--clr) 0% 100%), linear-gradient(90deg, var(--clr) 13%, #fff0 0% 87%, var(--clr) 0% 100%), radial-gradient(#666, #434343, #222);\n}\n.xyz.cuboid > .side:nth-child(4) {\n    --clr: #525c7a;\n}\n.xyz.cuboid > .side:nth-child(5) {\n    --clr: #b3b9cc;\n}\n\n\n\nlabel.cuboid {\n    --width: 8;\n    --height: 8;\n    --depth: 8;\n    transform: translateZ(1vmin);\n    perspective: 1000vmin;\n    transition: all 0.5s var(--bounce) 0s;\n}\n\n\n\n\n\n\nlabel.cuboid[for=ry] {\n    transform: translateZ(1vmin) rotateY(90deg);\n}\n\n\nlabel.cuboid[for=rz] {\n    transform: translateZ(1vmin) rotateX(270deg);\n}\n\n\n\n\n#rx:checked ~ .xyz.cuboid label[for=\"rx\"],\n#ry:checked ~ .xyz.cuboid label[for=\"ry\"],\n#rz:checked ~ .xyz.cuboid label[for=\"rz\"] {\n    transform: translateZ(-0.5vmin);\n}\n\n#ry:checked ~ .xyz.cuboid label[for=\"ry\"] {\n    transform: translateZ(-0.5vmin) rotateY(90deg);\n}\n\n#rz:checked ~ .xyz.cuboid label[for=\"rz\"] {\n    transform: translateZ(-0.5vmin) rotateX(270deg);\n}\n\n\n\n\n\n\n\n#rx:checked ~ .xyz.cuboid label[for=rx].cuboid {\n    --hue: 10;\n    --sat: 60%;\n}\n\n#rx:checked ~ .xyz.cuboid label[for=rx] .side {\n    box-shadow: 0 0 1vmin 0 #cc4c33, 0 0 1vmin 0 #a33d29 inset;\n}\n\n#rz:checked ~ .xyz.cuboid label[for=rz].cuboid {\n    --hue: 100;\n    --sat: 60%;\n}\n\n#rz:checked ~ .xyz.cuboid label[for=rz] .side {\n    box-shadow: 0 0 1vmin 0 #64ca32, 0 0 1vmin 0 #52a429 inset;\n}\n\n#ry:checked ~ .xyz.cuboid label[for=ry].cuboid {\n    --hue: 200;\n    --sat: 60%;\n}\n\n#ry:checked ~ .xyz.cuboid label[for=ry] .side {\n    box-shadow: 0 0 1vmin 0 #44a1ce, 0 0 1vmin 0 #297aa3 inset;\n}\n\n\n\n\n\n\nlabel[for=rz] .side:nth-child(5):before {\n    content: \"Z\";\n    color: #ffffff45;\n    color: #66cb33;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    transform: rotate(45deg);\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\nlabel[for=rx] .side:nth-child(1):before {\n    content: \"X\";\n    color: #ffffff45;\n    color: #cc4c33;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\nlabel[for=ry] .side:nth-child(4):before {\n    content: \"Y\";\n    color: #ffffff45;\n    color: #3399cc;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\n\n\n\n#rz:checked ~ .xyz.cuboid label[for=rz] .side:nth-child(5):before,\n#rx:checked ~ .xyz.cuboid label[for=rx] .side:nth-child(1):before,\n#ry:checked ~ .xyz.cuboid label[for=ry] .side:nth-child(4):before {\n    color: #fff;\n}\n\n\n#rx:checked ~ .xyz.cuboid > .side:nth-child(1) {\n    box-shadow: 0 0 5vmin 1vmin #ff6243dd inset\n}\n#ry:checked ~ .xyz.cuboid > .side:nth-child(4) {\n    box-shadow: 0 0 5vmin 1vmin #3399ccdd inset\n}\n#rz:checked ~ .xyz.cuboid > .side:nth-child(5) {\n    box-shadow: 0 0 5vmin 1vmin #64c731dd inset\n}','2024-01-06 21:00:51','2024-01-06 21:00:51',2,0,'public','css','Untitled'),(2,'<svg viewBox=\"0 0 100 100\">\n	<g stroke-width=\"20\">\n		<g transform=\"rotate(0 50 50)\">\n			<circle cx=\"50\" cy=\"50\" r=\"0\" stroke=\"#012\" stroke-dasharray=\"0 9 6 4 5\" fill=\"none\">\n				<animate attributeName=\"r\" values=\"0; 100\" dur=\"30s\" begin=\"0s\" repeatCount=\"indefinite\" />\n			</circle>\n		</g>\n		<g transform=\"rotate(60 50 50)\">\n			<circle cx=\"50\" cy=\"50\" r=\"0\" stroke=\"#345\" stroke-dasharray=\"4 8 4 6 2\" fill=\"none\">\n				<animate attributeName=\"r\" values=\"0; 100\" dur=\"30s\" begin=\"-2s\" repeatCount=\"indefinite\" />\n			</circle>\n		</g>\n		<g transform=\"rotate(120 50 50)\">\n			<circle cx=\"50\" cy=\"50\" r=\"0\" stroke=\"#678\" stroke-dasharray=\"2 7 9 9 6\" fill=\"none\">\n				<animate attributeName=\"r\" values=\"0; 100\" dur=\"30s\" begin=\"-4s\" repeatCount=\"indefinite\" />\n			</circle>\n		</g>\n		<g transform=\"rotate(180 50 50)\">\n			<circle cx=\"50\" cy=\"50\" r=\"0\" stroke=\"#9ab\" stroke-dasharray=\"8 8 3 7 7\" fill=\"none\">\n				<animate attributeName=\"r\" values=\"0; 100\" dur=\"30s\" begin=\"-6s\" repeatCount=\"indefinite\" />\n			</circle>\n		</g>\n		<g transform=\"rotate(240 50 50)\">\n			<circle cx=\"50\" cy=\"50\" r=\"0\" stroke=\"#cde\" stroke-dasharray=\"1 5 6 7 5\" fill=\"none\">\n				<animate attributeName=\"r\" values=\"0; 100\" dur=\"30s\" begin=\"-8s\" repeatCount=\"indefinite\" />\n			</circle>\n		</g>\n	</g>\n</svg>','','body {\n	background: #def;\n}\nsvg {\n	position: absolute;\n	top: 50%;\n	left: 50%;\n	transform: translate(-50%,-50%);\n	height: 100%;\n	width: 100%;\n}','2024-01-06 21:02:44','2024-01-06 21:02:44',2,0,'public','css','Untitled'),(3,'<div class=\"emoji-toggle emoji-happy\">\n    <input type=\"checkbox\" id=\"toggle1\" class=\"toggle\">\n    <div class=\"emoji\"></div>\n    <label for=\"toggle1\" class=\"well\"></label>\n</div>\n\n<div class=\"emoji-toggle emoji-travel\">\n    <input type=\"checkbox\" id=\"toggle2\" class=\"toggle\">\n    <div class=\"emoji\"></div>\n    <label for=\"toggle2\" class=\"well\"></label>\n</div>\n\n<div class=\"emoji-toggle emoji-food\">\n    <input type=\"checkbox\" id=\"toggle3\" class=\"toggle\">\n    <div class=\"emoji\"></div>\n    <label for=\"toggle3\" class=\"well\"></label>\n</div>\n\n<div class=\"emoji-toggle emoji-vote\">\n    <input type=\"checkbox\" id=\"toggle4\" class=\"toggle\">\n    <div class=\"emoji\"></div>\n    <label for=\"toggle4\" class=\"well\"></label>\n</div>\n\n<div class=\"emoji-toggle emoji-love\">\n    <input type=\"checkbox\" id=\"toggle5\" class=\"toggle\">\n    <div class=\"emoji\"></div>\n    <label for=\"toggle5\" class=\"well\"></label>\n</div>','','@charset \"UTF-8\";\n.emoji-toggle {\n  position: relative;\n  width: 60px;\n  margin: 40px auto; }\n  .emoji-toggle .well {\n    display: block;\n    background: #eee;\n    height: 20px;\n    border-radius: 10px;\n    cursor: pointer; }\n  .emoji-toggle .toggle {\n    opacity: 0;\n    border: 0;\n    outline: none;\n    height: 100%;\n    width: 100%;\n    background: transparent;\n    position: absolute;\n    cursor: pointer;\n    z-index: 100; }\n    .emoji-toggle .toggle ~ .emoji:before {\n      content: \"\\01F431\";\n      position: absolute;\n      left: 0;\n      top: -15px;\n      font-size: 40px;\n      transition: 0.2s; }\n    .emoji-toggle .toggle:checked ~ .emoji:before {\n      left: 100%;\n      margin-left: -1em; }\n    .emoji-toggle .toggle ~ label {\n      white-space: nowrap; }\n      .emoji-toggle .toggle ~ label:before {\n        position: absolute;\n        right: 100%;\n        margin-right: 5px;\n        top: 0; }\n      .emoji-toggle .toggle ~ label:after {\n        position: absolute;\n        left: 100%;\n        margin-left: 5px;\n        top: 0; }\n\n.emoji-happy .toggle ~ .emoji:before {\n  content: \"😄\"; }\n\n.emoji-happy .toggle:checked ~ .emoji:before {\n  content: \"😠\"; }\n\n.emoji-happy .toggle ~ label:before {\n  content: \"Happy\"; }\n\n.emoji-happy .toggle ~ label:after {\n  content: \"Mad\"; }\n\n.emoji-travel .toggle ~ .emoji:before {\n  content: \"✈\"; }\n\n.emoji-travel .toggle:checked ~ .emoji:before {\n  content: \"🚃\"; }\n\n.emoji-travel .toggle ~ label:before {\n  content: \"Plane\"; }\n\n.emoji-travel .toggle ~ label:after {\n  content: \"Train\"; }\n\n.emoji-food .toggle ~ .emoji:before {\n  content: \"🍔\"; }\n\n.emoji-food .toggle:checked ~ .emoji:before {\n  content: \"🍕\"; }\n\n.emoji-food .toggle ~ label:before {\n  content: \"Burger\"; }\n\n.emoji-food .toggle ~ label:after {\n  content: \"Pizza\"; }\n\n.emoji-vote .toggle ~ .emoji:before {\n  content: \"👍\"; }\n\n.emoji-vote .toggle:checked ~ .emoji:before {\n  content: \"👎\"; }\n\n.emoji-vote .toggle ~ label:before {\n  content: \"Thumbs Up\"; }\n\n.emoji-vote .toggle ~ label:after {\n  content: \"Thumbs Down\"; }\n\n.emoji-love .toggle ~ .emoji:before {\n  content: \"💘\"; }\n\n.emoji-love .toggle:checked ~ .emoji:before {\n  content: \"💔\"; }\n\n.emoji-love .toggle ~ label:before {\n  content: \"Loves Me\"; }\n\n.emoji-love .toggle ~ label:after {\n  content: \"Loves Me Not\"; }\n','2024-01-06 21:04:23','2024-01-06 21:04:23',2,0,'public','scss','Untitled'),(4,'<body>\n    <section>\n      <img class=\"hero\" src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/c62efd51-f844-4335-ba29-70ea35521dd8\" alt=\"\" />\n      <div class=\"swiper\">\n        <div class=\"swiper-wrapper\">\n          <div class=\"swiper-slide\">\n            <h1 class=\"title one\">Edinburgh</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/1bdebd02-d675-4469-be36-dc248448980d\" alt=\"\" />\n          </div>\n\n          <div class=\"swiper-slide\">\n            <h1 class=\"title two\">Stockholm</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/62411bbf-dde9-4654-9298-1fe3e7da2d64\" alt=\"\" />\n          </div>\n\n          <div class=\"swiper-slide\">\n            <h1 class=\"title three\">Paris</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/b49c729f-65b0-4a2a-baf7-1d9f180df0a6\" alt=\"\" />\n          </div>\n\n          <div class=\"swiper-slide\">\n            <h1 class=\"title four\">Brugge</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/c9a61071-c74d-4e8b-966a-6948cdbd9665\" alt=\"\" />\n          </div>\n\n          <div class=\"swiper-slide\">\n            <h1 class=\"title five\">Bavaria</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/25ab6cb7-9251-4aa5-9993-32ebd8542616\" alt=\"\" />\n          </div>\n\n          <div class=\"swiper-slide\">\n            <h1 class=\"title six\">Copenhagen</h1>\n            <img src=\"https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/365656bc-24bc-4d95-92da-7f34faa616cf\" alt=\"\" />\n          </div>\n        </div>\n      </div>\n    </section>\n  </body>','','* {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n\nhtml,\nbody {\n  position: relative;\n  height: 100%;\n  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;\n}\n\nsection {\n  position: relative;\n  display: flex;\n  justify-content: center;\n  width: 100%;\n  height: 100vh;\n}\n\n.hero {\n  position: absolute;\n  bottom: 0;\n  z-index: 5;\n  max-width: 550px;\n  filter: contrast(90%);\n  pointer-events: none;\n}\n\n.swiper {\n  width: 100%;\n  height: 100%;\n}\n\n.swiper-slide {\n  position: relative;\n  text-align: center;\n  font-size: 18px;\n  background: #fff;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n}\n\n.title {\n  position: absolute;\n  top: 18%;\n  left: 50%;\n  -ms-transform: translate(-50%, -50%);\n  transform: translate(-50%, -50%);\n  font-size: 5rem;\n  letter-spacing: 0.3rem;\n  z-index: 5;\n  color: transparent;\n  background-position: 0 0;\n  animation: animated-text 20s linear infinite;\n}\n\n@keyframes animated-text {\n  100% {\n    background-position: 200% 0;\n  }\n}\n\n.one,\n.five {\n  -webkit-text-stroke: 1px rgba(16, 104, 31, 0.8);\n  background: url(https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/e9d06cb6-2844-49ed-9bde-23d3364b9fa4);\n  background-clip: text;\n  -webkit-background-clip: text;\n}\n\n.two,\n.three,\n.four,\n.six {\n  -webkit-text-stroke: 1px #fff;\n  background: url(https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/ba4edde6-822d-437a-88c2-f54392d7a56f);\n  background-clip: text;\n  -webkit-background-clip: text;\n}\n\n.swiper-slide img {\n  width: 100%;\n  height: 100%;\n  object-fit: cover;\n  z-index: 1;\n}\n','2024-01-06 21:05:58','2024-01-06 21:07:37',2,0,'public','css','Untitled'),(5,'Result Skip Results Iframe\n<label class=\"switch\">\n  <input class=\"switch__input\" type=\"checkbox\" role=\"switch\">\n  <span class=\"switch__base-outer\"></span>\n  <span class=\"switch__base-inner\"></span>\n  <svg class=\"switch__base-neon\" viewBox=\"0 0 40 24\" width=\"40px\" height=\"24px\">\n    <defs>\n      <filter id=\"switch-glow\">\n        <feGaussianBlur result=\"coloredBlur\" stddeviation=\"1\"></feGaussianBlur>\n        <feMerge>\n          <feMergeNode in=\"coloredBlur\"></feMergeNode>\n          <feMergeNode in=\"SourceGraphic\"></feMergeNode>\n        </feMerge>\n      </filter>\n      <linearGradient id=\"switch-gradient1\" x1=\"0\" y1=\"0\" x2=\"1\" y2=\"0\">\n        <stop offset=\"0%\" stop-color=\"hsl(var(--on-hue1),90%,70%)\" />\n        <stop offset=\"100%\" stop-color=\"hsl(var(--on-hue2),90%,70%)\" />\n      </linearGradient>\n      <linearGradient id=\"switch-gradient2\" x1=\"0.7\" y1=\"0\" x2=\"0.3\" y2=\"1\">\n        <stop offset=\"25%\" stop-color=\"hsla(var(--on-hue1),90%,70%,0)\" />\n        <stop offset=\"50%\" stop-color=\"hsla(var(--on-hue1),90%,70%,0.3)\" />\n        <stop offset=\"100%\" stop-color=\"hsla(var(--on-hue2),90%,70%,0.3)\" />\n      </linearGradient>\n    </defs>\n    <path fill=\"none\" filter=\"url(#switch-glow)\" stroke=\"url(#switch-gradient1)\" stroke-width=\"1\" stroke-dasharray=\"0 104.26 0\" stroke-dashoffset=\"0.01\" stroke-linecap=\"round\" d=\"m.5,12C.5,5.649,5.649.5,12,.5h16c6.351,0,11.5,5.149,11.5,11.5s-5.149,11.5-11.5,11.5H12C5.649,23.5.5,18.351.5,12Z\"/>\n  </svg>\n  <span class=\"switch__knob-shadow\"></span>\n  <span class=\"switch__knob-container\">\n    <span class=\"switch__knob\">\n      <svg class=\"switch__knob-neon\" viewBox=\"0 0 48 48\" width=\"48px\" height=\"48px\">\n        <circle fill=\"none\" stroke=\"url(#switch-gradient2)\" stroke-dasharray=\"0 90.32 0 54.19\" stroke-linecap=\"round\" stroke-width=\"1\" r=\"23\" cx=\"24\" cy=\"24\" transform=\"rotate(-112.5,24,24)\" />\n      </svg>  \n    </span>\n  </span>\n  <span class=\"switch__led\"></span>\n  <span class=\"switch__text\">Power</span>\n</label>','','* {\n  border: 0;\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n:root {\n  --hue: 223;\n  --off-hue: 3;\n  --on-hue1: 123;\n  --on-hue2: 168;\n  --fg: hsl(var(--hue),10%,90%);\n  --primary: hsl(var(--hue),90%,50%);\n  --trans-dur: 0.6s;\n  --trans-timing: cubic-bezier(0.65,0,0.35,1);\n  font-size: calc(40px + (60 - 40) * (100vw - 320px) / (2560 - 320));\n}\nbody,\ninput {\n  font: 1em/1.5 sans-serif;\n}\nbody {\n  background-image: linear-gradient(45deg,hsl(var(--hue),10%,20%), hsl(var(--hue),10%,10%));\n  color: var(--fg);\n  display: flex;\n  height: 100vh;\n  transition:\n    background-color var(--trans-dur),\n    color var(--trans-dur);\n}\n.switch,\n.switch__input {\n  -webkit-tap-highlight-color: #0000;\n}\n.switch {\n  display: block;\n  margin: auto;\n  position: relative;\n  width: 5em;\n  height: 3em;\n}\n.switch__base-outer,\n.switch__base-inner {\n  display: block;\n  position: absolute;\n}\n.switch__base-outer {\n  border-radius: 1.25em;\n  box-shadow:\n    -0.125em -0.125em 0.25em hsl(var(--hue),10%,30%),\n    0.125em 0.125em 0.125em hsl(var(--hue),10%,30%) inset,\n    0.125em 0.125em 0.25em hsl(0,0%,0%),\n    -0.125em -0.125em 0.125em hsl(var(--hue),10%,5%) inset;\n  top: 0.125em;\n  left: 0.125em;\n  width: 4.75em;\n  height: 2.75em;\n}\n.switch__base-inner {\n  border-radius: 1.125em;\n  box-shadow:\n    -0.25em -0.25em 0.25em hsl(var(--hue),10%,30%) inset,\n    0.0625em 0.0625em 0.125em hsla(var(--hue),10%,30%),\n    0.125em 0.25em 0.25em hsl(var(--hue),10%,5%) inset,\n    -0.0625em -0.0625em 0.125em hsla(var(--hue),10%,5%);\n  top: 0.375em;\n  left: 0.375em;\n  width: 4.25em;\n  height: 2.25em;\n}\n.switch__base-neon {\n  display: block;\n  overflow: visible;\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: auto;\n}\n.switch__base-neon path {\n  stroke-dasharray: 0 104.26 0;\n  transition: stroke-dasharray var(--trans-dur) var(--trans-timing);\n}\n.switch__input {\n  outline: transparent;\n  position: relative;\n  width: 100%;\n  height: 100%;\n  -webkit-appearance: none;\n  appearance: none;\n}\n.switch__input:before {\n  border-radius: 0.125em;\n  box-shadow: 0 0 0 0.125em hsla(var(--hue),90%,50%,0);\n  content: \"\";\n  display: block;\n  position: absolute;\n  inset: -0.125em;\n  transition: box-shadow 0.15s linear;\n}\n.switch__input:focus-visible:before {\n  box-shadow: 0 0 0 0.125em var(--primary);\n}\n.switch__knob,\n.switch__knob-container {\n  border-radius: 1em;\n  display: block;\n  position: absolute;\n}\n.switch__knob {\n  background-color: hsl(var(--hue),10%,15%);\n  background-image:\n    radial-gradient(88% 88% at 50% 50%,hsl(var(--hue),10%,20%) 47%,hsla(var(--hue),10%,20%,0) 50%),\n    radial-gradient(88% 88% at 47% 47%,hsl(var(--hue),10%,85%) 45%,hsla(var(--hue),10%,85%,0) 50%),\n    radial-gradient(65% 70% at 40% 60%,hsl(var(--hue),10%,20%) 46%,hsla(var(--hue),10%,20%,0) 50%);\n  box-shadow:\n    -0.0625em -0.0625em 0.0625em hsl(var(--hue),10%,15%) inset,\n    -0.125em -0.125em 0.0625em hsl(var(--hue),10%,5%) inset,\n    0.75em 0.25em 0.125em hsla(0,0%,0%,0.8);\n  width: 2em;\n  height: 2em;\n  transition: transform var(--trans-dur) var(--trans-timing);\n}\n.switch__knob-container {\n  overflow: hidden;\n  top: 0.5em;\n  left: 0.5em;\n  width: 4em;\n  height: 2em;\n}\n.switch__knob-neon {\n  display: block;\n  width: 2em;\n  height: auto;\n}\n.switch__knob-neon circle {\n  opacity: 0;\n  stroke-dasharray: 0 90.32 0 54.19;\n  transition:\n    opacity var(--trans-dur) steps(1,end),\n    stroke-dasharray var(--trans-dur) var(--trans-timing);\n}\n.switch__knob-shadow {\n  border-radius: 50%;\n  box-shadow: 0.125em 0.125em 0.125em hsla(0,0%,0%,0.9);\n  display: block;\n  position: absolute;\n  top: 0.5em;\n  left: 0.5em;\n  width: 2em;\n  height: 2em;\n  transition: transform var(--trans-dur) var(--trans-timing);\n}\n.switch__led {\n  background-color: hsl(var(--off-hue),90%,70%);\n  border-radius: 50%;\n  box-shadow:\n    0 -0.0625em 0.0625em hsl(var(--off-hue),90%,40%) inset,\n    0 0 0.125em hsla(var(--off-hue),90%,70%,0.3),\n    0 0 0.125em hsla(var(--off-hue),90%,70%,0.3),\n    0.125em 0.125em 0.125em hsla(0,0%,0%,0.5);\n  display: block;\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 0.25em;\n  height: 0.25em;\n  transition:\n    background-color var(--trans-dur) var(--trans-timing),\n    box-shadow var(--trans-dur) var(--trans-timing);\n}\n.switch__text {\n  overflow: hidden;\n  position: absolute;\n  width: 1px;\n  height: 1px;\n}\n.switch__input:checked ~ .switch__led {\n  background-color: hsl(var(--on-hue1),90%,70%);\n  box-shadow:\n    0 -0.0625em 0.0625em hsl(var(--on-hue1),90%,40%) inset,\n    0 -0.125em 0.125em hsla(var(--on-hue1),90%,70%,0.3),\n    0 0.125em 0.125em hsla(var(--on-hue1),90%,70%,0.3),\n    0.125em 0.125em 0.125em hsla(0,0%,0%,0.5);\n}\n.switch__input:checked ~ .switch__base-neon path {\n  stroke-dasharray: 52.13 0 52.13;\n}\n.switch__input:checked ~ .switch__knob-shadow,\n.switch__input:checked ~ .switch__knob-container .switch__knob {\n  transform: translateX(100%);\n}\n.switch__input:checked ~ .switch__knob-container .switch__knob-neon circle {\n  opacity: 1;\n  stroke-dasharray: 45.16 0 45.16 54.19;\n  transition-timing-function: steps(1,start), var(--trans-timing);\n}','2024-01-06 21:10:33','2024-01-06 21:12:55',3,0,'public','css','Button'),(6,'<ul>\n   <li style=\"--clr:#2483ff;\">\n    <a href=\"#\">\n      <i class=\"fa-solid fa-house\"></i>\n      <span>Home</span>\n    </a>\n  </li>\n\n  <li style=\"--clr:#fff200;\">\n    <a href=\"#\">\n      <i class=\"fa-solid fa-user\"></i>\n      <span>Profile</span>\n    </a>\n  </li>\n\n  <li style=\"--clr:#ff253f;\">\n    <a href=\"#\">\n      <i class=\"fa-solid fa-heart\"></i>\n      <span>Likes</span>\n    </a>\n  </li>\n\n  <li style=\"--clr:#25d366;\">\n    <a href=\"#\">\n      <i class=\"fa-solid fa-gear\"></i>\n      <span>Settings</span>\n    </a>\n  </li>\n\n  <li style=\"--clr:#f32ec8;\">\n    <a href=\"#\">\n      <i class=\"fa-solid fa-magnifying-glass\"></i>\n      <span>Search</span>\n    </a>\n  </li>\n\n </ul>','','* {\n   margin: 0;\n   padding: 0;\n   box-sizing: border-box;\n}\n:root {\n   --bg: #222;\n   --clr: #fff;\n}\nbody {\n   display: flex;\n   justify-content: center;\n   align-items: center;\n   min-height: 100vh;\n   background: var(--bg);\n}\nul {\n   position: relative;\n   display: flex;\n   gap: 50px;\n}\nul li {\n   position: relative;\n   list-style: none;\n   width: 80px;\n   height: 80px;\n   display: flex;\n   justify-content: center;\n   align-items: center;\n   cursor: pointer;\n   transition: 0.5s;\n}\nul li::before {\n   content: \'\';\n   position: absolute;\n   inset: 30px;\n   box-shadow: 0 0 0 10px var(--clr),\n               0 0 0 20px var(--bg),\n               0 0 0 22px var(--clr);\n   transition: 0.5s;\n}\nul li:hover::before {\n   inset: 15px;\n}\nul li::after {\n   content: \'\';\n   position: absolute;\n   inset: 0;\n   background: var(--bg);\n   transform: rotate(45deg);\n   transition: 0.5s;\n}\nul li:hover::after {\n   inset: 0px;\n   transform: rotate(0deg);\n}\nul li a {\n   position: relative;\n   text-decoration: none;\n   z-index: 10;\n   display: flex;\n   justify-content: center;\n   align-items: center;\n}\nul li a i {\n   font-size: 2em;\n   transition: 0.5s;\n   color: var(--clr);\n   opacity: 1;\n}\nul li:hover a i {\n   color: var(--clr);\n   transform: translateY(-40%);\n}\nul li a span {\n   position: absolute;\n   font-family: sans-serif;\n   color: var(--clr);\n   opacity: 0;\n   transition: 0.5s;\n   transform: scale(0) translateY(200%);\n}\nul li:hover a span {\n   opacity: 1;\n   transform: scale(1) translateY(100%);\n}\nul li:hover a i,\nul li a span {\n   filter: drop-shadow(0 0 20px var(--clr)) drop-shadow(0 0 40px var(--clr)) drop-shadow(0 0 60px var(--clr));\n}','2024-01-06 21:12:22','2024-01-06 21:14:11',3,0,'public','css','Icon Hover Effect Using'),(7,'<input type=\"checkbox\" name=\"rotation\" id=\"rx\" checked>\n<input type=\"checkbox\" name=\"rotation\" id=\"ry\" checked>\n<input type=\"checkbox\" name=\"rotation\" id=\"rz\" checked>\n\n<div class=\"xyz cuboid\">\n    <div class=\"side\">\n        <label for=\"rx\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\"></div>\n    <div class=\"side\"></div>\n    <div class=\"side\">\n        <label for=\"ry\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\">\n        <label for=\"rz\" class=\"cuboid\">\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n            <div class=\"side\"></div>\n        </label>\n    </div>\n    <div class=\"side\"></div>\n</div>\n\n<div class=\"content\">\n\n    <div class=\"rotate-x\">\n        <div class=\"rotate-y\">\n            <div class=\"rotate-z\">\n                <div class=\"cuboid\">\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                    <div class=\"side\"></div>\n                </div>\n            </div>\n        </div>\n    </div>\n\n</div>','',':root {\n    --bounce: linear(0 0%, 0 2.27%, 0.02 4.53%, 0.04 6.8%, 0.06 9.07%, 0.1 11.33%, 0.14 13.6%, 0.25 18.15%, 0.39 22.7%, 0.56 27.25%, 0.77 31.8%, 1 36.35%, 0.89 40.9%, 0.85 43.18%, 0.81 45.45%, 0.79 47.72%, 0.77 50%, 0.75 52.27%, 0.75 54.55%, 0.75 56.82%, 0.77 59.1%, 0.79 61.38%, 0.81 63.65%, 0.85 65.93%, 0.89 68.2%, 1 72.7%, 0.97 74.98%, 0.95 77.25%, 0.94 79.53%, 0.94 81.8%, 0.94 84.08%, 0.95 86.35%, 0.97 88.63%, 1 90.9%, 0.99 93.18%, 0.98 95.45%, 0.99 97.73%, 1 100%);\n    --speed: 6s;\n}\n\n* {\n    transform-style: preserve-3d;\n    box-sizing: border-box;\n}\n\nbody {\n    margin: 0;\n    padding: 0;\n    width: 100vw;\n    height: 100vh;\n    overflow: hidden;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    perspective: 500vmin;\n    background: radial-gradient(circle at 50% 0, #555, #333, #000);\n}\n\n.content {\n    width: 36vmin;\n    height: 36vmin;\n    background: #f000;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    /*transform: rotate3d(1,1,1,45deg);*/\n    margin-top: 22vmin;\n}\n\n.cuboid {\n    --height: 36;\n    --width: 36;\n    --depth: 36;\n    --hue: 225;\n    --sat: 20%;\n    height: calc(var(--height) * 1vmin);\n    width: calc(var(--width) * 1vmin);\n    position: absolute;\n    transform: translate3d(0vmin, 0vmin, 0vmin);\n}\n\n.cuboid > .side {\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    height: 100%;\n    width: 100%;\n    border-radius: 2px;\n    perspective: 100vmin;\n}\n\n\n.cuboid > .side:nth-of-type(1) {\n    transform: translate3d(-50%, -50%, calc(var(--depth) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 50%);\n}\n.cuboid > .side:nth-of-type(2) {\n    transform: translate3d(-50%, -50%, calc(var(--depth) * -0.5vmin)) rotateY(180deg);\n    background: hsl(var(--hue), var(--sat), 30%);\n}\n.cuboid > .side:nth-of-type(3) {\n    width: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateY(90deg)	translate3d(0, 0, calc(var(--width) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 65%);\n}\n.cuboid > .side:nth-of-type(4) {\n    width: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateY(-90deg) translate3d(0, 0, calc(var(--width) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 40%);\n}\n.cuboid > .side:nth-of-type(5) {\n    height: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateX(90deg) translate3d(0, 0, calc(var(--height) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 75%);\n}\n.cuboid > .side:nth-of-type(6) {\n    height: calc(var(--depth) * 1vmin);\n    transform: translate(-50%, -50%) rotateX(-90deg) translate3d(0, 0, calc(var(--height) * 0.5vmin));\n    background: hsl(var(--hue), var(--sat), 25%);\n}\n\n\n\n\n\n\n\n[class^=\"rotate-\"], [class*=\"rotate-\"] {\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    position: absolute;\n    width: 100%;\n    height: 100%;\n}\n\n\n\n.rotate-x,\n.rotate-y, \n.rotate-z {\n    animation: rot-x var(--speed) linear 0s infinite;\n    animation-play-state: paused;\n}\n.rotate-y {\n    animation-name: rot-y;\n}\n.rotate-z {\n    animation-name: rot-z;\n}\n\n#rx:checked ~ .content .rotate-x,\n#ry:checked ~ .content .rotate-y, \n#rz:checked ~ .content .rotate-z {\n    animation-play-state: running;\n}\n\n@keyframes rot-x {\n    100% { transform: rotateX(360deg); }\n}\n@keyframes rot-y {\n    100% { transform: rotateY(360deg); }\n}\n@keyframes rot-z {\n    100% { transform: rotateZ(-360deg); }\n}\n\n\n\n\n\n\nlabel {\n    position: absolute;\n    top: 10vmin;\n    left: 50%;\n    width: 8vmin;\n    height: 8vmin;\n    background-color: rgba(255, 0, 0, 0.192);\n    cursor: pointer;\n    left: 2vmin;\n    top: 2vmin;\n}\n\ninput {\n    display: none;\n}\n\n.cuboid.xyz {\n    position: absolute;\n    --width: 12;\n    --height: 12;\n    --depth: 12;\n    --hue: 125;\n    background-color: #00f4;\n    top: 10vmin;\n    transform: rotateX(-45deg) rotateY(48deg) rotateZ(4deg);\n    transform-origin: 50% 50%;\n    perspective: 10000vmin;\n}\n\n.xyz.cuboid > .side {\n    --clr: #667399;\n    background: linear-gradient(0deg, var(--clr) 13%, #fff0 0% 87%, var(--clr) 0% 100%), linear-gradient(90deg, var(--clr) 13%, #fff0 0% 87%, var(--clr) 0% 100%), radial-gradient(#666, #434343, #222);\n}\n.xyz.cuboid > .side:nth-child(4) {\n    --clr: #525c7a;\n}\n.xyz.cuboid > .side:nth-child(5) {\n    --clr: #b3b9cc;\n}\n\n\n\nlabel.cuboid {\n    --width: 8;\n    --height: 8;\n    --depth: 8;\n    transform: translateZ(1vmin);\n    perspective: 1000vmin;\n    transition: all 0.5s var(--bounce) 0s;\n}\n\n\n\n\n\n\nlabel.cuboid[for=ry] {\n    transform: translateZ(1vmin) rotateY(90deg);\n}\n\n\nlabel.cuboid[for=rz] {\n    transform: translateZ(1vmin) rotateX(270deg);\n}\n\n\n\n\n#rx:checked ~ .xyz.cuboid label[for=\"rx\"],\n#ry:checked ~ .xyz.cuboid label[for=\"ry\"],\n#rz:checked ~ .xyz.cuboid label[for=\"rz\"] {\n    transform: translateZ(-0.5vmin);\n}\n\n#ry:checked ~ .xyz.cuboid label[for=\"ry\"] {\n    transform: translateZ(-0.5vmin) rotateY(90deg);\n}\n\n#rz:checked ~ .xyz.cuboid label[for=\"rz\"] {\n    transform: translateZ(-0.5vmin) rotateX(270deg);\n}\n\n\n\n\n\n\n\n#rx:checked ~ .xyz.cuboid label[for=rx].cuboid {\n    --hue: 10;\n    --sat: 60%;\n}\n\n#rx:checked ~ .xyz.cuboid label[for=rx] .side {\n    box-shadow: 0 0 1vmin 0 #cc4c33, 0 0 1vmin 0 #a33d29 inset;\n}\n\n#rz:checked ~ .xyz.cuboid label[for=rz].cuboid {\n    --hue: 100;\n    --sat: 60%;\n}\n\n#rz:checked ~ .xyz.cuboid label[for=rz] .side {\n    box-shadow: 0 0 1vmin 0 #64ca32, 0 0 1vmin 0 #52a429 inset;\n}\n\n#ry:checked ~ .xyz.cuboid label[for=ry].cuboid {\n    --hue: 200;\n    --sat: 60%;\n}\n\n#ry:checked ~ .xyz.cuboid label[for=ry] .side {\n    box-shadow: 0 0 1vmin 0 #44a1ce, 0 0 1vmin 0 #297aa3 inset;\n}\n\n\n\n\n\n\nlabel[for=rz] .side:nth-child(5):before {\n    content: \"Z\";\n    color: #ffffff45;\n    color: #66cb33;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    transform: rotate(45deg);\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\nlabel[for=rx] .side:nth-child(1):before {\n    content: \"X\";\n    color: #ffffff45;\n    color: #cc4c33;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\nlabel[for=ry] .side:nth-child(4):before {\n    content: \"Y\";\n    color: #ffffff45;\n    color: #3399cc;\n    color: #fff0;\n    font-size: 5vmin;\n    font-family: Arial, Helvetica, serif;\n    display: flex;\n    justify-content: center;\n    height: 100%;\n    align-items: center;\n    text-shadow: -1px 0 0px #fff8, 1px 0 0px #0004;\n}\n\n\n\n#rz:checked ~ .xyz.cuboid label[for=rz] .side:nth-child(5):before,\n#rx:checked ~ .xyz.cuboid label[for=rx] .side:nth-child(1):before,\n#ry:checked ~ .xyz.cuboid label[for=ry] .side:nth-child(4):before {\n    color: #fff;\n}\n\n\n#rx:checked ~ .xyz.cuboid > .side:nth-child(1) {\n    box-shadow: 0 0 5vmin 1vmin #ff6243dd inset\n}\n#ry:checked ~ .xyz.cuboid > .side:nth-child(4) {\n    box-shadow: 0 0 5vmin 1vmin #3399ccdd inset\n}\n#rz:checked ~ .xyz.cuboid > .side:nth-child(5) {\n    box-shadow: 0 0 5vmin 1vmin #64c731dd inset\n}','2024-01-06 21:17:15','2024-01-06 21:17:15',1,0,'public','css','Untitled - copy'),(8,'Result Skip Results Iframe\n<label class=\"switch\">\n  <input class=\"switch__input\" type=\"checkbox\" role=\"switch\">\n  <span class=\"switch__base-outer\"></span>\n  <span class=\"switch__base-inner\"></span>\n  <svg class=\"switch__base-neon\" viewBox=\"0 0 40 24\" width=\"40px\" height=\"24px\">\n    <defs>\n      <filter id=\"switch-glow\">\n        <feGaussianBlur result=\"coloredBlur\" stddeviation=\"1\"></feGaussianBlur>\n        <feMerge>\n          <feMergeNode in=\"coloredBlur\"></feMergeNode>\n          <feMergeNode in=\"SourceGraphic\"></feMergeNode>\n        </feMerge>\n      </filter>\n      <linearGradient id=\"switch-gradient1\" x1=\"0\" y1=\"0\" x2=\"1\" y2=\"0\">\n        <stop offset=\"0%\" stop-color=\"hsl(var(--on-hue1),90%,70%)\" />\n        <stop offset=\"100%\" stop-color=\"hsl(var(--on-hue2),90%,70%)\" />\n      </linearGradient>\n      <linearGradient id=\"switch-gradient2\" x1=\"0.7\" y1=\"0\" x2=\"0.3\" y2=\"1\">\n        <stop offset=\"25%\" stop-color=\"hsla(var(--on-hue1),90%,70%,0)\" />\n        <stop offset=\"50%\" stop-color=\"hsla(var(--on-hue1),90%,70%,0.3)\" />\n        <stop offset=\"100%\" stop-color=\"hsla(var(--on-hue2),90%,70%,0.3)\" />\n      </linearGradient>\n    </defs>\n    <path fill=\"none\" filter=\"url(#switch-glow)\" stroke=\"url(#switch-gradient1)\" stroke-width=\"1\" stroke-dasharray=\"0 104.26 0\" stroke-dashoffset=\"0.01\" stroke-linecap=\"round\" d=\"m.5,12C.5,5.649,5.649.5,12,.5h16c6.351,0,11.5,5.149,11.5,11.5s-5.149,11.5-11.5,11.5H12C5.649,23.5.5,18.351.5,12Z\"/>\n  </svg>\n  <span class=\"switch__knob-shadow\"></span>\n  <span class=\"switch__knob-container\">\n    <span class=\"switch__knob\">\n      <svg class=\"switch__knob-neon\" viewBox=\"0 0 48 48\" width=\"48px\" height=\"48px\">\n        <circle fill=\"none\" stroke=\"url(#switch-gradient2)\" stroke-dasharray=\"0 90.32 0 54.19\" stroke-linecap=\"round\" stroke-width=\"1\" r=\"23\" cx=\"24\" cy=\"24\" transform=\"rotate(-112.5,24,24)\" />\n      </svg>  \n    </span>\n  </span>\n  <span class=\"switch__led\"></span>\n  <span class=\"switch__text\">Power</span>\n</label>','','* {\n  border: 0;\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n}\n:root {\n  --hue: 223;\n  --off-hue: 3;\n  --on-hue1: 123;\n  --on-hue2: 168;\n  --fg: hsl(var(--hue),10%,90%);\n  --primary: hsl(var(--hue),90%,50%);\n  --trans-dur: 0.6s;\n  --trans-timing: cubic-bezier(0.65,0,0.35,1);\n  font-size: calc(40px + (60 - 40) * (100vw - 320px) / (2560 - 320));\n}\nbody,\ninput {\n  font: 1em/1.5 sans-serif;\n}\nbody {\n  background-image: linear-gradient(45deg,hsl(var(--hue),10%,20%), hsl(var(--hue),10%,10%));\n  color: var(--fg);\n  display: flex;\n  height: 100vh;\n  transition:\n    background-color var(--trans-dur),\n    color var(--trans-dur);\n}\n.switch,\n.switch__input {\n  -webkit-tap-highlight-color: #0000;\n}\n.switch {\n  display: block;\n  margin: auto;\n  position: relative;\n  width: 5em;\n  height: 3em;\n}\n.switch__base-outer,\n.switch__base-inner {\n  display: block;\n  position: absolute;\n}\n.switch__base-outer {\n  border-radius: 1.25em;\n  box-shadow:\n    -0.125em -0.125em 0.25em hsl(var(--hue),10%,30%),\n    0.125em 0.125em 0.125em hsl(var(--hue),10%,30%) inset,\n    0.125em 0.125em 0.25em hsl(0,0%,0%),\n    -0.125em -0.125em 0.125em hsl(var(--hue),10%,5%) inset;\n  top: 0.125em;\n  left: 0.125em;\n  width: 4.75em;\n  height: 2.75em;\n}\n.switch__base-inner {\n  border-radius: 1.125em;\n  box-shadow:\n    -0.25em -0.25em 0.25em hsl(var(--hue),10%,30%) inset,\n    0.0625em 0.0625em 0.125em hsla(var(--hue),10%,30%),\n    0.125em 0.25em 0.25em hsl(var(--hue),10%,5%) inset,\n    -0.0625em -0.0625em 0.125em hsla(var(--hue),10%,5%);\n  top: 0.375em;\n  left: 0.375em;\n  width: 4.25em;\n  height: 2.25em;\n}\n.switch__base-neon {\n  display: block;\n  overflow: visible;\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: auto;\n}\n.switch__base-neon path {\n  stroke-dasharray: 0 104.26 0;\n  transition: stroke-dasharray var(--trans-dur) var(--trans-timing);\n}\n.switch__input {\n  outline: transparent;\n  position: relative;\n  width: 100%;\n  height: 100%;\n  -webkit-appearance: none;\n  appearance: none;\n}\n.switch__input:before {\n  border-radius: 0.125em;\n  box-shadow: 0 0 0 0.125em hsla(var(--hue),90%,50%,0);\n  content: \"\";\n  display: block;\n  position: absolute;\n  inset: -0.125em;\n  transition: box-shadow 0.15s linear;\n}\n.switch__input:focus-visible:before {\n  box-shadow: 0 0 0 0.125em var(--primary);\n}\n.switch__knob,\n.switch__knob-container {\n  border-radius: 1em;\n  display: block;\n  position: absolute;\n}\n.switch__knob {\n  background-color: hsl(var(--hue),10%,15%);\n  background-image:\n    radial-gradient(88% 88% at 50% 50%,hsl(var(--hue),10%,20%) 47%,hsla(var(--hue),10%,20%,0) 50%),\n    radial-gradient(88% 88% at 47% 47%,hsl(var(--hue),10%,85%) 45%,hsla(var(--hue),10%,85%,0) 50%),\n    radial-gradient(65% 70% at 40% 60%,hsl(var(--hue),10%,20%) 46%,hsla(var(--hue),10%,20%,0) 50%);\n  box-shadow:\n    -0.0625em -0.0625em 0.0625em hsl(var(--hue),10%,15%) inset,\n    -0.125em -0.125em 0.0625em hsl(var(--hue),10%,5%) inset,\n    0.75em 0.25em 0.125em hsla(0,0%,0%,0.8);\n  width: 2em;\n  height: 2em;\n  transition: transform var(--trans-dur) var(--trans-timing);\n}\n.switch__knob-container {\n  overflow: hidden;\n  top: 0.5em;\n  left: 0.5em;\n  width: 4em;\n  height: 2em;\n}\n.switch__knob-neon {\n  display: block;\n  width: 2em;\n  height: auto;\n}\n.switch__knob-neon circle {\n  opacity: 0;\n  stroke-dasharray: 0 90.32 0 54.19;\n  transition:\n    opacity var(--trans-dur) steps(1,end),\n    stroke-dasharray var(--trans-dur) var(--trans-timing);\n}\n.switch__knob-shadow {\n  border-radius: 50%;\n  box-shadow: 0.125em 0.125em 0.125em hsla(0,0%,0%,0.9);\n  display: block;\n  position: absolute;\n  top: 0.5em;\n  left: 0.5em;\n  width: 2em;\n  height: 2em;\n  transition: transform var(--trans-dur) var(--trans-timing);\n}\n.switch__led {\n  background-color: hsl(var(--off-hue),90%,70%);\n  border-radius: 50%;\n  box-shadow:\n    0 -0.0625em 0.0625em hsl(var(--off-hue),90%,40%) inset,\n    0 0 0.125em hsla(var(--off-hue),90%,70%,0.3),\n    0 0 0.125em hsla(var(--off-hue),90%,70%,0.3),\n    0.125em 0.125em 0.125em hsla(0,0%,0%,0.5);\n  display: block;\n  position: absolute;\n  top: 0;\n  left: 0;\n  width: 0.25em;\n  height: 0.25em;\n  transition:\n    background-color var(--trans-dur) var(--trans-timing),\n    box-shadow var(--trans-dur) var(--trans-timing);\n}\n.switch__text {\n  overflow: hidden;\n  position: absolute;\n  width: 1px;\n  height: 1px;\n}\n.switch__input:checked ~ .switch__led {\n  background-color: hsl(var(--on-hue1),90%,70%);\n  box-shadow:\n    0 -0.0625em 0.0625em hsl(var(--on-hue1),90%,40%) inset,\n    0 -0.125em 0.125em hsla(var(--on-hue1),90%,70%,0.3),\n    0 0.125em 0.125em hsla(var(--on-hue1),90%,70%,0.3),\n    0.125em 0.125em 0.125em hsla(0,0%,0%,0.5);\n}\n.switch__input:checked ~ .switch__base-neon path {\n  stroke-dasharray: 52.13 0 52.13;\n}\n.switch__input:checked ~ .switch__knob-shadow,\n.switch__input:checked ~ .switch__knob-container .switch__knob {\n  transform: translateX(100%);\n}\n.switch__input:checked ~ .switch__knob-container .switch__knob-neon circle {\n  opacity: 1;\n  stroke-dasharray: 45.16 0 45.16 54.19;\n  transition-timing-function: steps(1,start), var(--trans-timing);\n}','2024-01-06 21:17:36','2024-01-06 21:17:36',1,0,'public','css','Button - copy');
/*!40000 ALTER TABLE `pen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin` (
  `pin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `collection_id` int DEFAULT NULL,
  `pen_id` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pen',
  PRIMARY KEY (`pin_id`),
  KEY `FK_pin_user` (`user_id`),
  KEY `FK_pin_pen` (`pen_id`),
  KEY `FK_pin_collection` (`collection_id`),
  CONSTRAINT `FK_pin_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `FK_pin_pen` FOREIGN KEY (`pen_id`) REFERENCES `pen` (`pen_id`),
  CONSTRAINT `FK_pin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
INSERT INTO `pin` VALUES (1,1,NULL,1,'2024-01-06 21:20:33','2024-01-06 21:20:33','pen');
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'public',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `avatar_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gmail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT '0',
  `isAdmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_chk_1` CHECK (json_valid(`links`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'admin','admin@gmail,com','admin123','2024-01-06 19:48:51','2024-01-06 19:48:51','admin',NULL,NULL,NULL,0,0),(2,NULL,'user1','user1@gmail.com','Password1@','2024-01-06 20:59:17','2024-01-06 20:59:17','user user1','Unknown',NULL,NULL,0,0),(3,NULL,'user2','user2@gmail.com','Passwod2@','2024-01-06 21:09:15','2024-01-06 21:09:15','Nguyen Van Khang','Unknown',NULL,NULL,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_table`
--

DROP TABLE IF EXISTS `view_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_table` (
  `view_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `collection_id` int DEFAULT NULL,
  `pen_id` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pen',
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`view_id`),
  KEY `FK_view_table_user` (`user_id`),
  KEY `FK_view_table_pen` (`pen_id`),
  KEY `FK_view_table_collection` (`collection_id`),
  KEY `FK_view_porject` (`project_id`),
  CONSTRAINT `FK_view_porject` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_view_table_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  CONSTRAINT `FK_view_table_pen` FOREIGN KEY (`pen_id`) REFERENCES `pen` (`pen_id`),
  CONSTRAINT `FK_view_table_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_table`
--

LOCK TABLES `view_table` WRITE;
/*!40000 ALTER TABLE `view_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07  4:57:35
