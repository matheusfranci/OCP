01:30:51 HR@ecoapp> explain plan for
01:30:59   2  select first_name from employees where first_name='Eleni';

Explicado.

Decorrido: 00:00:00.00
01:31:01 HR@ecoapp> @?/rdbms/admin/utlxpls.sql

PLAN_TABLE_OUTPUT
================================================================================================================================================================
Plan hash value: 1278441224

----------------------------------------------------------------------------
| Id  | Operation        | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0 | SELECT STATEMENT |         |     1 |     7 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| IDX_001 |     1 |     7 |     1   (0)| 00:00:01 |
----------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - access("FIRST_NAME"='Eleni')

13 linhas selecionadas.
