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
    ocupacaoMax int not null,
	situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
    
);

describe quartos;

delete from quartos where idQuarto = 2;

alter table quartos change ocupacacaoMax ocupacaoMax int not null;

alter table quartos add column numeroQuarto varchar(10) not null after andar;

alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto varchar(255) not null after descricao; 

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("5°", "505", "Superior Premier", "3", "não", 
"Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', wi-fi gratis, cofre digital, 
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 750.90, "Queen Size", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, cafeDaManha, tipoCama, varanda) values ("10°", "14", "Suite Presidencial", "2", "não", 
"Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 50'', wi-fi gratis, cofre digital, 
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 5000, "sim", "Queen Size", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5°", "33", "Room Standard", "2", "não", 
"Casal", "O quarto de 30m² com piso frio, varanda. Oferece ar condicionado individual, TV LCD 40'', wi-fi gratis,
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://www.revistasim.com.br/wp-content/uploads/2021/03/revistaSIM_Arquitetura_Quarto-de-hotel-em-casa_Destaque_Credito_Eduardo-Pozella-1155x500.jpg",  409, "nao", "Queen Size", "sim");

update quartos set cafeDaManha = "sim" where idQuarto = 1;
update quartos set foto = "https://www.revistasim.com.br/wp-content/uploads/2021/03/revistaSIM_Arquitetura_Quarto-de-hotel-em-casa_Destaque_Credito_Eduardo-Pozella-1155x500.jpg" where idQuarto = 1;
update quartos set foto = "https://www.hplus.com.br/wp-content/uploads/2019/08/quarto-cama-casal-hotel-vision-hplus-em-brasilia-13.jpg" where idQuarto = 3;


select * from quartos;

select * from quartos where situacao = 'não';

select * from quartos  where cafeDaManha = "sim" and situacao = "nao";

select * from quartos where varanda = "sim" and cafeDaManha = "sim" and situacao = "nao";

select * from quartos order by preco desc;

select * from quartos where preco < 700.00 and situacao = "nao";


/*dataPedido timestap default current_timestap significa que a data do pedido será a mesma do sistema, ou seja, a data atual
statusPedido significa que a situação do pedido será uma das seguintes opções: Pendente, Finalizado, Cancelado */

create table pedido (
    idpedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key (idCliente) references clientes (idCliente) 
);

insert into pedido (statusPedido, idCliente) values ("Pendente", 1);
insert into pedido (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedido;

describe pedido;

create table reservas (
	idReserva int primary key auto_increment, 
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedido (idPedido),
    foreign key (idQuarto) references quartos (idQuarto)
    
);

describe reservas;
    

create table clientes (
    idCliente int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) unique,
    celular varchar(20) not null,
    numeroCartao varchar(20) not null unique,
    nomeTitular varchar(100) not null,
    validade date not null,
    cvv char(3) not null,
    checkin datetime not null,
    checkout datetime not null

);

describe clientes;

drop table clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803", "5526 4863 8286 2543", "Jose de Assis", "2025-03-24", "452", "2023-11-02 14:00:00", "2023-11-05 12:00:00");


insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
("Nathan Hitler", "452.230.750-78", "84.560.325-5", "nathanhitler@gmail.com", "(49) 99525-9820", "6205 9620 3281 8524", "Nathan Hitler", "2025-04-20", "352", "2023-12-05 14:00:00", "2023-12-08 12:00:00");

select * from clientes;

/* Busacr o nome completo e o celular do cliente que alugou o quarto de número 14, pois a tabela quartos está vinculada á tabela clientes pelo campo idQuarto */ 
select clientes.nomeCompleto,
clientes.celular
from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 14;

/* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada á tabela clientes pelo campo idQuarto */
select * from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto;

/* Buscar o nome completo e data/horário do checkout do cliente que alugou o quarto  de número 14 */
select clientes.nomeCompleto,date_format (clientes.checkout,'%d/%m/%Y - %H:%i') as Checkout  from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 14; 



