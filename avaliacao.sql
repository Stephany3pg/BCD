---- view de numero de pre Requisitos---

create view NumPreRequisitos as 
  select nome, count(*) as num
  from disciplina join preRequisito 
  on preRequisito.disciplina = disciplina.id 
  group by nome ;


select * from NumPreRequisitos order by num desc;

select nome as Disciplinas, num as NumPreRequisito from NumPreRequisitos order by num desc;


select disciplina.id, nome, count(*) as Número_de_PréRequisitos from disciplina join preRequisito on preRequisito.disciplina = disciplina.id group by disciplina.id ;


---------View com ID

create view NumPreRequisitos as 
  select disciplina.id as disciplinaID, 
  nome as Disciplina, 
  count(*) as num
  from disciplina join preRequisito 
  on preRequisito.disciplina = disciplina.id 
  group by disciplina.id;

------Quantos pre requisitos na disciplina, por ID
select num from NumPreRequisitos where disciplinaID = 17;
R: Eletrônica I  |   3

----view AlunoMatriculaCurso-----
create view MatriculaCurso as 
    select matricula.numero as matricula,
           aluno.nome as aluno, 
           curso.nome as curso 
           from aluno inner join matricula  
           on aluno.id = matricula.aluno 
           inner join curso on curso.id=matricula.curso;

-------------View NumeroMatriculas por disciplina-----

create view NumeroMatriculas as

   select disciplina.id,codigo, nome as Disciplina, count(*) as
   NumMatriculas from disciplina
   inner join PedidoDeMatricula 
   on disciplina.id=PedidoDeMatricula.disciplina 
   group by nome;

-- numero de disciplinas com matricula superior a...
   select * from NumeroMatriculas where NumMatriculas >=32;
   select * from NumeroMatriculas where NumMatriculas <=16;

--------------

select count(distinct matricula) as MatriculaFase from MtriculaDisciplinas where MtriculaDisciplinas.codigo like '%29001'



---Matricula Fase-----
----nova coluna na tabela disciplina

alter table disciplina add column fase smallint;
update disciplina set fase = 7 where disciplina.codigo like '%29007';


create view MatriculaFase as
   select count( distinct matricula) as 
   NumeroMatriculas, 
   fase  
   from PedidoDeMatricula 
   inner join disciplina 
   on PedidoDeMatricula.disciplina=disciplina.id 
   group by fase;
-------tablre professor-----

alter table professor add column CH smallint;
insert into DisciplinasMinistradas(professor, disciplina)
values((select id from professor where documento=1), (select id from disciplina where codigo='BCD29008'));

create view CHProfessor as select sum(disciplina.CH) as ch, professor from DisciplinasMinistradas inner join disciplina on DisciplinasMinistradas.disciplina=disciplina.id group by professor ;
--------------------------PROVA

1. Tres fases com mais alunos

select * from MatriculaFase order by fase desc limit 3;

2. Quantos Repetentes

create view ComNumRepetentes as select disciplina.id,codigo, nome as Disciplina, count(*) as NumMatriculas,(count(*)-count(distinct matricula)) as NumRepetentes from disciplina    inner join PedidoDeMatricula     on disciplina.id=PedidoDeMatricula.disciplina   group by nome;

3. Quantos horizontais e quantos verticais;

create view verticais as select disciplina,count(preRequisito)as verticais from preRequisito where eixo=1 group by preRequisito.disciplina;
create view horizontais as select disciplina,count(preRequisito) as horizontais from preRequisito where eixo=0 group by preRequisito.disciplina;

create view Nprerequisitos as select disciplinaID, NumPreRequisitos.Disciplina, num, verticais.verticais, horizontais.horizontais 
from NumPreRequisitos inner join verticais on verticais.disciplina=NumPreRequisitos.disciplinaID left join horizontais on horizontais.disciplina=NumPreRequisitos.disciplinaID;

4. % de tempo em sala

select ((CHProfessor.ch/18)*100)/professor.CH as porcentagemSemana from CHProfessor inner join professor on professor.id=CHProfessor.professor; 
