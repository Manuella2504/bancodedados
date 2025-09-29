USE RESTAURANTES;

SELECT * FROM CLIENTE;



SELECT * FROM MARMITA WHERE preco = 15.00;

SELECT * FROM MARMITA WHERE preco <> 20.00;

SELECT * FROM PEDIDO WHERE data_pedido > '2025-09-01';

SELECT * FROM CLIENTE WHERE data_nascimento < '2000-01-01';

SELECT * FROM MARMITA WHERE preco >= 25.00;

SELECT * FROM MARMITA WHERE preco <= 10.00;

SELECT * FROM CLIENTE WHERE endereco = 'Centro';

SELECT * FROM ENTREGADOR WHERE empresa_id = 1;



SELECT * FROM MARMITA WHERE tamanho IN ('Pequena', 'Média', 'Grande');

SELECT * FROM ENTREGADOR WHERE empresa_id NOT IN (2, 3, 5);



SELECT * FROM ENTREGADOR WHERE celular IS NULL;

SELECT * FROM CLIENTE WHERE endereco IS NOT NULL;

SELECT * FROM PEDIDO WHERE taxa_entrega IS NULL;





SELECT * FROM MARMITA WHERE preco BETWEEN 10.00 AND 25.00;

SELECT * FROM PEDIDO WHERE data_pedido BETWEEN '2025-09-01' AND '2025-09-05';

SELECT * FROM CLIENTE WHERE nome LIKE 'A%';

SELECT * FROM ENTREGADOR WHERE cpf LIKE '%99';

SELECT * FROM MARMITA WHERE descricao LIKE '%Frango%';

SELECT * FROM MARMITA WHERE preco > 20.00 AND tamanho = 'Grande';

SELECT * FROM PEDIDO WHERE status = 'Entregue' OR status = 'Em andamento';




SELECT MAX(preco) FROM MARMITA;

SELECT MIN(preco) FROM MARMITA;

SELECT AVG(preco) FROM MARMITA;

SELECT COUNT(*) FROM CLIENTE;

SELECT COUNT(*) FROM PEDIDO;

SELECT SUM(preco) FROM MARMITA;


SELECT 
    p.id_pedido,
    c.nome AS nome_cliente,
    c.endereco
FROM 
    PEDIDO p
INNER JOIN 
    CLIENTE c ON p.id_cliente = c.id_cliente;


SELECT 
    p.id_pedido,
    c.nome AS nome_cliente,
    e.nome AS nome_entregador,
    p.data_pedido
FROM 
    PEDIDO p
INNER JOIN 
    CLIENTE c ON p.id_cliente = c.id_cliente
INNER JOIN 
    ENTREGADOR e ON p.id_entregador = e.id_entregador;


SELECT 
    i.id_pedido,
    m.nome AS nome_marmita,
    i.quantidade,
    i.valor_unitario
FROM 
    ITEM_PEDIDO i
INNER JOIN 
    MARMITA m ON i.id_marmita = m.id_marmita;


SELECT 
    c.id_cliente,
    c.nome AS nome_cliente,
    p.id_pedido
FROM 
    CLIENTE c
LEFT JOIN 
    PEDIDO p ON c.id_cliente = p.id_cliente;


SELECT 
    e.id_entregador,
    e.nome AS nome_entregador,
    p.id_pedido
FROM 
    ENTREGADOR e
LEFT JOIN 
    PEDIDO p ON e.id_entregador = p.id_entregador;


SELECT 
    p.id_pedido,
    m.nome AS nome_marmita
FROM 
    PEDIDO p
LEFT JOIN 
    ITEM_PEDIDO i ON p.id_pedido = i.id_pedido
LEFT JOIN 
    MARMITA m ON i.id_marmita = m.id_marmita;


SELECT 
    emp.nome_empresa,
    e.nome AS nome_entregador
FROM 
    ENTREGADOR e
RIGHT JOIN 
    EMPRESA emp ON e.empresa_id = emp.id_empresa;


SELECT 
    p.id_pedido,
    c.nome AS nome_cliente
FROM 
    CLIENTE c
RIGHT JOIN 
    PEDIDO p ON c.id_cliente = p.id_cliente;


SELECT 
    m.nome AS nome_marmita,
    i.id_pedido
FROM 
    ITEM_PEDIDO i
RIGHT JOIN 
    MARMITA m ON i.id_marmita = m.id_marmita;


SELECT 
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM 
    CLIENTE c
INNER JOIN 
    PEDIDO p ON c.id_cliente = p.id_cliente
GROUP BY 
    c.id_cliente, c.nome
ORDER BY 
    total_pedidos DESC;


SELECT 
    m.id_marmita,
    m.nome AS nome_marmita
FROM 
    MARMITA m
LEFT JOIN 
    ITEM_PEDIDO i ON m.id_marmita = i.id_marmita
WHERE 
    i.id_marmita IS NULL;


SELECT 
    e.nome AS nome_entregador,
    emp.nome_empresa
FROM 
    ENTREGADOR e
LEFT JOIN 
    EMPRESA emp ON e.empresa_id = emp.id_empresa;

