USE uc4atividades;
SELECT*FROM mysql.user;

/*Crie um usuário chamado user_relatorio. Crie role para ele, com acesso ao comando SELECT de todas tabelas da base de dados uc4atividades.
 Não pode ser definido para este usuário nenhum outro comando DDL ou DML além do SELECT.*/
 
 CREATE ROLE 'leitor_relatorio';
 GRANT SELECT ON uc4atividades.* TO 'leitor_relatorio'; 
 FLUSH PRIVILEGES;
 CREATE USER 'user_relatorio'@'localhost';
 GRANT 'leitor_relatorio' TO 'user_relatorio'@'localhost';
 SET DEFAULT ROLE 'leitor_relatorio' TO 'user_relatorio'@'localhost';
 FLUSH PRIVILEGES;
 
 /*Crie usuário chamado user_funcionario. Crie role para esse usuário. 
 Ele poderá manipular as tabelas de venda, cliente e produto da base de dados uc4atividades, 
 ou seja, poderá fazer apenas os comandos de SELECT, INSERT, UPDATE e DELETE.*/
 
CREATE ROLE 'funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'funcionario'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'funcionario'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'funcionario'; 
FLUSH PRIVILEGES;
CREATE USER 'user_funcionario'@'localhost';
GRANT 'funcionario' TO 'user_funcionario'@'localhost';
SET DEFAULT ROLE 'funcionario' TO 'user_funcionario'@'localhost';
FLUSH PRIVILEGES;

