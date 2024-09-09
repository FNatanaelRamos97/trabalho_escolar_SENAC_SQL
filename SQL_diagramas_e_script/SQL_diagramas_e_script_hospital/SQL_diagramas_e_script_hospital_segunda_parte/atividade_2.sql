create table quarto (
id int not null auto_increment primary key,
id_tipo_quarto int not null,
numero int not null,
foreign key (id_tipo_quarto) references tipo_quarto(id) 
);

create table tipo_quarto(
id int not null auto_increment primary key,
descricao varchar(255) not null,
valor_diaria decimal(9,2) not null
);

create table internacao(
id int not null auto_increment primary key,
data_entrada datetime not null,
dat_prev_alta datetime not null,
dat_alta datetime not null,
procedimento longtext,
id_quarto int not null,
foreign key (id_quarto) references quarto(id)
);

create table enfer_inter(
id_internacao int not null ,
id_enfermeiro int not null ,
primary key(id_internacao, id_enfermeiro),
foreign key(id_internacao) references internacao(id),
foreign key(id_enfermeiro) references enfermeiro(id)
);
 
 create table enfermeiro (
 id int not null auto_increment primary key,
 nome varchar(255) not null,
 cpf varchar(255) not null,
 cre varchar(255) not null
 );

create table medico(
id int not null auto_increment primary key,
nome varchar(255) not null,
data_nascimento date not null,
endereço varchar(255) not null,
telefone varchar(20) not null,
email varchar(100) not null,
cpf varchar(14) not null,
crm varchar(20) not null
);

create table receituario(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
medicamento VARCHAR(255) NOT NULL,
quantidade VARCHAR(45) NOT NULL,
instrucao_uso TEXT NOT NULL
);

CREATE TABLE convenio(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
cnpj VARCHAR(18) NOT NULL,
tempo_carencia VARCHAR(20) NOT NULL,
num_carteirinha VARCHAR(45) NOT NULL
);

CREATE TABLE paciente(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
data_nascimeto DATE NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(20),
email VARCHAR(255),
cpf VARCHAR(14) NOT NULL,
rg VARCHAR(20) NOT NULL,
convenio_id INT,
FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

CREATE TABLE especialidades (
nome_especialidade VARCHAR(255) NOT NULL,
medico_id INT NOT NULL PRIMARY KEY,
FOREIGN KEY(medico_id) REFERENCES medico(id)
);

CREATE TABLE atendimento(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_atendimento DATE NOT NULL,
hora_atendimento TIME NOT NULL,
valor DECIMAL(9,2) NOT NULL,
medico_id INT NOT NULL,
paciente_id INT NOT NULL,
receituario_id INT NOT NULL,
especialidades_id INT NOT NULL,
convenio_id INT NOT NULL,
FOREIGN KEY (medico_id) REFERENCES medico(id),
FOREIGN KEY (paciente_id) REFERENCES paciente(id),
FOREIGN KEY (receituario_id) REFERENCES receituario(id),
FOREIGN KEY (especialidades_id) REFERENCES especialidades(medico_id),
FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

ALTER TABLE atendimento ADD COLUMN internacao_id INT NOT NULL;
ALTER TABLE atendimento ADD FOREIGN KEY (internacao_id) REFERENCES internacao(id);
