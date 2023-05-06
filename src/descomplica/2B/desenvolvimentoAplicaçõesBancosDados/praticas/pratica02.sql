-- Criar tabela

CREATE TABLE cidadao (
    CPF NUMBER NOT NULL CONSTRAINT cidadao_pk PRIMARY KEY,
    Nome VARCHAR2(80) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    Cidade VARCHAR2(20) NOT NULL,
    Estado VARCHAR2(2) NOT NULL
);
/

-- Popular tabela

INSERT INTO cidadao
    VALUES (11125365214, 'José da Silva', 'jSilva@govmg.com', 'Sabedoria', 'MG'); 

INSERT INTO cidadao
    VALUES (32569852369, 'Maria Souza', 'mSouza@govmg.com', 'Esperança', 'MG'); 

INSERT INTO cidadao
    VALUES (47815932687, 'Julia Andrade', 'jAndrade@govmg.com', 'Alegria', 'MG'); 

INSERT INTO cidadao
    VALUES (52387196348, 'Ana Costa', 'aCosta@govmg.com', 'Esperança', 'MG');

INSERT INTO cidadao
    VALUES (25976314789, 'Sofia Castro de Oliveira', 'sCastro@govmg.com', 'Paciência', 'MG');

INSERT INTO cidadao
    VALUES (16897423569, 'Joao Castro', 'jCastro@govmg.com', 'Esperança', 'MG');

-- Teste

Select nome from cidadao where cidade = 'Esperanca' or nome like '%Castro' order by nome;

-- Resultado
-- Joao Castro
