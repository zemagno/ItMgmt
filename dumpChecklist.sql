-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklists`
--

LOCK TABLES `checklists` WRITE;
/*!40000 ALTER TABLE `checklists` DISABLE KEYS */;
INSERT INTO `checklists` VALUES (7,'Alterar Senha CORE','nsantos',3,'0000-00-00 00:00:00','2013-12-31 01:46:39',1),(8,'Entrega Novo Andar ou Movimentar equipe entre sites',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(9,'InstalaÃ§Ã£o Novo FW ou Recuperar Backup FW',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(10,'Instalacao Novo Link',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(11,'AutomaÃ§Ã£o de VPN e Contigencias',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(12,'Inclusao de Rota Simples no Firewall',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(13,'Desligar DC',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(14,'HorÃ¡rio de VerÃ£o',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(15,'Criacao de Servidor',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(16,'LiberaÃ§Ã£o de Ambiente',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(17,'Revisao de Servidor',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(18,'Desligar Link',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(19,'DevoluÃ§Ã£o site',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(20,'Movimentar equipamentos entre sites',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(21,'GMUD',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(22,'GMUD Menor',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(23,'Parada DC Teofilo','cfelicio',3,'2013-12-25 15:07:47','2013-12-25 15:07:47',NULL);
/*!40000 ALTER TABLE `checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_checklists`
--

DROP TABLE IF EXISTS `itens_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_id` int(11) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `users` varchar(255) DEFAULT NULL,
  `cis` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `TipoAberturaTicket` varchar(20) DEFAULT NULL,
  `tipo_checklist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_itens_checklists_on_checklist_id` (`checklist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_checklists`
--

LOCK TABLES `itens_checklists` WRITE;
/*!40000 ALTER TABLE `itens_checklists` DISABLE KEYS */;
INSERT INTO `itens_checklists` VALUES (20,7,'Verificar Script provisionamento CA IdMgmt ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(21,7,'Verificar sync granite','','','0000-00-00 00:00:00','2013-12-25 14:41:24','Comentario',1),(22,7,'Alterar senhas do ESX, FW, Roteadores, Switches (expandir lista pelo CMDB) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(23,7,'Alterar senhas do AD ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(24,7,'Cada um alterar senha Shadow (expandir lista pelo CMDB) ','','','0000-00-00 00:00:00','2013-12-25 14:41:48','Comentario',1),(25,7,'Mapear usuÃ¡rios do AD que sÃ£o ADM do Dominio. (UsuÃ¡rios de Sistemas) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(26,7,'Mudar senha com aplicaÃ§Ãµes de terceiros (Portal da gerencia/GVT, Umonitor/L3 e etc) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(27,8,'Verificar numero descritores Firewall para prever aumento de recursos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(28,8,'Verificar quais clientes necessitam ser acessados para inclusÃ£oi de rotas ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(29,8,'Verificar acessos especiais em proxy, firewall, etc (tanto backoffice quanto projetos) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(30,8,'Montar mapeando de pessoas ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(31,20,'Levantar numeros de patrimonio ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(32,20,'Emitir Nota Fiscal ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(33,12,'Checar: Existe rota conflitante ou mais generica/mais especifica ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(34,12,'Existe alguma VPN automatica ou contigencia /bla bla bla ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(35,12,'Ã‰ necessÃ¡rio colocar rotas com o Fornecedor Externo ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(36,9,'Verificar nÃºmero descritores Firewall para prever aumento de recursos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(37,9,'Verificar alteracoes recentes no Firewall que possam nao ter sido aplicadas no backup do firewall ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(38,9,'Desligar e ligar estaÃ§Ã£o para verificar se DHCP forneceu IP ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(39,10,'Criar CI no CMDB e Registrar dependencias e impactos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(40,10,'Criar monitoraÃ§Ã£o e registrar no CI do link ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(41,10,'Criar ou atualizar Contratos (Cesar) e registrar no CI do link ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(42,10,'Analisar como serÃ¡ contigencia ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(43,10,'Analisar rotas de outros sites (novas, refazer atuais, etc) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(44,10,'Atualizar todos desenhos de rede (desenho com e sem nome de cliente, por exemplo)  ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(45,10,'Testar acessos requeridos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(46,10,'Testar contigencias ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(47,10,'Atualizar relatorio do gestor/diretor da Torre ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(48,13,'Negociar com Impactados ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(49,13,'Testar telefonia interna ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(50,13,'Testar telefonia externa ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(51,13,'Testar sistemas internos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(52,13,'Testar impressÃ£o  ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(53,13,'Testar internet ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(54,13,'Testar conexoes com clientes (mapear quais clientes) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(55,13,'Testar mainframe com o cliente ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(56,14,'Ver o documento deste link=> https://docs.google.com/a/brq.com/spreadsheet/ccc?key=0Age7GKvZkPnqdDFMOVduOFN0THB1d0k2cFBhMFM4ZWc&usp=sharing ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(57,15,'Incluir no procedimento de backup ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(58,15,'Incluir Servidor na monitoracao ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(59,15,'Incluir no CacTI ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(60,15,'Incluir ServiÃ§os na monitoraÃ§Ã£o ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(61,16,'Excluir do CacTI ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(62,16,'Excluir do HM ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(63,17,'Verificar se servidor ainda esta em uso ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(64,17,'Verificar quais servicos rodam no servidor e atualizar CMDB (email; \"alem dos servicos (x,y,z), quais outros serviÃ§os rodam nesse servidor?\") ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(65,17,'Atualizar Hostmonitor para novos servicos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(66,17,'Revisar backup. (email: O backup atual contempla x,y,x com tempo de retencao a,b,c\") ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(67,18,'Avisar financeiro ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(68,18,'Desativar no CMDB ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(69,19,'Mover VPNs para outro site ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(70,19,'Mover range de ramais para outro site ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(71,19,'Pedir cancelamento de E1 ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(72,19,'Pedir Cancelamento de Links ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(73,19,'Mover Links de Cliente para outros site ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(74,19,'Rever procedimento de contigencias (pode herdar de um checklist mais generico de contigencia) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(75,19,'Planejar EspaÃ§o para estoque de Equipamentos ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(76,19,'Cancelar contratos (impressora, ironmoutain) ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(77,19,'Verificar se tem central telefonia na localidade e planejar movimentacao ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(78,21,'Foi Testado ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(79,21,'Foi prÃ©-negociado com as Ã¡reas envolvidas ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(80,21,'ComunicaÃ§Ã£o Externa OK ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(81,21,'ComunicaÃ§Ã£o Interna OK ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(82,21,'Necessita notificar Ã¡rea de suporte interno ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(83,21,'Necessita treinamento para Ã¡rea de suporte interno ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(84,21,'Plano de instalaÃ§Ã£o OK ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(85,21,'Plano de Roll-Back OK ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(86,21,'Planos foram aprovados ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(87,21,'Existe impacto em outros elementos do DC ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(88,21,'Existe plano de teste pÃ³s-implementaÃ§Ã£o ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(89,21,'UsuÃ¡rios para testes pÃ³s-implementaÃ§Ã£o foram mobilizados ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(90,21,'Entidades externas foram notificadas e mobilizadas ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(91,21,'Necessita de aÃ§Ã£o das entidades externas ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(92,21,'Enviar comunicado para alta direcao com mudancas da semana ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Novo Ticket',1),(93,22,'Foi Testado ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(94,22,'ComunicaÃ§Ã£o Interna OK ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(95,22,'Necessita notificar Ã¡rea de suporte interno ? ',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Comentario',1),(96,23,'Verificar replicacao entre granite e BV','','','2013-12-25 16:01:32','2013-12-25 16:18:32','Comentario',1),(97,23,'Verificar conexao de estacao com RM SP','','','2013-12-25 16:02:17','2013-12-25 16:18:23','Comentario',1);
/*!40000 ALTER TABLE `itens_checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_checklists`
--

DROP TABLE IF EXISTS `status_checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_checklists`
--

LOCK TABLES `status_checklists` WRITE;
/*!40000 ALTER TABLE `status_checklists` DISABLE KEYS */;
INSERT INTO `status_checklists` VALUES (1,'Executado','001_06.png','2013-12-08 22:17:35','2013-12-08 22:17:35'),(2,'Falha de execucao','001_05.png','2013-12-08 22:19:03','2013-12-08 22:19:03'),(3,'Em Andamento','001_39.png','2013-12-08 22:19:18','2013-12-08 22:19:18'),(4,'Aberto','001_35.png','2013-12-08 22:20:20','2013-12-08 22:20:20'),(5,'Cancelado','001_30.png','2013-12-08 22:24:12','2013-12-08 22:24:12');
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
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_checklists`
--

LOCK TABLES `tipo_checklists` WRITE;
/*!40000 ALTER TABLE `tipo_checklists` DISABLE KEYS */;
INSERT INTO `tipo_checklists` VALUES (1,'GMUD','2013-12-24 01:36:19','2013-12-24 01:36:19'),(2,'Novo Requisito','2013-12-24 01:36:33','2013-12-24 01:36:33');
/*!40000 ALTER TABLE `tipo_checklists` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heranca_checklists`
--

LOCK TABLES `heranca_checklists` WRITE;
/*!40000 ALTER TABLE `heranca_checklists` DISABLE KEYS */;
INSERT INTO `heranca_checklists` VALUES (4,21,7,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(5,21,8,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(6,21,9,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(7,21,10,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(8,21,11,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(9,21,12,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(10,21,13,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(12,21,15,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(13,21,16,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(14,21,17,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(15,21,18,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(16,21,19,'2013-12-25 12:53:30','2013-12-25 12:53:30'),(19,13,23,'2013-12-25 13:08:09','2013-12-25 13:08:09'),(20,21,23,'2013-12-25 14:07:13','2013-12-25 14:07:13');
/*!40000 ALTER TABLE `heranca_checklists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-09 10:00:09
