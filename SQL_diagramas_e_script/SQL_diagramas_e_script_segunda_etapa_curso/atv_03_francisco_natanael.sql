USE uc4atividades;

/*Execute o comando EXPLAIN mostrando detalhes da execução da consulta e tire um print.*/

EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

EXPLAIN SELECT * FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

/*Realize ajustes de otimização nas consultas utilizando JOINs entre as tabelas, assim como removendo os asteriscos (*) 
e definindo quais colunas devem ser retornadas de cada consulta, a fim de otimizá-la.*/

/**consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
SELECT v.data, iv.subtotal, iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.telefone
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
WHERE v.tipo_pagamento = 'D' ORDER BY v.data DESC;  

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
SELECT iv.nome_produto, iv.quantidade, v.data, p.fabricante
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN produto p ON iv.produto_id = p.id
WHERE p.fabricante LIKE '%ial%';

/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
SELECT c.nome, iv.nome_produto, SUM(iv.quantidade), SUM(iv.subtotal)
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
GROUP BY c.nome, iv.nome_produto;

/*Crie índices que possam se beneficiar do recurso para melhorar o desempenho das consultas,
 considerando principalmente colunas utilizadas nas cláusulas WHERE.*/

CREATE INDEX idx_fabricante ON produto(fabricante);
CREATE INDEX idx_nome_cliente ON cliente(nome);
CREATE INDEX idx_tipo_pagamento ON venda(tipo_pagamento);
CREATE INDEX idx_nome_produto ON item_venda(nome_produto);

SHOW INDEX FROM cliente;

/*Execute novamente o comando EXPLAIN, mostrando agora os detalhes da execução da consulta
 depois das otimizações realizadas e tire um print.*/
EXPLAIN SELECT v.data, iv.subtotal, iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.telefone
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
WHERE v.tipo_pagamento = 'D' ORDER BY v.data DESC;  

EXPLAIN SELECT iv.nome_produto, iv.quantidade, v.data, p.fabricante
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN produto p ON iv.produto_id = p.id
WHERE p.fabricante LIKE '%ial%';

EXPLAIN SELECT c.nome, iv.nome_produto, SUM(iv.quantidade), SUM(iv.subtotal)
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
GROUP BY c.nome, iv.nome_produto;

/*Crie uma view para cada uma das consultas ajustadas com JOINS.*/
CREATE VIEW rel_ven_dinheiro AS SELECT v.data, iv.subtotal, iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.telefone
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
WHERE v.tipo_pagamento = 'D' ORDER BY v.data DESC;

CREATE VIEW rel_ven_fabricante AS SELECT iv.nome_produto, iv.quantidade, v.data, p.fabricante
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN produto p ON iv.produto_id = p.id
WHERE p.fabricante LIKE '%ial%';

CREATE VIEW rel_ven_cliente AS SELECT c.nome, iv.nome_produto, SUM(iv.quantidade), SUM(iv.subtotal)
FROM venda v JOIN item_venda iv ON iv.venda_id = v.id JOIN cliente c ON v.cliente_id = c.id
GROUP BY c.nome, iv.nome_produto;

SELECT*FROM rel_ven_dinheiro;
SELECT*FROM rel_ven_fabricante;
SELECT*FROM rel_ven_cliente;
