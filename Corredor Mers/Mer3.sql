CREATE DATABASE Sistema_Deportivo;

-- CREACIÓN DE TABLAS PRINCIPALES
CREATE TABLE Club (
    id_club INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fundacion DATE
);

CREATE TABLE Deportista (
    id_deportista INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    genero VARCHAR(10),
    nacionalidad VARCHAR(50)
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE Entrenador (
    id_entrenador INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    ubicacion VARCHAR(100)
);

CREATE TABLE Instalacion (
    id_instalacion INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    capacidad INT
);

CREATE TABLE Membresia (
    id_membresia INT PRIMARY KEY,
    tipo VARCHAR(50),
    costo_mensual DECIMAL(10, 2)
);

-- TABLAS PIVOTE
CREATE TABLE Deportista_Disciplina (
    id_deportista INT,
    id_disciplina INT,
    PRIMARY KEY (id_deportista, id_disciplina),
    FOREIGN KEY (id_deportista) REFERENCES Deportista(id_deportista),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Evento_Deportista (
    id_evento INT,
    id_deportista INT,
    PRIMARY KEY (id_evento, id_deportista),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_deportista) REFERENCES Deportista(id_deportista)
);

-- INSERTS AGRUPADOS
INSERT INTO Club VALUES
(1, 'Club Elite', 'Madrid', '2001-06-01'),
(2, 'Deporte Total', 'Barcelona', '1998-04-12'),
(3, 'FitLife', 'Sevilla', '2010-09-05'),
(4, 'MaxPower', 'Valencia', '2005-03-20');

INSERT INTO Deportista VALUES
(1, 'Luis Pérez', '1995-07-14', 'Masculino', 'España'),
(2, 'Ana Torres', '2000-05-09', 'Femenino', 'México'),
(3, 'Carlos Gómez', '1992-11-22', 'Masculino', 'Colombia'),
(4, 'Laura Méndez', '1998-03-30', 'Femenino', 'España');

INSERT INTO Disciplina VALUES
(1, 'Natación', 'Acuático'),
(2, 'Atletismo', 'Pista'),
(3, 'Ciclismo', 'Resistencia'),
(4, 'Gimnasia', 'Artístico');

INSERT INTO Entrenador VALUES
(1, 'Miguel Sánchez', 'Natación'),
(2, 'Paula Ruiz', 'Atletismo'),
(3, 'Javier Montes', 'Ciclismo'),
(4, 'Sandra López', 'Gimnasia');

INSERT INTO Evento VALUES
(1, 'Torneo Nacional', '2024-07-10', 'Madrid'),
(2, 'Copa Primavera', '2024-05-05', 'Barcelona'),
(3, 'Reto Extremo', '2024-09-15', 'Valencia'),
(4, 'Olimpiadas Locales', '2024-08-01', 'Sevilla');

INSERT INTO Instalacion VALUES
(1, 'Piscina Olímpica', 'Piscina', 500),
(2, 'Pista de Atletismo', 'Pista', 300),
(3, 'Velódromo', 'Pista Ciclismo', 400),
(4, 'Gimnasio Central', 'Gimnasio', 600);

INSERT INTO Membresia VALUES
(1, 'Básica', 30.00),
(2, 'Premium', 60.00),
(3, 'Estudiante', 20.00),
(4, 'Familiar', 80.00);

INSERT INTO Deportista_Disciplina VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Evento_Deportista VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- JOINS

SELECT dp.nombre, cl.nombre AS club FROM Deportista dp JOIN Club cl ON dp.id_club = cl.id_club;

SELECT e.nombre AS evento, d.nombre AS disciplina FROM Evento e JOIN Disciplina d ON e.id_disciplina = d.id_disciplina;

SELECT de.nombre AS deportista, dis.nombre AS disciplina FROM Deportista de JOIN Deportista_Disciplina dd ON de.id_deportista = dd.id_deportista JOIN Disciplina dis ON dis.id_disciplina = dd.id_disciplina;

SELECT ev.nombre AS evento, de.nombre AS participante FROM Evento ev JOIN Evento_Deportista ed ON ev.id_evento = ed.id_evento JOIN Deportista de ON de.id_deportista = ed.id_deportista;

SELECT en.nombre, cl.nombre AS club FROM Entrenador en JOIN Club cl ON en.id_club = cl.id_club;

-- FUNCIONES

SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Deportista;

SELECT nombre, UPPER(nombre) AS nombre_mayus FROM Club;

SELECT nombre, LOWER(nombre) AS nombre_minus FROM Entrenador;

SELECT costo_mensual, ROUND(costo_mensual, 0) AS costo_redondeado FROM Membresia;

SELECT CONCAT(nombre, ' - ', tipo) AS detalle FROM Instalacion;

SELECT fecha, YEAR(fecha) AS año FROM Evento;

SELECT '2024-06-01' AS fecha, MONTH('2024-06-01') AS mes;

SELECT NOW() AS fecha_actual;

SELECT ABS(500 - 300) AS diferencia_capacidad;

SELECT nombre, SUBSTRING(nombre, 1, 3) AS abreviado FROM Disciplina;

-- ALTERACIONES

ALTER TABLE Deportista ADD COLUMN id_club INT;

ALTER TABLE Deportista ADD FOREIGN KEY (id_club) REFERENCES Club(id_club);

ALTER TABLE Deportista ADD COLUMN id_membresia INT;

ALTER TABLE Deportista ADD FOREIGN KEY (id_membresia) REFERENCES Membresia(id_membresia);

ALTER TABLE Entrenador ADD COLUMN id_club INT;

ALTER TABLE Entrenador ADD FOREIGN KEY (id_club) REFERENCES Club(id_club);

ALTER TABLE Evento ADD COLUMN id_disciplina INT;

ALTER TABLE Evento ADD FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina);

-- UPDATES

UPDATE Deportista SET id_club = 1, id_membresia = 2 WHERE id_deportista = 1;

UPDATE Deportista SET id_club = 2, id_membresia = 1 WHERE id_deportista = 2;

UPDATE Deportista SET id_club = 3, id_membresia = 4 WHERE id_deportista = 3;

UPDATE Deportista SET id_club = 4, id_membresia = 3 WHERE id_deportista = 4;

UPDATE Entrenador SET id_club = 1 WHERE id_entrenador = 1;

-- DELETES

DELETE FROM Evento_Deportista WHERE id_evento = 4 AND id_deportista = 4;

DELETE FROM Deportista_Disciplina WHERE id_deportista = 3 AND id_disciplina = 3;

DELETE FROM Instalacion WHERE id_instalacion = 4;

DELETE FROM Membresia WHERE id_membresia = 4;

DELETE FROM Club WHERE id_club = 4;

-- TRUNCATE

TRUNCATE TABLE Evento_Deportista;

-- SUBCONSULTAS

SELECT nombre FROM Deportista WHERE id_club = (SELECT id_club FROM Club WHERE nombre = 'FitLife');

SELECT nombre FROM Entrenador WHERE id_club = (SELECT id_club FROM Deportista WHERE nombre = 'Carlos Gómez');

SELECT nombre FROM Disciplina WHERE id_disciplina = (SELECT id_disciplina FROM Evento WHERE nombre = 'Torneo Nacional');

SELECT tipo FROM Membresia WHERE id_membresia = (SELECT id_membresia FROM Deportista WHERE nombre = 'Ana Torres');

SELECT nombre FROM Instalacion WHERE capacidad = (SELECT MAX(capacidad) FROM Instalacion);
