create database Escola;
use Escola; -- selecionar o bd
create table Alunos
(
	RA varchar(12) not null, -- o not null não permite que o número esteja vazio 
    NOME varchar (100),
    DATANASC date,
    PRIMARY KEY(RA)    
);

create table Materias
(
	CODMAT char(10),
	NOMEMAT varchar(100),
	CARGAHOR int,
    primary key (CODMAT)
);

create table historico 
(
	RA varchar(12),
    CODMAT char(10),
    MEDIA float,
    FALTAS float,
    primary key(RA, CODMAT),
    -- aqui também seria possível usar uma chave adicional invés da composta
    foreign key(RA) references Alunos (RA),
    foreign key(codmat) references Materias (CODMAT)
);

-- DML - INSERINDO DADOS

insert into Alunos (RA, NOME, DATANASC) -- Aqui todas as colunas estão informadas, já que todas estão informadas, você poderia não especificar
values ('100', 'Maria da Silva', '2000-05-01');

insert into Alunos -- Omitindo as colunas, você obrigatoriamente deve colocar todos os valores
values ('101', 'José da Silva', '2000-05-01');

insert into Alunos (RA, NOME) -- Neste tem apenas as informações que eu quis colocar
values ('102', 'Luis da Silva');

insert into Alunos (RA, NOME, DATANASC) -- Pode-se ser feito mais de um registro de uma vez
values ('103', 'Luis Otávio', '2000-05-01'),
	   ('104', 'Carlos Silva', '2000-05-01');
       
insert into Alunos (Nome)
values ('Luisa');

update Alunos
Set RA = 110
Where RA = null

-- delete from alunos 
       
-- SELECT * FROM escola.alunos; este comando diz que está selecionando todos os campos de informação dos alunos 
-- SELECT RA, NOME FROM escola.alunos; este comando seleciona apenas nome e ra do aluno