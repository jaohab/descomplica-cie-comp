-- Criando uma VIEW

CREATE VIEW empvu10 AS SELECT empno, aname, job FROM emp WHERE deptno = 10;

SELECT * FROM empvu10;

-- Atualizar tabela através da VIEW

UPDATE empvu10 SET ename="José" WHERE empno=7934;

SELECT * FROM empvu10;
SELECT * FROM emp WHERE empno=7934;



-- Criando outra VIEW

CREATE VIEW salvu31 AS SELECT empno EMPLOYEE_NUMBER, ename NAME, sal SALARY FROM emp WHERE deptno = 30;

SELECT * FROM salvu31;

-- Depeletando um VIEW

DROP VIEW empvu10;

-- Alterando um VIEW

CREATE OR REPLACE VIEW empvu10 (employee_number, empl_name, job_title) AS SELECT empno, ename, job FROM emp WHERE deptno = 10;



-- Criando VIEW complexa

CREATE VIEW dept_sum_vu_10 (name, minsal, maxsal, avgsal) AS SELECT d.name, MIN(e.sal), MAX(e.sal), trunc(AVG(e.sal)) FROM emp e JOIN dept d ON e.deptno = d.deptno GROUP BY d.dname;

SELECT * FROM dept_sum_vu_10;

-- Alterando um VIEW para READ PNLY

CREATE OR REPLACE VIEW empvu10 (empno, ename, job) AS SELECT empno, ename, job FROM emp WHERE deptno = 10 WITH READ ONLY;
