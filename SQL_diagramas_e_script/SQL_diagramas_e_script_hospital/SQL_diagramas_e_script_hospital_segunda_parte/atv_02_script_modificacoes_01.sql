alter table atendimento drop foreign key atendimento_ibfk_4;
select * from atendimento;
alter table especialidades drop foreign key especialidades_ibfk_1;
select * from especialidades;
alter table especialidades drop column medico_id;
alter table especialidades add id int not null auto_increment primary key; 

create table med_esp(
id int not null auto_increment primary key,
medico_id int not null,
especialidade_id int not null,
foreign key (medico_id) references medico(id),
foreign key (especialidade_id) references especialidades (id)
);

alter table atendimento add foreign key (especialidades_id) references especialidades(id);
alter table atendimento modify column convenio_id int;
alter table atendimento drop column internacao_id;
alter table internacao modify column dat_alta datetime;
alter table atendimento drop foreign key atendimento_ibfk_3;
alter table atendimento drop column receituario_id;
alter table receituario add column atendimento_id int not null;
alter table receituario add foreign key (atendimento_id) references atendimento(id);



