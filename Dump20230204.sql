CREATE DATABASE  IF NOT EXISTS `db_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_ecommerce`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_ecommerce
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `tb_addresses`
--

DROP TABLE IF EXISTS `tb_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_addresses` (
  `idaddress` int(11) NOT NULL AUTO_INCREMENT,
  `idperson` int(11) NOT NULL,
  `desaddress` varchar(128) NOT NULL,
  `descomplement` varchar(32) DEFAULT NULL,
  `descity` varchar(32) NOT NULL,
  `desstate` varchar(32) NOT NULL,
  `descountry` varchar(32) NOT NULL,
  `nrzipcode` int(11) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idaddress`),
  KEY `fk_addresses_persons_idx` (`idperson`),
  CONSTRAINT `fk_addresses_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_addresses`
--

LOCK TABLES `tb_addresses` WRITE;
/*!40000 ALTER TABLE `tb_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carts`
--

DROP TABLE IF EXISTS `tb_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carts` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `dessessionid` varchar(64) NOT NULL,
  `iduser` int(11) DEFAULT NULL,
  `deszipcode` char(8) DEFAULT NULL,
  `vlfreight` decimal(10,2) DEFAULT NULL,
  `nrdays` int(11) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idcart`),
  KEY `FK_carts_users_idx` (`iduser`),
  CONSTRAINT `fk_carts_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carts`
--

