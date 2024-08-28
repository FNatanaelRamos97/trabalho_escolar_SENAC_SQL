USE uc4atividades;

/*Crie um stored procedure que receba id de cliente, data inicial e data final, 
e que mostre a lista de compras realizadas pelo referido cliente entre as datas informadas (incluindo essas datas),
 mostrando nome do cliente, id da compra, total, nome e quantidade de cada produto comprado. 
No script, inclua o código de criação e o comando de chamada da procedure.*/

DELIMITER //
CREATE PROCEDURE pesquisa(
id_cliente INT,
data_compra DATETIME,
data_final DATETIME
)
BEGIN
SELECT c.nome, v.id, iv.quantidade, iv.nome_produto, iv.subtotal, v.data, v.data_envio
FROM venda AS v JOIN cliente AS c ON v.cliente_id = c.id JOIN item_venda AS iv ON v.id = iv.venda_id
WHERE id_cliente = c.id AND v.data BETWEEN data_compra AND data_final; 
END //
DELIMITER ;

CALL pesquisa(2, '2019-02-02 00:00:00','2020-02-09 23:59:00');

/*Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”.
 Um cliente é “PREMIUM” se já realizou mais de R$ 10 mil em compras na loja.  Se não, é um cliente “REGULAR”. 
No script, inclua o código de criação e o comando de chamada da function.*/

DELIMITER //
CREATE FUNCTION buscar_cliente(
id_cliente INT
) RETURNS VARCHAR(15) DETERMINISTIC 
BEGIN
DECLARE total DECIMAL(9,2);
DECLARE menssagem VARCHAR(30);

SELECT SUM(iv.subtotal) INTO total FROM item_venda AS iv JOIN venda AS v ON iv.venda_id = v.id WHERE id_cliente = v.cliente_id;

IF total >= 10000.00 THEN
  SET menssagem := "Cliente premium";
  ELSE 
  SET menssagem := "Cliente regular";
  END IF;

RETURN (menssagem);
END//
DELIMITER ;

DROP FUNCTION buscar_cliente;
SELECT buscar_cliente(9);

/*Crie um trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário, aplique automaticamente MD5() à coluna “senha”; 
utilize nesta atividade variáveis com NEW.*/

DELIMITER //
CREATE TRIGGER atualizar_senha BEFORE INSERT
ON usuario
FOR EACH ROW
BEGIN
SET NEW.senha = MD5(NEW.senha);
END//
DELIMITER ;

DROP TRIGGER atualizar_senha;
INSERT INTO usuario(login, senha, ultimo_login)
VALUES ('abreu123','abreu123','2024-01-24 16:01:00');