Introdução SQL / MYSQL


DDL – Data Definition Language ( DDL) são usadas para definir a estrutura de banco de dados ou esquema. Alguns exemplos:

CREATE- para criar objetos no banco de dados
ALTER – altera a estrutura da base de dados
TRUNCATE – remover todos os registros de uma tabela, incluindo todos os espaços alocados para os registros são removidos
COMMENT – adicionar comentários ao dicionário de dados
RENAME – para renomear um objeto

DML – Data Manipulation Language ( DML) são utilizados para o gerenciamento de dados dentro de objetos do banco. Alguns exemplos:

SELECT- recuperar dados do banco de dados
INSERT – inserir dados em uma tabela
UPDATE – atualiza os dados existentes em uma tabela
DELETE – exclui registros de uma tabela,
CALL – chamar um subprograma PL / SQL
EXPLAIN PLAN – explicar o caminho de acesso aos dados
LOCK TABLE – controle de concorrência

DCL – Data Control Language ( DCL ) declarações. Alguns exemplos:

GRANT – atribui privilégios de acesso do usuário a objetos do banco de dados
REVOKE – remove os privilégios de acesso aos objetos obtidos com o comando GRANT

TCL – Transaction Control Language – (Controle de Transações) são usados ??para gerenciar as mudanças feitas por instruções DML . Ele permite que as declarações a serem agrupadas em transações lógicas .

COMMIT – salvar o trabalho feito
SAVEPOINT – identificar um ponto em uma transação para que mais tarde você pode efetuar um ROLLBACK
ROLLBACK – restaurar banco de dados ao original desde o último COMMIT


CREATE TABLE Pessoa(
    idPes INT NOT NULL AUTO_INCREMENT,
    nomePes VARCHAR(80),4
    cidadePes VARCHAR(80),
    ruaPes VARCHAR(80),
    numeroPes INT(80),
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE telefone (
    idTel INT NOT NULL AUTO_INCREMENT, 
    numeroTel VARCHAR(10),
    tipoTel VARCHAR(10),
    idPes INT,
    PRIMARY KEY (idTel),
    INDEX (idPes),
    FOREIGN KEY (idPes)
      REFERENCES Pessoa(idPes)
) ENGINE=INNODB;


CREATE TABLE Evento(
    idEv INT NOT NULL, 
    descEv VARCHAR(80),
    dataEv DATE,
    horaEv DATE,
    cidadeEv VARCHAR(80),
    ruaEv VARCHAR(80),
    numeroEv INT(80),
    PRIMARY KEY(idEv)
)   ENGINE=INNODB;


CREATE TABLE Pes_Ev (
    idEv INT NOT NULL,
    idPes INT NOT NULL,
    PRIMARY KEY(idEv, idPes),

    FOREIGN KEY (idPes)
      REFERENCES Pessoa(idPes)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (idEv)
      REFERENCES Evento(idEv)
      ON UPDATE CASCADE ON DELETE RESTRICT,
)   ENGINE=INNODB;