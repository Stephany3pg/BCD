
insert into curso(numero, CHmin, CHmax, nome, campus) values('290', '216','612','Engenharia de Telecomunicações',

    (select id from campus where nome = 'São José')

);

insert into aluno(nome, documento, telefone, email)
values ('Stephany Padilha Guimarães', '12', '34', 'stephany@aluno.com'),
       ('João da Silva', '34','56', 'joaosilva@aluno.com'),
       ('Maria Paula Pereira', '56', '78', 'mariapereira@aluno.com'),
       ('Joana Pereira', '78', '910', 'joanapereira@aluno.com'),
       ('Pedro Henrique Guimarães', '910', '1112', 'pedro@aluno.com');

insert into matricula(numero, aluno, curso)
values('111', 
        (select id from  aluno  where documento = '12'),
        (select id from  curso  where numero = '290')
),
('112', 
        (select id from  aluno  where documento = '34'),
        (select id from  curso  where numero = '290')
),
('113', 
        (select id from  aluno  where documento = '56'),
        (select id from  curso  where numero = '290')
),

('114', 
        (select id from  aluno  where documento = '78'),
        (select id from  curso  where numero = '290')
),
('115', 
        (select id from  aluno  where documento = '910'),
        (select id from  curso  where numero = '290')
);

insert into PedidoDeMatricula(sessao,tipo, matricula, disciplina)
values
        (
                '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'CAL29001')
        ),
        (
                '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'LOG29001')
        ),
        (        '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'DES29001')
        ),
        (        '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'ELI29001')
        ),
        (        '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'FSC29001')
        ),
        (        '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'GAL29001')
        ),
        (        '1','1',
                (select id from matricula where matricula.numero = '111'),
                (select id from disciplina where codigo like 'PJI29001')
        );
