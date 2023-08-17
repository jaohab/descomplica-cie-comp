-- Exemplo IF encadeado

DECLARE
    a NUMBER;
    b NUMBER;
BEGIN
    a := 0;
    b := 0;

    IF a = b THEN
        DBMS_OUTPUT.PUT_LINE('A igual a B');
    ELSIF a > b THEN
        DBMS_OUTPUT.PUT_LINE('A maior que B');
    ELSIF a < b THEN
        DBMS_OUTPUT.PUT_LINE('A menor que B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nenhuma condição atendida');
    END IF;
END;
/


-- Exemplo CASE 1

DECLARE
    a NUMBER;
    b NUMBER;
BEGIN
    a := 0;
    b := 0;

    CASE 
        WHEN a = b THEN
            DBMS_OUTPUT.PUT_LINE('A igual a B');
        WHEN a > b THEN
            DBMS_OUTPUT.PUT_LINE('A maior que B');
        WHEN a < b THEN
            DBMS_OUTPUT.PUT_LINE('A menor que B');
        WHEN (a IS NULL OR b IS NULL) THEN
            DBMS_OUTPUT.PUT_LINE('Uma das váriaveis tem o valor NULL');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nenhuma condição atendida');
    END CASE;
END;
/


-- Exemplo CASE 2

DECLARE
    dia NUMBER;
    nome VARCHAR2(100);
BEGIN
    dia := 5;
    nome := CASE dia
                WHEN 1 THEN 'Domingo'
                WHEN 2 THEN 'Segunda-feira'
                WHEN 3 THEN 'Terça-feira'
                WHEN 4 THEN 'Quarta-feira'
                WHEN 5 THEN 'Quinta-feira'
                WHEN 6 THEN 'Sexta-feira'
                WHEN 7 THEN 'Sábado'
                ELSE 'Não é um número válido'
            END;
    
    DBMS_OUTPUT.PUT_LINE(nome);
END;
/


-- Exemplo GOTO

DECLARE
    fatorial NUMBER := 1;
    n NUMBER;
    i NUMBER := 0;
BEGIN
    n := 6;
    i := n;
    <<inicio_loop>>
    IF i >= 1 THEN
        fatorial := fatorial * i;
        i := i-1;
        GOTO inicio_loop;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Fatorial de ' || n || ' é: ' || fatorial);
END;
/


-- Exemplo LOOP 1

DECLARE
    fatorial NUMBER := 1;
    n NUMBER;
    i NUMBER;
BEGIN
    n := 6;
    i := n;
    LOOP
        IF i <= 1 THEN
            EXIT;
        END IF;
        fatorial := fatorial * i;
        i := i-1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Fatorial de ' || n || ' é: ' || fatorial);
END;
/


-- Exemplo LOOP 2

CREATE TABLE teste_loop (id NUMBER, nome VARCHAR2(10));

DECLARE
    v_counter NUMBER := 1;
    v_nome VARCHAR2(10) := 'TESTE_LOOP';
BEGIN
    LOOP
        INSERT INTO teste_loop(id, nome)
        VALUES(v_counter, v_nome);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 5;
    END LOOP;
END;
/

SELECT * FROM teste_loop;

-- Exemplo LOOP aninhado

CREATE TABLE loop_aninhado (contador NUMBER, nome VARCHAR2(100));

DECLARE
    v_cont1 NUMBER := 1;
    v_nome1 VARCHAR2(100) := 'Loop 1';
    v_cont2 NUMBER := 7;
    v_nome2 VARCHAR2(100) := 'Loop 2';
BEGIN
    LOOP
        INSERT INTO loop_aninhado(contador, nome)
        VALUES(v_cont1, v_nome1);
        v_cont1 := v_cont1 + 1;
        EXIT WHEN v_cont1 > 5;
    END LOOP;
    LOOP
        INSERT INTO loop_aninhado(contador, nome)
        VALUES(v_cont2, v_nome2);
        v_cont2 := v_cont2 + 1;
        EXIT WHEN v_cont2 > 9; 
    END LOOP;
END;
/

SELECT * FROM loop_aninhado;


-- Exemplo FOR incremental

CREATE TABLE item (ordid NUMBER(5), itemid NUMBER(5));

DECLARE
    v_ordid NUMBER := 601;
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO item(ordid, itemid)
        VALUES(v_ordid, i);
    END LOOP;
END;
/

-- Exemplo FOR decremental

CREATE TABLE item2 (ordid NUMBER(5), itemid NUMBER(5));

DECLARE
    v_ordid NUMBER := 605;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        INSERT INTO item2(ordid, itemid)
        VALUES(v_ordid, i);
    END LOOP;
END;
/


-- Exemplo WHILE

SET SERVEROUTPUT ON;
ACCEPT p_voltas PROMPT 'Digitar o número de voltas do laço: ';

DECLARE
    v_cont NUMBER(10) := 1;
BEGIN
    WHILE v_cont <= &p_voltas LOOP
        DBMS_OUTPUT.PUT_LINE('Valor do contador: ' || v_cont);
        v_cont := v_cont + 1;
    END LOOP;
END;
/