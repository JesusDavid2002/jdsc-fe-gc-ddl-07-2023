CREATE DATABASE DDL_ex02;
USE DDL_ex02;
-- DROP DATABASE DDL_ex02;
CREATE TABLE temas(
	clave_tema int,
    nombre varchar(20),
    PRIMARY KEY (clave_tema)
);

CREATE TABLE autores(
	clave_autor int,
    nombre varchar(20),
    PRIMARY KEY (clave_autor)
);

CREATE TABLE editoriales(
	clave_editorial int,
    nombre varchar(30),
    direccion varchar (40),
    telefono int,
    PRIMARY KEY (clave_editorial)
);

CREATE TABLE libros(
	clave_libro int,
    titulo varchar(25),
    idioma varchar(15),
    formato varchar(20),
    clave_editoriales int,
    PRIMARY KEY (clave_libro),
    FOREIGN KEY (clave_editoriales) REFERENCES editoriales (clave_editorial)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE ejemplares(
	clave_ejemplar int,
    numero_orden int,
    edicion int,
    ubicacion varchar(40),
    categoria varchar(30), 
    clave_libros int,
    PRIMARY KEY (clave_ejemplar),
    FOREIGN KEY (clave_libros) REFERENCES libros (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE socios(
	clave_socio int,
    nombre varchar(20),
    direccion varchar(40),
    telefono int,
    categoria varchar(30)
);

CREATE TABLE prestamos(
	id int auto_increment,
    numero_orden int,
    fecha_prestamo date,
    fecha_devolucion date,
    notas varchar(200),
    clave_socios int,
    clave_ejemplares int,
    PRIMARY KEY (id),
    FOREIGN KEY (clave_ejemplares) REFERENCES ejemplares (clave_ejemplar)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (clave_socios) REFERENCES socios (clave_socio)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE trata_sobre (
	id int auto_increment,
    clave_libros int,
    clave_temas int,
    PRIMARY KEY(id),
    FOREIGN KEY (clave_libros) REFERENCES libros (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (clave_temas) REFERENCES temas (clave_tema)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE escrito_por (
	id int auto_increment,
    clave_libros int,
    clave_autores int,
    PRIMARY KEY(id),
    FOREIGN KEY (clave_libros) REFERENCES libros (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (clave_autores) REFERENCES autores (clave_autor)
    ON DELETE cascade
    ON UPDATE cascade
);
