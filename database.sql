/* Mostrar os bancos de dados existentes no servidor */
show databases;

/* Criar um novo banco */ 
create database dbHotel;

/* Selecionar o banco de dados */
use dbHotel;

/* Excluir tabelas */
drop table funcionarios;

/* Adicionar o campo email à tabela funcionarios */
alter table funcionarios add column email varchar (50) not null;

alter table funcionarios add column nomeFunc varchar(100) not null after idFunc;

/* Excluir um campo da tabela */
alter table funcionarios drop column email;

/* Redirecionar o campo email para que ele fique após o campo login */
alter table funcionarios modify column email varchar(50) not null after login;

/* Modificar o campo email para que se torne obrigatório, ou seja, não nulo (not null) */
alter table  funcionarios modify column email varchar(50) not null;

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
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Administrador", "admin", md5("admin"), "Administrador", "admin@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Nathan Raphael", "nathanraphael", md5("123@senac"), "Gerência", "nathanraphael@gmail.com");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Felipe Coelho", "felipe", md5("123@senac"));

/*READ*/
/* Ler/Buscar as informações da tabela funcionários */ 
select * from funcionarios;

/* Buscar o login e a senha da tabela funcionarios em que o login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha =md5("admin");

/*Buscar o ID e o nome do funcionário da tabela funcionários ordenado o nome alfabeticamente (ascendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

/*Buscar o ID e o nome do funcionário da tabela funcionários ordenado o nome alfabeticamente (descendente, de Z a A) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

/*Buscar os acmpos ID com o apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario
da tabela funcionários ordenado de forma descedente (do maior ID para o menor) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by idFunc desc;

/*Buscar os campos ID com o apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario
da tabela funcionários ordenado de forma descedente (do maior ID para o menor) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios  where cargo <> 'null' order by idFunc desc;

select * from funcionarios  where cargo = 'Gerência' order by NomeFunc asc;


/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "felipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerência" where idFunc = 2;

update funcionarios set email = "lauralopes@gmail.com" where idFunc = 1;

update funcionarios set email = "victoriacardoso@gmail.com" where idFunc = 2;

update funcionarios set email = "brenosilva@gmail.com" where idFunc = 3;

update funcionarios set email = "pamellapereto@gmail.com" where idFunc = 5;

update funcionarios set email = "felipecoelho@gmail.com" where idFunc = 6;



/*DELETE */

delete from funcionarios where idFunc = 9;

create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacacaoMax int not null,
	situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
    
);

describe quartos;

alter table quartos add column numeroQuarto varchar(10) not null after andar;







