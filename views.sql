use suicidio;

### 1. Listar idade, sexo e estado onde ocorreu o óbito
create view idade_sexo_estado_local 
as select suicidio.idade, suicidio.sexo, estados.sigla_estado from suicidio
join estados on suicidio.id_estado = estados.id_estado;

SELECT * FROM idade_sexo_estado_local order by idade asc;

### 2. Exibir o total de registros de suicidios por Estado.

create view suicidio_por_estado
as select estados.sigla_estado, count(suicidio.id_suicidio) as total from suicidio
join estados on suicidio.id_estado = estados.id_estado
group by estados.sigla_estado;

SELECT * FROM suicidio_por_estado;

### 3. Mostrar os 10 Estados com mais casos

create view top_10_estados
as select estados.sigla_estado, count(suicidio.id_suicidio) as total from suicidio
join estados on suicidio.id_estado = estados.id_estado
group by estados.sigla_estado
order by total desc limit 10;

SELECT * FROM top_10_estados;

### 4. Exibir quantidade de casos para cada nível de escolaridade.

create view casos_escolaridade
as select escolaridade.escolaridade, count(suicidio.id_suicidio) as total from suicidio
join escolaridade on suicidio.id_escolaridade = escolaridade.id_escolaridade
group by escolaridade.escolaridade;

SELECT * FROM casos_escolaridade;

### 5. Mostrar quantidade de registros por estado civil.

create view casos_estado_civil
as select estado_civil.estado_civil, count(suicidio.id_suicidio) as total from suicidio
join estado_civil on suicidio.id_estado_civil = estado_civil.id_estado_civil
group by estado_civil.estado_civil;

SELECT * FROM casos_estado_civil;

### 6. Mostre a média de idade dos casos por estado.

create view media_idade_estado
as select estados.sigla_estado, round(avg(suicidio.idade), 2) as media_idade from suicidio
join estados on suicidio.id_estado = estados.id_estado
group by estados.sigla_estado;

SELECT * FROM media_idade_estado;

### 7. Crie um relatório exibindo as seguintes informações para cada caso: Estado, estado civil, escolaridade, causas e quantidade de casos.

create view relatorio_casos
as select estados.sigla_estado, estado_civil.estado_civil, escolaridade.escolaridade, causas.causabas, count(suicidio.id_suicidio) as total from suicidio
join estados on suicidio.id_estado = estados.id_estado
join estado_civil on suicidio.id_estado_civil = estado_civil.id_estado_civil
join escolaridade on suicidio.id_escolaridade = escolaridade.id_escolaridade
join causas on suicidio.id_causa = causas.id_causa
group by estados.sigla_estado, estado_civil.estado_civil, escolaridade.escolaridade, causas.causabas;

SELECT * FROM relatorio_casos;