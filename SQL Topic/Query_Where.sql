-- Query com outra query no where
select * from employees where hire_date = (select min(hire_date) from employees);
