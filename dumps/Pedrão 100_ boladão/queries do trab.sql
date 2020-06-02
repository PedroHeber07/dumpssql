select * from aluno;

select * from curso;

select * from disciplina;

select * from turma;

select * from turma_aluno;


select aluno.nome, disciplina.creditos 
from aluno, curso, disciplina, turma, turma_aluno
where matricula = '1' and
disciplina.fk_curso = curso.codigo_curso and
turma.fk_disc = disciplina.id_disc and
turma_aluno.fk_aluno = aluno.matricula and 
turma_aluno.fk_turma = turma.codigo_turma; 

select max(cr) from aluno; #valor máximo do campo cr

select max(creditos) from disciplina;

select max(cr) fromaluno;
select nome, cr from aluno
where cr = '10'
order by nome;

select aluno.nome, aluno.cr, codigo_curso, curso.nome
from aluno, curso, disciplina, turma, turma_aluno
where codigo_curso = '3' and
disciplina.fk_curso = curso.codigo_curso and
turma.fk_disc = disciplina.id_disc and
turma_aluno.fk_aluno = aluno.matricula and 
turma_aluno.fk_turma = turma.codigo_turma
order by aluno.cr desc; 


select count(matricula) from aluno; # contagem

select sum(matricula) from aluno; #soma

select avg(cr) from aluno;  #média
