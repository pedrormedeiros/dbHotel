/* Mostrar os bancos de dados existentes no servidor */
show databases;

/* Criar um novo banco */ 
create database dbHotel;

/* Selecionar o banco de dados */
use dbHotel;

/* Excluir tabelas */
drop table funcionarios;

/*Criar uma nova tabela */
create table funcionarios (
	/* int se refere ao tipo na tabela 
    primary key determina que o campo idFunc seja uma chave primária e será responsável popr identificar cada funcionário
    auto_increment determina que o MySQL dê um id novo a cada cadastro */
    idFunc int primary key auto_increment,
    /* varchar é a quantidade variável de caracteres no nome (nesse caso, até 100 caracteres)
    not null determina que o campo seja obrigatório */
    
    /* unique determina que o campo seja único e o valor não possa repetir */
    login varchar (20) not null unique,
    senha varchar (255) not null,
    cargo varchar(20)
);

/* Descreve os campos da tabela funcionarios */
describe funcionarios;



/* Mostrar as tabelas */
show tables;

/*CREATE */
/* inserir um funcionario na tabela, com nome, login, senha criptografada  e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Felipe Coelho", "felipe", md5("123@senac"));

/*READ*/
/* Ler/Buscar as informações da tabela funcionários */ 
select * from funcionarios;

/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "felipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerência" where idFunc = 2;

