-- Script atividade 04
USE uc4atividades;

CREATE TABLE endereco(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR(60) NOT NULL,
numero VARCHAR(10) NOT NULL,
bairro VARCHAR(45)NOT NULL,
cidade VARCHAR(45) NOT NULL,
estado VARCHAR(45) NOT NULL,
cep VARCHAR(45) 
);

CREATE TABLE contato(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
telefone1 VARCHAR(45) NOT NULL,
telefone2 VARCHAR(45),
email1 VARCHAR(65),
email2 VARCHAR(65) NOT NULL
);

ALTER TABLE cliente DROP COLUMN endereco;
ALTER TABLE cliente DROP COLUMN telefone;
ALTER TABLE cliente ADD endereco_id INT NOT NULL;
ALTER TABLE cliente ADD contato_id INT NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT fk_endereco_id FOREIGN KEY(endereco_id) REFERENCES endereco(id);
ALTER TABLE cliente ADD CONSTRAINT fk_contato_id FOREIGN KEY(contato_id) REFERENCES contato(id);

CREATE TABLE cartao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
numero_cartao VARCHAR(60) NOT NULL,
data_vencimento DATE,
cliente_id INT NOT NULL,
CONSTRAINT fk_cliente_id FOREIGN KEY(cliente_id) REFERENCES cliente(id)
);

CREATE TABLE forma_pagamento(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo_pagamento VARCHAR(65),
parcelamento BINARY(1),
qtd_parcelas INT
);

ALTER TABLE venda DROP COLUMN tipo_pagamento;
ALTER TABLE venda DROP COLUMN numero_cartao_pagamento;
ALTER TABLE venda DROP COLUMN numero_parcelas_pagamento;
ALTER TABLE venda ADD COLUMN forma_pagamento_id INT NOT NULL;
ALTER TABLE venda ADD COLUMN cartao_id INT;
ALTER TABLE venda ADD CONSTRAINT fk_forma_pagamento_id FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id);
ALTER TABLE venda ADD CONSTRAINT fk_cartao_id FOREIGN KEY (cartao_id) REFERENCES cartao(id);

ALTER TABLE item_venda DROP COLUMN nome_produto;
ALTER TABLE item_venda DROP COLUMN subtotal;
ALTER TABLE item_venda DROP COLUMN valor_unitario;

ALTER TABLE produto ADD valor_unitario DECIMAL(9,2);
