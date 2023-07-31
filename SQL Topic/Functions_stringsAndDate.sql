-- NVL Substitui o NULL por um valor
SELECT first_name, last_name, salary, NVL (commission_pct,0) as "Comissão"
FROM employees
WHERE rownum < 5;

-- NVL2 Substitui o nulo por um valor e não nulo por outro
SELECT first_name, last_name, salary, NVL2 (commission_pct,'Salário e comissão', 'Apenas salário') as "Comissão"
FROM employees
WHERE rownum < 5;

-- Nesse caso a função UPPER deixará a coluna first_name inteiramento maiuscula enquanto a função INITCAP deixará a coluna last_name com a primeira letra maiuscula apenas. Por último a função LOWER deixará todas as strings da coluna job_id minúscula.
SELECT UPPER(first_name), INITCAP(last_name), LOWER(job_id)
FROM employees
WHERE rownum < 5;

-- Função concat está concatenando ambas as colunas
SELECT CONCAT (first_name, last_name) FROM employees WHERE
rownum < 5;

-- Pegará first_name com 5 caracteres e contará em que posição terá o valor entre '' que nesse caso é o A
SELECT SUBSTR (first_name,1,5), INSTR (first_name,'a') FROM
employees WHERE rownum < 5;

-- RPAD e LPAD adicionará caracteres a direita(RPAD) e a esquerda (LPAD)
SELECT RPAD(first_name,10,'_'),LPAD (job_id,15,'_') FROM
employees WHERE rownum < 5;

-- TRIM tira todos os valores nas extremidades, como, por exemplo, espaços.
SELECT TRIM ('d' FROM 'dddddHelloWorld') FROM dual;

-- REPLACE substitui parte de strings por outros valores
SELECT REPLACE('JACK and JUE','J','BL') FROM dual;
-- Varias funções para teste
SELECT LENGTH('HelloWorld'),
INSTR('HelloWorld', 'W'),
LPAD('salary',10,'*'), -- Pode substituir por RPAD('salary',10,'*'),
CONCAT('Hello', 'World'),
TRIM('H' FROM 'HelloWorld'),
SUBSTR('HelloWorld',1,5),
REPLACE('JACK and JUE','J','BL')
from dual;

-- TRUNC e ROUND estão associadas a arrendondamento de números.
SELECT ROUND(45.925,2), TRUNC(45.925,2),
ROUND(45.923,0), TRUNC(45.923,0),
ROUND(45.923,-1),
ROUND(44.923,-1)
FROM DUAL;

-- MOD mostra a sobra da sivisão
SELECT MOD(10000, 5000), MOD(6500,5000)
FROM dual;

-- GREATEST pega o maior valor
SELECT GREATEST (1, '3,925', '2,4') "Greatest"
FROM DUAL;

-- Verificando variáveis relacionadas a datas
select * from
(select 'SESSION' SCOPE,nsp.* from nls_session_parameters nsp
union
select 'DATABASE' SCOPE,ndp.* from nls_database_parameters ndp
union
select 'INSTANCE' SCOPE,nip.* from nls_instance_parameters nip
) a
pivot (LISTAGG(VALUE) WITHIN GROUP (ORDER BY SCOPE)
FOR SCOPE
in ('SESSION' as "SESSION",'DATABASE' as DATABASE,'INSTANCE' as INSTANCE));

-- Alterando a nível de sessão o nls_date_format
ALTER SESSION SET nls_date_format='DD/MM/YYYY HH24:MI:SS';

-- teste de adição na unidade de horário
SELECT SYSDATE AS current_date,
SYSDATE + 1 AS plus_1_day,
SYSDATE + 2/24 AS plus_2_hours,
SYSDATE + 10/24/60 AS plus_10_minutes,
SYSDATE + 30/24/60/60 AS plus_30_seconds
FROM dual;

-- Verificando intervalos entre meses
SELECT MONTHS_BETWEEN('01-09-21','01-08-20') FROM DUAL;

-- Adicionando meses a duma data
SELECT ADD_MONTHS('10-01-2020',6) FROM DUAL;

-- Verificando próxima sexta-feira
SELECT NEXT_DAY(SYSDATE, 'SEXTA-FEIRA') FROM DUAL;

-- Último dia dos mês
SELECT LAST_DAY('01-07-2023') FROM DUAL;

-- Arrendodamento de mês e ano
SELECT ROUND(SYSDATE +10,'MONTH') FROM DUAL;
SELECT ROUND(SYSDATE +10,'YEAR') FROM DUAL;
SELECT TRUNC(SYSDATE +10,'MONTH') FROM DUAL;
SELECT TRUNC(SYSDATE +10,'YEAR') FROM DUAL;
