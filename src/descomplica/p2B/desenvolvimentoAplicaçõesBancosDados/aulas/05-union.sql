CREATE TABLE conjuntoA (
    cod_fruta_A NUMBER(2),
    nome_fruta_A VARCHAR2(30)
);

INSERT INTO conjuntoA VALUES (1, 'banana');
INSERT INTO conjuntoA VALUES (2, 'mamao');
INSERT INTO conjuntoA VALUES (3, 'limao');
COMMIT;

SELECT * FROM conjuntoA;

CREATE TABLE conjuntoB (
    cod_fruta_B NUMBER(2),
    nome_fruta_B VARCHAR2(30)
);

INSERT INTO conjuntoB VALUES (1,'banana');
INSERT INTO conjuntoB VALUES (20, 'melancia');
INSERT INTO conjuntoB VALUES (30,'abacaxi');

SELECT * FROM conjuntoB;

-- UNION
-- Faz a união entre tabelas, se há elementos que se repetem nas tabelas, não serão exibidos e para exibi-los é necessário usar o UNION ALL.

SELECT cod_fruta_A, nome_fruta_A FROM conjuntoA 
UNION
SELECT cod_fruta_B, nome_fruta_B FROM conjuntoB; 

SELECT cod_fruta_A, nome_fruta_A FROM conjuntoA 
UNION ALL
SELECT cod_fruta_B, nome_fruta_B FROM conjuntoB; 

-- INTERSECT
-- Exibi os elementos que são comuns entre as tebaleas.

SELECT cod_fruta_A, nome_fruta_A FROM conjuntoA 
INTERSECT
SELECT cod_fruta_B, nome_fruta_B FROM conjuntoB; 

-- MINUS / EXCEPT
-- Retira do resultado os elementos que são comuns entre as tabelas, a ordem interfere no resultado.

SELECT cod_fruta_A, nome_fruta_A FROM conjuntoA 
MINUS
SELECT cod_fruta_B, nome_fruta_B FROM conjuntoB; 

SELECT cod_fruta_B, nome_fruta_B FROM conjuntoB
MINUS
SELECT cod_fruta_A, nome_fruta_A FROM conjuntoA;