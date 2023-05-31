-- Função que substitui sem valor por um valor determinado(nesse caso zero)
select avg(COMMISSION_PCT) from employees;
select avg(nvl(commission_pct,0)) from employees;
