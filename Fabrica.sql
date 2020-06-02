CREATE DATABASE FABRICA
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE FABRICA;

CREATE TABLE Fabricante (
  idFabricante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  cnpj VARCHAR(20) NULL,
  telefone VARCHAR(20) NULL,
  PRIMARY KEY(idFabricante)
);

INSERT INTO Fabricante (`nome`, `cnpj`, `telefone`) VALUES('Sony Brasil', '11.111.111/0001-11', '(11)2222-2222');
INSERT INTO Fabricante (`nome`, `cnpj`, `telefone`) VALUES('Samsung Brasil', '22.222.222/0001-22', '(11)3333-3333');
INSERT INTO Fabricante (`nome`, `cnpj`, `telefone`) VALUES('Apple Brasil', '33.333.333/0001-33', '(11)4444-4444');

CREATE TABLE Produto (
  idProduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  custo DOUBLE UNSIGNED NULL,
  idFabricante INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idProduto),
  CONSTRAINT fk_Produto_Fabricante FOREIGN KEY(idFabricante) REFERENCES Fabricante(idFabricante)
);

INSERT INTO Produto (`nome`, `custo`, `idFabricante`) VALUES('Galaxy S5', '3000', '2');
INSERT INTO Produto (`nome`, `custo`, `idFabricante`) VALUES('Galaxy S6', '4000', '2');
INSERT INTO Produto (`nome`, `custo`, `idFabricante`) VALUES('IPhone 5S', '3000', '3');
