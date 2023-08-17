-- Consulta com privilégio de DBA
SELECT username, account_status FROM dba_users ORDER BY username;
SELECT profile, resource_name, limit FROM dba_profiles where profile="conexao" and resource_name="FAILED_LOGIN_ATTEMPTS";
SELECT username, account_status, lock_date, expire_date, default_tablespace, profile FROM dba_users WHERE username="peter";


-- 1 Criar um usuário

CONN system/oracle

-- Definir user
CREATE USER aaron

-- Definir senha
IDENTIFIED BY senha

-- Local de gravação
DEFAULT TABLESPACE system

-- Cota de uso o usuário
QUOTA unlimited on system

-- Ao cessar a conta pela primeira vez, a senha deve ser redefinida
PASSWORD EXPIRE;

-- 2 Conder privilégios

-- Garante os privilégios de criar uma sessão e criar tabelas
GRANT CREATE SESSION, CREATE TABLE TO aaron;

-- 3 Acessando o sistema

CONN aaron/senha

-- Exibir com qual usário está conectado
SHOW USER

-- 4 Deletando usuário

-- Só funciona se o usuarop não tiver criado nada
DROP USER aaron;

-- Caso o usuário tenha criado algo, tudo que ele criou também será apagado.
DROP USER aaron CASCADE;



-- Criano um novo usuário
CREATE USER peter IDENTIFIED BY peter DEFAULT TABLESPACE system QUOTA 15m on system;

-- Garantindo acesso
GRANT CREATE SESSION peter;
CONN peter/peter

-- Bloaquear usuário
ALTER USER peter ACCOUNT LOCK;

-- Desbloaquear usuário
ALTER USER peter ACCOUNT UNLOCK;

-- 5 Criar um profile

CREATE PROFILE conexao LIMIT FAILED_LOGIN_ATTEMPTS 2; 
SELECT PROFILE, resource_name, limit FROM dba_profiles WHERE PROFILE="conexao" AND resource_name="FAILED_LOGIN_ATTEMPTS";

-- 6 Associar o profile ao usuário

ALTER USER peter PROFILE conexao;
SELECT username, account_status, lock_date, expire_date, default_tablespace, profile FROM dba_users WHERE username="peter";

-- 7 Deletar profile

-- Apenas se não estiver associado a nenhum usuário
DROP PROFILE conexao;

DROP PROFILE conexao CASCADE;