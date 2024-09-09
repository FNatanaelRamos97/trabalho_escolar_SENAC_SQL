/*Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio*/

SELECT*FROM atendimento WHERE data_atendimento BETWEEN '2020-01-01' AND '2020-12-31';

SELECT AVG(valor) FROM atendimento WHERE data_atendimento BETWEEN '2020-01-01' AND '2020-12-31' 
AND convenio_id IS NULL;

/*Todos os dados e o valor médio das consultas do ano de 2020 realizadas por convênio*/
SELECT AVG(valor) FROM atendimento WHERE data_atendimento BETWEEN '2020-01-01' AND '2020-12-31' 
AND convenio_id IS NOT NULL;

/*Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta*/
SELECT*FROM internacao WHERE dat_alta > dat_prev_alta;

/*Receituário completo da primeira consulta registrada com receituário associado*/
SELECT*FROM receituario WHERE atendimento_id = 1;

/*Todos os dados da consulta de maior valor e também da de menor valor 
(ambas as consultas não foram realizadas sob convênio)*/ 
SELECT*FROM atendimento WHERE valor=(select max(valor) from atendimento where convenio_id is null);
SELECT*FROM atendimento WHERE valor=(select min(valor) from atendimento where convenio_id is null);

/*Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor
 de diária do quarto e o número de dias entre a entrada e a alta*/
select paciente.nome,
internacao.data_entrada,
internacao.dat_alta,
quarto.numero as num_quarto, 
tipo_quarto.descricao,
datediff(internacao.dat_alta, internacao.data_entrada) as total_de_dias,
tipo_quarto.valor_diaria,
(tipo_quarto.valor_diaria*(datediff(internacao.dat_alta, internacao.data_entrada))) as valor_total
from 
atendimento join paciente on atendimento.paciente_id = paciente.id
join internacao on atendimento.id = internacao.atendimento_id
join quarto on  internacao.id_quarto = quarto.id 
join tipo_quarto on quarto.id_tipo_quarto = tipo_quarto.id 
order by internacao.id asc; 
 
 /*Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”*/
 SELECT internacao.data_entrada, internacao.procedimento, quarto.numero, tipo_quarto.tipoDoQuarto
 FROM internacao JOIN quarto ON internacao.id_quarto = quarto.id JOIN tipo_quarto ON quarto.id_tipo_quarto = tipo_quarto.id 
 WHERE tipo_quarto.tipoDoQuarto = 'apartamento';
 
 
 /*Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes 
 eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, 
 ordenando por data de realização da consulta*/
 
SELECT paciente.nome, atendimento.data_atendimento,(YEAR(atendimento.data_atendimento) - YEAR(paciente.data_nascimeto)) AS idade 
, especialidades.nome_especialidade
FROM atendimento JOIN paciente ON atendimento.paciente_id = paciente.id
JOIN especialidades ON atendimento.especialidades_id = especialidades.id
WHERE (YEAR(atendimento.data_atendimento) - YEAR(paciente.data_nascimeto)) < 18 AND especialidades.nome_especialidade <> 'pediatria';
 
 /*Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por 
 médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.*/
 
 SELECT paciente.nome AS paciente, medico.nome AS medico, internacao.data_entrada, internacao.procedimento,
 especialidades.nome_especialidade, tipo_quarto.descricao
 FROM paciente JOIN atendimento ON atendimento.paciente_id = paciente.id
 JOIN medico ON atendimento.medico_id = medico.id 
 JOIN internacao ON internacao.atendimento_id = atendimento.id
 JOIN especialidades ON atendimento.especialidades_id = especialidades.id
 JOIN quarto ON internacao.id_quarto = quarto.id
 JOIN tipo_quarto ON quarto.id_tipo_quarto = tipo_quarto.id
 WHERE tipo_quarto.descricao = 'enfermaria' AND  especialidades.nome_especialidade = 'gastroenterologia';  
  
 /*Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou*/ 
 
SELECT medico.nome, medico.crm, count(*) 
FROM atendimento JOIN medico ON atendimento.medico_id = medico.id
GROUP BY atendimento.medico_id;

 /*Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação
 e os números de internações referentes a esses profissionais.*/
 
 SELECT enfermeiro.nome, enfermeiro.cre, enfer_inter.id_enfermeiro, enfer_inter.id_internacao
 FROM enfermeiro 
 JOIN enfer_inter ON enfer_inter.id_enfermeiro = enfermeiro.id;
 
 SELECT enfermeiro.nome, enfermeiro.cre, count(*)
 FROM enfermeiro 
 JOIN enfer_inter ON enfer_inter.id_enfermeiro = enfermeiro.id
 GROUP BY enfer_inter.id_enfermeiro
 HAVING count(*) > 1;
 
 SELECT enfermeiro.nome, enfermeiro.cre, count(*)
 FROM enfermeiro 
 JOIN enfer_inter ON enfer_inter.id_enfermeiro = enfermeiro.id
 GROUP BY enfer_inter.id_enfermeiro;
 
/*sera feita a consulta com o nome do paciente, do medico, o enfermeiro, numero e a descrição do quarto*/

 SELECT internacao.id, paciente.nome AS paciente, medico.nome AS medico, enfermeiro.nome AS enfermeiro,
 quarto.numero, tipo_quarto.descricao
FROM atendimento 
JOIN paciente ON atendimento.paciente_id = paciente.id
JOIN medico ON atendimento.medico_id = medico.id
JOIN internacao ON internacao.atendimento_id = atendimento.id
JOIN enfer_inter ON enfer_inter.id_internacao = internacao.id         
JOIN enfermeiro ON enfer_inter.id_enfermeiro = enfermeiro.id
JOIN quarto ON internacao.id_quarto = quarto.id
JOIN tipo_quarto ON quarto.id_tipo_quarto = tipo_quarto.id
ORDER BY internacao.id ASC ;