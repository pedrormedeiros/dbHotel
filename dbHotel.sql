/* Banco de dados para gerenciamento de hotel */

create database dbHotel;

show databases;

use dbHotel;

create table funcionarios (
    idFunc int primary key auto_increment,
    nomeFunc varchar (100) not null,
    login varchar (20) not null unique,
    email varchar (50) not null,
    senha varchar (255) not null,
    cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Administrador", "admin", md5("admin"), "Administrador", "admin@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI", "pamellapereto@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade", "brenosilva@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "Gerência", "victoriacardoso@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Nathan Raphael", "nathanraphael", md5("123@senac"), "Gerência", "nathanraphael@gmail.com");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Felipe Coelho", "felipe", md5("123@senac"));

select * from funcionarios;
select login as Login, senha from funcionarios where login = "admin" and senha =md5("admin");

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by idFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios  where cargo <> 'null' order by idFunc desc;

select * from funcionarios  where cargo = 'Gerência' order by NomeFunc asc;

create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    numeroQuarto varchar (10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
	disponibilidade char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar (255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char (3) not null,
    precoCafe decimal (10,2),
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5°", "505", "Superior Premier", "3", "não", 
"Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', wi-fi gratis, cofre digital, 
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.",  "https://www.revistasim.com.br/wp-content/uploads/2021/03/revistaSIM_Arquitetura_Quarto-de-hotel-em-casa_Destaque_Credito_Eduardo-Pozella-1155x500.jpg", 750.90,  "sim", "60.00", "Queen Size", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("10°", "14", "Suite Presidencial", "2", "não", 
"Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 50'', wi-fi gratis, cofre digital, 
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.",  "https://www.revistasim.com.br/wp-content/uploads/2021/03/revistaSIM_Arquitetura_Quarto-de-hotel-em-casa_Destaque_Credito_Eduardo-Pozella-1155x500.jpg", 5000, "sim", "60.00", "Queen Size", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5°", "33", "Room Standard", "2", "não", 
"Casal", "O quarto de 30m² com piso frio, varanda. Oferece ar condicionado individual, TV LCD 40'', wi-fi gratis,
frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://www.revistasim.com.br/wp-content/uploads/2021/03/revistaSIM_Arquitetura_Quarto-de-hotel-em-casa_Destaque_Credito_Eduardo-Pozella-1155x500.jpg",  409, "nao", "Queen Size", "sim");

select * from quartos;

select * from quartos where disponibilidade = 'não';

select * from quartos  where cafeDaManha = "sim" and disponibilidade = "nao";

select * from quartos where varanda = "sim" and cafeDaManha = "sim" and disponibilidade = "nao";

select * from quartos order by preco desc;

select * from quartos where preco < 700.00 and disponibilidade = "nao";

create table clientes (
    idCliente int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) unique,
    celular varchar(20) not null
);

describe clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803");

insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("Nathan Hitler", "452.230.750-78", "84.560.325-5", "nathanhitler@gmail.com", "(49) 99525-9820");

select * from clientes;

create table pedido (
    idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key (idCliente) references clientes (idCliente) 
);

describe clientes;

insert into pedido (statusPedido, idCliente) values ("Pendente", 1);

insert into pedido (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedido;

select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;

create table reservas (
	idReserva int primary key auto_increment, 
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedido (idPedido),
    foreign key (idQuarto) references quartos (idQuarto),
    checkin datetime not null,
    checkout datetime not null
    
);

describe reservas;

insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 1, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 3, "2023-11-02 14:00:00", "2023-11-05 12:00:00");

insert into reservas(idPedido, idQuarto, checkin, checkout) values (2, 4, "2023-12-20 14:00:00", "2023-12-23 15:00:00");

select * from reservas;

select clientes.nomeCompleto, clientes.cpf, clientes.email, pedido.idPedido, pedido.dataPedido, quartos.tipoQuarto, 
quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout from 
clientes inner join pedido on clientes.idCliente = pedido.idCliente inner join 
reservas on reservas.idPedido = pedido.idPedido inner join quartos
on reservas .idQuarto = quartos.idQuarto;


select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido = 2;

/*cliente reservado: Nathan Hitler - idPedido 2
Quarto reservado: Room Standard (5 andar, numero 33, preço/diária: R$ 409,00)
check-in: 27/11/2023 ás 10h00
check-out: 08/12/2023 ás 12:00 */

/*Atualizar a disponibilidade do quarto somente daqueles cuja a data do checkout já passou ou é igual a data do sistema */
update reservas inner join quartos on reservas.idQuarto = quartos.idQuarto 
set quartos.disponibilidade = "sim" where reservas.checkout < current_timestamp();

select * from quartos;

/* Buscar o nome do cliente, andar, número do quarto e checkout somente daqueles
cuja data do checkout já passou ou é igual ao do sistema*/
select clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkout from 
clientes inner join pedido on clientes.idCliente = pedido.idCliente inner join 
reservas on reservas.idPedido = pedido.idPedido inner join quartos
on reservas.idQuarto = quartos.idQuarto where reservas.checkout <=current_timestamp();

/* Buscar o nome do cliente, andar, número do quarto, checkout (com data formatada em 99/99/9999) e 
o cálculo de quantos dias faltam para a reserva do cliente encerrar (dias restantes = data do checkout - data de hoje */
select clientes.nomeCompleto, andar, numeroQuarto, date_format(checkout, '%d/%m/%Y') as checkout,
datediff(checkout, curdate()) as dias_restantes from clientes inner join pedido
on clientes.idCliente = pedido.idCliente inner join reservas on reservas.idPedido = pedido.idPedido
inner join quartos on reservas.idQuarto = quartos.idQuarto  where reservas.checkout > current_timestamp();





