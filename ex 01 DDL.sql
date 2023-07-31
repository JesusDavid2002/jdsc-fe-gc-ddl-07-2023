CREATE DATABASE DDL_ex01;
USE DDL_ex01;

CREATE TABLE estación(
	identificador int,
    latitud float,
    longitud float,
    altitud float,
    PRIMARY KEY (identificador)
);

CREATE TABLE muestra(
	id_muestra int auto_increment,
	identificador_estacion int,
    fecha date,
    temperatura_min float,
    temperatura_max float,
    precipitaciones float,
    humedad_min float,
    humedad_max float,
    velocidad_viento_min float,
    velocidad_viento_max float,
    PRIMARY KEY (id_muestra),
    FOREIGN KEY (identificador_estacion) REFERENCES estación(identificador)
    ON DELETE cascade
    ON UPDATE cascade
);