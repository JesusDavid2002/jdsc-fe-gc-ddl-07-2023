-- Almacenes

CREATE DATABASE DDL_ex05;
USE DDL_ex05;

CREATE TABLE almacenes(
	codigo int,
    lugar varchar(100),
    capacidad int,
    PRIMARY KEY (codigo)
);

CREATE TABLE cajas(
	num_referencia char(5),
    contendio varchar(100),
    valor int,
    almacen int,
    PRIMARY KEY (num_referencia),
    FOREIGN KEY (almacen) REFERENCES almacenes (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);