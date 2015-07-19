-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tasklist_development
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `Login` varchar(30) NOT NULL DEFAULT '',
  `NumMatrProfissional` int(11) DEFAULT NULL,
  `NomProfissional` varchar(50) DEFAULT NULL,
  `DtaAdmissao` date DEFAULT NULL,
  `DtaDemissao` date DEFAULT NULL,
  `NomEmailBRQ` varchar(50) DEFAULT NULL,
  `IdtCPF` varchar(20) DEFAULT NULL,
  `IdtRG` varchar(20) DEFAULT NULL,
  `IdtCodigoCentroCusto` varchar(10) DEFAULT NULL,
  `NomCentroCusto` varchar(255) DEFAULT NULL,
  `NomTipoCentroCusto` varchar(255) DEFAULT NULL,
  `OwnerCC` varchar(255) DEFAULT NULL,
  `IdtCodigoSecao` varchar(10) DEFAULT NULL,
  `NomLocalTrabalho` varchar(50) DEFAULT NULL,
  `NomCidadeLocalTrabalho` varchar(50) DEFAULT NULL,
  `IdtCentroCustoTorre` varchar(10) DEFAULT NULL,
  `DscCentroCustoTorre` varchar(50) DEFAULT NULL,
  `NomAlocacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES ('andrea',285,'andrea','0000-00-00','0000-00-00','magno@brq.com','966150797/04','073257230','C3731','Infra','Backoffice','Benj','1','Teofilo BRQ','SP','a','a','interno'),('magno',285,'jose carlos magno','0000-00-00','0000-00-00','magno@brq.com','966150797/04','073257230','C3731','Infra','Backoffice','Andrea','1','Teofilo BRQ','Rio de Janeiro','a','a','interno');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-19  8:43:29
