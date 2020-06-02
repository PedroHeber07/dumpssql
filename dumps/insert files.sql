create database castelo_negro;

use castelo_negro;

create table aluno (
matricula int not null auto_increment,
nome varchar(30),
data_nasc date,
cr float,
primary key(matricula)
)ENGINE = InnoDB;

create table curso(
codigo_curso int not null auto_increment,
nome varchar(30),
primary key (codigo_curso)
)ENGINE = InnoDB;

create table disciplina(
id_disc int not null auto_increment,
nome varchar(30),
creditos int not null,
primary key (id_disc),

fk_curso int, 
foreign key(fk_curso)
references curso(codigo_curso)
)engine = InnoDB;

create table turma(
codigo_turma int not null auto_increment,
nome varchar(30),
ano year,
qtdalunos int,
Primary key(codigo_turma),

fk_disc int,
foreign key(fk_disc)
references disciplina(id_disc)
)engine = innodb;

create table turma_aluno(
id int not null auto_increment,
sala int,
bloco varchar(5),
primary key (id),

fk_aluno int,
foreign key(fk_aluno)
references aluno(matricula),

fk_turma int,
foreign key(fk_turma)
references turma(codigo_turma)
)engine = innodb;

desc aluno;
desc curso;
desc disciplina;
desc turma;
desc turma_aluno;

select * from aluno;

insert into aluno values('5', 'Didier Drogba', '1970-08-04','10.0'),
('6', 'Wayne ROoney', '1998-03-08', '9.5'),
('7','Paulo Henrique Ganso','2008-04-09','5.0'),
('8','Menino Neymar','1996-08-04','6.5'),
('9','Bruna Marquezine','1995-09-05','5.5'),
('10','Cristiano Ronaldo','2000-12-25','7.5'); 

select * from curso;

insert into curso values ('1', 'PHP'),
('2','HTMl5'),
('3','Python'),
('4','Ruby'),
('5','Script'),
('6','Visual Basic'),
('7','.Net'),
('8','Portugol'),
('9','C#'),
('10','C++');

select * from disciplina;

insert into disciplina values ('1','Operadores Lógicos','20','1'),
('2','Matrizes','20','1'),
('3','Operações Matemáticas','10','1'),
('4','Sintaxe','10','1'),
('5','PhpMyadmin','15','1');

insert into disciplina values ('6','Sintaxe','20','2'),
('7','Paragrafo','20','2'),
('8','Interação com CSS','10','2'),
('9','Interação com Bootstrap','10','2'),
('10','Interação com JavaScript','15','2');

insert into disciplina values ('11','Operadores Lógicos','20','3'),
('12','Matrizes','20','3'),
('13','Operações Matemáticas','10','3'),
('14','Sintaxe','10','3'),
('15','LogicPython','15','3');

insert into disciplina values ('16','Operadores Lógicos','20','4'),
('17','Matrizes','20','4'),
('18','Operações Matemáticas','10','4'),
('19','Sintaxe','10','4'),
('20','LogicRuby','15','4');

insert into disciplina values ('21','Operadores Lógicos','20','5'),
('22','Matrizes','20','5'),
('23','Operações Matemáticas','10','5'),
('24','Sintaxe','10','5'),
('25','LogicScript','15','5');

insert into disciplina values ('26','Operadores Lógicos','20','6'),
('27','Matrizes','20','6'),
('28','Operações Matemáticas','10','6'),
('29','Sintaxe','10','6'),
('30','LogicVisualBasic','15','6');

insert into disciplina values ('31','Operadores Lógicos','20','7'),
('32','Matrizes','20','7'),
('33','Operações Matemáticas','10','7'),
('34','Sintaxe','10','7'),
('35','Logic.net','15','7');

insert into disciplina values ('36','Operadores Lógicos','20','8'),
('37','Matrizes','20','8'),
('38','Operações Matemáticas','10','8'),
('39','Sintaxe','10','8'),
('45','LogicPortugol','15','8');

insert into disciplina values ('46','Operadores Lógicos','20','9'),
('47','Matrizes','20','9'),
('48','Operações Matemáticas','10','9'),
('49','Sintaxe','10','9'),
('50','LogicC#','15','9');

insert into disciplina values ('51','Operadores Lógicos','20','10'),
('52','Matrizes','20','10'),
('53','Operações Matemáticas','10','10'),
('54','Sintaxe','10','10'),
('55','LogicC++','15','10');

select * from disciplina;

select * from turma;

insert into turma values('44','Turma 144','2003','12','44'),
('45','Turma 145','2004','13','45');

select * from turma_aluno;

select * from aluno;

select * from turma;
