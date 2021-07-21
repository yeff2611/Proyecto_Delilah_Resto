-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: db_delilah_resto
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.10-MariaDB

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
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Cancelado'),(4,'Nuevo'),(5,'Confimado'),(6,'Preparando'),(7,'Enviando'),(8,'Entregado');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_pedido` varchar(255) DEFAULT NULL,
  `id_estado` int(11) NOT NULL DEFAULT 4,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pedido`),
  KEY `id_estado` (`id_estado`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `tbl_pedido_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `tbl_pedido_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`),
  CONSTRAINT `tbl_pedido_ibfk_3` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tbl_tipo_pago` (`id_tipo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
INSERT INTO `tbl_pedido` VALUES (8,'1pizza small sin champiñones',4,3,2,'2021-07-13 20:04:22'),(9,'1pizza small sin champiñones',4,3,2,'2021-07-13 20:07:46'),(10,'1pizza small sin champiñones',4,3,2,'2021-07-14 23:59:38'),(11,'1pizza small sin champiñones',4,3,2,'2021-07-15 00:18:07'),(12,'1pizza small sin champiñones',4,4,1,'2021-07-15 00:21:06'),(13,'hamburguesa sin cebolla',4,5,3,'2021-07-15 00:23:42'),(14,'hamburguesa sin cebolla',4,5,3,'2021-07-15 00:24:47'),(15,'hamburguesa doble tocineta',4,3,2,'2021-07-15 00:41:26'),(16,'hamburguesa doble tocineta',4,2,1,'2021-07-15 00:46:42'),(17,'hamburguesa doble tocineta',4,2,1,'2021-07-15 16:44:24'),(18,'hamburguesa doble tocineta',4,4,2,'2021-07-15 16:52:41'),(19,'hamburguesa doble tocineta',4,4,3,'2021-07-15 16:55:51'),(20,'hamburguesa doble tocineta',4,4,3,'2021-07-15 16:59:02'),(21,'hamburguesa doble tocineta',4,4,3,'2021-07-15 16:59:35'),(22,'hamburguesa doble tocineta',4,4,3,'2021-07-15 17:02:14'),(23,'hamburguesa doble tocineta',4,4,3,'2021-07-15 17:03:59'),(24,'hamburguesa doble tocineta',4,2,1,'2021-07-15 17:05:46'),(25,'hamburguesa doble tocineta',4,3,2,'2021-07-15 17:13:49'),(26,'hamburguesa doble tocineta, sin lechuga',1,3,1,'2021-07-15 17:14:56'),(27,'hamburguesa doble tocineta',4,2,1,'2021-07-15 22:28:47');
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_producto`
--

DROP TABLE IF EXISTS `tbl_pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido_producto` (
  `id_pedido_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido_producto`,`id_pedido`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `tbl_pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_producto` (`id_producto`),
  CONSTRAINT `tbl_pedido_producto_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_producto`
--

LOCK TABLES `tbl_pedido_producto` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_producto` DISABLE KEYS */;
INSERT INTO `tbl_pedido_producto` VALUES (4,8,1,5),(5,9,3,1),(6,10,3,1),(7,11,3,1),(8,11,4,3),(9,11,1,2),(10,12,5,2),(11,12,2,1),(12,12,3,2),(13,14,5,2),(14,14,2,1),(15,14,3,2),(16,14,1,5),(17,15,1,2),(18,15,2,1),(19,15,3,2),(20,15,4,3),(21,16,5,2),(22,16,2,1),(23,16,3,2),(24,16,4,3),(25,18,4,3),(26,19,4,3),(27,19,4,3),(28,23,3,2),(29,23,2,1),(30,23,1,2),(31,23,4,3),(32,24,1,2),(33,24,2,5),(34,25,3,3),(35,25,2,4),(36,26,1,1),(37,26,2,3),(38,26,3,2),(39,26,4,3),(40,26,5,4),(41,27,1,2),(42,27,2,3),(43,27,3,6);
/*!40000 ALTER TABLE `tbl_pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `costo_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto`
--

LOCK TABLES `tbl_producto` WRITE;
/*!40000 ALTER TABLE `tbl_producto` DISABLE KEYS */;
INSERT INTO `tbl_producto` VALUES (1,'Hamburguesa XL','Hamburguesa extra grande',15000),(2,'Pizza peper','Pizza doble queso y peperoni',12000),(3,'Quesadilla mex','Quesadilla mexicana',14000),(4,'Ceviche Camaron','Coctel ceviche de camaron',22000),(5,'Cerveza','Cerveza rubia',5000),(6,'Coca cola','Gaseosa coca cola',3000),(8,'Punta de Anca','Carne de contextura gruesa',20000),(9,'Solomito','Solomito de cerdo',22000);
/*!40000 ALTER TABLE `tbl_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) NOT NULL,
  `descripcion_rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES (1,'Administrador','Este rol permite acceso total a todas las funcionalidades'),(2,'Viewer','Este rol solo permite consultas');
/*!40000 ALTER TABLE `tbl_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_pago`
--

DROP TABLE IF EXISTS `tbl_tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_pago` varchar(255) NOT NULL,
  `descripcion_tipo_pago` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_pago`
--

LOCK TABLES `tbl_tipo_pago` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_pago` DISABLE KEYS */;
INSERT INTO `tbl_tipo_pago` VALUES (1,'Efectivo','Pago en efectivo'),(2,'Tarjeta de Credito','Pago con todas las tarjetas de credito'),(3,'Tarjeta Debido','Pago con todas las tarjetas debito'),(4,'Paypal','Pago electronico por medio de paypal');
/*!40000 ALTER TABLE `tbl_tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `tbl_usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'Armando123','123456','Armando','Caceres','arman@correo.com',5556666,'Cra 1 #43 - 55',1),(2,'Carola2525','321','Carola','Marin','Carola@correo.com',4457766,'Cra 8 #43 - 72',2),(3,'Ander1420','98765','Anderson','Restrepo','andres@correo.com',3332528,'Cra 15 #88 - 33',2),(4,'yef125','253535','Yeff','Vargas','yvargas@correo.com',56565,'Cra 1 #43 - 55',2),(5,'yefferson12','123455','Yefferson','Vargas','correo@correo.com',215445,'Cra 22 #55 - 78',2),(7,'yefferson12','123456','Yefferson','Vargas','correo1@correo.com',215445,'Cra 22 #55 - 78',2),(8,'samu2525','123456','samuel','Vargas','samu@correo.com',5554444,'Cra 33 #55 - 22',2);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_delilah_resto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-21 18:45:19
