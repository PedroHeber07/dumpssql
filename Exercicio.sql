CREATE DATABASE EXERCICIO
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE EXERCICIO;

CREATE TABLE DVD (
  idDVD INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(80) NULL,
  genero VARCHAR(30) NULL,
  numDiscos INTEGER UNSIGNED NULL,
  artista1 VARCHAR(80) NULL,
  artista2 VARCHAR(80) NULL,
  PRIMARY KEY(idDVD)
);

INSERT INTO DVD (titulo, genero, numDiscos, artista1, artista2) VALUES('Carros 2', 'Animação', 1, '', '');
INSERT INTO DVD (titulo, genero, numDiscos, artista1, artista2) VALUES('Os Intocáveis', 'Policial', 1, 'Kevin Costner', 'Sean Connery');

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(80) NULL,
  endereco VARCHAR(150) NULL,
  telefone VARCHAR(15) NULL,
  PRIMARY KEY(idCliente)
);

INSERT INTO Cliente (nome, endereco, telefone) VALUES('Joao da Silva', 'Avenida Santa Cruz, 1234', '2222-3333');
INSERT INTO Cliente (nome, endereco, telefone) VALUES('Maria de Souza', 'Avenida das Americas, 4321', '3333-4444');

CREATE TABLE Aluguel (
  idAluguel INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idCliente INTEGER UNSIGNED NOT NULL,
  idDVD INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idAluguel),
  CONSTRAINT fk_Aluguel_idCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
  CONSTRAINT fk_Aluguel_idDVD FOREIGN KEY(idDVD) REFERENCES DVD(idDVD)
);

INSERT INTO Aluguel (idCliente, idDVD) VALUES(1, 1);