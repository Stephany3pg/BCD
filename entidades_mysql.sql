CREATE TABLE  aluno(
    id unsigned int auto_increment primary key,
    nome varchar(128) not null,
    documento char(11) unique not null,
    telefone unsigned bigint,
    email varchar(128)
);

CREATE TABLE campus(
    id unsigned tinyint auto_increment primary key,
    nome varchar(128)
);

CREATE TABLE curso(
    id unsigned smallint auto_increment primary key,
    numero unsigned smallint not null,
    CHmin unsigned smallint not null,
    CHmax unsigned smallint not null, 
    nome varchar(128) not null,
    campus tinyint not null,
    curriculo varchar(128) ,
    constraint fk_curso_campus_campus_id foreign key(campus) references campus(id),
    constraint fk_curso_curriculo_curriculo_implantacao foreign key(curriculo) references curriculo(implantacao),
    constraint fk_curso_curriculo_curriculo_disciplina foreign key(curriculo) references curriculo(disciplina)
);

CREATE TABLE matricula(
    id unsigned int auto_increment primary key,
    numero unsigned bigint unique not null,
    aluno unsigned int not null,
    curso unsigned smallint not null,
    constraint fk_matricula_aluno_aluno_id foreign key(aluno) references aluno(id),
    constraint fk_matricula_curso_curso_id foreign key(curso) references curso(id)
);



