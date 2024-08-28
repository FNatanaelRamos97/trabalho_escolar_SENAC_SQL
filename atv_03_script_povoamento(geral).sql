/*Script de povoamento geral (inserts) da parte 1*/

select * from medico;

insert into medico(id, nome, data_nascimento, endereço, telefone, email, cpf, crm) values
(1, 'Mauricio','87-10-12','rua_das_palmeiras','5896-45893', 'drm@hospital.com', '548.444.689-89', '897.425-RS');

insert into medico(nome, data_nascimento, endereço, telefone, email, cpf, crm)
values('Camargo', '70-01-18', 'Av Paraná', '4587-8569','drc5@hospital.com', '745.154.789-89', '789-458');

insert into medico(nome, data_nascimento, endereço, telefone, email, cpf, crm)
values('Paula', '82-07-21', 'rua jatobá','3658-8879','drP@hospital.com','356.569.489-89','658-879'),
      ('Luiza', '90-12-14', 'rua junqueira','6983-4569','drL@hospital.com','596.886.798-69','632-152'),
      ('Carmen', '68-07-02', 'rua palmeiras','8967-2586','drC@hospital.com','458.478.489-89','892-698'),
      ('Maria', '92-03-10', 'rua 10','3669-4589','drM@hospital.com','562.804.891-69','894-569'),
      ('Jonas', '87-02-28', 'rua J ','98634-8963','drJonas@hospital.com','896.878.965-46','893-489'),
      ('Italo', '94-07-21', 'rua samambaia','8964-8879','drItalo@hospital.com','887.775.896-58','485-856'),
      ('Sergio', '86-09-11', 'rua de fátima','8963-8796','drSergio@hospital.com','789.894.986-69','589-325'),
      ('Thais', '95-06-24', 'rua pau brasil','2456-8967','drThais@hospital.com','894.854.000-00','752-965');
      
select * from especialidades;      
insert into especialidades (nome_especialidade)
values ('pediatria'),
       ('clinica geral'), 
       ('gastroenterologia'),
       ('dermatologia'),
       ('ortopedia'),
       ('cardiologia'),
       ('medicina do trabalho'); 
       
select*from paciente;
insert into paciente(nome, data_nascimeto, endereco, telefone, email, cpf, rg)
values('Miguel', '88-08-06','Rua das graças','8546-7893','mi@cadatro.com','963.701.570-15','15.259.664-1'),
      ('Marcia', '69-04-29','Rua são pedro','4464-9658','marcia@cadastro.com','415.539.560-60','44.336.281-6'), 
      ('Joana', '89-05-27','Rua 87','4689-2563','joana@cadastro.com','572.341.250-78','38.757.566-2'),
      ('Alice', '2001-08-27','Rua da mata','6589-7456','alice@cadastro.com','061.515.525-69','45.556.896-89'),
      ('Donatelo', '2005-12-06','Rua castro alves','9846-1679','donatelo@cadastro.com','694.557.978-46','48.575.496-75'),
      ('Rafael', '1999-11-30','Rua miguel silva','9654-6358','rafael@cadastro.com','045.689.831-00','16.834.573-80'),
      ('Mônica', '1998-10-01','Rua carnaúba','4896-7896','monica@cadastro.com','045.986.458-63','78.896.469-45'),
      ('Kadu', '1980-03-15','Rua assis','6987-2689','kadu@cadastro.com','698.149.367-56','26.268.639-89'),
      ('Sostenes', '1984-07-27','Rua do pequi','3458-6325','sostenes@cadastro.com','365.789.359-78','69.456.964-32'),
      ('Natalicio', '1974-01-29','Rua palmas','6368-7891','natalicio@cadastro.com','632.754.638-70','16.724.079-65'),
      ('Magali', '2002-04-16','Rua presidente vargas','3295-2099','magali@cadastro.com','016.365.525-69','45.685.965-78')
      ;

