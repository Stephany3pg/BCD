CREATE TABLE  aluno(
    nome varchar(128),
    documento char(11) primary key,
    telefone bigint,
    email varchar(128)
);

CREATE TABLE matricula(
    numero char(10) primary key,
    aluno char(11),
    curso char(4),
    constraint fk_matricula_aluno_aluno_documento foreign key(aluno) references aluno(documento),
    constraint fk_matricula_curso_curso_numero foreign key(curso) references curso(numero)
);

CREATE TABLE curso(
    numero char(4) primary key,
    CHmin int,
    CHmáx int, 
    nome varchar(128),
    campus varchar(128),
    curriculo varchar(128),
    constraint fk_curso_campus_campus_nome foreign key(campus) references campus(come),
    constraint fk_curso_curriculo_curriculo_implantacao foreign key(curriculo) references curriculo(implantacao),
    constraint fk_curso_curriculo_curriculo_disciplina foreign key(curriculo) references curriculo(disciplina)
);

CREATE TABLE campus(
    nome varchar(128) primary key
);
