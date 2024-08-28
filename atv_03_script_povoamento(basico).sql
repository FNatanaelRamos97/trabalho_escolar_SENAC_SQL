insert into medico(id, nome, data_nascimento, endereço, telefone, email, cpf, crm) values
(1, 'Mauricio','87-10-12','rua_das_palmeiras','5896-45893', 'drm@hospital.com', '548.444.689-89', '897.425-RS');

insert into especialidades (nome_especialidade)
values ('pediatria');

insert into paciente(nome, data_nascimeto, endereco, telefone, email, cpf, rg)
values('Miguel', '88-08-06','Rua das graças','8546-7893','mi@cadatro.com','963.701.570-15','15.259.664-1');

insert into atendimento(data_atendimento, hora_atendimento, valor, medico_id, paciente_id, especialidades_id)
values('2017-08-01', '15:32:00', 300.00, 1, 10, 2);

insert into receituario(medicamento, quantidade, instrucao_uso, atendimento_id)
values('dipirona', '20 comprimidos','tomar assim que sentir dor ou febre', 1);

insert into convenio(nome, cnpj, tempo_carencia)
values('medcal', '05.545.139/0001-34','30');

insert into tipo_quarto(descricao, valor_diaria)
values ('enfermaria', 150.00);

insert into quarto (id_tipo_quarto, numero)
values(1, 100);

insert into enfermeiro(nome, cpf, cre)
values('Joana','928.377.120-60','658.489');

insert into internacao(data_entrada, dat_prev_alta, id_quarto, atendimento_id)
values('2017-08-01','2017-08-02','1','1');

insert into enfer_inter(id_internacao, id_enfermeiro)
values (3,1) , (3,2) , (1,3) , (2,4) , (4,5) , (6,5) , (7,6); 