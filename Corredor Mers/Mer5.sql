CREATE DATABASE sistema_de_control_de_producción_cinematográfica;

-- CREACIÓN DE TABLAS PRINCIPALES
CREATE TABLE Productora (
    id_productora INT PRIMARY KEY,
    nombre VARCHAR(100),
    pais VARCHAR(50),
    fundacion DATE
);

CREATE TABLE Director (
    id_director INT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(50),
    genero VARCHAR(10)
);

CREATE TABLE Pelicula (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    duracion INT
);

CREATE TABLE Actor (
    id_actor INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

CREATE TABLE Festival (
    id_festival INT PRIMARY KEY,
    nombre VARCHAR(100),
    sede VARCHAR(100),
    fecha DATE
);

CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad INT,
    tipo VARCHAR(50)
);

CREATE TABLE Distribuidor (
    id_distribuidor INT PRIMARY KEY,
    nombre VARCHAR(100),
    alcance VARCHAR(50)
);

-- TABLAS PIVOTE
CREATE TABLE Actor_Pelicula (
    id_actor INT,
    id_pelicula INT,
    PRIMARY KEY (id_actor, id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actor(id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula)
);

CREATE TABLE Festival_Pelicula (
    id_festival INT,
    id_pelicula INT,
    PRIMARY KEY (id_festival, id_pelicula),
    FOREIGN KEY (id_festival) REFERENCES Festival(id_festival),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula)
);

-- INSERTS
INSERT INTO Productora VALUES 
(1, 'CineGlobal', 'España', '2003-05-15'),
(2, 'VisionArte', 'México', '2008-09-22'),
(3, 'Luz y Cámara', 'Argentina', '2012-03-30'),
(4, '7º Arte Films', 'Chile', '2015-11-10');

INSERT INTO Director VALUES 
(1, 'Claudia Ruiz', 'España', 'Femenino'),
(2, 'Mateo Herrera', 'México', 'Masculino'),
(3, 'Julieta Basso', 'Argentina', 'Femenino'),
(4, 'Tomás Vergara', 'Chile', 'Masculino');

INSERT INTO Pelicula VALUES 
(1, 'Horizonte Rojo', 'Drama', 120),
(2, 'Más Allá del Tiempo', 'Ciencia Ficción', 145),
(3, 'La Ruta Final', 'Acción', 110),
(4, 'Reflejo Interior', 'Psicológico', 95);

INSERT INTO Actor VALUES 
(1, 'Lucía Moreno', '1990-08-15', 'España'),
(2, 'Gabriel Torres', '1985-12-03', 'México'),
(3, 'Valentina Soto', '1992-06-25', 'Chile'),
(4, 'Emilio Duarte', '1980-04-10', 'Argentina');

INSERT INTO Festival VALUES 
(1, 'Festival Internacional de Cine', 'San Sebastián', '2025-09-20'),
(2, 'CineLatino', 'Guadalajara', '2025-07-12'),
(3, 'Pantalla Abierta', 'Buenos Aires', '2025-08-05'),
(4, 'Luz en la Pantalla', 'Santiago', '2025-10-10');

INSERT INTO Sala VALUES 
(1, 'Sala A', 300, 'Proyección'),
(2, 'Sala B', 200, 'Privada'),
(3, 'Auditorio Principal', 500, 'Gala'),
(4, 'Sala C', 150, 'Talleres');

INSERT INTO Distribuidor VALUES 
(1, 'GlobalDistrib', 'Internacional'),
(2, 'CineExpress', 'Nacional'),
(3, 'ArtFilmNet', 'Regional'),
(4, 'PeliMundo', 'Internacional');

INSERT INTO Actor_Pelicula VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Festival_Pelicula VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- JOINS
SELECT p.titulo, d.nombre AS director
FROM Pelicula p
JOIN Director d ON p.id_pelicula = d.id_director;

SELECT a.nombre AS actor, p.titulo AS pelicula
FROM Actor a
JOIN Actor_Pelicula ap ON a.id_actor = ap.id_actor
JOIN Pelicula p ON p.id_pelicula = ap.id_pelicula;

SELECT f.nombre AS festival, p.titulo
FROM Festival f
JOIN Festival_Pelicula fp ON f.id_festival = fp.id_festival
JOIN Pelicula p ON p.id_pelicula = fp.id_pelicula;

SELECT d.nombre AS distribuidor, p.titulo
FROM Distribuidor d
JOIN Pelicula p ON d.id_distribuidor = p.id_pelicula;

SELECT s.nombre AS sala, f.nombre AS festival
FROM Sala s
JOIN Festival f ON s.id_sala = f.id_festival;

-- FUNCIONES

SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM Pelicula;

SELECT nombre, UPPER(nombre) AS nombre_mayus FROM Actor;

SELECT nombre, LOWER(nombre) AS nombre_min FROM Director;

SELECT duracion, ROUND(duracion/60.0, 1) AS duracion_horas FROM Pelicula;

SELECT CONCAT(nombre, ' - ', alcance) AS info FROM Distribuidor;

SELECT fecha, YEAR(fecha) AS año FROM Festival;

SELECT '2025-10-01' AS fecha, MONTH('2025-10-01') AS mes;

SELECT NOW() AS fecha_actual;

SELECT ABS(145 - 95) AS diferencia_duracion;

SELECT titulo, SUBSTRING(titulo, 1, 5) AS abreviado FROM Pelicula;

-- ALTER
ALTER TABLE Pelicula ADD COLUMN id_productora INT;

ALTER TABLE Pelicula ADD FOREIGN KEY (id_productora) REFERENCES Productora(id_productora);

ALTER TABLE Pelicula ADD COLUMN id_director INT;

ALTER TABLE Pelicula ADD FOREIGN KEY (id_director) REFERENCES Director(id_director);

ALTER TABLE Festival ADD COLUMN id_sala INT;

ALTER TABLE Festival ADD FOREIGN KEY (id_sala) REFERENCES Sala(id_sala);

ALTER TABLE Actor ADD COLUMN genero VARCHAR(10);

ALTER TABLE Sala ADD COLUMN disponible BOOLEAN;

-- UPDATE
UPDATE Pelicula SET id_productora = 1 WHERE id_pelicula = 1;

UPDATE Pelicula SET id_director = 2 WHERE id_pelicula = 2;

UPDATE Festival SET id_sala = 1 WHERE id_festival = 1;

UPDATE Sala SET disponible = TRUE WHERE id_sala = 3;

UPDATE Actor SET genero = 'Femenino' WHERE id_actor = 1;


-- DELETE

DELETE FROM Actor_Pelicula WHERE id_actor = 4 AND id_pelicula = 4;

DELETE FROM Festival_Pelicula WHERE id_festival = 3 AND id_pelicula = 3;

DELETE FROM Distribuidor WHERE id_distribuidor = 3;

DELETE FROM Sala WHERE id_sala = 4;

DELETE FROM Productora WHERE id_productora = 4;

-- TRUNCATE

TRUNCATE TABLE Festival_Pelicula;

-- SUBCONSULTAS

SELECT titulo FROM Pelicula WHERE id_director = (SELECT id_director FROM Director WHERE nombre = 'Mateo Herrera');

SELECT nombre FROM Productora WHERE id_productora = (SELECT id_productora FROM Pelicula WHERE titulo = 'Horizonte Rojo');

SELECT nombre FROM Festival WHERE id_sala = (SELECT id_sala FROM Sala WHERE nombre = 'Auditorio Principal');

SELECT titulo FROM Pelicula WHERE duracion = (SELECT MAX(duracion) FROM Pelicula);

SELECT nombre FROM Actor WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM Actor);
