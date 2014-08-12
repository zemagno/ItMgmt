-- MySQL dump 10.13  Distrib 5.6.11, for osx10.7 (x86_64)
--
-- Host: localhost    Database: tasklist_development
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `custom_de_paras`
--

DROP TABLE IF EXISTS `custom_de_paras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_de_paras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `de` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `para` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_de_paras`
--

LOCK TABLES `custom_de_paras` WRITE;
/*!40000 ALTER TABLE `custom_de_paras` DISABLE KEYS */;
INSERT INTO `custom_de_paras` VALUES (227,'RJ - BRQ HOME-OFFICE (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(228,'SP - BRQ BOAVISTA (SÃO PAULO)','Boa Vista','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(229,'RJ - BRQ (RIO DE JANEIRO)','Teofilo','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(230,'RJ - BRQ HOME-OFFICE (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(231,'CE - BRQ (FORTALEZA)','Unifor','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(232,'SP - BRQ ALPHAVILLE (BARUERI)','Alphaville','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(233,'PR - BRQ MARECHAL (CURITIBA)','Marechal','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(234,'SP - BRQ GUIDO CALOI (SÃO PAULO)','Panamerica Park','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(235,'PE - BRQ (RECIFE)','Recife','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(236,'RN - BRQ (NATAL)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(237,'DF - BRQ (BRASÍLIA)','BSB','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(238,'RJ - EBX SERRADOR (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(239,'SP - BRQ HOME-OFFICE (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(240,'SP - VIVO (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(241,'SP - CLARO (SÃO PAULO - MORUMBI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(242,'SP - CLARO (SÃO PAULO - ITAIM BIBI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(243,'SP - NEC (SÃO PAULO - ANGÉLICA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(244,'SP - NEXTEL (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(245,'RN - COSERN (ASSU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(246,'RN - COSERN (CAICÓ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(247,'RN - COSERN (CEARÁ MIRIM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(248,'RN - COSERN (CURRAIS NOVOS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(249,'RN - COSERN (EXTREMOZ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(250,'RN - COSERN (GOIANINHA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(251,'RN - COSERN (JOÃO CÂMARA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(252,'RN - COSERN (MACAÍBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(253,'RN - COSERN (MACAU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(254,'RN - COSERN (MOSSORÓ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(255,'RN - COSERN (NATAL)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(256,'RN - COSERN (NATAL - ALECRIM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(257,'RN - COSERN (NATAL - VIA DIRETA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(258,'RN - COSERN (NATAL - ZONA NORTE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(259,'RN - COSERN (PARNAMIRIM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(260,'RN - COSERN (PAU DOS FERROS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(261,'RN - COSERN (SANTA CRUZ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(262,'RN - COSERN (SÃO GONÇALO DO AMARANTE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(263,'RN - COSERN (SÃO JOSÉ DE MIPIBU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(264,'RN - COSERN (SÃO PAULO DO POTENGI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(265,'RN - COSERN (TOUROS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(266,'RN - COSERN (NOVA CRUZ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(267,'SP - RAPIDAO COMETA (SUMARE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(268,'PE - CELPE (AFOGADOS DA INGAZEIRA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(269,'PE - CELPE (ÁGUAS BELAS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(270,'PE - CELPE (ARARIPINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(271,'PE - CELPE (ARCOVERDE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(272,'PE - CELPE (BARREIROS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(273,'PE - CELPE (BELÉM DE SÃO FRANCISCO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(274,'PE - CELPE (BELO JARDIM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(275,'PE - CELPE (CABO DE SANTO AGOSTINHO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(276,'PE - CELPE (CAMARAGIBE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(277,'PE - CELPE (CARPINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(278,'PE - CELPE (CARUARU - BELEM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(279,'PE - CELPE (CARUARU - VIGARIO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(280,'PE - CELPE (GARANHUNS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(281,'PE - CELPE (GOIANA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(282,'PE - CELPE (GRAVATÁ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(283,'PE - CELPE (IBIMIRIM)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(284,'PE - CELPE (IGARASSU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(285,'PE - CELPE (RECIFE - IMBIRIBEIRA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(286,'PE - CELPE (IPOJUCA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(287,'PE - CELPE (JABOATÃO DOS GUARARAPES - AV BARRETO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(288,'PE - CELPE (JABOATÃO DOS GUARARAPES - PÇA. SEVERINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(289,'PE - CELPE (JABOATÃO DOS GUARARAPES - PE. LEAO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(290,'PE - CELPE (LIMOEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(291,'PE - CELPE (OLINDA - AV KENNEDY)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(292,'PE - CELPE (OLINDA - AV OLINDA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(293,'PE - CELPE (OLINDA - DR. FRANCISCO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(294,'PE - CELPE (OURICURI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(295,'PE - CELPE (PALMARES)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(296,'PE - CELPE (PAULISTA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(297,'PE - CELPE (PETROLÂNDIA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(298,'PE - CELPE (PETROLINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(299,'PE - CELPE (RECIFE - ARMANDO GAIOSO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(300,'PE - CELPE (RECIFE - CARLOS GOMES)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(301,'PE - CELPE (RECIFE - CAXANGA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(302,'PE - CELPE (RECIFE - CONDE BOA VISTA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(303,'PE - CELPE (RECIFE - JEQUITINHONHA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(304,'PE - CELPE (RECIFE - JOAO DE BARROS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(305,'PE - CELPE (RECIFE - JULIO RAMOS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(306,'PE - CELPE (RECIFE - RUA VELHA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(307,'PE - CELPE (RIBEIRÃO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(308,'PE - CELPE (SALGUEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(309,'PE - CELPE (SÃO JOSÉ DO EGITO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(310,'PE - CELPE (SÃO LOURENÇO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(311,'PE - CELPE (SERRA TALHADA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(312,'PE - CELPE (STª CRUZ DO CAPIBARIBE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(313,'PE - CELPE (STª MARIA DA BOA VISTA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(314,'PE - CELPE (TIMBAUBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(315,'PE - CELPE (VITÓRIA DE SANTO ANTÃO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(316,'PE - PETROQUIMICA (RECIFE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(317,'PE - RAPIDÃO COMETA (RECIFE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(318,'PE - BRQ HOME OFFICE (RECIFE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(319,'AM - RAPIDÃO COMETA (MANAUS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(320,'SP - FEDEX SAOWK (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(321,'BA - RAPIDÃO COMETA (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(322,'SP - RAPIDÃO COMETA (GUARULHOS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(323,'SP - PETROQUÍMICA SUAPE (CAMPINAS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(324,'SC - RAPIDÃO COMETA (ITAJAÍ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(325,'RJ - RAPIDÃO COMETA (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(326,'BA - TRANSPETRO (SANTO ANTONIO DE JESUS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(327,'RJ - NEOENERGIA (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(328,'BA - PETROBRAS BIOCOMBUSTÍVEIS (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(329,'PI - PETROBRAS BIOCOMBUSTÍVEIS (TERESINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(330,'BA - BRQ (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(331,'BA - COELBA (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(332,'CE - BNB (FORTALEZA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(333,'SP - RAPIDÃO COMETA (BARUERI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(334,'CE - UNIMED (FORTALEZA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(335,'CE - PETROBRAS BIOCOMBUSTIVEIS (FORTALEZA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(336,'AL - PETROBRAS (PILAR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(337,'BA - PETROBRAS (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(338,'BA - TRANSPETRO (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(339,'RN - COSERN (NISIA FLORESTA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(340,'BA - COELBA (ITABUNA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(341,'SE - TRANSPETRO (ARACAJU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(342,'SE - TRT (ARACAJU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(343,'SE - PETROBRAS (ARACAJU)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(344,'GO - BRQ HOME-OFFICE (GOIANIA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(345,'RJ - BRADESCO SEGUROS (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(346,'RJ - GLOBOSAT (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(347,'RJ - SEGURADORA LÍDER (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(348,'SP - SCHAHIN VERGUEIRO (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(349,'RJ - PETROBRAS CITI (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(350,'RJ - ANP (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(351,'ES - PETROBRAS (VITÓRIA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(352,'MA - EBX (SÃO LUIS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(353,'MG - EBX (BRUMADINHO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(354,'RJ - BRQ ICOMAP (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(355,'RJ - ELETROBRAS (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(356,'RJ - FAPES (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(357,'RJ - SULAMÉRICA SEGUROS (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(358,'RJ - DASA (DUQUE DE CAXIAS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(359,'RJ - PETROBRAS VENTURA (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(360,'SP - SCHAHIN (VOTUPORANGA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(361,'SP - PETROBRAS REPLAN (PAULÍNIA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(362,'CE - EBX (FORTALEZA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(363,'RJ - SCHAHIN (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(364,'RJ - SCHAHIN (MACAÉ)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(365,'RJ - IBM/EMBARCADO (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(366,'RJ - IBM/VALE (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(367,'RJ - PETROBRAS CASTELO (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(368,'RJ - PETROBRAS EDISE (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(369,'MS - PETROBRAS (TRÊS LAGOAS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(370,'RJ - EBX PRAIA DO FLAMENGO (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(371,'RJ - FURNAS (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(372,'RJ - EBX (SÃO JOÃO DA BARRA - GUILHERMINA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(373,'RJ - PETROBRAS SENADO TORRE A  4 ANDAR (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(374,'RJ - PETROBRAS SENADO TORRE B  8 ANDAR (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(375,'RJ - PETROBRAS SENADO TORRE B  5 ANDAR (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(376,'MG - EBX (BELO HORIZONTE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(377,'BA - PETROBRAS USINA (SÃO FRANCISCO DO CONDE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(378,'MA - IBM (SANTO ANTONIO DOS LOPES)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(379,'MG - SCHAHIN (LAGOA SANTA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(380,'SP - BRQ MURANO (BARUERI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(381,'PR - GVT (CURITIBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(382,'PR - GVT EVOLUTION (CURITIBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(383,'PR - SASCAR (SÃO JOSÉ DOS PINHAIS)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(384,'PR - UNINTER (CURITIBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(385,'PR - VOLVO (CURITIBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(386,'PR - BANCO PETRA (CURITIBA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(387,'SP - LIBERTY (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(388,'SP - PRODESP (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(389,'SP - PRODESP (TABOAO DA SERRA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(390,'SP - TICKET (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(391,'SP - SANTANDER - CASA 3 (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(392,'SP - CARREFOUR (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(393,'SP - CCEE (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(394,'SP - PERNAMBUCANAS (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(395,'SP - RHODIA (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(396,'SP - PEARSON (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(397,'SP - SCANIA (SÃO BERNARDO DO CAMPO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(398,'SP - GRUPO PÃO DE AÇUCAR (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(399,'SP - NOVA PONTOCOM (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(400,'SP - BANK OF AMERICA (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(401,'SP - BTG PACTUAL (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(402,'RJ - BTG PACTUAL (RIO DE JANEIRO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(403,'SP - ITAU CTO (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(404,'SP - BRADESCO CIDADE DE DEUS (OSASCO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(405,'SP - BRADESCO NUCLEO ALPHAVILLE (BARUERI)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(406,'SP - ITAU - CAU (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(407,'SP - CITIBANK MATARAZZO (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(408,'SP - PORTO SEGURO (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(409,'SP - BRQ BOAVISTA - 6 ANDAR (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(410,'SP - BANCO VOLKSWAGEN (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(411,'SP - ITAU BBA (SÃO PAULO - WTORRE)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(412,'SP - BANCO ORIGINAL (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(413,'SP - WHIRPOOL (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(414,'SP - ITAU BBA (SÃO PAULO - FARIA LIMA)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(415,'SP - ITAU AUTO E RESIDÊNCIA (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(416,'SP - BM&F (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(417,'BA - BRQ HOME-OFFICE (SALVADOR)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(418,'SP - ITAU BBA (SÃO PAULO - MARGINAL)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(419,'SP - CITIBANK PAULISTA (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(420,'SP - CITI BRASIL (BTSC) (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(421,'SP - VOTORANTIN (SÃO PAULO)\n','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(422,'SP - CIELO (BARUERI)','BRQ','RM','2014-08-10 14:46:19','2014-08-10 14:46:19'),(423,'MEDIA GATEWAY ALPHAVILLE','Alphaville','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(424,'MEDIA GATEWAY TEOFILO','Teofilo','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(425,'MEDIA GATEWAY VILA OLIMPIA','Boa Vista','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(426,'MEDIA GATEWAY MARECHAL','Marechal','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(427,'MEDIA GATEWAY UNIFOR','Unifor','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(428,'MEDIA GATEWAY BSB','Bsb','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(429,'MEDIA GATEWAY PANAMERIKA PARK','Panamerica Park','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(430,'MEDIA GATEWAY BOA VISTA','Boa Vista','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(431,'INTERFACE CELULAR ZENITE','Boa Vista','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26'),(432,'SIP SERVER SP','BRQ','Mediagw','2014-08-10 14:46:26','2014-08-10 14:46:26');
/*!40000 ALTER TABLE `custom_de_paras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-10 11:48:56
