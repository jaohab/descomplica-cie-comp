-- Pseudoregistros OLD e NEW

-- Exemplo 1.1
CREATE OR REPLACE TRIGGER restringe_salario
BEFORE INSERT OR UPDATE OF sal ON emp
FOR EACH ROW
BEGIN
    IF NOT (:NEW.job IN('PRESIDENT', 'SALES')) AND :NEW.sal > 15000 THEN 
        RAISE_APPLICATION_ERROR(-20202, 'O funcionário não pode ter este aumento de salário');
    END IF;
END;
/

-- Testando o gatilho

INSERT INTO emp(empno, ename, job, sal, deptno) VALUES (135, 'Marcos', 'Clerk', 15010, 10); -- ATIVA
INSERT INTO emp(empno, ename, job, sal, deptno) VALUES (135, 'Marcos', 'Sales', 15010, 10); -- NÃO ATIVA
SELECT * FROM emp WHERE empno = 135;

UPDATE emp SET sal = 20000 WHERE empno = 7788; -- ATIVA
SELECT job FROM emp WHERE empno = 7788;

-- Exemplo 1.2

CREATE OR REPLACE TRIGGER seguro_emp
BEFORE INSERT ON scott.emp
BEGIN
    IF (TO_CHAR(SYSDATE, 'DY') IN ('SAB', 'DOM')) OR (TO_CHAR(SYSDATE, 'HH24:MI') BETWEEN '08:00' AND '17:00') THEN
        RAISE_APPLICATION_ERROR(-20500, 'Inserções de funcionários somente fora do horário comercial');
    END IF;
END;
/

INSERT INTO scott.emp(empno, ename, sal, deptno) VALUES (7935, 'Sandra', 1203, 10); -- ATIVA

-- Identificando o evento de disparo

-- Exemplo 2.1

CREATE TABLE event_log(evento VARCHAR2(100));

CREATE OR REPLACE TRIGGER log_logon 
AFTER LOGON ON DATABASE 
WHEN (USER = 'SYSTEM' OR USER = 'SCOTT')
BEGIN
    INSERT INTO event_log VALUES ('O usuário ' || USER || ' efetuou login no banco de dados em ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));
END;
/

-- Exemplo 2.2

CREATE TABLE aud_emp(
    user_name VARCHAR2(30),
    data DATE,
    antigo_nome VARCHAR2(50),
    novo_nome VARCHAR2(50),
    antigo_salario NUMBER(7,2),
    novo_salario NUMBER(7,2)
);

CREATE OR REPLACE TRIGGER auditar_emp
AFTER DELETE OR INSERT OR UPDATE ON scott.emp
FOR EACH ROW
BEGIN
    INSERT INTO aud_emp(user_name, data, antigo_nome, novo_nome, antigo_salario, novo_salario) VALUES (user, SYSDATE, :OLD.ename, :NEW.ename, :OLD.sal, :NEW.sal);
END;
/

-- Exemplo 3 

CREATE OR REPLACE TRIGGER vigia3
AFTER RENAME ON SCHEMA
BEGIN
    DBMS_OUTPUT.PUT_LINE('O comando ' || ORA_SYSEVENT 
        || ' acima foi executado pelo usuário ' || ORA_LOGIN_USER 
        || ' em um objeto criado pelo usuário ' || ORA_DICT_OBJ_OWNER 
        || ' no objeto: ' || ORA_DICT_OBJ_NAME);
END;
/