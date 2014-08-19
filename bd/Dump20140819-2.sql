CREATE DATABASE  IF NOT EXISTS `pronatec` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pronatec`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pronatec
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `alteracao_senha`
--

DROP TABLE IF EXISTS `alteracao_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alteracao_senha` (
  `alt_token` int(11) NOT NULL,
  `alt_data_solicitacao` datetime NOT NULL,
  `alt_data_alteracao` datetime DEFAULT NULL,
  `usu_id` int(11) NOT NULL,
  PRIMARY KEY (`alt_token`),
  KEY `fk_AlteracaoSenha_Usuario1_idx` (`usu_id`),
  CONSTRAINT `fk_AlteracaoSenha_Usuario1` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `alu_id` int(11) NOT NULL AUTO_INCREMENT,
  `alu_nome` varchar(45) NOT NULL,
  `alu_matricula` varchar(45) NOT NULL,
  `alu_telefone` varchar(45) DEFAULT NULL,
  `alu_celular` varchar(45) DEFAULT NULL,
  `alu_email` varchar(45) DEFAULT NULL,
  `alu_data_nasc` date DEFAULT NULL,
  `alu_sexo` char(1) DEFAULT NULL,
  `alu_cpf` varchar(45) DEFAULT NULL,
  `tur_id` int(11) NOT NULL,
  PRIMARY KEY (`alu_id`),
  KEY `fk_Aluno_Turma1_idx` (`tur_id`),
  CONSTRAINT `fk_Aluno_Turma1` FOREIGN KEY (`tur_id`) REFERENCES `turma` (`tur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `aul_id` int(11) NOT NULL AUTO_INCREMENT,
  `aul_data` date DEFAULT NULL,
  `tur_id` int(11) NOT NULL,
  PRIMARY KEY (`aul_id`),
  KEY `fk_aula_turma1_idx` (`tur_id`),
  CONSTRAINT `fk_aula_turma1` FOREIGN KEY (`tur_id`) REFERENCES `turma` (`tur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `cur_id` int(11) NOT NULL AUTO_INCREMENT,
  `cur_nome` varchar(60) NOT NULL,
  `cur_carga_horaria` varchar(45) DEFAULT NULL,
  `cur_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencia` (
  `fre_id` int(11) NOT NULL AUTO_INCREMENT,
  `fre_presente` tinyint(1) NOT NULL,
  `aul_id` int(11) NOT NULL,
  `alu_id` int(11) NOT NULL,
  PRIMARY KEY (`fre_id`),
  KEY `fk_frequencia_aula1_idx` (`aul_id`),
  KEY `fk_frequencia_aluno1_idx` (`alu_id`),
  CONSTRAINT `fk_frequencia_aluno1` FOREIGN KEY (`alu_id`) REFERENCES `aluno` (`alu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frequencia_aula1` FOREIGN KEY (`aul_id`) REFERENCES `aula` (`aul_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_login` varchar(12) NOT NULL,
  `log_hash_senha` varchar(40) NOT NULL,
  `log_ultimo_acesso` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `tur_id` int(11) NOT NULL AUTO_INCREMENT,
  `tur_nome` varchar(45) DEFAULT NULL,
  `tur_data_inicio` date DEFAULT NULL,
  `tur_data_fim` date DEFAULT NULL,
  `cur_id` int(11) NOT NULL,
  `uni_id` int(11) NOT NULL,
  `tur_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tur_id`),
  KEY `fk_Turma_Curso1_idx` (`cur_id`),
  KEY `fk_Turma_Local1_idx` (`uni_id`),
  CONSTRAINT `fk_Turma_Curso1` FOREIGN KEY (`cur_id`) REFERENCES `curso` (`cur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Local1` FOREIGN KEY (`uni_id`) REFERENCES `unidade_ensino` (`uni_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade_ensino`
--

DROP TABLE IF EXISTS `unidade_ensino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_ensino` (
  `uni_id` int(11) NOT NULL AUTO_INCREMENT,
  `uni_nome` varchar(60) NOT NULL,
  `uni_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uni_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nome` varchar(40) NOT NULL,
  `usu_email` varchar(30) NOT NULL,
  `usu_telefone` varchar(12) DEFAULT NULL,
  `usu_deletado` tinyint(1) DEFAULT NULL,
  `per_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `fk_Usuario_Perfil_idx` (`per_id`),
  KEY `fk_Usuario_Login1_idx` (`log_id`),
  CONSTRAINT `fk_Usuario_Perfil` FOREIGN KEY (`per_id`) REFERENCES `perfil` (`per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Login1` FOREIGN KEY (`log_id`) REFERENCES `login` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_turma`
--

DROP TABLE IF EXISTS `v_turma`;
/*!50001 DROP VIEW IF EXISTS `v_turma`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_turma` (
  `tur_id` tinyint NOT NULL,
  `tur_nome` tinyint NOT NULL,
  `tur_data_inicio` tinyint NOT NULL,
  `tur_data_fim` tinyint NOT NULL,
  `tur_deletado` tinyint NOT NULL,
  `cur_id` tinyint NOT NULL,
  `cur_nome` tinyint NOT NULL,
  `cur_carga_horaria` tinyint NOT NULL,
  `uni_id` tinyint NOT NULL,
  `uni_nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_usuario`
--

DROP TABLE IF EXISTS `v_usuario`;
/*!50001 DROP VIEW IF EXISTS `v_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_usuario` (
  `usu_id` tinyint NOT NULL,
  `usu_nome` tinyint NOT NULL,
  `usu_email` tinyint NOT NULL,
  `usu_telefone` tinyint NOT NULL,
  `usu_deletado` tinyint NOT NULL,
  `log_id` tinyint NOT NULL,
  `log_login` tinyint NOT NULL,
  `log_hash_senha` tinyint NOT NULL,
  `log_ultimo_acesso` tinyint NOT NULL,
  `per_id` tinyint NOT NULL,
  `per_perfil` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'pronatec'
--

--
-- Dumping routines for database 'pronatec'
--

--
-- Final view structure for view `v_turma`
--

/*!50001 DROP TABLE IF EXISTS `v_turma`*/;
/*!50001 DROP VIEW IF EXISTS `v_turma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_turma` AS select `turma`.`tur_id` AS `tur_id`,`turma`.`tur_nome` AS `tur_nome`,`turma`.`tur_data_inicio` AS `tur_data_inicio`,`turma`.`tur_data_fim` AS `tur_data_fim`,`turma`.`tur_deletado` AS `tur_deletado`,`curso`.`cur_id` AS `cur_id`,`curso`.`cur_nome` AS `cur_nome`,`curso`.`cur_carga_horaria` AS `cur_carga_horaria`,`unidade_ensino`.`uni_id` AS `uni_id`,`unidade_ensino`.`uni_nome` AS `uni_nome` from ((`turma` join `curso` on((`turma`.`cur_id` = `curso`.`cur_id`))) join `unidade_ensino` on((`turma`.`uni_id` = `unidade_ensino`.`uni_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usuario`
--

/*!50001 DROP TABLE IF EXISTS `v_usuario`*/;
/*!50001 DROP VIEW IF EXISTS `v_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usuario` AS select `usuario`.`usu_id` AS `usu_id`,`usuario`.`usu_nome` AS `usu_nome`,`usuario`.`usu_email` AS `usu_email`,`usuario`.`usu_telefone` AS `usu_telefone`,`usuario`.`usu_deletado` AS `usu_deletado`,`login`.`log_id` AS `log_id`,`login`.`log_login` AS `log_login`,`login`.`log_hash_senha` AS `log_hash_senha`,`login`.`log_ultimo_acesso` AS `log_ultimo_acesso`,`perfil`.`per_id` AS `per_id`,`perfil`.`per_perfil` AS `per_perfil` from ((`usuario` join `login` on((`usuario`.`log_id` = `login`.`log_id`))) join `perfil` on((`usuario`.`per_id` = `perfil`.`per_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-19  8:53:49
