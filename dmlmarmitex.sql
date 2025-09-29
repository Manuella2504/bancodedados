--tabela cliente

INSERT INTO cliente VALUES ('76789890098', 'Manuella', 'Barra', 'Próximo a praia', '2008-04-25');
INSERT INTO cliente VALUES ('76759497878', 'Ramon', 'Barra', 'Próximo a praia', '2006-11-22');
INSERT INTO cliente VALUES ('76779099098', 'Marcelle', 'Barra', 'Próximo a praia', '2007-11-02');
INSERT INTO cliente VALUES ('76789890658', 'Camila', 'Barra', 'Próximo a praia', '2007-06-08');
INSERT INTO cliente VALUES ('76778790987', 'Cátia', 'Barra', 'Próximo a praia', '2008-04-09');
INSERT INTO cliente VALUES ('76789909094', 'Duda', 'Barra', 'Próximo a praia', '2007-05-25');
INSERT INTO cliente VALUES ('76789337909', 'Dilma', 'Barra', 'Próximo a praia', '2008-05-11');
INSERT INTO cliente VALUES ('76783466789', 'Pedro', 'Barra', 'Próximo a praia', '2008-10-12');
INSERT INTO cliente VALUES ('96586764533', 'João', 'Barra', 'Próximo a praia', '2002-02-25');
INSERT INTO cliente VALUES ('75444356898', 'Jesus', 'Barra', 'Próximo a praia', '2000-12-25');

UPDATE cliente SET nome='Juscelino' where telefone='96586764533';
UPDATE cliente SET nome='Fabiana' where telefone='76778790987';
UPDATE cliente SET nome='Eduarda' where telefone='76789909094';
UPDATE cliente SET nome='Dandara' where telefone='76789337909';
UPDATE cliente SET nome='Julio Cezar' where telefone='76783466789';

DELETE from cliente where telefone='96586764533';
DELETE from cliente where telefone='76783466789';

SELECT * FROM marmitex;


--tabela login 

INSERT INTO login VALUES ('smanuella918@gmail.com', '12345678', '2');
INSERT INTO login VALUES ('manu08@gmail.com', '85960400', '3');
INSERT INTO login VALUES ('manuzinha25@gmail.com', '33456789', '2');
INSERT INTO login VALUES ('manuella2504@gmail.com', '90876543', '2');
INSERT INTO login VALUES ('manuellasouza250408@gmail.com', '90908765', '1');
INSERT INTO login VALUES ('rm2211@gmail.com', '44567742', '2');
INSERT INTO login VALUES ('ramonpires1212@gmail.com', '09876890', '2');
INSERT INTO login VALUES ('soulemonpie2121@gmail.com', '89874689', '4');
INSERT INTO login VALUES ('ramonpm1122@gmail.com', '12098345', '5');
INSERT INTO login VALUES ('rpm2211@gmail.com', '09812398', '5');


UPDATE login SET nivel_acesso='1' where telefone='1';
UPDATE login SET nivel_acesso='2' where telefone='2';
UPDATE login SET nivel_acesso='3' where telefone='3';
UPDATE login SET nivel_acesso='4' where telefone='4';
UPDATE login SET nivel_acesso='5' where telefone='5';


DELETE from login where telefone='1';
DELETE from cliente where telefone='2';
