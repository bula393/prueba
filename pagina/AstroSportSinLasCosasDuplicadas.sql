-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: astro-sport
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `nombre` varchar(45) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('botines',0),('guantes de arquero',1),('remeras',2),('kits entre',3),('accesorios',4),('calzado',5);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `fecha` date DEFAULT NULL,
  `targetaDePago` varchar(45) DEFAULT NULL,
  `precioFinal` varchar(45) DEFAULT NULL,
  `Cliente_Dni` int DEFAULT NULL,
  `Producto_Codigo` int DEFAULT NULL,
  KEY `Cliente_Dni` (`Cliente_Dni`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Cliente_Dni`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `dni` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idEstado` int DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Codigo` int NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `subcategoria_idsubcategoria` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_productos_subcategoria1_idx` (`subcategoria_idsubcategoria`),
  CONSTRAINT `fk_productos_subcategoria1` FOREIGN KEY (`subcategoria_idsubcategoria`) REFERENCES `subcategoria` (`idsubcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (0,'nike','mercurial superfly',110,0,'imagenesBOTINES-taponesBOTINES-tapones1.jpg'),(1,'puma','ultra ultimate',90,0,'imagenesBOTINES-taponesBOTINES-tapones2.jpg'),(2,'puma','future 7',77,0,'imagenesBOTINES-taponesBOTINES-tapones3.jpg'),(3,'puma','future ultimate',89,0,'imagenesBOTINES-taponesBOTINES-tapones4.jpg'),(4,'nike','mercurial vapor 14 academy fg',70,0,'imagenesBOTINES-taponesBOTINES-tapones5.jpg'),(5,'nike','mercurial vapor 14 academy mg',80,0,'imagenesBOTINES-taponesBOTINES-tapones6.jpg'),(6,'adidas','predator',105,0,'imagenesBOTINES-taponesBOTINES-tapones7.jpg'),(7,'adidas','X 18',95,0,'imagenesBOTINES-taponesBOTINES-tapones8.jpg'),(9,'umbro','pro 5',80,1,'imagenesBOTINES-s-taponesBotinDeFutsal1.webp'),(10,'kelme','indoor copa',75,1,'imagenesBOTINES-s-taponesBotinDeFutsal2.jpg'),(11,'adidas','X crazy fast legue tf',95,1,'imagenesBOTINES-s-taponesBotinDeFutsal3.webp'),(12,'nike','mercurial vapor 15 academy',120,1,'imagenesBOTINES-s-taponesBotinDeFutsal4.webp'),(13,'puma','future match',75,1,'imagenesBOTINES-s-taponesBotinDeFutsal5.png'),(14,'umbro','pro 6',85,1,'imagenesBOTINES-s-taponesBotinDeFutsal6.jpg'),(15,'umbro','pro 5 bump dragon',90,1,'imagenesBOTINES-s-taponesBotinDeFutsal7.webp'),(16,'nike','tiempo leyend 9',65,1,'imagenesBOTINES-s-taponesBotinDeFutsal8.webp'),(17,'reusch','attrakt starter',40,2,'imagenesguantesguantes1.jpg'),(18,'DRB','leader 22',55,2,'imagenesguantesguantes2.jpg'),(19,'DRB','leader 22 pro',35,2,'imagenesguantesguantes3.png'),(20,'DRB','master 22',60,2,'imagenesguantesguantes4.jpg'),(21,'DRB','feline 22',55,2,'imagenesguantesguantes5.png'),(22,'reusch','attrakt infinity',40,2,'imagenesguantesguantes6.jpg'),(23,'reusch','pure contact',60,2,'imagenesguantesguantes7.jpg'),(24,'VGFC','turnen',55,2,'imagenesguantesguantes8.jpg'),(25,'puma','ultra grip',35,3,'imagenesguantesguantes9.jpg'),(26,'VGFC','bursa',70,3,'imagenesguantesguantesflat1.jpg'),(27,'VGFC','roth',50,3,'imagenesguantesguantesflat2.jpg'),(28,'shinestone','kalesi',30,3,'imagenesguantesguantesflat3.webp'),(29,'reusch','attakt fusion',40,3,'imagenesguantesguantesflat4.webp'),(30,'ho','protek blade',40,3,'imagenesguantesguantesflat5.jpg'),(31,'ho','arena',20,3,'imagenesguantesguantesflat6.jpg'),(32,'ho','axilal',20,3,'imagenesguantesguantesflat7.jpg'),(33,'amago','los pumas',25,4,'imagenesmusculasas\remeraM1.jpg'),(34,'imago','dry lite',25,4,'imagenesmusculasas\remeraM2.jpg'),(35,'imago','tawhiri',23,4,'imagenesmusculasas\remeraM3.jpg'),(36,'adidas','boca',30,4,'imagenesmusculasas\remeraM5.webp'),(37,'adidas','river',30,4,'imagenesmusculasas\remeraM6.jpg'),(38,'puma','indeoendiente',20,4,'imagenesmusculasas\remeraM7.jpeg'),(39,'kappa','racing',18,4,'imagenesmusculasas\remeraM8.jpg'),(40,'nike','barcelona',35,4,'imagenesmusculasas\remerasM11.jpg'),(41,'imago','microfibra',18,5,'imagenes\remeras-depor\remera1.jpg'),(42,'puma','manchater city',50,5,'imagenes\remeras-depor\remera3.jpg'),(43,'underarmor','tela fit',18,5,'imagenes\remeras-depor\remera4.jpg'),(44,'aidas','argentina',30,5,'imagenes\remeras-depor\remera5.jpg'),(45,'reebok','atletic dept',22,5,'imagenes\remeras-depor\remera6.jpg'),(46,NULL,'roja',12,5,'imagenes\remeras-depor\remera2.jpg'),(47,'adidas','real madrid',50,5,'imagenes\remeras-depor\remera9.jpg'),(48,'sg','local',20,5,'imagenes\remeras-depor\remera7.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `idsubcategoria` int NOT NULL,
  `categoria_id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsubcategoria`),
  KEY `fk_subcategoria_categoria1_idx` (`categoria_id`),
  CONSTRAINT `fk_subcategoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
INSERT INTO `subcategoria` VALUES (0,0,'botines con tapones'),(1,0,'botines sin tapones'),(2,1,'Corte Negativo'),(3,1,'Corte Flat'),(4,2,'muscualosas'),(5,2,'deportivas'),(6,3,'campo'),(7,3,'gym'),(8,4,'tren superior'),(9,4,'tren inferior'),(10,5,'deportivo'),(11,5,'de calle');
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 21:35:43
