CREATE TABLE remedios (
codigo INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL,
marca VARCHAR(20),
preco DECIMAL(9,2) NOT NULL,
generico CHAR(1) NOT NULL DEFAULT('N'),
validade DATE NOT NULL,
PRIMARY KEY (codigo)
);

INSERT INTO remedios (codigo, nome, marca, preco, generico, validade)
VALUES (1,'parecetamol','medvida',8.50,'S','2023-01-01');

SELECT * FROM pessoa;

INSERT INTO remedios (nome, marca, preco, generico, validade)
VALUES ('dipirona','medvida',4.50,'S','2024-01-01');

DROP TABLE pessoa;

CREATE TABLE pessoa (
id INT NOT NULL AUTO_INCREMENT,
Ultimonome VARCHAR(200),
Primeironome VARCHAR(200),
idade INT,
PRIMARY KEY (id)
);

ALTER TABLE pessoa MODIFY COLUMN Ultimonome VARCHAR(200) NOT NULL;

CREATE TABLE PessoaRG(
numero_rg INT NOT NULL,
estado_emissao CHAR(2) NOT NULL,
nome VARCHAR(255),
data_nascimento DATE,
PRIMARY KEY(numero_rg, estado_emissao)
);


