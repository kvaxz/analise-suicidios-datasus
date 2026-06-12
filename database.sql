create database suicidio;

use suicidio;

create table estados (
    id_estado int primary key auto_increment,
    sigla_estado ENUM('AC','AL','AP','AM','BA','CE','DF',
        'ES','GO','MA','MT','MS','MG',
        'PA','PB','PR','PE','PI','RJ',
        'RN','RS','RO','RR','SC','SP',
        'SE','TO')
);

create table estado_civil (
    id_estado_civil int primary key auto_increment,
    estado_civil ENUM('SOLTEIRO','CASADO','DIVORCIADO','VIUVO','UNIAO ESTAVEL','IGNORADO')
);

create table escolaridade (
    id_escolaridade int primary key auto_increment,
    escolaridade ENUM('SEM ESCOLARIDADE','FUNDAMENTAL INCOMPLETO',
        'FUNDAMENTAL COMPLETO','MEDIO INCOMPLETO','MEDIO COMPLETO',
        'SUPERIOR INCOMPLETO','SUPERIOR COMPLETO')
);

create table causas (
    id_causa int primary key auto_increment,
    causabas VARCHAR(100),
    causabas_o VARCHAR(100)
);

SELECT MAX(id_causa) FROM causas;
SELECT COUNT(*) FROM causas;

create table suicidio (
    id_suicidio int primary key auto_increment,
    ano YEAR,
    idade int,
    sexo ENUM('MASCULINO','FEMININO'),
    id_estado int,
    id_estado_civil int,
    id_escolaridade int,
    id_causa int,

    FOREIGN KEY (id_estado) REFERENCES estados(id_estado),
    FOREIGN KEY (id_estado_civil) REFERENCES estado_civil(id_estado_civil),
    FOREIGN KEY (id_escolaridade) REFERENCES escolaridade(id_escolaridade),
    FOREIGN KEY (id_causa) REFERENCES causas(id_causa)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE suicidio;
DROP TABLE causas;
DROP TABLE escolaridade;
DROP TABLE estado_civil;
DROP TABLE estados;
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE suicidio;
TRUNCATE TABLE causas;
TRUNCATE TABLE escolaridade;
TRUNCATE TABLE estado_civil;
TRUNCATE TABLE estados;
SET FOREIGN_KEY_CHECKS = 1;