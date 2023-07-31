-- Cientificos

CREATE DATABASE DDL_ex09;
USE DDL_ex09;

CREATE TABLE cientificos(
	DNI varchar(8),
    nom_apels varchar(225),
    PRIMARY KEY (DNI)
);

CREATE TABLE proyectos(
	id char(4),
    nombre varchar(225),
    horas int,
    PRIMARY KEY (id)
);

CREATE TABLE asignado_a(
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos (DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (proyecto) REFERENCES proyectos (id)
    ON DELETE cascade
    ON UPDATE cascade
);