CREATE DATABASE Faculdade
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE Faculdade;


CREATE TABLE Pessoa (
  idPessoa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(80) NULL,
  endereco VARCHAR(200) NULL,
  telefone VARCHAR(15) NULL,
  PRIMARY KEY(idPessoa)
);

INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('1','Thiago','Rua T','2222-2222');
INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('2','Andre','Rua A','2222-3333');
INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('3','Marcelo','Rua M','3333-3333');
INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('4','Ze Luiz','Rua Z','3333-4444');
INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('5','Angela','Rua A','3333-5555');
INSERT INTO Pessoa (`idPessoa`, `nome`, `endereco`, `telefone`) VALUES('6','Rogerio','Rua R','3333-5555');


CREATE TABLE Aluno (
  idAluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPessoa INTEGER UNSIGNED NOT NULL UNIQUE,
  matricula VARCHAR(30) NULL,
  ativo BOOL NULL,
  PRIMARY KEY(idAluno),
  CONSTRAINT fk_Aluno_idPessoa FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO Aluno (`idAluno`, `idPessoa`, `matricula`, `ativo`) VALUES('1', '1', '2009010101', '0');
INSERT INTO Aluno (`idAluno`, `idPessoa`, `matricula`, `ativo`) VALUES('2', '2', '2013020202', '1');
INSERT INTO Aluno (`idAluno`, `idPessoa`, `matricula`, `ativo`) VALUES('3', '3', '2014000001', '1');


CREATE TABLE Professor (
  idProfessor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPessoa INTEGER UNSIGNED NOT NULL UNIQUE,
  titulacao VARCHAR(30) NULL,
  PRIMARY KEY(idProfessor),
  CONSTRAINT fk_Professor_idPessoa FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO Professor (`idProfessor`, `idPessoa`, `titulacao`) VALUES('1', '4', 'Especialista');
INSERT INTO Professor (`idProfessor`, `idPessoa`, `titulacao`) VALUES('2', '5', 'Mestre');
INSERT INTO Professor (`idProfessor`, `idPessoa`, `titulacao`) VALUES('3', '6', 'Mestre');


CREATE TABLE Disciplina (
  idDisciplina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  codigo VARCHAR(10) NULL,
  PRIMARY KEY(idDisciplina)
);

INSERT INTO Disciplina (`idDisciplina`, `nome`, `codigo`) VALUES('1', 'Projetos de Software', 'SI1387');
INSERT INTO Disciplina (`idDisciplina`, `nome`, `codigo`) VALUES('2', 'Computação Gráfica', 'SI1461');
INSERT INTO Disciplina (`idDisciplina`, `nome`, `codigo`) VALUES('3', 'Controle e Avaliação de Software', 'SI8223');


CREATE TABLE AlunoDisciplina (
  idAlunoDisciplina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idAluno INTEGER UNSIGNED NOT NULL,
  idDisciplina INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idAlunoDisciplina),
  CONSTRAINT fk_AlunoDisciplina_idAluno FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno),
  CONSTRAINT fk_AlunoDisciplina_idDisciplina FOREIGN KEY(idDisciplina) REFERENCES Disciplina(idDisciplina)
);

INSERT INTO AlunoDisciplina (`idAlunoDisciplina`, `idAluno`, `idDisciplina`) VALUES('1', '1', '1');
INSERT INTO AlunoDisciplina (`idAlunoDisciplina`, `idAluno`, `idDisciplina`) VALUES('2', '1', '2');
INSERT INTO AlunoDisciplina (`idAlunoDisciplina`, `idAluno`, `idDisciplina`) VALUES('3', '2', '2');
INSERT INTO AlunoDisciplina (`idAlunoDisciplina`, `idAluno`, `idDisciplina`) VALUES('4', '3', '1');
