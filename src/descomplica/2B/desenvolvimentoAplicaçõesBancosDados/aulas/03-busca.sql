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