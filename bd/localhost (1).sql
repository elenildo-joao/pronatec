-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 19, 2014 at 12:01 PM
-- Server version: 5.5.37-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pronatec`
--
CREATE DATABASE IF NOT EXISTS `pronatec` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pronatec`;

-- --------------------------------------------------------

--
-- Table structure for table `alteracao_senha`
--

DROP TABLE IF EXISTS `alteracao_senha`;
CREATE TABLE IF NOT EXISTS `alteracao_senha` (
  `alt_token` int(11) NOT NULL,
  `alt_data_solicitacao` datetime NOT NULL,
  `alt_data_alteracao` datetime DEFAULT NULL,
  `usu_id` int(11) NOT NULL,
  PRIMARY KEY (`alt_token`),
  KEY `fk_AlteracaoSenha_Usuario1_idx` (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
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
  KEY `fk_Aluno_Turma1_idx` (`tur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
CREATE TABLE IF NOT EXISTS `aula` (
  `aul_id` int(11) NOT NULL AUTO_INCREMENT,
  `aul_data` date DEFAULT NULL,
  `tur_id` int(11) NOT NULL,
  PRIMARY KEY (`aul_id`),
  KEY `fk_aula_turma1_idx` (`tur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `cur_id` int(11) NOT NULL AUTO_INCREMENT,
  `cur_nome` varchar(60) NOT NULL,
  `cur_carga_horaria` varchar(45) DEFAULT NULL,
  `cur_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
CREATE TABLE IF NOT EXISTS `frequencia` (
  `fre_id` int(11) NOT NULL AUTO_INCREMENT,
  `fre_presente` tinyint(1) NOT NULL,
  `aul_id` int(11) NOT NULL,
  `alu_id` int(11) NOT NULL,
  PRIMARY KEY (`fre_id`),
  KEY `fk_frequencia_aula1_idx` (`aul_id`),
  KEY `fk_frequencia_aluno1_idx` (`alu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_login` varchar(12) NOT NULL,
  `log_hash_senha` varchar(40) NOT NULL,
  `log_ultimo_acesso` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `tur_id` int(11) NOT NULL AUTO_INCREMENT,
  `tur_nome` varchar(45) DEFAULT NULL,
  `tur_data_inicio` date DEFAULT NULL,
  `tur_data_fim` date DEFAULT NULL,
  `cur_id` int(11) NOT NULL,
  `uni_id` int(11) NOT NULL,
  `tur_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tur_id`),
  KEY `fk_Turma_Curso1_idx` (`cur_id`),
  KEY `fk_Turma_Local1_idx` (`uni_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `unidade_ensino`
--

DROP TABLE IF EXISTS `unidade_ensino`;
CREATE TABLE IF NOT EXISTS `unidade_ensino` (
  `uni_id` int(11) NOT NULL AUTO_INCREMENT,
  `uni_nome` varchar(60) NOT NULL,
  `uni_deletado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uni_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nome` varchar(40) NOT NULL,
  `usu_email` varchar(30) NOT NULL,
  `usu_telefone` varchar(12) DEFAULT NULL,
  `usu_deletado` tinyint(1) DEFAULT NULL,
  `per_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `fk_Usuario_Perfil_idx` (`per_id`),
  KEY `fk_Usuario_Login1_idx` (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_turma`
--
DROP VIEW IF EXISTS `v_turma`;
CREATE TABLE IF NOT EXISTS `v_turma` (
`tur_id` int(11)
,`tur_nome` varchar(45)
,`tur_data_inicio` date
,`tur_data_fim` date
,`tur_deletado` tinyint(1)
,`cur_id` int(11)
,`cur_nome` varchar(60)
,`cur_carga_horaria` varchar(45)
,`uni_id` int(11)
,`uni_nome` varchar(60)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario`
--
DROP VIEW IF EXISTS `v_usuario`;
CREATE TABLE IF NOT EXISTS `v_usuario` (
`usu_id` int(11)
,`usu_nome` varchar(40)
,`usu_email` varchar(30)
,`usu_telefone` varchar(12)
,`usu_deletado` tinyint(1)
,`log_id` int(11)
,`log_login` varchar(12)
,`log_hash_senha` varchar(40)
,`log_ultimo_acesso` datetime
,`per_id` int(11)
,`per_perfil` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `v_turma`
--
DROP TABLE IF EXISTS `v_turma`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_turma` AS select `turma`.`tur_id` AS `tur_id`,`turma`.`tur_nome` AS `tur_nome`,`turma`.`tur_data_inicio` AS `tur_data_inicio`,`turma`.`tur_data_fim` AS `tur_data_fim`,`turma`.`tur_deletado` AS `tur_deletado`,`curso`.`cur_id` AS `cur_id`,`curso`.`cur_nome` AS `cur_nome`,`curso`.`cur_carga_horaria` AS `cur_carga_horaria`,`unidade_ensino`.`uni_id` AS `uni_id`,`unidade_ensino`.`uni_nome` AS `uni_nome` from ((`turma` join `curso` on((`turma`.`cur_id` = `curso`.`cur_id`))) join `unidade_ensino` on((`turma`.`uni_id` = `unidade_ensino`.`uni_id`)));

-- --------------------------------------------------------

--
-- Structure for view `v_usuario`
--
DROP TABLE IF EXISTS `v_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario` AS select `usuario`.`usu_id` AS `usu_id`,`usuario`.`usu_nome` AS `usu_nome`,`usuario`.`usu_email` AS `usu_email`,`usuario`.`usu_telefone` AS `usu_telefone`,`usuario`.`usu_deletado` AS `usu_deletado`,`login`.`log_id` AS `log_id`,`login`.`log_login` AS `log_login`,`login`.`log_hash_senha` AS `log_hash_senha`,`login`.`log_ultimo_acesso` AS `log_ultimo_acesso`,`perfil`.`per_id` AS `per_id`,`perfil`.`per_perfil` AS `per_perfil` from ((`usuario` join `login` on((`usuario`.`log_id` = `login`.`log_id`))) join `perfil` on((`usuario`.`per_id` = `perfil`.`per_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alteracao_senha`
--
ALTER TABLE `alteracao_senha`
  ADD CONSTRAINT `fk_AlteracaoSenha_Usuario1` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_Aluno_Turma1` FOREIGN KEY (`tur_id`) REFERENCES `turma` (`tur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_aula_turma1` FOREIGN KEY (`tur_id`) REFERENCES `turma` (`tur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `frequencia`
--
ALTER TABLE `frequencia`
  ADD CONSTRAINT `fk_frequencia_aluno1` FOREIGN KEY (`alu_id`) REFERENCES `aluno` (`alu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_frequencia_aula1` FOREIGN KEY (`aul_id`) REFERENCES `aula` (`aul_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_Turma_Curso1` FOREIGN KEY (`cur_id`) REFERENCES `curso` (`cur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Turma_Local1` FOREIGN KEY (`uni_id`) REFERENCES `unidade_ensino` (`uni_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Perfil` FOREIGN KEY (`per_id`) REFERENCES `perfil` (`per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Login1` FOREIGN KEY (`log_id`) REFERENCES `login` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
