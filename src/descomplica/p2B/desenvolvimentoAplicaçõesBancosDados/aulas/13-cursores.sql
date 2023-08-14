-- Exemplo 1

VARIABLE linhas_deletadas VARCHAR2(30)
DECLARE
    v_deptno NUMBER := 10;
BEGIN
    DELETE FROM emp
    WHERE deptno = v_deptno;
    :linhas_deletadas := (SQL%ROWCOUNT || ' linhas deletadas.');
END;

PRINT linhas_deletadas
ROLLBACK;

-- Exemplo 2

ACCEPT p_cargo_func PROMPT 'Digite i CARGO do funcionário: '

VARIABLE g_n_ocorrencias NUMBER;

CREATE TABLE sal_tot (ename VARCHAR2(50), sal_mes NUMBER(7,2), sal_tot NUMBER(7,2));

DECLARE
    v_cargo_func emp.job%TYPE := UPPER('&p_cargo_func');
    v_nome_func emp.enama%TYPE;
    v_sal_mes emp.sal%TYPE;
    v_sal_ano NUMBER(9,2);

CURSOR sal_func_cursor IS
    SELECT ename, sal, sal * 12
    FROM emp
    WHERE job = v_cargo_func;

BEGIN
    OPEN sal_func_cursor;
    LOOP
        FETCH sal_func_cursor
        INTO v_nome_func, v_sal_mes, v_sal_ano;
        EXIT WHEN sal_func_cursor%NOTFOUND;
        INSERT INTO sal_tot(ename, sal_mes, sal_tot) VALUES(v_nome_func, v_sal_mes, v_sal_ano);
    END LOOP;
    :g_n_ocorrencias := sal_func_cursor%ROWCOUNT;
    CLOSE sal_func_cursor;
END;
/

PRINT g_n_ocorrencias
SELECT * FROM sal_tot;