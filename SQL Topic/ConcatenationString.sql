-- rowid existe na tabela, rownum é gerado em tempo de execução
-- quando não utilizamos o order by o oracle utiliza a chave primária como ordenador

-- Concatenação de string
select first_name || last_name || ' annually earns ' || salary*12 as TEXTO from employees;
/*
StevenKing annually earns 288000
NeenaKochhar annually earns 204000
LexDe Haan annually earns 204000
AlexanderHunold annually earns 108000*/

-- Colocando espaços entre as strings
select first_name ||' '|| last_name || ' annually earns ' || salary*12 as TEXTO from employees;
/*
Steven King annually earns 288000
Neena Kochhar annually earns 204000
Lex De Haan annually earns 204000
Alexander Hunold annually earns 108000
*/
