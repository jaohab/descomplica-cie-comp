-- Elementos 
    -- Identificadores
    -- Váriáveis
    -- Constantes
    -- Literais
    -- Operadores
        -- Aritméticos  - (+ soma) ( subtração) (* multiplicação) (/ divisão) (** potenciação)
        -- Lógicos      - AND OR NOT
        -- Relacionais  - (= igual a) (<> != ~= diferente de) (> maior que) (>= maior ou igual a) (< menor que) (<= meor ou igual a)
        -- Comparação   - (BETWEEN entre dois valores) (LIKE comparação com caractere coringa)
        -- Atribuição   - :=
        -- Concatenação - ||
    -- Rótulos
        -- <<rótulo>>   - Identificam um local do programa 


-- Principais tipos de dados
    -- NUMBER(p,s)      - Número inteiro ou de ponto fixo, com P dígitos significativos (até (P-S) dígitos na parte inteira e S dígitos na parte decimal)
    -- PLS_INTEGER      - Números inteiros
    -- BINARY_FLOAT     - Número de ponto flutuante, com 8 dígitos decimais.
    -- BINARY_DOUBLE    - Número de ponto flutuante, com 16 dígitos decimais.

    -- CHAR(n)          -  String de tamanho fixo (N caracteres)
    -- VARCHAR2(n)      -  String de tamanho variável (até N caracteres)

    -- DATE                 - Data e hora (hora, minuto e segundo)
        -- TO_DATE()        - Usado para convertes valores literias para inteiro
    -- TIMESTAMP(n)         - Data e hora, com N casa decimais para frações de segundo (máximo 9)
        -- TO_TIMESTAMP()   - Usado para convertes valores literias para inteiro

    -- INTERVAL YEAR(n) TO MONTH        - Intervalo de tempo em anos e meses. N é o número de dígitos para o período de anos (n = 3 corresponde de 0 a 999 anos)
    -- INTERVAL DAY(n) TO SECOND(m)     - Intervalo de tempo em dias, horas, miutos, segundos e fraçâo de segundos. N é o número de dias e M o número de dígitos da fração de segundos (0 a 9)


-- Estrutua bloco anônimo

DECLARE
    -- Seção de declaração
BEGIN
    -- Seção de execução
EXCEPTION
    -- Seção de tratamento de exceções
END;

-- Exemplo "Hello World"

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;


-- Exemplo com intereção do usuário

SET SERVEROUTPUT ON     -- Libera a exibição de mensagens
ACCEPT p_name PROMPT 'Digite o nome do funcionário...'
ACCEPT p_sal_mes PROMPT 'Digite o valor do salário...'

DECLARE
    v_name VARCHAR2(30) := '&p_nome';
    v_sal NUMBER(9,2) := ep_sal_mes;
    v_sal_anual NUMBER(9,2);
BEGIN
    v_sal_anual := v_sal * 12;
    DBMS_OUTPUT.PUT_LINE('O salário anual de de: ' || v_name || ' é ' || v_sal_anual);
END;
/   -- Executa o código


-- Exemplo com SELECT

DECLARE
    v_deptno NUMBER(2);
    v_loc VARCHAR2(15);
BEGIN
    SELECT deptno, loc 
    INTO v_deptno, v_loc
    FROM dept
    WHERE dname = 'SALES';

    DBMS_OUTPUT.PUT_LINE('O Código do Departamento é ' || v_deptno ||  ' e a sua localizacdo é : ' || v_loc);
END;
/


DECLARE
    v_sum_sal emp.sal%TYPE;     -- Atribui o mesmo tipo do campo da tabela 
    v_deptno NUMBER NOT NULL := 30;
BEGIN
    SELECT SUM(sal)
    INTO v_sum_sal
    FROM emp
    WHERE deptno = v_deptno;

    DBMS_OUTPUT.PUT_LINE('A soma dos salários é: ' || v_sum_sal);
END;
/

-- Exemplo escobo de varável

SET SERVEROUTPUT ON
DECLARE -- bloco 1
    valorl NUMBER(2) := 7;
    valor2 NUMBER(2) := 13;
BEGIN -- bloco 1
    DECLARE -- bloco 2
        valorl varchar2(30) := 'Valor 1 do bloco 2';
    BEGIN -- bloco 2
        DECLARE -- bloco 3
            valorl date := sysdate;
        BEGIN -- bloco 3
            DBMS_OUTPUT.PUT_LINE('Valor 1 do bloco 3...' || valorl);
        END; -- bloco 3
        DBMS_OUTPUT.PUT_LINE('Valor 1 do bloco 2...' || valorl);
    END; -- bloco 2
    DBMS_OUTPUT.PUT_LINE('Valor 1 do bloco 1... ' || valorl);
END; -- bloco 1
/
