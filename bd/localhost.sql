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

--
-- Dumping data for table `aluno`
--

INSERT INTO `aluno` (`alu_id`, `alu_nome`, `alu_matricula`, `alu_telefone`, `alu_celular`, `alu_email`, `alu_data_nasc`, `alu_sexo`, `alu_cpf`, `tur_id`) VALUES
(1, 'ANA MARIA DOS SANTOS AMARAL', '3771421', '4525383518', '7332411326', '9391185018', NULL, NULL, '9721000000000000', 3),
(2, 'ANA PAULA SOUZA COSTA', '3771561', '7332411326', '7381451184', NULL, NULL, NULL, '4931366570', 3),
(3, 'ANDRIELLE BARBOSA DOS ANJOS', '3771372', '7332411326', '9391351168', NULL, NULL, NULL, '5327054594', 3),
(4, 'BEATRIZ SANTOS REIS', '3771578', '7332411326', '7391406117', NULL, NULL, NULL, '85910401556', 3),
(5, 'CAIALLA RODRIGUES SANTOS', '3771403', '7332411326', '7381827133', NULL, NULL, NULL, '3140058543', 3),
(6, 'DAIANE SANTOS DA SILVA', '3771522', '4994912548', '7332411326', '7381960938', NULL, NULL, '2602200000000000', 3),
(7, 'DANIELA NUNES DA SILVA', '3771546', '4994913510', '7332411326', '7382243211', NULL, NULL, '2.6022E+16', 3),
(8, 'DIMAS CORREIA SANTOS', '3771497', '7332411326', '7382075653', NULL, NULL, NULL, '5756629564', 3),
(9, 'ELISANE DOS SANTOS PINHEIRO', '3771616', '7332411326', '7391181548', NULL, NULL, NULL, '1367607590', 3),
(10, 'GUSTAVO BATISTA DA SILVA', '3771312', '7332411326', '7381340436', NULL, NULL, NULL, '3759839533', 3),
(11, 'JANETE OLIVEIRA SANTOS', '3771389', '4848933510', '7332411326', '7381243793', NULL, NULL, '6.3681E+16', 3),
(12, 'KAYZZA SANTOS E SANTOS', '3771588', '7332411326', '7381981776', NULL, NULL, NULL, '86088651571', 3),
(13, 'LEIDIANA FRANCA DOS SANTOS', '3771626', '7332411326', '7381645105', NULL, NULL, NULL, '99406209500', 3),
(14, 'LUCAS SOLIDADE SANTOS', '3771471', '7332411326', '7381312137', NULL, NULL, NULL, '5238628579', 3),
(15, 'MARCELA SANTOS SOUZA', '3771455', '7332411326', '7381623703', NULL, NULL, NULL, '86089778508', 3),
(16, 'MARIA ALICE DE JESUS SOARES', '3771332', '7332411326', '7391649178', NULL, NULL, NULL, '85910468545', 3),
(17, 'POLIANA FERREIRA DOS SANTOS', '3771601', '7332411326', '7391957208', NULL, NULL, NULL, '1296088588', 3),
(18, 'SILAS SANTOS OLIVEIRA', '3771299', '7332411326', '7181944074', NULL, NULL, NULL, '4755282551', 3),
(19, 'TELMA DOS SANTOS BULHOES', '3771611', '7332411326', '7391377584', NULL, NULL, NULL, '39836754504', 3),
(20, 'VALERIA NERES DE JESUS', '3771351', '4831305596', '7332411326', '7381745135', NULL, NULL, '6.5436E+16', 3);

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

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`cur_id`, `cur_nome`, `cur_carga_horaria`, `cur_deletado`) VALUES
(1, 'Agente de alimentação escolar', '200', NULL),
(2, 'Agente de gestão de resíduos sólidos', '200', NULL),
(3, 'Agente de informações turísticas', '200', NULL),
(4, 'Assistente de operação de logística portuária', '200', NULL),
(5, 'Assistente de planejamento e controle de produção', '200', NULL),
(6, 'Assistente de produção cultural', '200', NULL),
(7, 'Auxiliar administrativo', '200', NULL),
(8, 'Auxiliar de cozinha', '200', NULL),
(9, 'Auxiliar de garçom', '200', NULL),
(10, 'Camareira em meios de hospedagem', '200', NULL),
(11, 'Cuidador de idoso', '200', NULL),
(12, 'Espanhol aplicado a serviços turísticos', '200', NULL),
(13, 'Espanhol básico', '200', NULL),
(14, 'Inglês aplicado a serviços turísticos', '200', NULL),
(15, 'Inglês básico', '200', NULL),
(16, 'Vendedor', '200', NULL),
(17, 'Cobrador de ônibus coletivo urbano', '200', NULL),
(18, 'Costureiro industrial do vestuário', '200', NULL),
(19, 'Espanhol intermediário', '200', NULL),
(20, 'Inglês intermediário', '200', NULL),
(21, 'Auxiliar de recursos humanos', '200', NULL),
(22, 'Churrasqueiro', '200', NULL),
(23, 'Cuidador infantil', '200', NULL),
(24, 'TESTE', '200', 1);

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

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `log_login`, `log_hash_senha`, `log_ultimo_acesso`) VALUES
(1, 'elenildo', 'dadf48f307504f8fe3772a1bc060591028520957', NULL),
(3, 'fabricio', 'f800e56c0846b22e3a76eb04c3d31ba8746527fa', NULL),
(4, 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', NULL),
(5, 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', NULL),
(6, 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', NULL),
(7, 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', NULL);

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

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`per_id`, `per_perfil`) VALUES
(1, 'Apoio às atividades acadêmicas e administrativas'),
(2, 'Coordenador'),
(3, 'Orientador'),
(4, 'Professor'),
(5, 'Supervisor de curso'),
(6, 'Apoio às atividades acadêmicas e administrativas'),
(7, 'Coordenador'),
(8, 'Orientador'),
(9, 'Professor'),
(10, 'Supervisor de curso');

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

--
-- Dumping data for table `turma`
--

INSERT INTO `turma` (`tur_id`, `tur_nome`, `tur_data_inicio`, `tur_data_fim`, `cur_id`, `uni_id`, `tur_deletado`) VALUES
(3, 'Teste', '0000-00-00', '0000-00-00', 1, 3, NULL);

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

--
-- Dumping data for table `unidade_ensino`
--

INSERT INTO `unidade_ensino` (`uni_id`, `uni_nome`, `uni_deletado`) VALUES
(1, 'IFBA Campus Ilhéus', NULL),
(2, 'Escola Heitor Dias - Unidade de Apoio Ilhéus', NULL),
(3, 'Colégio Ação Fraternal de Itabuna - Unidade de Apoio Itabuna', NULL),
(4, 'Unidade de Apoio Barro Preto', NULL),
(5, 'Unidade de Apoio Coaraci', NULL),
(6, 'Unidade de Apoio Itapé', NULL),
(7, 'foda', 1),
(8, 'teste', 1);

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

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nome`, `usu_email`, `usu_telefone`, `usu_deletado`, `per_id`, `log_id`) VALUES
(1, 'Elenildo João', 'elenildo.joao@gmail.com', '7391940231', NULL, 1, 1),
(3, 'Jorge Fabrício', 'jorge@gmail.com', '7388888888', NULL, 5, 3);

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
