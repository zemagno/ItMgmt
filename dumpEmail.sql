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
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'cobrancacontratos','TO','contratos@brq.com,compras@brq.com','2012-10-31 19:06:06','2014-01-25 14:00:45'),(2,'cobrancacontratos','CC','magno@brq.com',NULL,'2013-10-01 13:15:03'),(3,'cobrancacontratos','BODY','Bom dia,\r\nSegue fatura referente a {{contrato_descricao}}.\r\n\r\nValor    :{{contrato_valor}}\r\nCC       :{{contrato_projetoCCTI}}\r\nClassif. :{{contrato_classificacao}}\r\n\r\n','2014-01-25 11:58:37','2014-01-25 23:53:22'),(4,'cobrancacontratos','SUBJECT','APROVACAO: Fatura {{contrato_fornecedor_nome}} - {{contrato_valor}}','2014-01-25 11:58:43','2014-01-26 00:03:47'),(5,'servidor_sem_espaco','TO','{{ci_owner}},{{ci_notificacao}}','2014-02-04 22:43:50','2014-02-05 01:46:55'),(6,'servidor_sem_espaco','SUBJECT','[dc] Alerta - {{ci_chave}}','2014-02-04 22:43:54','2014-02-05 01:46:30'),(7,'servidor_sem_espaco','CC',NULL,'2014-02-04 22:43:58','2014-02-05 01:18:04'),(8,'servidor_sem_espaco','BODY','Prezados,\r\n\r\nBoa Noite,\r\n\r\nInformamos que o espaço em disco da unidade C do servidor {{ci_chave}} está com ___ de espaço livre.\r\n\r\n\r\nAtt,','2014-02-04 22:44:03','2014-02-05 01:47:04'),(13,'servidor_down','TO','{{ci_owner}},{{ci_notificacao}}','2014-02-06 00:38:35','2014-02-06 01:12:37'),(14,'servidor_down','CC',NULL,'2014-02-06 00:38:35','2014-02-06 00:38:35'),(15,'servidor_down','SUBJECT',NULL,'2014-02-06 00:38:35','2014-02-06 00:38:35'),(16,'servidor_down','BODY',NULL,'2014-02-06 00:38:35','2014-02-06 00:38:35'),(29,'cobrar_cc','TO','','2014-02-06 01:04:08','2014-02-06 01:12:31'),(30,'cobrar_cc','CC','a','2014-02-06 01:04:08','2014-02-06 01:06:31'),(31,'cobrar_cc','SUBJECT','a','2014-02-06 01:04:09','2014-02-06 01:06:36'),(32,'cobrar_cc','BODY','a','2014-02-06 01:04:09','2014-02-06 01:06:39');
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_templates`
--

DROP TABLE IF EXISTS `sql_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handler` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partial` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_templates`
--

LOCK TABLES `sql_templates` WRITE;
/*!40000 ALTER TABLE `sql_templates` DISABLE KEYS */;
INSERT INTO `sql_templates` VALUES (2,'Alerta aberto pelo NOC....\r\n\r\n<p>\r\n  	\r\n<% if @task.ci %>\r\n  <p><%= \"CI: #{@task.ci.chave}\" =%>\r\n  \r\n<% end %>\r\n\r\n<p><b>Evento:</b><%= @task.nome %>\r\n<p><b>Descricao:</b><%= content_tag(\'pre\',@task.description) %>\r\n\r\n<p><b>Alerta Publico ?</b><%= @task.publica ? \'Sim\' : \'Nao\' %>\r\n<p><b>Tipo de Alerta:</b><%= @task.tipotask %>\r\n<p><b>Status do Alerta:</b><%= @task.status %>\r\n<p><b>Criticidade:</b><%= @task.criticidade.name %>\r\n<p><b>Status:</b><%= \"#{@task.status} em #{@task.criado_em} por #{@task.author.name}\" %>\r\n<p><b>Fornecedor:</b><%= @task.fornecedor.nome %>\r\n<p><b>Chamado:</b><%= @task.chamado %>\r\n<p><b>Solicitante:</b><%= @task.solicitante %>\r\n<p><b>Cliente:</b><%= @task.category.name %>\r\n<p><b>Site:</b><%= @task.site.nome %> ','ci_mailer/alerta_incidente','html','en','erb',0,'0000-00-00 00:00:00','2014-02-02 13:03:01'),(4,'<h1>Problema com servidor</h1>\r\n\r\nBom dia, \r\n\r\nO seguinte servidor esta com problema. Favor entrar em contato com o NOC no ramal (21xxxz):\r\n\r\n<p><%= \"#{@ci.tipoci.tipo}:#{@ci.chave}\" %>,</p>\r\n<p>Descricao: <%= @ci.descricao %>,</p>\r\n<p>Responsavel: <%= @ci.Owner %>,</p>\r\n<p>IP: <%= @ci._IP %></p>\r\n<p>Servicos existente nesse servidor: <%= @ci._Servicos %></p>\r\n\r\nObrigado','ci_mailer/problema_servidor','html','en','erb',0,'0000-00-00 00:00:00','2014-02-02 11:07:36'),(5,'<h1>Revalidação de Servidores</h1>\r\n\r\nBom dia, \r\n\r\nPrecisamos revalidar algumas informações do servidor abaixo:\r\n\r\n<p>Descricao: <%= @ci.descricao %>,</p>\r\n<p>Responsavel: <%= @ci.Owner %>,</p>\r\n<p>IP: <%= @ci.atributos[6][1] %></p>\r\n<p>Servicos existente nesse servidor: <%= @ci.atributos[9][1] %></p>\r\n\r\n<h2>Por favor, responda a esse email validando as informações acima.</h2>\r\n\r\nObrigado pela ajuda\r\nBRQ IT Services','ci_mailer/revalidar_servidor','html','en','erb',0,'0000-00-00 00:00:00','2014-01-21 00:09:25');
/*!40000 ALTER TABLE `sql_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates_emails`
--

DROP TABLE IF EXISTS `templates_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sync` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates_emails`
--

LOCK TABLES `templates_emails` WRITE;
/*!40000 ALTER TABLE `templates_emails` DISABLE KEYS */;
INSERT INTO `templates_emails` VALUES (1,'CI','revalidar_servidor','Revalidar Servidor','servidor virtual','0000-00-00 00:00:00','2014-02-05 00:36:54',0),(2,'CI','problema_servidor','Servidor com Problemas','servidor virtual','0000-00-00 00:00:00','2014-02-05 00:39:48',0),(3,'CI','servidor_sem_espaco','Falta de Espaco em Disco','servidor virtual','2014-02-05 00:39:15','2014-02-05 00:39:15',1),(4,'CONTRATOS','cobrancacontratos','Cobrar Contratos','','2014-02-04 23:37:21','2014-02-04 23:37:21',0),(5,'CI','servidor_down','Servidor Down','servidor virtual','2014-02-06 00:31:52','2014-02-06 00:31:52',1),(14,'CONTRATOS','cobrar_cc','Cobrar CC','','2014-02-06 01:04:08','2014-02-06 01:04:08',1);
/*!40000 ALTER TABLE `templates_emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-17 21:26:31
