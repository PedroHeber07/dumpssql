create database Ucb;

create table aluno (
matricula int not null auto_increment,
nome varchar(30),
data_nasc date,
cr float,
primary key(matricula)
)ENGINE=INNODB;

create table curso (
codigo_curso int not null auto_increment,
nome varchar(30),
primary key(codigo_curso)
) ENGINE = INNODB;

create table disciplina (
id_disc int not null auto_increment,
nome varchar(30),
creditos int,
primary key(id_disc),
fk_curso int,
foreign key(fk_curso)
references curso(codigo_curso)
)ENGINE=INNODB;

create table turma (
codigo_turma int not null auto_increment,
nome varchar(30),
ano int(4),
qtdalunos int,
primary key(codigo_turma),
fk_disc int,
foreign key(fk_disc)
references disciplina(id_disc)
)ENGINE=INNODB;

create table turma_aluno (
id int not null auto_increment,
sala int,
bloco varchar(10),
primary key (id),
fk_aluno int,
foreign key(fk_aluno)
references aluno (matricula),
fk_turma int,
foreign key (fk_turma)
references turma (codigo_turma)
)ENGINE=INNODB;

desc aluno;
desc curso;
desc disciplina;
desc turma;
desc turma_aluno;

insert into aluno values 
(1, "maria", "1999-4-4",7.4),
(2,'Jose','1999-01-12',8.5),
(3,'Maria','1997-01-20',7.5),
(4,'joao','1996-05-30',6),
(5,'Pedro','1997-06-08',8),
(6,'Maristela','1970-02-28',9),
(7,'Najara','1999-05-06',9.5),
(8,'Luciana','1976-01-11',10),
(9,'Jéssica','1999-12-15',9.5),
(10,'Alan','1980-09-25',7),
(11,'Carolina','1981-10-22',3);


insert into aluno values
(12,'Leonardo','1960-01-24',5),
(13,'Junior','1985-05-24',4),
(14,'Flavio','2000-06-06',6),
(15,'Letícia','2001-02-26',7),
(16,'Drogba','2002-08-22',8.5),
(17,'RAgnarok','1989-07-05',10),
(18,'Eligium','1996-03-21',10),
(19,'Elesis','1986-10-12',4.5),
(20,'Arme','1998-04-26',6.5),
(21,'Thor','1995-10-09',5.5),
(22,'Dio','1987-06-08',4.5),
(23,'Odin','1988-07-15',6),
(24,'Manchester','1987-10-19',10);

insert into curso values 
(1,'matematica'),
(2,'PHP'),
(3,'Arduíno'),
(4,'HTML5'),
(5,'Photoshop'),
(6,'Mysql'),
(7,'Worckbench'),
(8,'Sql'),
(9,'Internet'),
(10,'Redes'),
(11,'Word'),
(12,'Excel'),
(13,'PowerPoint');

INSERT INTO disciplina VALUES 
(1,'Português',30,2),
(2,'Matemática ',20,3),
(3,'lógica de programação',10,1),
(4,'Liguagem Sql',50,5),
(5,'redes ',40,8),
(6,'arduino básico',12,9),
(7,'anatomia',30,10),
(8,'biologia',60,4),
(9,'matemática',40,1),
(10,'Desenho',50,2);

INSERT INTO turma VALUES 
(1,'turma1',2001,10,2),
(2,'turma2',2002,13,5),
(3,'turma3',2003,13,8),
(4,'turma4',2004,20,9),
(5,'turma5',2005,14,7),
(6,'turma6',2006,12,4),
(7,'turma7',2007,8,1),
(8,'turma8',2008,9,2),
(9,'turma9',2009,5,3),
(10,'turma10',2010,6,8);

INSERT INTO turma_aluno VALUES 
(1,1,'B',1,1),
(2,2,'B',2,1),
(3,3,'B',3,1),
(4,4,'B',4,1),
(5,5,'B',5,1),
(6,6,'A',6,2),
(7,7,'A',7,2),
(8,8,'A',8,2),
(9,9,'A',9,2),
(10,10,'A',10,2);


select * from aluno;

select * from curso;

select * from disciplina;

select * from turma;

select * from turma_aluno;


#Informar o total de créditos de um determinado aluno.

select matricula, aluno.nome, creditos
from aluno, curso, disciplina, turma, turma_aluno
where matricula = '2'
and disciplina.fk_curso = curso.codigo_curso
and turma.fk_disc = disciplina.id_disc
and turma_aluno.fk_aluno = aluno.matricula
and turma_aluno.fk_turma = turma.codigo_turma;

#Apresentar o nome do aluno de maior CR.
    
select aluno.nome, aluno.cr
from aluno
where cr = (select max(cr) from aluno)
order by nome;

#Apresentar o nome do aluno de maior CR de um curso específico.

select aluno.matricula, aluno.nome, aluno.cr 
from aluno
where cr = (select max(cr)
from aluno, curso, disciplina, turma, turma_aluno
where curso.codigo_curso = '8'
and disciplina.fk_curso = curso.codigo_curso
and turma.fk_disc = disciplina.id_disc
and turma_aluno.fk_aluno = aluno.matricula
and turma_aluno.fk_turma = turma.codigo_turma);






