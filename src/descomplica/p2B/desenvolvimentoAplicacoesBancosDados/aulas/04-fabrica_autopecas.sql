-- Cria a tabela depósito

CREATE TABLE deposito (
    cod_deposito NUMBER(5) PRIMARY KEY,
    endereco_deposito VARCHAR2(50)
)

DESCRIBE deposito;

-- Popular a tabela

INSERT INTO deposito VALUES (100, 'R. X, 10');
INSERT INTO deposito VALUES (101, 'R. Y, 20');
INSERT INTO deposito VALUES (102, 'R. Z, 30');
INSERT INTO deposito VALUES (103, 'R. W, 40');

SELECT * FROM deposito;

-- Atuliza uma entrada

UPDATE deposito SET endereco_deposito='R. A, 1' WHERE cod_deposito=100;
SELECT * FROM deposito;

-- Remove uma entrada

DELETE FROM deposito WHERE cod_deposito=100;
SELECT * FROM deposito;