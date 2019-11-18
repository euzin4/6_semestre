-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18/11/2019 às 14:36
-- Versão do servidor: 10.1.34-MariaDB
-- Versão do PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `id10903184_site_aposta`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apostas`
--

CREATE TABLE `apostas` (
  `id_aposta` int(11) NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_partida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `campeonatos`
--

CREATE TABLE `campeonatos` (
  `id_camp` int(11) NOT NULL,
  `tipo_camp` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(3) NOT NULL,
  `horario_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `horario_termino` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `campeonatos`
--

INSERT INTO `campeonatos` (`id_camp`, `tipo_camp`, `nome`, `sigla`, `horario_inicio`, `horario_termino`) VALUES
(1, 1, 'camp 1', 'cp1', '2018-12-12 02:00:00', '2018-12-13 02:00:00'),
(2, 2, 'camp 2', 'CP2', '2018-12-13 02:00:00', '2018-12-14 02:00:00'),
(3, 3, 'camp 3', 'CP3', '2018-12-14 02:00:00', '2018-12-15 02:00:00'),
(4, 1, 'camp 4', 'CP4', '2018-12-16 02:00:00', '2018-12-17 02:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_games`
--

CREATE TABLE `categoria_games` (
  `nome` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipes`
--

CREATE TABLE `equipes` (
  `id_equipe` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `id_game` int(11) NOT NULL,
  `sigla` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `equipes`
--

INSERT INTO `equipes` (`id_equipe`, `nome`, `id_game`, `sigla`) VALUES
(1, 'time a', 2, 'TMA'),
(2, 'time b', 2, 'TMB'),
(3, 'time c', 1, 'TMC'),
(4, 'time d', 1, 'TMD'),
(5, 'time e', 3, 'TME'),
(6, 'time f', 3, 'TMF'),
(7, 'time g', 4, 'TMG'),
(8, 'time h', 4, 'TMH');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id_game` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `games`
--

INSERT INTO `games` (`id_game`, `nome`) VALUES
(1, 'League of Legends'),
(2, 'Counter-Strike: Global Offensive'),
(3, 'Dota 2'),
(4, 'Tom Clancy\'s Rainbow Six Siege');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_login`
--

CREATE TABLE `log_login` (
  `id_log` int(11) NOT NULL,
  `senha_log` varchar(100) NOT NULL,
  `data_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_ender` varchar(100) NOT NULL,
  `email_log` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `log_login`
--

INSERT INTO `log_login` (`id_log`, `senha_log`, `data_access`, `ip_ender`, `email_log`) VALUES
(1, '111111', '2019-11-11 17:41:04', '127.0.0.1', 'a@b.c');

--
-- Gatilhos `log_login`
--
DELIMITER $$
CREATE TRIGGER `insere_data_acesso_log` BEFORE INSERT ON `log_login` FOR EACH ROW SET NEW.data_access = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `participantes`
--

CREATE TABLE `participantes` (
  `id_equipe` int(11) NOT NULL,
  `id_camp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `participantes`
--

INSERT INTO `participantes` (`id_equipe`, `id_camp`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partidas`
--

CREATE TABLE `partidas` (
  `id_partida` int(11) NOT NULL,
  `horario_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `horario_termino` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_equipe1` int(11) NOT NULL,
  `id_equipe2` int(11) NOT NULL,
  `pontos_equipe1` int(11) DEFAULT NULL,
  `pontos_equipe2` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_campeonato` int(11) NOT NULL,
  `id_camp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `partidas`
--

INSERT INTO `partidas` (`id_partida`, `horario_inicio`, `horario_termino`, `id_equipe1`, `id_equipe2`, `pontos_equipe1`, `pontos_equipe2`, `data_cadastro`, `id_campeonato`, `id_camp`) VALUES
(1, '2019-11-11 18:00:24', '2018-12-12 15:00:00', 1, 2, 0, 1, '2019-11-11 17:48:19', 0, 1),
(2, '2019-11-11 18:00:29', '2018-12-13 15:00:00', 3, 4, 3, 2, '2019-11-11 17:57:38', 0, 2),
(3, '2019-11-11 18:00:59', '2018-12-14 15:00:00', 5, 6, 2, 0, '2019-11-11 17:58:13', 0, 3),
(4, '2019-11-11 18:00:39', '2018-12-16 15:00:00', 7, 8, 1, 3, '2019-11-11 17:58:49', 0, 4),
(5, '2018-12-16 20:00:00', '2018-12-16 20:00:00', 7, 8, NULL, NULL, '2019-11-11 20:01:12', 0, 4);

--
-- Gatilhos `partidas`
--
DELIMITER $$
CREATE TRIGGER `insere_data_cadastro_partidas` BEFORE INSERT ON `partidas` FOR EACH ROW SET NEW.data_cadastro = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipagem`
--

CREATE TABLE `tipagem` (
  `id_categoria` int(11) NOT NULL,
  `id_game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `nome` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nasc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sexo` char(1) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `saldo` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`nome`, `nickname`, `email`, `data_nasc`, `sexo`, `senha`, `tipo_usuario`, `saldo`) VALUES
('Admin001', 'admin001', 'a@b.c', '2019-11-11 17:39:39', 'm', '96e79218965eb72c92a549dd5a330112', 0, '1000.00');

--
-- Gatilhos `usuarios`
--
DELIMITER $$
CREATE TRIGGER `insere_saldo_usuario` BEFORE INSERT ON `usuarios` FOR EACH ROW SET NEW.saldo = 1000
$$
DELIMITER ;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `apostas`
--
ALTER TABLE `apostas`
  ADD PRIMARY KEY (`id_aposta`),
  ADD KEY `fk_apostas_usuarios` (`email`),
  ADD KEY `fk_apostas_partidas` (`id_partida`);

--
-- Índices de tabela `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD PRIMARY KEY (`id_camp`);

--
-- Índices de tabela `categoria_games`
--
ALTER TABLE `categoria_games`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id_equipe`),
  ADD KEY `fk_equipes_games` (`id_game`);

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id_game`);

--
-- Índices de tabela `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id_log`);

--
-- Índices de tabela `participantes`
--
ALTER TABLE `participantes`
  ADD KEY `fk_participantes_equipes` (`id_equipe`),
  ADD KEY `fk_participantes_campeonatos` (`id_camp`);

--
-- Índices de tabela `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `fk_partidas_campeonatos` (`id_camp`);

--
-- Índices de tabela `tipagem`
--
ALTER TABLE `tipagem`
  ADD KEY `fk_tipagem_categoria_games` (`id_categoria`),
  ADD KEY `fk_tipagem_games` (`id_game`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `apostas`
--
ALTER TABLE `apostas`
  MODIFY `id_aposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `campeonatos`
--
ALTER TABLE `campeonatos`
  MODIFY `id_camp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria_games`
--
ALTER TABLE `categoria_games`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id_game` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `apostas`
--
ALTER TABLE `apostas`
  ADD CONSTRAINT `fk_apostas_partidas` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`),
  ADD CONSTRAINT `fk_apostas_usuarios` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`);

--
-- Restrições para tabelas `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `fk_equipes_games` FOREIGN KEY (`id_game`) REFERENCES `games` (`id_game`);

--
-- Restrições para tabelas `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `fk_participantes_campeonatos` FOREIGN KEY (`id_camp`) REFERENCES `campeonatos` (`id_camp`),
  ADD CONSTRAINT `fk_participantes_equipes` FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id_equipe`);

--
-- Restrições para tabelas `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `fk_partidas_campeonatos` FOREIGN KEY (`id_camp`) REFERENCES `campeonatos` (`id_camp`);

--
-- Restrições para tabelas `tipagem`
--
ALTER TABLE `tipagem`
  ADD CONSTRAINT `fk_tipagem_categoria_games` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_games` (`id_categoria`),
  ADD CONSTRAINT `fk_tipagem_games` FOREIGN KEY (`id_game`) REFERENCES `games` (`id_game`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
