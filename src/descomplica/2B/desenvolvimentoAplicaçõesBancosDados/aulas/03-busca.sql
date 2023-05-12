-- Usuário Scott

-- Exibe todo o conteúdo da tabela dept.

SELECT * FROM scott.dept;

-- Exibe coluans específicas da tabela dept.

SELECT deptno, dname FROM scott.dept;

SELECT job FROM scott.emp;

SELECT DISTINCT job FROM scott.emp;

-- Junções (NATURAL e FULL JOINS)

-- NATURAL: Junção entre duas tabelas onde o banco de dados compara automaticamente as colunas com o mesmo nome nas duas tabelas e retorna apenas as linhas onde as colunas correspondentes são iguais.
-- FULL JOIN: Junção que retorna todas as linhas das duas tabelas, incluindo as linhas que não correspondem a uma chave estrangeira na outra tabela. Se não houver correspondência, o resultado para a coluna da tabela que não possui a correspondência será nulo.

SELECT emp.ename, dept.dname, emp.deptno, dept.deptno FROM scott.emp JOIN scott.dept ON (emp.deptno = dept.deptno);

SELECT e.ename, d.dname, e.deptno FROM scott.emp e JOIN scott.dept d ON (e.deptno = d.deptno);

SELECT ename, dname, deptno FROM scott.emp NATURAL JOIN scott.dept;

-- Junções (INNER JOINS)

-- INNER JOIN: Junção que retorna apenas as linhas onde há correspondência nas duas tabelas, ou seja, apenas as linhas que possuem valores correspondentes nas colunas selecionadas em ambas as tabelas.

SELECT e.ename, d.dname, e.sal, d.loc FROM scott.emp e INNER JOIN scott.dept d ON (e.deptno = d.deptno);

SELECT e.ename Nome, d.dname Departamento, e.sal Salário, d.loc Localização FROM scott.emp e INNER JOIN scott.dept d ON (e.deptno = d.deptno) WHERE e.sal > 2000;

-- Junções (OUTER JOINS)

-- OUTER JOIN: Junção que retorna todas as linhas de uma tabela e as linhas correspondentes na outra tabela. Se não houver correspondência, o resultado para a coluna da tabela que não possui a correspondência será nulo.

SELECT e.ename, e.sal, e.deptno, d.deptno, d.dname FROM scott.emp e FULL OUTER JOIN scott.dept d ON (e.deptno = d.deptno);

-- Funções de tabela

SELECT SYSDATE FROM dual;
SELECT TO_CHAR(SYSDATE, 'dd/mm/yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'dd-mon-yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE, 'day, month, year') FROM dual;

SELECT TRUNC(58.548, 1) FROM dual;

SELECT ename, LOWER(ename), UPPER(ename), INITCAP(ename) FROM scott.emp;

-- Ordenação da tabela
-- Por padrão a consulta retorna os elementos na ordem de inserção na tabela.

SELECT ename, sal FROM scott.emp ORDER BY ename;
SELECT ename, sal FROM scott.emp ORDER BY ename DESC;
SELECT ename, sal FROM scott.emp ORDER BY sal;
SELECT ename, sal FROM scott.emp ORDER BY sal DESC;

SELECT ename, deptno, sal FROM scott.emp ORDER BY deptno, sal DESC;

-- Agrupamento

SELECT MAX(sal), MIN(sal), SUM(sal) FROM scott.emp;
SELECT MIN(hiredate), MAX(hiredate) FROM scott.emp;
SELECT MIN(ename), MAX(ename) FROM scott.emp;

SELECT COUNT(*) FROM scott.emp;
SELECT COUNT(comm) FROM scott.emp;
SELECT COUNT(comm) FROM scott.emp WHERE deptno = 30;
SELECT COUNT(ename), COUNT(comm) FROM scott.emp;

SELECT deptno, SUM(sal) FROM scott.emp GROUP BY deptno;

SELECT deptno, job, SUM(sal) FROM scott.emp GROUP BY deptno, job ORDER BY deptno, job;

-- Totalização

SELECT deptno, job, SUM(sal) FROM scott.emp GROUP BY ROLLUP(deptno, job) ORDER BY deptno, job;

SELECT job, SUM(sal) FROM scott.emp GROUP BY job HAVING SUM(sal) > 5000 ORDER BY SUM(sal);

-- Subconsulta - WHERE

SELECT ename, deptno FROM scott.emp WHERE deptno = (
    SELECT deptno FROM scott.emp WHERE ename = 'SMITH'
);

SELECT ename, job, sal FROM scott.emp WHERE sal >= (
    SELECT sal FROM scott.emp WHERE ename = 'SCOTT'
);

SELECT ename, sal, job FROM scott.emp WHERE job = (
    SELECT job FROM scott.emp WHERE empno = '7566'
);

SELECT empno, ename, job, sal FROM scott.emp WHERE sal < ANY (
    SELECT sal FROM scott.emp WHERE job = 'CLERK'
) AND job <> 'CLERK';

SELECT empno, ename, job FROM scott.emp WHERE sal < ALL (
    SELECT sal FROM scott.emp WHERE job = 'CLERK'
);

SELECT DISTINCT deptno FROM scott.emp WHERE EXISTS (
    SELECT deptno FROM scott.dept
) ORDER BY deptno;

SELECT ename, job, sal FROM scott.emp WHERE sal IN (
    SELECT MAX(sal) FROM scott.emp GROUP BY job
);

SELECT empno, ename, job, sal, deptno FROM scott.emp WHERE (job, deptno) IN (
    SELECT job, deptno FROM scott.emp WHERE empno = 7844
);

-- Subconsulta - FROM

SELECT a.ename, a.sal, a.deptno, TRUNC(b.salavg) FROM scott.emp a, (
    SELECT deptno, AVG(sal) salavg FROM  scott.emp GROUP BY deptno
) b WHERE a.deptno = b.deptno AND  a.sal > b.salavg ORDER BY deptno;