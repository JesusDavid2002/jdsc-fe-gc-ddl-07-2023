-- Investigadores

CREATE DATABASE DDL_ex11;
USE DDL_ex11;

CREATE TABLE facultades(
	codigo int,
    nombre varchar(100) unique,
    PRIMARY KEY (codigo)
);

CREATE TABLE investigadores(
	DNI varchar(8),
    nom_apels varchar(255),
    facultad int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (facultad) REFERENCES facultades (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE equipos(
	num_serie char(4),
    nombre varchar(100),
    facultad int,
    PRIMARY KEY (num_serie),
    FOREIGN KEY (facultad) REFERENCES facultades (codigo) 
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE reservas (
	DNI varchar(8),
    num_serie char(4),
    comienzo datetime,
    fin datetime,
    PRIMARY KEY (DNI, num_serie),
    FOREIGN KEY (DNI) REFERENCES investigadores (DNI) 
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (num_serie) REFERENCES equipos (num_serie) 
    ON DELETE cascade
    ON UPDATE cascade
);