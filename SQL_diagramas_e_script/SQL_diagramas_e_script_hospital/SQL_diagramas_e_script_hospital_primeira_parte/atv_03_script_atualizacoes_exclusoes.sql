alter table medico add column em_atividade bit not null default(1);
update medico set em_atividade = 0 where id = 3 or id =9;
select*from medico;

/*Crie um comando SQL para atualizar as datas de 
alta nas internações em quartos de enfermaria para três dias após a entrada.*/

update internacao set dat_alta = data_entrada+03 where id_quarto = 1; 
select*from internacao;

/*Crie comandos SQL para excluir o último convênio cadastrado. 
Note que também será necessária a exclusão das consultas relacionadas a esse convênio.*/

select*from atendimento;
update atendimento set convenio_id = null where convenio_id = 4;
select*from paciente;
update paciente set convenio_id = null where convenio_id = 4;
select*from convenio;
delete from convenio where id = 4;
