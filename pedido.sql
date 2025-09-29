CREATE DATABASE Pedido;
USE Pedido;

create table cliente(
idcliente int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
senha varchar(20) not null,
rua varchar(50) not null,
cidade varchar(20) not null,
bairro varchar(20) not null,
cep varchar(8) not null,
estado varchar(20) not null,
primary key(idcliente)
);


create table categorias(
idcategorias int not null auto_increment,
categoria varchar(50) not null,
primary key(idcategorias)
);

create table pedidos(
idpedido int not null auto_increment,
datadopedido datetime not null,
idcliente int not null,
statusdoepedido varchar(50) null,
sessao varchar(50) null,
primary key(idpedido),
constraint fk_pedidos_cliente foreign key(idcliente) references cliente(idcliente)
);

create table produtos(
idprodutos int not null auto_increment,
idcategorias int not null,
produtos varchar(50) not null,
quantidade  varchar(50) not null,
descricao  varchar(100) not null,
primary key(idprodutos),
constraint fk_produtos_categorias foreign key(idcategorias) references categorias(idcategorias)
);

create table pedidoitens(
iditem int not null auto_increment,
idpedido int not null,
idprodutos int not null,
produto varchar(50) not null,
quantidade varchar(50) not null,
valor int not null,
subtotal int not null,
primary key(iditem),
constraint fk_pedidoitens_pedidos foreign key(idpedido) references pedidos(idpedido),
constraint fk_pedidoitens_produtos foreign key(idprodutos) references produtos(idprodutos)
);

create table carrinho(
iditem int not null auto_increment,
sessao varchar(50) not null,
idprodutos int not null,
quantidade int not null,
preco float not null,
primary key(iditem),
constraint fk_carrinho_produtos foreign key(idprodutos) references produtos(idprodutos)
);

create table usuarios(
idusuario int not null auto_increment,
usuario varchar(50) not null,
senha varchar(20) not null,
primary key(idusuario)
);
