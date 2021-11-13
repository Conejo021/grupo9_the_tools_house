-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: thetoolhouse
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `legajo` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3d32b917-4a12-4fa7-99c6-9f0239e52a96` (`id_producto`),
  KEY `FK_e9ad698f-9b39-4f28-91d0-5a09316fab0c` (`id_clientes`),
  CONSTRAINT `FK_3d32b917-4a12-4fa7-99c6-9f0239e52a96` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  CONSTRAINT `FK_e9ad698f-9b39-4f28-91d0-5a09316fab0c` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Gustavo','Coniglio',11,1,2,'2021-11-13 11:49:35',NULL,1),(2,'Andres','Urbano',12,1,2,'2021-11-13 11:49:35',NULL,1),(3,'Julian','Ginepro',13,1,2,'2021-11-13 11:49:35',NULL,1),(4,'Juan','Perez',14,1,2,'2021-11-13 11:49:35',NULL,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `DNI` int(11) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5d0e0d94-9745-495a-8c06-aecb8f0d445b` (`id_producto`),
  CONSTRAINT `FK_5d0e0d94-9745-495a-8c06-aecb8f0d445b` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Pepito','Perez',31234567,'1125252525','Cordoba 3381.Caba',1,0,'2021-11-13 11:25:14',NULL,1,NULL),(2,'Viviana','Granados',19876543,'351248267','Gascon 1245.Caba',2,0,'2021-11-13 11:35:40',NULL,1,NULL),(3,'Alex ','Porcel',25123456,'1135353535','Gorriti 4520.Caba',4,0,'2021-11-13 11:48:24',NULL,1,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `origen` varchar(30) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Makita','Japon','2021-11-13 10:12:40','2021-11-13 10:12:40'),(2,'Bosch','Alemania','2021-11-13 10:29:46','2021-11-13 10:29:46'),(3,'Stanley','EE.UU','2021-11-13 10:31:17','2021-11-13 10:31:17'),(4,'Bellota','España','2021-11-13 10:33:22','2021-11-13 10:33:22'),(5,'Beta','China','2021-11-13 10:34:07','2021-11-13 10:34:07'),(6,'Einhell','Alemania','2021-11-13 10:38:46','2021-11-13 10:38:46'),(7,'Facom','Francia','2021-11-13 10:38:46','2021-11-13 10:38:46'),(8,'JBM','China','2021-11-13 11:07:26','2021-11-13 11:07:26');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `id_marcas` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c3e0f523-7320-4420-9fcc-7c34fd5a61da` (`id_marcas`),
  CONSTRAINT `FK_c3e0f523-7320-4420-9fcc-7c34fd5a61da` FOREIGN KEY (`id_marcas`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Amoladora','Amoladora de 230 mm -2200w',22000,1,'2021-11-13 10:26:28',NULL,1),(2,'Amoladora','Amoladora a bateria 18v',26000,2,'2021-11-13 10:46:54',NULL,1),(3,'Lijadora','Lijadora de banda',20000,6,'2021-11-13 10:46:54',NULL,1),(4,'Caja de Herramientas','Maletin JBM de 216 pzas ref.52840',25000,8,'2021-11-13 10:46:54',NULL,1),(5,'Bateria','Bateria de 14.4v',10000,2,'2021-11-13 10:46:54',NULL,1),(6,'Caja de Herramientas','Maletin multiple de herramientas',20000,7,'2021-11-13 10:46:54',NULL,1),(7,'Carretilla','Carretilla de Mano. Ref: BT-HT 100',10000,6,'2021-11-13 10:46:54',NULL,1),(8,'Caja de Herramientas','Carro supertank C28',50000,5,'2021-11-13 10:46:54',NULL,1),(9,'LLave Dinamometrica','LLave Dinamometrica version normal',18000,7,'2021-11-13 10:46:54',NULL,1),(10,'Taladro','Taladro percutor GSB 18 2 LI',35000,2,'2021-11-13 10:46:54',NULL,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'thetoolhouse'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 11:57:54
