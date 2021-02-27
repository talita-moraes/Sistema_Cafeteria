-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Fev-2017 às 03:22
-- Versão do servidor: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `ID_compra` int(11) NOT NULL,
  `Data_compra` date DEFAULT NULL,
  `Status_compra` varchar(10) DEFAULT NULL,
  `Preco_total_compra` double DEFAULT NULL,
  `ID_usuario` int(11) DEFAULT NULL,
  `Itens_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_compra`
--

CREATE TABLE `itens_compra` (
  `Itens_compra` int(11) NOT NULL,
  `Quantidade_itens_compra` int(11) DEFAULT NULL,
  `ID_Produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID_Produto` int(11) NOT NULL,
  `Nome_produto` varchar(20) DEFAULT NULL,
  `Ingredientes_produto` varchar(25) DEFAULT NULL,
  `Preco_produto` double DEFAULT NULL,
  `ID_tipo_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `ID_tipo_produto` int(11) NOT NULL,
  `Descricao_tipo_produto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `ID_tipo_usuario` int(11) NOT NULL,
  `Descrição_tipo_usuario` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `Rg_usuario` varchar(7) DEFAULT NULL,
  `Estado_endereco_usuario` varchar(2) DEFAULT NULL,
  `Complemento_endereco_usuario` varchar(20) DEFAULT NULL,
  `Cep_endereco_usuario` varchar(8) DEFAULT NULL,
  `Cidade_endereco_usuario` varchar(11) DEFAULT NULL,
  `Numero_endereco_usuario` varchar(8) DEFAULT NULL,
  `Bairro_endereco_usuario` varchar(11) DEFAULT NULL,
  `Nacionalidade_usuario` varchar(20) DEFAULT NULL,
  `Data_nascimento_usuario` date DEFAULT NULL,
  `ID_usuario` int(11) NOT NULL,
  `Telefone_usuario` int(8) DEFAULT NULL,
  `Cpf_Login_usuario` varchar(11) DEFAULT NULL,
  `Email_usuario` varchar(25) DEFAULT NULL,
  `Nome_usuario` varchar(50) DEFAULT NULL,
  `Senha_usuario` varchar(11) DEFAULT NULL,
  `Celular_usuario` int(8) DEFAULT NULL,
  `Sexo_usuario` varchar(1) DEFAULT NULL,
  `Estado_civil_usuario` varchar(10) DEFAULT NULL,
  `ID_tipo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID_compra`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `Itens_compra` (`Itens_compra`);

--
-- Indexes for table `itens_compra`
--
ALTER TABLE `itens_compra`
  ADD PRIMARY KEY (`Itens_compra`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID_Produto`),
  ADD KEY `ID_tipo_produto` (`ID_tipo_produto`);

--
-- Indexes for table `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`ID_tipo_produto`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`ID_tipo_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD KEY `ID_tipo_usuario` (`ID_tipo_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `ID_compra` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Itens_compra`) REFERENCES `itens_compra` (`Itens_compra`);

--
-- Limitadores para a tabela `itens_compra`
--
ALTER TABLE `itens_compra`
  ADD CONSTRAINT `itens_compra_ibfk_1` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`ID_tipo_produto`) REFERENCES `tipo_produto` (`ID_tipo_produto`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_tipo_usuario`) REFERENCES `tipo_usuario` (`ID_tipo_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
