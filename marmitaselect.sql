-- =====================================================
-- SISTEMA DE DELIVERY DE MARMITAS - BANCO DE DADOS
-- =====================================================

-- Criação das tabelas
CREATE DATABASE IF NOT EXISTS sistema_marmitas;
USE sistema_marmitas;

-- Tabela EMPRESA
CREATE TABLE EMPRESA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela ENTREGADOR
CREATE TABLE ENTREGADOR (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    celular VARCHAR(15),
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES EMPRESA(id)
);

-- Tabela MARMITA
CREATE TABLE MARMITA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    tamanho ENUM('Pequena', 'Média', 'Grande') NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela PEDIDO
CREATE TABLE PEDIDO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    entregador_id INT,
    data_pedido DATETIME NOT NULL,
    status ENUM('Pendente', 'Em andamento', 'Entregue', 'Cancelado') DEFAULT 'Pendente',
    taxa_entrega DECIMAL(10,2),
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id),
    FOREIGN KEY (entregador_id) REFERENCES ENTREGADOR(id)
);

-- Tabela ITEM_PEDIDO (relacionamento entre pedido e marmita)
CREATE TABLE ITEM_PEDIDO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    marmita_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES PEDIDO(id),
    FOREIGN KEY (marmita_id) REFERENCES MARMITA(id)
);

-- =====================================================
-- INSERÇÃO DE DADOS DE EXEMPLO
-- =====================================================

-- Inserindo empresas
INSERT INTO EMPRESA (nome, endereco, telefone) VALUES
(1, 'Delivery Express', 'Rua das Flores, 123', '(11) 1234-5678'),
(2, 'Fast Food Delivery', 'Av. Principal, 456', '(11) 2345-6789'),
(3, 'Moto Entrega', 'Rua do Comércio, 789', '(11) 3456-7890'),
(4, 'Speed Delivery', 'Av. Central, 321', '(11) 4567-8901'),
(5, 'Rápido & Seguro', 'Rua Nova, 654', '(11) 5678-9012');

-- Inserindo clientes
INSERT INTO CLIENTE (nome, cpf, data_nascimento, endereco, telefone, email) VALUES
('Ana Silva', '123.456.789-01', '1995-03-15', 'Centro', '(11) 9876-5432', 'ana@email.com'),
('Bruno Santos', '234.567.890-12', '1988-07-22', 'Jardim Paulista', '(11) 9765-4321', 'bruno@email.com'),
('Carlos Oliveira', '345.678.901-23', '2001-11-08', 'Vila Nova', '(11) 9654-3210', 'carlos@email.com'),
('Diana Costa', '456.789.012-34', '1992-05-30', 'Centro', '(11) 9543-2109', 'diana@email.com'),
('Eduardo Lima', '567.890.123-45', '1985-12-03', NULL, '(11) 9432-1098', 'eduardo@email.com'),
('Fernanda Rocha', '678.901.234-56', '1999-09-17', 'Bela Vista', NULL, 'fernanda@email.com'),
('Gabriel Mendes', '789.012.345-67', '1976-04-25', 'Centro', '(11) 9210-9876', 'gabriel@email.com'),
('Helena Torres', '890.123.456-78', '2003-08-12', 'Liberdade', '(11) 9109-8765', 'helena@email.com'),
('Igor Ferreira', '901.234.567-89', '1990-01-28', 'Vila Mariana', '(11) 9098-7654', 'igor@email.com'),
('Julia Martins', '012.345.678-90', '1998-06-14', NULL, '(11) 8987-6543', 'julia@email.com');

-- Inserindo entregadores
INSERT INTO ENTREGADOR (nome, cpf, celular, empresa_id) VALUES
('João Moto', '111.222.333-44', '(11) 99999-0001', 1),
('Pedro Bike', '222.333.444-55', '(11) 99999-0002', 1),
('Lucas Fast', '333.444.555-66', NULL, 2),
('Rafael Speed', '444.555.666-77', '(11) 99999-0004', 2),
('Thiago Quick', '555.666.777-88', '(11) 99999-0005', 3),
('Marcelo Rush', '666.777.888-99', '(11) 99999-0006', 4),
('Antonio Veloz', '777.888.999-00', '(11) 99999-0007', 4),
('Roberto Flash', '888.999.000-11', '(11) 99999-0008', 5);

