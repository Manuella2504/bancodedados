CREATE DATABASE Marmitex;
USE marmitex;

create table cliente(
telefone varchar(255) not null,
nome varchar(255) not null,
endereco varchar(225) not null,
pontoreferencia varchar(255) not null,
nascimento date not null,
primary key(telefone)
);

create table login(
id integer not null auto_increment,
email varchar(255) not null,
senha varchar(255) not null,
nivel_acesso integer null,
primary key(id)
); 

create table empresa(
id integer not null auto_increment,
nome varchar(255) not null,
cnpj varchar(255) not null unique,
email varchar(255) not null,
telefone varchar(255) null,
endereco varchar(255) null,
primary key(id)
);

create table marmita(
id integer not null,
nome varchar(255) not null,
descricao mediumtext not null,
tamanho varchar(100) not null,
primary key(id)
);

create table pedido(
id integer not null,
telefone_cliente varchar(255) not null,
id_entregador integer not null,
status varchar(255) not null,
taxa_entrega varchar(255) not null,
data_pedido datetime null default now(),
primary key(id),
constraint fk_cliente_pedido foreign key(telefone_cliente) references cliente(telefone),
constraint fk_entregador_pedido foreign key(id_entregador) references entregador(id)
);

create table item_pedido(
id INT PRIMARY KEY AUTO_INCREMENT,
id_marmita integer not null,
id_pedido integer not null,
quantidade integer not null,
constraint fk_item_pedido_marmita foreign key(id_marmita) references marmita(id),
constraint fk_item_pedido_pedido foreign key(id_pedido) references pedido(id)
);

create table entregador(
id integer not null auto_increment,
id_empresa integer not null,
nome varchar(255) not null,
cpf varchar(255) not null unique,
celular varchar(255) null,
primary key(id),
constraint fk_entregador_empresa foreign key(id_empresa) references empresa(id)
);



