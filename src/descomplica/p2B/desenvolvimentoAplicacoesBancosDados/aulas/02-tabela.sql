-- Criar a tabela 

CREATE TABLE aluno (
    id NUMBER(5) PRIMARY KEY,
    nome VARCHAR2(20) NOT NULL,
    data_mat DATE DEFAULT SYSDATE,
    cod_turma NUMBER(2)
);

CREATE TABLE turma (
    cod_turma NUMBER(2) PRIMARY KEY,
    desc_turma VARCHAR2(30)
);

-- Exibe a estrutura da tabela

DESCRIBE turma;

-- Altera a tabela para adicionar uma coluna

ALTER TABLE turma ADD periodo VARCHAR2(15);

ALTER TABLE aluno ADD FOREIGN KEY(cod_turma) REFERENCES turma (cod_turma);

-- Excluí a tabela

DROP TABLE turma;


-- Adiciona valores a tabela

INSERT INTO aluno VALUES (1, 'José da Silva', default, 10);
INSERT INTO aluno VALUES (2, 'João Antonio', '10-oct-22', 11);

-- Atualiza valores

UPDATE aluno SET cod_turma=13 WHERE id=1;

-- Deleta valores

DELETE FROM aluno WHERE id=2;