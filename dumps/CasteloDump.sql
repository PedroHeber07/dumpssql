-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: castelo_branco
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `cr` float DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'jose','1999-01-12',8.5),(2,'Maria','1997-01-20',7.5),(3,'joao','1996-05-30',6),(4,'Pedro','1997-06-08',8),(5,'Maristela','1970-02-28',9),(6,'Najara','1999-05-06',9.5),(7,'Luciana','1976-01-11',10),(8,'Jéssica','1999-12-15',9.5),(9,'Alan','1980-09-25',7),(10,'Carolina','1981-10-22',3),(11,'Leonardo','1960-01-24',5),(12,'Junior','1985-05-24',4),(13,'flávio','2000-06-06',6),(14,'Letícia','2001-02-26',7),(15,'Drogba','2002-08-22',8.5),(16,'RAgnarok','1989-07-05',10),(17,'Eligium','1996-03-21',10),(18,'Elesis','1986-10-12',4.5),(19,'Arme','1998-04-26',6.5),(20,'Thor','1995-10-09',5.5),(21,'Dio','1987-06-08',4.5),(22,'Odin','1988-07-15',6),(23,'MAnchester','1987-10-19',10);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codigo_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'PHP'),(2,'Arduíno'),(3,'HTML5'),(4,'Photoshop'),(5,'Mysql'),(6,'Worckbench'),(7,'Sql'),(8,'Internet'),(9,'Redes'),(10,'Word'),(11,'Excel'),(12,'PowerPoint'),(13,'Sexologia');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `id_disc` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `fk_curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_disc`),
  KEY `fk_curso` (`fk_curso`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`fk_curso`) REFERENCES `curso` (`codigo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Português',30,2),(2,'Matemática ',20,3),(3,'lógica de programação',10,1),(4,'Liguagem Sql',50,5),(5,'redes ',40,8),(6,'arduino básico',12,9),(7,'anatomia',30,10),(8,'biologia',60,4),(9,'matemática',40,1),(10,'Reprodução',50,2);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `codigo_turma` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `qtdalunos` int(11) DEFAULT NULL,
  `fk_disc` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_turma`),
  KEY `fk_disc` (`fk_disc`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`fk_disc`) REFERENCES `disciplina` (`id_disc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'turma1',2001,10,2),(2,'turma2',2002,13,5),(3,'turma3',2003,13,8),(4,'turma4',2004,20,9),(5,'turma5',2005,14,7),(6,'turma6',2006,12,4),(7,'turma7',2007,8,1),(8,'turma8',2008,9,2),(9,'turma9',2009,5,3),(10,'turma10',2010,6,8);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_aluno`
--

DROP TABLE IF EXISTS `turma_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sala` int(11) DEFAULT NULL,
  `bloco` varchar(5) DEFAULT NULL,
  `fk_aluno` int(11) DEFAULT NULL,
  `fk_turma` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno` (`fk_aluno`),
  KEY `fk_turma` (`fk_turma`),
  CONSTRAINT `turma_aluno_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `turma_aluno_ibfk_2` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`codigo_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_aluno`
--

LOCK TABLES `turma_aluno` WRITE;
/*!40000 ALTER TABLE `turma_aluno` DISABLE KEYS */;
INSERT INTO `turma_aluno` VALUES (1,1,'B',1,1),(2,2,'B',2,1),(3,3,'B',3,1),(4,4,'B',4,1),(5,5,'B',5,1),(6,6,'A',6,2),(7,7,'A',7,2),(8,8,'A',8,2),(9,9,'A',9,2),(10,10,'A',10,2);
/*!40000 ALTER TABLE `turma_aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23 16:23:43