LOCK TABLES `tb_carts` WRITE;
/*!40000 ALTER TABLE `tb_carts` DISABLE KEYS */;
INSERT INTO `tb_carts` VALUES (1,'pl3fmgljgargeac08uug7b09mk',1,NULL,NULL,NULL,'2023-02-03 19:57:40');
/*!40000 ALTER TABLE `tb_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartsproducts`
--

DROP TABLE IF EXISTS `tb_cartsproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cartsproducts` (
  `idcartproduct` int(11) NOT NULL AUTO_INCREMENT,
  `idcart` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `dtremoved` datetime NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idcartproduct`),
  KEY `FK_cartsproducts_carts_idx` (`idcart`),
  KEY `FK_cartsproducts_products_idx` (`idproduct`),
  CONSTRAINT `fk_cartsproducts_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartsproducts_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartsproducts`
--

LOCK TABLES `tb_cartsproducts` WRITE;
/*!40000 ALTER TABLE `tb_cartsproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cartsproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categories`
--

DROP TABLE IF EXISTS `tb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categories` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `descategory` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categories`
--

LOCK TABLES `tb_categories` WRITE;
/*!40000 ALTER TABLE `tb_categories` DISABLE KEYS */;
INSERT INTO `tb_categories` VALUES (2,'apple','2023-02-01 20:47:06'),(3,'android','2023-02-01 20:56:04'),(4,'motorola','2023-02-01 20:56:14'),(5,'samsung','2023-02-01 20:56:19');
/*!40000 ALTER TABLE `tb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `idcart` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL,
  `vltotal` decimal(10,2) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idorder`),
  KEY `FK_orders_carts_idx` (`idcart`),
  KEY `FK_orders_users_idx` (`iduser`),
  KEY `fk_orders_ordersstatus_idx` (`idstatus`),
  CONSTRAINT `fk_orders_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_ordersstatus` FOREIGN KEY (`idstatus`) REFERENCES `tb_ordersstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ordersstatus`
--

DROP TABLE IF EXISTS `tb_ordersstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ordersstatus` (
  `idstatus` int(11) NOT NULL AUTO_INCREMENT,
  `desstatus` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ordersstatus`
--

LOCK TABLES `tb_ordersstatus` WRITE;
/*!40000 ALTER TABLE `tb_ordersstatus` DISABLE KEYS */;
INSERT INTO `tb_ordersstatus` VALUES (1,'Em Aberto','2017-03-13 03:00:00'),(2,'Aguardando Pagamento','2017-03-13 03:00:00'),(3,'Pago','2017-03-13 03:00:00'),(4,'Entregue','2017-03-13 03:00:00');
/*!40000 ALTER TABLE `tb_ordersstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_persons`
--

DROP TABLE IF EXISTS `tb_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_persons` (
  `idperson` int(11) NOT NULL AUTO_INCREMENT,
  `desperson` varchar(64) NOT NULL,
  `desemail` varchar(128) DEFAULT NULL,
  `nrphone` bigint(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_persons`
--

LOCK TABLES `tb_persons` WRITE;
/*!40000 ALTER TABLE `tb_persons` DISABLE KEYS */;
INSERT INTO `tb_persons` VALUES (1,'JoÃ£o Rangel','admin@hcode.com.br',2147483647,'2017-03-01 03:00:00'),(7,'Suporte','suporte@hcode.com.br',1112345678,'2017-03-15 16:10:27'),(10,'Guilherme S','ggtest196@gmail.com',112345678,'2023-01-31 15:31:28'),(11,'Guilher','dev01@sonax.net.br',111111111,'2023-02-01 14:57:39');
/*!40000 ALTER TABLE `tb_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_products` (
  `idproduct` int(11) NOT NULL AUTO_INCREMENT,
  `desproduct` varchar(64) NOT NULL,
  `vlprice` decimal(10,2) NOT NULL,
  `vlwidth` decimal(10,2) NOT NULL,
  `vlheight` decimal(10,2) NOT NULL,
  `vllength` decimal(10,2) NOT NULL,
  `vlweight` decimal(10,2) NOT NULL,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
INSERT INTO `tb_products` VALUES (4,'Ipad 32GB Wi-FI Tela 9,7 Câmera 8MP Prata-Apple',2499.99,0.75,16.95,24.50,0.47,'ipad-32gb','2023-02-02 15:00:39'),(6,'Smartphone Motorola Moto G5 Plus',1135.23,15.20,7.40,0.70,0.16,'smartphone-motorola-moto-g5-plus','2023-02-02 18:41:38'),(7,'Smartphone Moto Z Play',1887.78,14.10,0.90,1.16,0.13,'smartphone-moto-z-play','2023-02-02 18:41:38'),(8,'Smartphone Samsung Galaxy J5 Pro',1299.00,14.60,7.10,0.80,0.16,'smartphone-samsung-galaxy-j5','2023-02-02 18:41:38'),(9,'Smartphone Samsung Galaxy J7 Prime',1149.00,15.10,7.50,0.80,0.16,'smartphone-samsung-galaxy-j7','2023-02-02 18:41:38'),(10,'Smartphone Samsung Galaxy J3 Dual',679.90,14.20,7.10,0.70,0.14,'smartphone-samsung-galaxy-j3','2023-02-02 18:41:38');
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_productscategories`
--

DROP TABLE IF EXISTS `tb_productscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productscategories` (
  `idcategory` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idcategory`,`idproduct`),
  KEY `fk_productscategories_products_idx` (`idproduct`),
  CONSTRAINT `fk_productscategories_categories` FOREIGN KEY (`idcategory`) REFERENCES `tb_categories` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productscategories_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productscategories`
--

LOCK TABLES `tb_productscategories` WRITE;
/*!40000 ALTER TABLE `tb_productscategories` DISABLE KEYS */;
INSERT INTO `tb_productscategories` VALUES (2,4),(3,6),(3,7),(3,8),(3,9),(3,10),(4,6),(4,7),(5,8),(5,9),(5,10);
/*!40000 ALTER TABLE `tb_productscategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `idperson` int(11) NOT NULL,
  `deslogin` varchar(64) NOT NULL,
  `despassword` varchar(256) NOT NULL,
  `inadmin` tinyint(4) NOT NULL DEFAULT 0,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`iduser`),
  KEY `FK_users_persons_idx` (`idperson`),
  CONSTRAINT `fk_users_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (1,1,'admin','$2y$12$YlooCyNvyTji8bPRcrfNfOKnVMmZA9ViM2A3IpFjmrpIbp5ovNmga',1,'2017-03-13 03:00:00'),(7,7,'suporte','$2y$12$HFjgUm/mk1RzTy4ZkJaZBe0Mc/BA2hQyoUckvm.lFa6TesjtNpiMe',1,'2017-03-15 16:10:27'),(10,10,'LytPez','Gjh180202*',1,'2023-01-31 15:31:28'),(11,11,'LytPez','Gjh180202*',1,'2023-02-01 14:57:39');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userslogs`
--

DROP TABLE IF EXISTS `tb_userslogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userslogs` (
  `idlog` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `deslog` varchar(128) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `desuseragent` varchar(128) NOT NULL,
  `dessessionid` varchar(64) NOT NULL,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idlog`),
  KEY `fk_userslogs_users_idx` (`iduser`),
  CONSTRAINT `fk_userslogs_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userslogs`
--

LOCK TABLES `tb_userslogs` WRITE;
/*!40000 ALTER TABLE `tb_userslogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_userslogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userspasswordsrecoveries`
--

DROP TABLE IF EXISTS `tb_userspasswordsrecoveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userspasswordsrecoveries` (
  `idrecovery` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `dtrecovery` datetime DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idrecovery`),
  KEY `fk_userspasswordsrecoveries_users_idx` (`iduser`),
  CONSTRAINT `fk_userspasswordsrecoveries_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userspasswordsrecoveries`
--

LOCK TABLES `tb_userspasswordsrecoveries` WRITE;
/*!40000 ALTER TABLE `tb_userspasswordsrecoveries` DISABLE KEYS */;
INSERT INTO `tb_userspasswordsrecoveries` VALUES (1,7,'127.0.0.1',NULL,'2017-03-15 16:10:59'),(2,7,'127.0.0.1','2017-03-15 13:33:45','2017-03-15 16:11:18'),(3,7,'127.0.0.1','2017-03-15 13:37:35','2017-03-15 16:37:12'),(4,10,'127.0.0.1',NULL,'2023-01-31 17:48:29'),(5,10,'127.0.0.1',NULL,'2023-01-31 17:48:58'),(6,10,'127.0.0.1',NULL,'2023-01-31 17:49:35'),(7,10,'127.0.0.1',NULL,'2023-01-31 17:49:39'),(8,10,'127.0.0.1',NULL,'2023-01-31 17:51:51'),(9,10,'127.0.0.1',NULL,'2023-01-31 18:05:03'),(10,10,'127.0.0.1',NULL,'2023-01-31 18:05:17'),(11,10,'127.0.0.1',NULL,'2023-01-31 18:07:10'),(12,10,'127.0.0.1',NULL,'2023-01-31 18:07:50'),(13,10,'127.0.0.1',NULL,'2023-01-31 18:08:03'),(14,10,'127.0.0.1',NULL,'2023-01-31 18:08:07'),(15,10,'127.0.0.1',NULL,'2023-01-31 18:09:25'),(16,10,'127.0.0.1',NULL,'2023-01-31 18:26:13'),(17,10,'127.0.0.1',NULL,'2023-01-31 18:26:40'),(18,10,'127.0.0.1',NULL,'2023-01-31 18:27:29'),(19,10,'127.0.0.1',NULL,'2023-01-31 18:27:42'),(20,10,'127.0.0.1',NULL,'2023-01-31 18:28:26'),(21,10,'127.0.0.1',NULL,'2023-01-31 18:30:03'),(22,10,'127.0.0.1',NULL,'2023-01-31 18:31:45'),(23,10,'127.0.0.1',NULL,'2023-01-31 18:34:29'),(24,10,'127.0.0.1',NULL,'2023-01-31 18:48:36'),(25,10,'127.0.0.1',NULL,'2023-01-31 18:49:10'),(26,10,'127.0.0.1',NULL,'2023-01-31 18:51:24'),(27,10,'127.0.0.1',NULL,'2023-01-31 18:53:32'),(28,10,'127.0.0.1',NULL,'2023-01-31 19:12:00'),(29,10,'127.0.0.1',NULL,'2023-01-31 19:31:47'),(30,10,'127.0.0.1',NULL,'2023-01-31 20:51:10'),(31,10,'127.0.0.1',NULL,'2023-01-31 20:56:03'),(32,10,'127.0.0.1',NULL,'2023-01-31 20:59:10'),(33,10,'127.0.0.1',NULL,'2023-01-31 21:02:09'),(34,10,'127.0.0.1',NULL,'2023-01-31 21:08:17'),(35,10,'127.0.0.1',NULL,'2023-01-31 21:09:29'),(36,10,'127.0.0.1',NULL,'2023-01-31 21:10:11'),(37,10,'127.0.0.1',NULL,'2023-01-31 21:12:18'),(38,10,'127.0.0.1',NULL,'2023-01-31 21:18:14'),(39,10,'127.0.0.1',NULL,'2023-01-31 21:19:20'),(40,10,'127.0.0.1',NULL,'2023-01-31 21:20:23'),(41,10,'127.0.0.1',NULL,'2023-01-31 21:22:17'),(42,10,'127.0.0.1',NULL,'2023-01-31 21:23:46'),(43,10,'127.0.0.1',NULL,'2023-02-01 12:02:56'),(44,10,'127.0.0.1',NULL,'2023-02-01 12:03:31'),(45,10,'127.0.0.1',NULL,'2023-02-01 14:31:49'),(46,10,'127.0.0.1',NULL,'2023-02-01 14:35:24'),(47,11,'127.0.0.1',NULL,'2023-02-01 14:59:00'),(48,11,'127.0.0.1',NULL,'2023-02-01 15:02:27'),(49,11,'127.0.0.1',NULL,'2023-02-01 15:12:27'),(50,11,'127.0.0.1',NULL,'2023-02-01 15:12:49'),(51,11,'127.0.0.1',NULL,'2023-02-01 15:13:25'),(52,11,'127.0.0.1',NULL,'2023-02-01 15:16:38'),(53,11,'127.0.0.1',NULL,'2023-02-01 15:17:38'),(54,11,'127.0.0.1',NULL,'2023-02-01 15:23:31'),(55,11,'127.0.0.1',NULL,'2023-02-01 15:25:56'),(56,11,'127.0.0.1',NULL,'2023-02-01 15:26:15'),(57,11,'127.0.0.1',NULL,'2023-02-01 15:27:19'),(58,11,'127.0.0.1',NULL,'2023-02-01 15:27:34'),(59,11,'127.0.0.1',NULL,'2023-02-01 15:27:49'),(60,11,'127.0.0.1',NULL,'2023-02-01 15:28:00'),(61,11,'127.0.0.1',NULL,'2023-02-01 15:29:41'),(62,11,'127.0.0.1',NULL,'2023-02-01 15:29:58'),(63,11,'127.0.0.1',NULL,'2023-02-01 15:33:30'),(64,11,'127.0.0.1',NULL,'2023-02-01 15:33:59'),(65,11,'127.0.0.1',NULL,'2023-02-01 15:34:59'),(66,11,'127.0.0.1',NULL,'2023-02-01 15:35:04'),(67,11,'127.0.0.1',NULL,'2023-02-01 15:35:13'),(68,11,'127.0.0.1',NULL,'2023-02-01 15:35:13'),(69,11,'127.0.0.1',NULL,'2023-02-01 15:35:13'),(70,11,'127.0.0.1',NULL,'2023-02-01 15:35:14'),(71,11,'127.0.0.1',NULL,'2023-02-01 15:36:11'),(72,11,'127.0.0.1',NULL,'2023-02-01 15:36:41'),(73,11,'127.0.0.1',NULL,'2023-02-01 15:36:57'),(74,11,'127.0.0.1',NULL,'2023-02-01 15:37:08'),(75,11,'127.0.0.1',NULL,'2023-02-01 15:37:14'),(76,11,'127.0.0.1',NULL,'2023-02-01 15:37:19'),(77,11,'127.0.0.1',NULL,'2023-02-01 15:37:27'),(78,11,'127.0.0.1',NULL,'2023-02-01 15:37:36'),(79,11,'127.0.0.1',NULL,'2023-02-01 15:40:42'),(80,11,'127.0.0.1',NULL,'2023-02-01 15:41:31'),(81,11,'127.0.0.1',NULL,'2023-02-01 15:42:29'),(82,11,'127.0.0.1',NULL,'2023-02-01 15:46:09'),(83,11,'127.0.0.1',NULL,'2023-02-01 15:46:31'),(84,11,'127.0.0.1',NULL,'2023-02-01 15:46:38'),(85,11,'127.0.0.1',NULL,'2023-02-01 15:49:09'),(86,11,'127.0.0.1',NULL,'2023-02-01 15:49:11'),(87,11,'127.0.0.1',NULL,'2023-02-01 15:49:11'),(88,11,'127.0.0.1',NULL,'2023-02-01 15:49:11'),(89,11,'127.0.0.1',NULL,'2023-02-01 15:49:24'),(90,11,'127.0.0.1',NULL,'2023-02-01 15:49:53'),(91,11,'127.0.0.1',NULL,'2023-02-01 15:49:56'),(92,11,'127.0.0.1',NULL,'2023-02-01 15:50:34'),(93,11,'127.0.0.1',NULL,'2023-02-01 15:50:42'),(94,11,'127.0.0.1',NULL,'2023-02-01 15:51:20'),(95,11,'127.0.0.1',NULL,'2023-02-01 15:51:54'),(96,11,'127.0.0.1',NULL,'2023-02-01 15:52:10'),(97,11,'127.0.0.1',NULL,'2023-02-01 15:52:23'),(98,11,'127.0.0.1',NULL,'2023-02-01 15:54:02'),(99,11,'127.0.0.1',NULL,'2023-02-01 17:48:53'),(100,11,'127.0.0.1',NULL,'2023-02-01 17:50:03'),(101,11,'127.0.0.1',NULL,'2023-02-01 17:55:55'),(102,11,'127.0.0.1',NULL,'2023-02-01 17:56:55'),(103,11,'127.0.0.1',NULL,'2023-02-01 17:58:35'),(104,11,'127.0.0.1',NULL,'2023-02-01 17:59:10'),(105,11,'127.0.0.1',NULL,'2023-02-01 18:06:50'),(106,11,'127.0.0.1',NULL,'2023-02-01 18:07:52'),(107,11,'127.0.0.1',NULL,'2023-02-01 18:13:08'),(108,11,'127.0.0.1',NULL,'2023-02-01 18:19:56'),(109,11,'127.0.0.1',NULL,'2023-02-01 18:20:43'),(110,11,'127.0.0.1',NULL,'2023-02-01 18:23:51'),(111,11,'127.0.0.1',NULL,'2023-02-01 18:26:50'),(112,11,'127.0.0.1',NULL,'2023-02-01 18:27:21'),(113,11,'127.0.0.1',NULL,'2023-02-01 18:27:35'),(114,11,'127.0.0.1',NULL,'2023-02-01 18:30:53'),(115,11,'127.0.0.1',NULL,'2023-02-01 18:32:58'),(116,11,'127.0.0.1',NULL,'2023-02-01 18:33:45'),(117,11,'127.0.0.1',NULL,'2023-02-01 18:44:14'),(118,11,'127.0.0.1',NULL,'2023-02-01 18:44:34');
/*!40000 ALTER TABLE `tb_userspasswordsrecoveries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-04 11:46:46
