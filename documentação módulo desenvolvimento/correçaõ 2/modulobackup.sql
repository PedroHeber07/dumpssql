-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modulo
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.40-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbcategoria`
--

DROP TABLE IF EXISTS `tbcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbcategoria` (
  `categoriaid` int(11) NOT NULL,
  `nome_categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`categoriaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcategoria`
--

LOCK TABLES `tbcategoria` WRITE;
/*!40000 ALTER TABLE `tbcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbclientes`
--

DROP TABLE IF EXISTS `tbclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbclientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomecli` varchar(50) NOT NULL,
  `endcli` varchar(100) DEFAULT NULL,
  `bairrocli` varchar(50) DEFAULT NULL,
  `cidadecli` varchar(50) DEFAULT NULL,
  `ufcli` varchar(2) DEFAULT NULL,
  `cepcli` varchar(10) DEFAULT NULL,
  `cpfcli` varchar(11) DEFAULT NULL,
  `rgcli` varchar(10) DEFAULT NULL,
  `fonecli` varchar(50) NOT NULL,
  `emailcli` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbclientes`
--

LOCK TABLES `tbclientes` WRITE;
/*!40000 ALTER TABLE `tbclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcolaborador`
--

DROP TABLE IF EXISTS `tbcolaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbcolaborador` (
  `id_func` int(11) NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(50) NOT NULL,
  `fone_func` varchar(20) NOT NULL,
  `func_nasc` date NOT NULL,
  `func_end` varchar(100) DEFAULT NULL,
  `func_bairro` varchar(50) DEFAULT NULL,
  `func_cidade` varchar(50) DEFAULT NULL,
  `func_uf` varchar(2) DEFAULT NULL,
  `func_cep` varchar(10) DEFAULT NULL,
  `func_cpf` varchar(11) DEFAULT NULL,
  `func_rg` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcolaborador`
--

LOCK TABLES `tbcolaborador` WRITE;
/*!40000 ALTER TABLE `tbcolaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcolaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcompras`
--

DROP TABLE IF EXISTS `tbcompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbcompras` (
  `compraid` int(11) NOT NULL AUTO_INCREMENT,
  `data_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idforn` int(11) NOT NULL,
  `id_colab_compra` int(11) NOT NULL,
  PRIMARY KEY (`compraid`),
  KEY `id_colab_compra` (`id_colab_compra`),
  KEY `idforn` (`idforn`),
  CONSTRAINT `tbcompras_ibfk_1` FOREIGN KEY (`id_colab_compra`) REFERENCES `tbcolaborador` (`id_func`),
  CONSTRAINT `tbcompras_ibfk_2` FOREIGN KEY (`idforn`) REFERENCES `tbfornecedor` (`fornecedorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcompras`
--

LOCK TABLES `tbcompras` WRITE;
/*!40000 ALTER TABLE `tbcompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfabricante`
--

DROP TABLE IF EXISTS `tbfabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbfabricante` (
  `fabricanteid` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fab` varchar(50) NOT NULL,
  `cnpj_fab` varchar(50) NOT NULL,
  `end_fab` varchar(100) DEFAULT NULL,
  `bairro_fab` varchar(50) DEFAULT NULL,
  `cidade_fab` varchar(50) DEFAULT NULL,
  `uf_fab` varchar(2) DEFAULT NULL,
  `cep_fab` varchar(10) NOT NULL,
  `fone_fab` varchar(50) DEFAULT NULL,
  `email_fab` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fabricanteid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfabricante`
--

LOCK TABLES `tbfabricante` WRITE;
/*!40000 ALTER TABLE `tbfabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbfabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfornecedor`
--

DROP TABLE IF EXISTS `tbfornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbfornecedor` (
  `fornecedorid` int(11) NOT NULL AUTO_INCREMENT,
  `nomeforn` varchar(50) DEFAULT NULL,
  `cnpjforn` varchar(50) DEFAULT NULL,
  `endforn` varchar(100) DEFAULT NULL,
  `bairroforn` varchar(50) DEFAULT NULL,
  `cidadeforn` varchar(50) DEFAULT NULL,
  `ufforn` varchar(2) DEFAULT NULL,
  `cepforn` varchar(10) DEFAULT NULL,
  `foneforn` varchar(50) DEFAULT NULL,
  `emailforn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fornecedorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfornecedor`
--

LOCK TABLES `tbfornecedor` WRITE;
/*!40000 ALTER TABLE `tbfornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbfornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbitenscompra`
--

DROP TABLE IF EXISTS `tbitenscompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbitenscompra` (
  `cod_ic` int(11) NOT NULL AUTO_INCREMENT,
  `quant_produto_compra` int(11) DEFAULT NULL,
  `preco_compra` decimal(10,2) NOT NULL,
  `id_produto_compra` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`cod_ic`),
  KEY `id_produto_compra` (`id_produto_compra`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `tbitenscompra_ibfk_1` FOREIGN KEY (`id_produto_compra`) REFERENCES `tbproduto` (`produtoid`),
  CONSTRAINT `tbitenscompra_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `tbcompras` (`compraid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbitenscompra`
--

LOCK TABLES `tbitenscompra` WRITE;
/*!40000 ALTER TABLE `tbitenscompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbitenscompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbitensvenda`
--

DROP TABLE IF EXISTS `tbitensvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbitensvenda` (
  `cod_iv` int(11) NOT NULL AUTO_INCREMENT,
  `quant_produto_venda` int(11) DEFAULT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `id_produto_venda` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`cod_iv`),
  KEY `id_produto_venda` (`id_produto_venda`),
  KEY `id_venda` (`id_venda`),
  CONSTRAINT `tbitensvenda_ibfk_1` FOREIGN KEY (`id_produto_venda`) REFERENCES `tbproduto` (`produtoid`),
  CONSTRAINT `tbitensvenda_ibfk_2` FOREIGN KEY (`id_venda`) REFERENCES `tbvenda` (`vendaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbitensvenda`
--

LOCK TABLES `tbitensvenda` WRITE;
/*!40000 ALTER TABLE `tbitensvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbitensvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbproduto`
--

DROP TABLE IF EXISTS `tbproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbproduto` (
  `produtoid` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_pro` varchar(100) NOT NULL,
  `preco_custo` decimal(10,2) NOT NULL,
  `uni_estoque` int(11) NOT NULL,
  `idcat` int(11) NOT NULL,
  `idfabric` int(11) NOT NULL,
  `idforn` int(11) NOT NULL,
  PRIMARY KEY (`produtoid`),
  UNIQUE KEY `descricao_pro` (`descricao_pro`),
  KEY `idcat` (`idcat`),
  KEY `idfabric` (`idfabric`),
  KEY `Fk_idforn` (`idforn`),
  CONSTRAINT `Fk_idforn` FOREIGN KEY (`idforn`) REFERENCES `tbfornecedor` (`fornecedorid`),
  CONSTRAINT `tbproduto_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `tbcategoria` (`categoriaid`),
  CONSTRAINT `tbproduto_ibfk_2` FOREIGN KEY (`idfabric`) REFERENCES `tbfabricante` (`fabricanteid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproduto`
--

LOCK TABLES `tbproduto` WRITE;
/*!40000 ALTER TABLE `tbproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbvenda`
--

DROP TABLE IF EXISTS `tbvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbvenda` (
  `vendaid` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idcli` int(11) NOT NULL,
  `idcolab` int(11) NOT NULL,
  PRIMARY KEY (`vendaid`),
  KEY `idcli` (`idcli`),
  KEY `idcolab` (`idcolab`),
  CONSTRAINT `tbvenda_ibfk_1` FOREIGN KEY (`idcli`) REFERENCES `tbclientes` (`idcliente`),
  CONSTRAINT `tbvenda_ibfk_2` FOREIGN KEY (`idcolab`) REFERENCES `tbcolaborador` (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbvenda`
--

LOCK TABLES `tbvenda` WRITE;
/*!40000 ALTER TABLE `tbvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbvenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07 13:27:23