select*from atendimento;
insert into atendimento(data_atendimento, hora_atendimento, valor, medico_id, paciente_id, especialidades_id)
values('2017-08-01', '15:32:00', 300.00, 1, 10, 2),
      ('2017-12-14', '08:40:00', 250.00, 2, 9, 2),
      ('2018-04-07', '07:00:00', 150.00, 3, 8, 2),
      ('2018-07-15', '15:32:00', 400.00, 4, 7, 2),
      ('2019-09-12', '14:40:00', 300.00, 5, 6, 2),
      ('2019-09-13', '06:40:00', 900.00, 6, 6, 2),
      ('2020-01-04', '07:35:00', 350.00, 7, 5, 6),
      ('2020-08-01', '15:44:00', 650.00, 8, 4, 4),
      ('2021-05-27', '08:00:00', 450.00, 9, 3, 7),
      ('2021-11-22', '14:40:00', 600.00, 10, 2, 6);

select*from receituario;
insert into receituario(medicamento, quantidade, instrucao_uso, atendimento_id)
values('dipirona', '20 comprimidos','tomar assim que sentir dor ou febre', 1),
	  ('amoxilina', '30 comprimidos','uso de 8h em 8h por 7 dias', 1),
      ('loratadina', '1 cx','ao acordar tomar 1 comprimido', 1),
      ('dipirona', '20 comprimidos','tomar se sentir dor ou febre', 2),
      ('ibuprofeno', '10 comprimidos','tomar de 6h em 6h', 2),
      ('dipirona', '20 comprimidos','tomar assim que sentir dor ou febre', 3),
      ('Amoxilina', '30 comprimidos','usar de 8h em 8h durante 7 dias', 4),
      ('ibuprofeno', '10 comprimidos','tomar assim que sentir dor ou febre', 5);
      
select*from convenio;
insert into convenio(nome, cnpj, tempo_carencia)
values('medcal', '05.545.139/0001-34','30'),
	  ('medluz', '57.236.877/0001-01','60'),
      ('mednoz', '54.303.473/0001-97','25'),
      ('medtrem','20.102.485/0001-31','40');
      
update paciente set convenio_id = 1 where id = 1;      
update paciente set convenio_id = 2 where id = 2;
update paciente set convenio_id = 3 where id = 3;
update paciente set convenio_id = 4 where id = 6;      

update atendimento set convenio_id = 1 where paciente_id = 1;
update atendimento set convenio_id = 2 where paciente_id = 2;
update atendimento set convenio_id = 3 where paciente_id = 3;      
update atendimento set convenio_id = 4 where paciente_id = 6;

select*from tipo_quarto;
insert into tipo_quarto(descricao, valor_diaria)
values ('enfermaria', 150.00),
       ('semi-leito', 250.00),
       ('semi-uti', 450.00),
       ('uti',550.00);

select*from quarto;
insert into quarto (id_tipo_quarto, numero)
values(1, 100),
      (2, 200),
      (3, 300),
      (4, 400);
       
select*from enfermeiro;
insert into enfermeiro(nome, cpf, cre)
values('Joana','928.377.120-60','658.489'),
      ('Catarina','662.654.970-73','894.235'),
      ('Caio','721.327.770-71','125.836'),
      ('Marcelo','398.543.880-34','358.547'),
      ('Patricia','534.369.930-85','549.365'),
      ('Iago','016.134.220-59','987.256');
      
/*Inclua ao menos sete internações. 
Pelo menos dois pacientes devem ter se internado mais de uma vez. 
As internações devem ter ocorrido entre 01/01/2017 e 31/12/2022.*/
      
select*from internacao;
insert into internacao(data_entrada, dat_prev_alta, id_quarto, atendimento_id)
values('2017-08-01','2017-08-02','1','1'),
	  ('2018-04-07','2018-04-10','2','2'),
      ('2019-09-12','2019-04-12','1','5'),
      ('2019-09-13','2019-09-20','4','6'),
      ('2020-01-04','2020-01-04','1','7'),
      ('2020-08-01','2020-08-02','1','8'),
      ('2021-05-27','2021-05-28','1','9');
      
 /*Inclua dados de seis profissionais de enfermaria.
 Associe cada internação a pelo menos dois enfermeiros.*/
 
 select*from enfer_inter;
insert into enfer_inter(id_internacao, id_enfermeiro)
values (3,1) , (3,2) , (1,3) , (2,4) , (4,5) , (6,5) , (7,6); 
		

      
      