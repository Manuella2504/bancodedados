/*====================================== PARTE DDL-CRIAÇÃO DO BANCO DE DADOS VENDAS ======================================*/
CREATE DATABASE IF NOT EXISTS VENDAS;
USE VENDAS;


CREATE TABLE VENDEDOR (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0)
);


CREATE TABLE VENDA (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor)
);


CREATE TABLE ITEM_VENDA (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario >= 0),
    FOREIGN KEY (id_venda) REFERENCES VENDA(id_venda),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

/*====================================== PARTE DML-SELECT ======================================*/

SELECT 
    v.id_vendedor,
    COUNT(*) AS total_vendas
FROM 
    VENDA v
GROUP BY 
    v.id_vendedor;

SELECT 
    v.id_vendedor,
    MAX(iv.valor_unitario) AS produto_mais_caro
FROM 
    VENDA v
JOIN 
    ITEM_VENDA iv ON v.id_venda = iv.id_venda
GROUP BY 
    v.id_vendedor;

SELECT 
    v.id_vendedor,
    SUM(iv.quantidade) AS total_unidades
FROM 
    VENDA v
JOIN 
    ITEM_VENDA iv ON v.id_venda = iv.id_venda
GROUP BY 
    v.id_vendedor
HAVING 
    SUM(iv.quantidade) > 5;

SELECT 
    p.id_produto,
    p.nome AS nome_produto,
    AVG(iv.valor_unitario) AS media_valor_unitario
FROM 
    ITEM_VENDA iv
JOIN 
    PRODUTO p ON iv.id_produto = p.id_produto
GROUP BY 
    p.id_produto, p.nome;

SELECT 
    iv.id_produto,
    p.nome AS nome_produto,
    SUM(iv.quantidade) AS total_vendido
FROM 
    ITEM_VENDA iv
JOIN 
    PRODUTO p ON iv.id_produto = p.id_produto
GROUP BY 
    iv.id_produto, p.nome
ORDER BY 
    total_vendido DESC
LIMIT 1;