-- Inserindo marmitas
INSERT INTO MARMITA (descricao, tamanho, preco) VALUES
('Marmita de Frango Grelhado com Arroz e Feijão', 'Grande', 25.00),
('Marmita de Carne de Panela com Purê', 'Média', 22.00),
('Marmita Vegetariana com Legumes', 'Pequena', 15.00),
('Marmita de Frango à Parmegiana', 'Grande', 28.00),
('Marmita de Peixe Assado', 'Média', 20.00),
('Marmita Fitness de Frango', 'Pequena', 18.00),
('Marmita de Feijoada', 'Grande', 30.00),
('Marmita de Strogonoff de Carne', 'Média', 24.00),
('Marmita Infantil', 'Pequena', 12.00),
('Marmita de Lasanha', 'Grande', 26.00),
('Marmita de Arroz Carreteiro', 'Média', 19.00),
('Marmita Light', 'Pequena', 16.00),
('Marmita de Frango Xadrez', 'Média', 21.00),
('Marmita Executiva', 'Grande', 35.00),
('Marmita de Salada', 'Pequena', 10.00),
('Marmita de Picanha', 'Grande', 40.00),
('Marmita de Frango Caipira', 'Média', 23.00),
('Marmita Básica', 'Pequena', 8.00);

-- Inserindo pedidos
INSERT INTO PEDIDO (cliente_id, entregador_id, data_pedido, status, taxa_entrega, valor_total) VALUES
(1, 1, '2025-08-25 12:30:00', 'Entregue', 5.00, 30.00),
(2, 2, '2025-09-01 13:15:00', 'Entregue', 4.50, 26.50),
(3, 3, '2025-09-02 19:20:00', 'Em andamento', 6.00, 31.00),
(4, 1, '2025-09-03 12:45:00', 'Entregue', 5.50, 27.50),
(5, 4, '2025-09-03 18:30:00', 'Em andamento', NULL, 45.00),
(6, 2, '2025-09-04 14:10:00', 'Pendente', 4.00, 24.00),
(7, 5, '2025-09-04 20:00:00', 'Em andamento', 7.00, 37.00),
(8, 3, '2025-09-05 11:30:00', 'Pendente', NULL, 22.00),
(9, 6, '2025-09-05 17:45:00', 'Em andamento', 5.50, 33.50),
(10, 4, '2025-09-05 19:15:00', 'Entregue', 6.50, 28.50);

-- Inserindo itens dos pedidos
INSERT INTO ITEM_PEDIDO (pedido_id, marmita_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 25.00), -- Frango Grelhado
(2, 3, 1, 15.00), -- Vegetariana
(2, 12, 1, 16.00), -- Light
(3, 4, 1, 28.00), -- Frango Parmegiana  
(4, 2, 1, 22.00), -- Carne de Panela
(5, 16, 1, 40.00), -- Picanha
(6, 5, 1, 20.00), -- Peixe Assado
(7, 7, 1, 30.00), -- Feijoada
(8, 11, 1, 19.00), -- Arroz Carreteiro
(9, 8, 1, 24.00), -- Strogonoff
(10, 13, 1, 21.00); -- Frango Xadrez

-- =====================================================
-- CONSULTAS SQL PARA RESOLVER A ATIVIDADE
-- =====================================================

-- 1.1 Liste todos os registros da tabela CLIENTE
SELECT * FROM CLIENTE;

-- 2.1 Liste todas as marmitas que custam exatamente 15,00
SELECT * FROM MARMITA WHERE preco = 15.00;

-- 2.2 Liste todas as marmitas com preço diferente de 20,00
SELECT * FROM MARMITA WHERE preco != 20.00;

-- 2.3 Liste todos os pedidos feitos após 01/09/2025
SELECT * FROM PEDIDO WHERE data_pedido > '2025-09-01';

-- 2.4 Liste todos os clientes que nasceram antes de 01/01/2000
SELECT * FROM CLIENTE WHERE data_nascimento < '2000-01-01';

-- 2.5 Liste todas as marmitas com valor maior ou igual a 25,00
SELECT * FROM MARMITA WHERE preco >= 25.00;

-- 2.6 Liste todas as marmitas com valor menor ou igual a 10,00
SELECT * FROM MARMITA WHERE preco <= 10.00;

-- 3.1 Liste os clientes cujo endereço seja "Centro"
SELECT * FROM CLIENTE WHERE endereco = 'Centro';

