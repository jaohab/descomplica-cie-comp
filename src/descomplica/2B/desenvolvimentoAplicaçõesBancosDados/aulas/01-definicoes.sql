-- Para executar e testar os scripts
-- https://livesql.oracle.com/

-- AULAS
-- ✅ - Princípios do comando SQL
-- ✅ - Prática em um projeto completo
-- ✅ - Consultas mais complexas
-- Consultas com agrupamento, totalização e ordenação
-- Segurança de Dados em SQL
-- Introdução à Linguagem PL/SQL
-- Comandos de Decisão, Desvio e Repetição
-- Programas Armazenados: Procedimentos, Funções e Pacotes
-- Integração SQL - PL/SQL
-- Triggers (Gatilhos)
-- Cursores Implícitos e Explícitos


-- DDL - Data Definition Language (Linguagem de definição de dados)

CREATE
ALTER
DROP
TRUNCATE

-- DML - Data Manipulation Language (Linguagem de manipulação de dados)

SELECT  
INSERT
UPDATE
DELETE

-- DCL - Data Control Language (Linguagem de Controle de Dados)

GRANT
REVOKE

-- TCL - Transaction Control Language (Linguagem de controle de transação)

BEGIN
COMMIT
ROLLBACK
SAVE

-- DQL - Data Query Language (Linguagem de Consulta de Dados)

SELECT [ALL | DISTINCT]
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY [ASC | DESC]
    LIMIT

-- Restrições

NOT NULL    -- Garante que uma coluna não pode ter um valor NULL.
DEFAULT     -- Fornece uma valor padrão quando nenhum valor é atribuído.
UNIQUE      -- Garante que todos os valores em uma coluna sejam diferentes.
PRIMARY KEY -- Chave primária
FOREIGN KEY -- Chave estrangeira
CHECK       -- Garante que os valores em uma coluna satisfaçam certas condições.
INDEX       -- Usado para criar e recuperar dados rapidamente.

-- Junções

JOIN
NATURAL JOIN
INNER JOIN
OUTER JOIN

UNION
UNION ALL
INTERSECT
MINUS
EXCEPT

-- Tipos

VARCHAR()
VARCHAR2()
NUMBER()
DATE

SYSDATE

DESCRIBE 

ADD
SET
ON