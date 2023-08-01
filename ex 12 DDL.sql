-- Academia alumnos

CREATE DATABASE DDL_ex12;
USE DDL_ex12;

CREATE TABLE profesores(
	DNI varchar(9),
	nombre varchar(20) unique,
    apellido1 varchar(20),
    apellido2 varchar(20),
    direccion varchar(40),
    titulo varchar(50),
    gana int not null,
    PRIMARY KEY (DNI)
);

CREATE TABLE cursos(
	cod_curso int,
    nombre_curso varchar(20) unique,
    maximo_alumnos int,
    fecha_inicio date,
    fecha_fin date,
    num_horas int not null,
    dni_profesor varchar(9),
    PRIMARY KEY (cod_curso),
    FOREIGN KEY (dni_profesor) REFERENCES profesores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE alumnos(
    DNI varchar(9),
	nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    direccion varchar(40),
    sexo enum('H', 'M'),
    fecha_nacimiento date,
    curso int not null,
	PRIMARY KEY (DNI),
    FOREIGN KEY (curso) REFERENCES cursos(cod_curso)
    ON DELETE cascade
    ON UPDATE cascade
);