-- 3.2 Liste os entregadores que pertencem à empresa de ID = 1
SELECT * FROM ENTREGADOR WHERE empresa_id = 1;

-- 4.1 Liste todas as marmitas cujo tamanho esteja entre 'Pequena', 'Média' ou 'Grande'
SELECT * FROM MARMITA WHERE tamanho IN ('Pequena', 'Média', 'Grande');

-- 4.2 Liste todos os entregadores que NÃO pertencem às empresas de ID 2, 3 e 5
SELECT * FROM ENTREGADOR WHERE empresa_id NOT IN (2, 3, 5);

-- 5.1 Liste todos os entregadores que não possuem celular cadastrado
SELECT * FROM ENTREGADOR WHERE celular IS NULL;

-- 5.2 Liste todos os clientes que possuem endereço preenchido
SELECT * FROM CLIENTE WHERE endereco IS NOT NULL;

-- 5.3 Liste todos os pedidos que não possuem taxa de entrega cadastrada
SELECT * FROM PEDIDO WHERE taxa_entrega IS NULL;

-- 6.1 Liste todas as marmitas com valor entre 10,00 e 25,00
SELECT * FROM MARMITA WHERE preco BETWEEN 10.00 AND 25.00;

-- 6.2 Liste todos os pedidos feitos entre 01/09/2025 e 05/09/2025
SELECT * FROM PEDIDO WHERE data_pedido BETWEEN '2025-09-01' AND '2025-09-05';

-- 7.1 Liste todos os clientes cujo nome comece com a letra 'A'
SELECT * FROM CLIENTE WHERE nome LIKE 'A%';

-- 7.2 Liste todos os entregadores cujo CPF termine com '99'
SELECT * FROM ENTREGADOR WHERE cpf LIKE '%99';

-- 7.3 Liste todas as marmitas que contenham a palavra 'Frango' na descrição
SELECT * FROM MARMITA WHERE descricao LIKE '%Frango%';

-- 8.1 Liste todas as marmitas cujo preço seja maior que 20,00 E tamanho seja 'Grande'
SELECT * FROM MARMITA WHERE preco > 20.00 AND tamanho = 'Grande';

-- 8.2 Liste todos os pedidos que estão com status 'Entregue' OU 'Em andamento'
SELECT * FROM PEDIDO WHERE status = 'Entregue' OR status = 'Em andamento';

-- 9.1 Mostre o valor mais caro de todas as marmitas
SELECT MAX(preco) AS valor_mais_caro FROM MARMITA;

-- 9.2 Mostre o valor mais barato de todas as marmitas
SELECT MIN(preco) AS valor_mais_barato FROM MARMITA;

-- 9.3 Calcule a média de preços das marmitas
SELECT AVG(preco) AS media_precos FROM MARMITA;

-- 9.4 Conte quantos clientes existem cadastrados
SELECT COUNT(*) AS total_clientes FROM CLIENTE;

-- 9.5 Conte quantos pedidos existem no sistema
SELECT COUNT(*) AS total_pedidos FROM PEDIDO;

-- 9.6 Calcule o valor total (SUM) de todas as marmitas cadastradas
SELECT SUM(preco) AS valor_total_marmitas FROM MARMITA;

-- =====================================================
-- CONSULTAS EXTRAS ÚTEIS
-- =====================================================

-- Relatório completo de pedidos com informações dos clientes
SELECT 
    p.id AS pedido_id,
    c.nome AS cliente,
    p.data_pedido,
    p.status,
    p.valor_total,
    p.taxa_entrega
FROM PEDIDO p
JOIN CLIENTE c ON p.cliente_id = c.id
ORDER BY p.data_pedido DESC;

-- Marmitas mais vendidas
SELECT 
    m.descricao,
    m.preco,
    COUNT(ip.marmita_id) AS vezes_pedida
FROM MARMITA m
LEFT JOIN ITEM_PEDIDO ip ON m.id = ip.marmita_id
GROUP BY m.id, m.descricao, m.preco
ORDER BY vezes_pedida DESC;

-- Faturamento total por dia
SELECT 
    DATE(data_pedido) AS data,
    COUNT(*) AS total_pedidos,
    SUM(valor_total) AS faturamento_dia
FROM PEDIDO
GROUP BY DATE(data_pedido)
ORDER BY data DESC;
