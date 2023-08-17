-- DML e PL/SQL

SET SERVEROUTPUT ON;

CREATE TABLE filmes (
    filmes_id NUMBER(5) PRIMARY KEY,
    titulo VARCHAR2(100),
    diretor VARCHAR2(100),
    ano NUMBER(5),
    pais VARCHAR2(100),
    duracao NUMBER(5)
);

CREATE OR REPLACE PACKAGE pkg_filmes AS
    filme_repetido EXCEPTION;
    campo_nulo EXCEPTION;
    PRAGMA EXCEPTION_INIT(filme_repetido, -1);
    PRAGMA EXCEPTION_INIT(campo_nulo, -2290);
END pkg_filmes;
/

CREATE OR REPLACE FUNCTION inclui_filme (
    filmes_id NUMBER,
    titulo VARCHAR2,
    diretor VARCHAR2,
    ano NUMBER,
    pais VARCHAR2,
    duracao NUMBER
)
RETURN NUMBER
IS
    ret NUMBER := 0;
    -- Inclui novo registro e trata as exceções que podem ocorrer. 
    -- Retorna 0 (Inclusão OK) ou o código de erro (Inclusão NOK).
BEGIN
    -- Para porder retornar ao corpo da função, após o tratamento do erro, coloca-se o comando INSERT dentro de um bloco.
    BEGIN
        INSERT INTO filmes VALUES (filme_id, titulo, diretor, ano, pais, duracao);
    EXCEPTION
        WHEN pkg_filmes.filme_repetido THEN
            ret := -1;
            -- Um campo NOT NULL recebe o calor NULL
        WHEN pkg_filmes.campo_nulo THEN
            ret := -2290;
        WHEN OTHERS THEN
            ret := SQLCODE;
    END;
    RETURN ret;
END;
/

DECLARE
    ret NUMBER;
BEGIN
    ret := inclui_filme(1, 'Caçadores da Arca Perdida', 'Steven Spielberg', 1981, 'E.U.A.', 115);
    IF ret = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Inclusão bem sucedida.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erro na inclusão: ' || ret || ' - Filme Repetido');
    END IF;
END;
/


-- Ancoragem de tipos

CREATE OR REPLACE PACKAGE pkg_filmes 
AS
    TYPE tipo_reg_filmes IS RECORD (
        filme_id filmes.filme_id%TYPE,
        titulo filmes.titulo%TYPE,
        diretor filmes.diretor%TYPE,
        ano filmes.ano%TYPE,
        pais filmes.pais%TYPE,
        duracao filmes.duracao%TYPE
);

campo_nulo EXCEPTION;
PRAGMA EXCEPTION_INIT(campo_nulo, -2290);
-- Inclui filme. Em caso de erro, retorna o código e mensagem de erro
PROCEDURE inclui_filme (
    registro IN pkg_filmes.tipo_reg_filmes,
    cod_erro OUT NUMBER,
    msg_erro OUT VARCHAR2
);
END pkg_filmes;
/

CREATE OR REPLACE PACKAGE BODY pkg_filmes 
AS
    PROCEDURE inclui_filme (
        registro IN pkg_filmes.tipo_reg_filmes,
        cod_erro OUT NUMBER,
        msg_erro OUT VARCHAR2
    )
IS
BEGIN
    BEGIN
        cod_erro := 0;
        INSERT INTO filmes VALUES registro;
    EXCEPTION
        WHEN dup_val_on_index THEN
            cod_erro := SQLCODE;
            msg_erro := 'ID_FILME ou TITULO repetido';
        WHEN campo_nulo THEN
            cod_erro := SQLCODE;
            msg_erro := 'TITULO ou DIRETOR nulo';
        WHEN OTHERS THEN
            cod_erro := SQLCODE;
            msg_erro := SQLERRM;
    END;
END;
END pkg_filmes;
/

DECLARE
    registro pkg_filmes.tipo_reg_filmes;
    cod_erro NUMBER;
    msg_erro VARCHAR2(100);
BEGIN
    registro.filme_id   := 4;
    registro.titulo     := 'Noites de Cabíria';
    registro.diretor    := "Federico Fellini"
    registro.ano        := 1958;
    registro.pais       := 'Itália'
    registro.duracao    := 110;
    pkg_filmes.inclui_filme(registro, cod_erro, msg_erro);
    IF cod_erro = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Erro na inclusão: ' || 'ORA' || TO_CHAR(cod_erro, '0000') || ' (' || msg_erro || ') ');
    END IF;
END;
/

SELECT * FROM filmes;