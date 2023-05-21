-- Managing views
-- Criando view
CREATE VIEW division1_staff AS
      SELECT ename, empno, job, dname
      FROM emp, dept
      WHERE emp.deptno IN (10, 30)
         AND emp.deptno = dept.deptno;

-- Criando ou substituindo a ddl de uma já existente
CREATE OR REPLACE VIEW sales_staff AS
     SELECT empno, ename, deptno
     FROM emp
     WHERE deptno = 30
     WITH CHECK OPTION CONSTRAINT sales_staff_cnst;

--Tabelas importantes no monitoramento de views
select * from DBA_UPDATABLE_COLUMNS
select * from ALL_UPDATABLE_COLUMNS 
select * from USER_UPDATABLE_COLUMNS

/*Também há a possibilidade de criar views com erros basta utlizar a cláusula FORCE
Uma view com erro é aquela que referencia uma tabela inexistente ou seleciona uma coluna inexistente de uma tabela
Um erro comum pode estar ligado a permissão do usuário que não pode realizar o select em uma tabela mas com o FORCE isso é possível
Ela será criada no dicionário mas não será usada*/
CREATE FORCE VIEW sales_staff AS
     SELECT empno, ename, deptno
     FROM emp
     WHERE deptno = 30
     WITH CHECK OPTION CONSTRAINT sales_staff_cnst;
     
     select * from sales_staff
/* Erro
Cause:    Attempt to execute a stored procedure or use a view that has
           errors.  For stored procedures, the problem could be syntax errors
           or references to other, non-existent procedures.  For views,
           the problem could be a reference in the view's defining query to
           a non-existent table.*/
           
/*Apesar de não ser muito comum pode-se realizar operações de insert, update e delete nas views
Quando deleto, insiro ou atualizo linhas na view isso não prejudica as tabelas bases*/

-- Também é possível recompilar uma view com o comando ALTER 
ALTER VIEW sales_staff

-- Ela fica com status inválido e pode ser consultada com essa query:
select owner "Owner",
object_name "Objeto",
Object_type "Tipo",
status "Estado",
created "Criado em"
from dba_objects
where lower(status) != 'valid'
order by owner, object_name;
