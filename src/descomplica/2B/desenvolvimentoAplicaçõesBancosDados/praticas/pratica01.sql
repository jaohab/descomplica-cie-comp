-- === CRIAR AS TABELAS ===


-- Cria a tabela MEDICO 
CREATE TABLE medico (
    crm NUMBER NOT NULL CONSTRAINT medico_pk PRIMARY KEY,
    nome VARCHAR2(80) NOT NULL
);


-- Cria a tabela PACIENTE 
create TABLE paciente (
    cpf NUMBER NOT NULL CONSTRAINT paciente_pk PRIMARY KEY,
    nome VARCHAR2(80) NOT NULL
);


-- Cria a tabela CONSULTA 
CREATE TABLE consulta (
    id_consulta NUMBER NOT NULL CONSTRAINT consulta_pk PRIMARY KEY,
    data DATE NOT NULL,
    relatorio VARCHAR2(4000),
    medico_crm NUMBER NOT NULL,
    paciente_cpf NUMBER NOT NULL
);


-- Define as chaves estrangeiras
ALTER TABLE consulta 
	ADD CONSTRAINT fk_medico_crm
	FOREIGN KEY (medico_crm)
	REFERENCES medico(crm);
 
ALTER TABLE consulta 
	ADD CONSTRAINT fk_paciente_cpf
	FOREIGN KEY (paciente_cpf)
	REFERENCES paciente(cpf);


-- === POPULAR AS TABELAS ===


-- Inserindo dados na tabela MEDICO
INSERT INTO medico (crm, nome) VALUES (12345678, 'Dr. João Carlos');
INSERT INTO medico (crm, nome) VALUES (34567890, 'Dra. Maria José');
INSERT INTO medico (crm, nome) VALUES (56789012, 'Dr. Flávio Henrique');


-- Inserindo dados na tabela PACIENTE
INSERT INTO paciente (cpf, nome) VALUES (11223344556, 'Eduardo Costa');
INSERT INTO paciente (cpf, nome) VALUES (33445566778, 'Maria Souza');
INSERT INTO paciente (cpf, nome) VALUES (55667788990, 'Carlos da Silva');


-- Inserindo dados na tabela CONSULTA
INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (1, to_date('21-04-2023', 'DD-MM-YYYY'), 'Consulta de rotina', 12345678, 11223344556);

INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (2, to_date('22-04-2023', 'DD-MM-YYYY'), 'Tratamento de pele', 34567890, 55667788990);

INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (3, to_date('22-04-2023', 'DD-MM-YYYY'), 'Consulta de rotina', 56789012, 33445566778);

INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (4, to_date('24-05-2023', 'DD-MM-YYYY'), 'Tratamento de capilar', 12345678, 55667788990);

INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (5, to_date('25-06-2023', 'DD-MM-YYYY'), 'Exame cardiológico', 56789012, 33445566778);

INSERT INTO consulta (id_consulta, data, relatorio, medico_crm, paciente_cpf)
VALUES (6, to_date('26-07-2023', 'DD-MM-YYYY'), 'Exame físico', 34567890, 11223344556);


-- === CRIAR A VIEW ===


-- Criar a VIEW
CREATE VIEW view_consultas AS
	SELECT c.id_consulta, c.data, c.relatorio, m.nome AS nome_medico, p.nome AS nome_paciente
	FROM consulta c
	JOIN medico m ON m.crm = c.medico_crm
	JOIN paciente p ON p.cpf = c.paciente_cpf
	ORDER BY c.data;


-- Exibi todas as consultas
SELECT * FROM view_consultas;


-- Exibi as consultas do dia
SELECT * FROM view_consultas WHERE data = '22-APR-23';