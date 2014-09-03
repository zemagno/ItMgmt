-- MySQL dump 10.13  Distrib 5.1.45, for apple-darwin10.2.0 (i386)
--
-- Host: localhost    Database: tasklist_development
-- ------------------------------------------------------
-- Server version	5.1.45

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
-- Table structure for table `checklists`
--

DROP TABLE IF EXISTS `checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `users` varchar(255) DEFAULT NULL,
  `tipoci_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo_checklist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_checklists_on_tipoci_id` (`tipoci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklists`
--

LOCK TABLES `checklists` WRITE;
/*!40000 ALTER TABLE `checklists` DISABLE KEYS */;
INSERT INTO `checklists` VALUES (7,'Alterar Senha CORE','nsantos',3,'0000-00-00 00:00:00','2013-12-31 01:46:39',0),(8,'Entrega Novo Andar ou Movimentar equipe entre sites',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(9,'Instalação Novo FW ou Recuperar Backup FW','',3,'0000-00-00 00:00:00','2014-04-09 17:25:36',0),(10,'Instalacao Novo Link',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(11,'Automação de VPN e Contigencias','',3,'0000-00-00 00:00:00','2014-04-09 17:26:55',0),(12,'Inclusao de Rota Simples no Firewall',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(13,'Desligar DC',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(14,'Horário de Verão','',3,'0000-00-00 00:00:00','2014-04-09 20:17:58',0),(15,'Criacao de Servidor','',32,'0000-00-00 00:00:00','2014-08-26 13:10:50',0),(16,'Liberação de Ambiente','',3,'0000-00-00 00:00:00','2014-04-09 17:27:14',0),(17,'Revisao de Servidor',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(18,'Desligar Link',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(19,'Devoluçãoo site','',3,'0000-00-00 00:00:00','2014-04-09 17:27:27',0),(20,'Movimentar equipamentos entre sites',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(21,'GMUD',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(22,'GMUD Menor',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(23,'Parada DC Teofilo','cfelicio',3,'2013-12-25 15:07:47','2013-12-25 15:07:47',0),(25,'Inclusao Servidor na Monitoracao','monitoracao',32,'2014-08-26 13:08:00','2014-08-26 13:08:00',NULL),(26,'Criacao Backup Servidor','backup',32,'2014-08-26 13:08:58','2014-08-26 13:08:58',NULL),(27,'Negociar com Magno e Cesar','',3,'2014-08-26 15:47:28','2014-08-26 15:47:28',NULL),(28,'Negociar com o Papa','',3,'2014-08-26 15:53:17','2014-08-26 15:53:17',NULL),(29,'Checklist Pai somente para testes','',3,'2014-08-26 17:08:13','2014-08-26 17:08:13',NULL),(30,'Checklist Pai somente para testes - 2','',3,'2014-08-26 17:09:03','2014-08-26 17:09:03',NULL);
/*!40000 ALTER TABLE `checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exec_checklists`
--

DROP TABLE IF EXISTS `exec_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exec_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inicioexec` date DEFAULT NULL,
  `fimexec` date DEFAULT NULL,
  `tipoci_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tickets` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_checklist_id` int(11) DEFAULT NULL,
  `checklist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_exec_checklists_on_tipoci_id` (`tipoci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exec_checklists`
--

LOCK TABLES `exec_checklists` WRITE;
/*!40000 ALTER TABLE `exec_checklists` DISABLE KEYS */;
INSERT INTO `exec_checklists` VALUES (1,'Desligar DC','','',NULL,NULL,NULL,'2014-08-21 20:13:38','2014-08-21 20:13:38',NULL,4,NULL),(2,'Desligar DC','','',NULL,NULL,NULL,'2014-08-21 20:16:12','2014-08-21 20:16:12',NULL,4,NULL),(3,'Parada DC Teofilo','','cfelicio',NULL,NULL,NULL,'2014-08-21 20:26:16','2014-08-21 20:26:16',NULL,4,NULL),(4,'Parada DC Teofilo','','cfelicio',NULL,NULL,NULL,'2014-08-21 20:26:58','2014-08-21 20:26:58',NULL,4,NULL),(5,'Parada DC Teofilo','','cfelicio',NULL,NULL,NULL,'2014-08-24 12:21:11','2014-08-24 12:21:11',NULL,4,23),(6,'Parada DC Teofilo','','cfelicio',NULL,NULL,NULL,'2014-08-24 12:26:52','2014-08-24 12:26:52',NULL,4,23);
/*!40000 ALTER TABLE `exec_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exec_itens_checklists`
--

DROP TABLE IF EXISTS `exec_itens_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exec_itens_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exec_checklist_id` int(11) DEFAULT NULL,
  `status_checklist_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tickets` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exec_itens_checklists`
--

LOCK TABLES `exec_itens_checklists` WRITE;
/*!40000 ALTER TABLE `exec_itens_checklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `exec_itens_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heranca_checklists`
--

DROP TABLE IF EXISTS `heranca_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heranca_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pai_id` int(11) DEFAULT NULL,
  `filho_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo_heranca` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heranca_checklists`
--

LOCK TABLES `heranca_checklists` WRITE;
/*!40000 ALTER TABLE `heranca_checklists` DISABLE KEYS */;
INSERT INTO `heranca_checklists` VALUES (4,21,7,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(5,21,8,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(6,21,9,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(7,21,10,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(8,21,11,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(9,21,12,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(10,21,13,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(12,21,15,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(13,21,16,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(14,21,17,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(15,21,18,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(16,21,19,'2013-12-25 12:53:30','2013-12-25 12:53:30',0),(19,13,23,'2013-12-25 13:08:09','2013-12-25 13:08:09',0),(20,21,23,'2013-12-25 14:07:13','2013-12-25 14:07:13',0),(21,26,15,'2014-08-26 13:26:32','2014-08-26 13:26:32',1),(22,25,15,'2014-08-26 13:27:09','2014-08-26 13:27:09',1),(23,23,14,'2014-08-26 13:37:13','2014-08-26 13:37:13',1),(24,21,14,'2014-08-26 13:39:53','2014-08-26 13:39:53',0),(25,27,14,'2014-08-26 15:47:55','2014-08-26 15:47:55',0),(26,28,21,'2014-08-26 15:54:25','2014-08-26 15:54:25',0),(27,29,14,'2014-08-26 17:08:43','2014-08-26 17:08:43',1),(28,30,23,'2014-08-26 17:10:09','2014-08-26 17:10:09',1);
/*!40000 ALTER TABLE `heranca_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_checklists`
--

DROP TABLE IF EXISTS `status_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_checklists`
--

LOCK TABLES `status_checklists` WRITE;
/*!40000 ALTER TABLE `status_checklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_checklists`
--

DROP TABLE IF EXISTS `tipo_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_checklists`
--

LOCK TABLES `tipo_checklists` WRITE;
/*!40000 ALTER TABLE `tipo_checklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_checklists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-28  9:30:37
