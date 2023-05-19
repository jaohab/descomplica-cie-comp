-- Procedimentos (Stored procedures)

SELECT empno, ename, sal FROM emp WHERE empno = 7934;

CREATE OR REPLACE PROCEDURE reajuste (v_cod_emp IN emp.empno%TYPE, v_porcentagem IN NUMBER)
IS 
BEGIN
    UPDATE emp 
        SET sal = sal + (sal *(v_porcentagem / 100))
        WHERE empno = v_cod_emp;
        COMMIT;
END reajuste;
/

EXECUTE reajuste(7934, 10);
SELECT empno, ename, sal FROM emp WHERE empno = 7934;


-- Funções (Stored functions)

CREATE OR REPLACE FUNCTION descobrir_salario (p_id IN emp.empno%TYPE)
RETURN NUMBER
IS
    v_salario emp.sal%TYPE := 0;
BEGIN
    SELECT sal 
    INTO v_salario 
    FROM emp 
    WHERE empno = p_id;
    RETURN v_salario;
END descobrir_salario;
/

SELECT descobrir_salario(7934) FROM dual;


-- Recursividade

CREATE OR REPLACE FUNCTION fatorial_func_rec (n IN NUMBER)
RETURN NUMBER
IS
BEGIN
    IF n = 2 THEN
        RETURN 2;
    ELSE
        RETURN n * fatorial_func_rec(n - 1);
    END IF;
END;
/

SELECT fatorial_func_rec(5) FROM dual;


-- Enpacotamente (Package)

-- Head
CREATE OR REPLACE PACKAGE exemplo_pack
IS
    PROCEDURE reajuste (v_cod_emp IN emp.empno%TYPE, v_porcentagem IN NUMBER);
    FUNCTION descobrir_salario (p_id IN emp.empno%TYPE)
        RETURN NUMBER;
END exemplo_pack;
/

-- Body
CREATE OR REPLACE PACKAGE BODY exemplo_pack
IS
    PROCEDURE reajuste (v_cod_emp IN emp.empno%TYPE, v_porcentagem IN NUMBER)
    IS 
    BEGIN
        UPDATE emp 
            SET sal = sal + (sal *(v_porcentagem / 100))
            WHERE empno = v_cod_emp;
            COMMIT;
    END reajuste;
    
    FUNCTION descobrir_salario (p_id IN emp.empno%TYPE)
    RETURN NUMBER
    IS
        v_salario emp.sal%TYPE := 0;
    BEGIN
        SELECT sal 
        INTO v_salario 
        FROM emp 
        WHERE empno = p_id;
        RETURN v_salario;
    END descobrir_salario;

END exemplo_pack;
/

SELECT exemplo_pack.descobrir_salario(7934) FROM dual;
EXECUTE exemplo_pack.reajuste(7934, 25);
SELECT exemplo_pack.descobrir_salario(7934) FROM dual;


-- Overloading 

CREATE OR REPLACE PACKAGE soma_tudo 
IS
    FUNCTION soma (x IN NUMBER, y IN NUMBER)
    RETURN NUMBER;

    FUNCTION soma (x IN VARCHAR2, y IN VARCHAR2)
    RETURN VARCHAR2;

    FUNCTION soma (x IN NUMBER, y IN VARCHAR2)
    RETURN VARCHAR2;

    FUNCTION soma (x IN VARCHAR2, y IN NUMBER)
    RETURN VARCHAR2;

END soma_tudo;
/

CREATE OR REPLACE PACKAGE BODY soma_tudo
IS
    FUNCTION soma (x IN NUMBER, y IN NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        RETURN x + y;
    END;

    FUNCTION soma (x IN VARCHAR2, y IN VARCHAR2)
    RETURN VARCHAR2
    IS
    BEGIN
        RETURN x || y;
    END;

    FUNCTION soma (x IN NUMBER, y IN VARCHAR2)
    RETURN VARCHAR2
    IS
    BEGIN
        RETURN soma(TO_CHAR(x), y);
    END;

    FUNCTION soma (x IN VARCHAR2, y IN NUMBER)
    RETURN VARCHAR2
    IS
    BEGIN
        RETURN soma(x, TO_CHAR(y));
    END;

END soma_tudo;
/


-- Tratamento de erros (Exceptions)

CREATE OR REPLACE PACKAGE pkg_dividir AS
    FUNCTION divide
    RETURN NUMBER;
END pkg_dividir;
/

CREATE OR REPLACE PACKAGE BODY pkg_dividir AS
    FUNCTION divide
    RETURN NUMBER
    IS
        x NUMBER := 10;
        y NUMBER := 5;
        resultado NUMBER;
    BEGIN
        resultado := y / x;
        RETURN resultado;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Não é possível dividir por zero.');
    END;
END pkg_dividir;
/

SELECT (pkg_dividir.divide) FROM dual;