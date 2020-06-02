create database Cadastro //criando base de dados
default character set utf8
default collate utf8_general_ci;

use cadastro;

create table `pessoas`( //criando tabela
`id` int not null auto_increment,
`nome` varchar(30) not null,
`nascimento` date,
`sexo` enum('M','F'),
`peso` decimal(5,2),
`altura` decimal(3,2),
`nacionalidade` varchar(30) default 'Brasil',
primary key (id)
) default charset = utf8;

use cadastro;
desc pessoas;

insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) values //inserindo cadastros 
('Pedro Heber', '1997-08-04', 'M', '55', '1.67', 'Brasil');
select * from pessoas;
insert into pessoas (nome, nascimento, sexo, peso, altura) values
('Luciana', '2000-05-03', 'F', '60', '1.75');
insert into pessoas values (default,'Mario','1970-04-05','M','101','1.95', 'Bélgica');

insert into pessoas values (default,'Andréia','1992-03-07','F','65','1.60', 'Madagascar'),
 (default,'Lionel Messi','1989-11-25','M','65','1.69', 'Argentina'),
 (default,'Alexis Sanchez','1989-04-05','M','75','1.67', 'Chile'),
(default,'Mariana','1970-04-05','F','100','1.95', 'Rep. Dominicana');

desc familia;
alter table pessoas //alterando tabela pessoas
add column profissao varchar(10); //adicionando colunas

alter table pessoas
drop column profissao;

alter table pessoas
add column profissao varchar(30) after nome;

alter table pessoas
modify column profissao varchar(30);

alter table pessoas
change column prof profissao varchar(30);

alter table pessoas
rename to familia;

create table if not exists cursos (
nome varchar(30) not null Unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2016'
) default charset = UTF8;

alter table cursos
add column idcurso int first;

alter table cursos
add primary key (idcurso);

alter table cursos
modify idcurso int not null auto_increment;
desc cursos;

select * from familia;
select * from cursos;
insert into cursos values
	('1','HTML5','Curso de HTML5', '40','37','2014'),
    ('2','Algoritmos','Lógica de Programação','20','15','2014'),
    ('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
    ('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
    ('5','Java','Introdução à Linguagem Java','10','29','2015'),
    ('6','MySQL','Banco de Dados MySQL','30','15','2016'),
    ('7','Word','Curso completo de Word','40','30','2016');
    
    update cursos
    set nome ='HTML5'
    where idcurso= '1';
    
    update cursos
    set nome = 'php' , ano = '2017'
    where idcurso = '4';
    
    update cursos
    set carga = '20', ano = '2015'
    where idcurso = '5'
    limit 1;

	delete from cursos
    where idcurso = 8;
    
    select * from cursos;
        
    delete from cursos
    where ano = '2018'
    limit 2;
    
    truncate table cursos; 
    
    drop database cadastro;
    
  