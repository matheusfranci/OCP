/*sqlplus hr/welcome1@pdb1
NVL
O exemplo a seguir retorna uma lista de nomes de funcionários
e comissões, substituindo "Não aplicável" se o funcionário não
receber comissão:*/
SELECT last_name, NVL(TO_CHAR(commission_pct),
'Not Applicable') commission
 FROM employees
 WHERE last_name LIKE 'B%'
 ORDER BY last_name; --Ou seja os valores nulos retornarão Não aplicável
 
 
/*NULLIF
O exemplo a seguir seleciona os funcionários do
esquema de exemplo hr que mudaram de cargo desde
que foram contratados, conforme indicado por um
job_id na job_history tabela diferente do atual
job_id na tabela employees:*/
SELECT e.last_name, NULLIF(j.job_id, e.job_id)
"Old Job ID"
 FROM employees e, job_history j
 WHERE e.employee_id = j.employee_id
 ORDER BY last_name, "Old Job ID"; --Retornará nullo em caso de não haver mudança no cargo
 
/*COALESCE
O exemplo a seguir retorna um porque é o primeiro
argumento não nulo:*/
SELECT
 COALESCE(NULL,1) -- return 1
FROM
 dual;
 
 
/*O exemplo a seguir retorna um valor com tipo de
caractere porque todos os argumentos são caracteres.*/
SELECT
 COALESCE(NULL,'A','B') result
FROM
 dual;
 
 
/*O exemplo a seguir usa argumentos de diferentes tipos para
a função:*/
SELECT
 COALESCE(NULL,1,'A')
FROM
 dual; -- Retorna um ero porque os tipos de dados são diferentes, ou seja, os dados precisam ser do mesmo tipo ou deve haver conversão
 -- segue erro: ORA-00932: tipos de dados inconsistentes: esperava NUMBER obteve CHAR
 
 
CONVERSÃO IMPLICITA
/*Texto Literal Exemplo
O literal de texto '10' tem tipo de dados CHAR. O Oracle o converte
implicitamente no NUMBER tipo de dados se ele aparecer em uma
expressão numérica como na seguinte instrução:*/
SELECT salary + '10'
 FROM employees;

 /*Exemplo de valores de caracteres e números
Quando uma condição compara um valor de caractere e um
NUMBER valor, o Oracle converte implicitamente o valor de
caractere em um NUMBER valor, em vez de converter o NUMBER
valor em um valor de caractere. Na instrução a seguir, o Oracle
converte implicitamente '200' em 200:*/
SELECT last_name
 FROM employees
 WHERE employee_id = '200';
 
/*Data Exemplo
Na instrução a seguir, o Oracle converte implicitamente ' 24-
JUN-06' em um DATE valor usando o formato de data padrão '
DD-MON-YY':*/
SELECT last_name
 FROM employees
 WHERE hire_date = '24-JUN-06';
 
TO_CHAR (caractere)
SELECT TO_CHAR('01110') FROM DUAL;

TO_CHAR (número)
SELECT TO_CHAR('01110' + 1) FROM DUAL;

TO_CHAR(datetime)
WITH dates AS (
 SELECT date'2015-01-01' d FROM dual union
 SELECT date'2015-01-10' d FROM dual union
 SELECT date'2015-02-01' d FROM dual
)
SELECT d "Original Date",
 to_char(d, 'dd-mm-yyyy') "Day-MonthYear",
 to_char(d, 'hh24:mi') "Time in 24-hr
format",
 to_char(d, 'iw-iyyy') "ISO Year and
Week of Year"
FROM dates;

/*TO_NUMBER
Os exemplos a seguir convertem dados de cadeia de
caracteres em um número:*/
UPDATE employees SET salary = salary +
 TO_NUMBER('100.00', '9G999D99')
 WHERE last_name = 'Perkins';
 -- Implicito é aquilo que a engine do oracle faz sem o dba especificar, explicito precisa do dba especificar.
 
/*O exemplo a seguir retorna o valor padrão de 0porque a
expressão especificada não pode ser convertida em um
NUMBER valor:*/
SELECT TO_NUMBER('2,00' DEFAULT 0 ON
CONVERSION ERROR) "Value"
 FROM DUAL;
 
/*TO_DATE
O exemplo a seguir converte uma cadeia de caracteres em
uma data:*/
SELECT TO_DATE(
 'January 15, 1989, 11:00 A.M.',
 'Month dd, YYYY, HH:MI A.M.',
 'NLS_DATE_LANGUAGE = American')
 FROM DUAL;
