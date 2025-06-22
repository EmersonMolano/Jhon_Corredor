CREATE DATABASE Sistema_de_gestión_de_un_festival_gastronómico;

-- CREACIÓN DE TABLAS PRINCIPALES
CREATE TABLE Restaurante (
    id_restaurante INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_apertura DATE
);

CREATE TABLE Chef (
    id_chef INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50),
    nacionalidad VARCHAR(50)
);

CREATE TABLE Plato (
    id_plato INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    precio DECIMAL(6,2)
);

CREATE TABLE Evento_Gastronomico (
    id_evento INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    lugar VARCHAR(100)
);

CREATE TABLE Jurado (
    id_jurado INT PRIMARY KEY,
    nombre VARCHAR(100),
    experiencia INT
);

CREATE TABLE Ingrediente (
    id_ingrediente INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE Patrocinador (
    id_patrocinador INT PRIMARY KEY,
    nombre VARCHAR(100),
    contribucion DECIMAL(10,2)
);

-- TABLAS PIVOTE
CREATE TABLE Plato_Ingrediente (
    id_plato INT,
    id_ingrediente INT,
    PRIMARY KEY (id_plato, id_ingrediente),
    FOREIGN KEY (id_plato) REFERENCES Plato(id_plato),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente)
);

CREATE TABLE Evento_Chef (
    id_evento INT,
    id_chef INT,
    PRIMARY KEY (id_evento, id_chef),
    FOREIGN KEY (id_evento) REFERENCES Evento_Gastronomico(id_evento),
    FOREIGN KEY (id_chef) REFERENCES Chef(id_chef)
);

-- INSERTS
INSERT INTO Restaurante VALUES 
(1, 'Sabor Andino', 'Quito', '2012-04-15'),
(2, 'La Cazuela Feliz', 'Lima', '2015-07-22'),
(3, 'Fusion Gourmet', 'Buenos Aires', '2018-09-30'),
(4, 'Mar y Tierra', 'Valparaíso', '2010-01-12');

INSERT INTO Chef VALUES 
(1, 'Andrea Gómez', 'Mariscos', 'Ecuador'),
(2, 'Carlos Rivera', 'Carnes', 'Perú'),
(3, 'Lucía Blanco', 'Vegetariano', 'Argentina'),
(4, 'Tomás Silva', 'Fusión', 'Chile');

INSERT INTO Plato VALUES 
(1, 'Ceviche Clásico', 'Entrada', 12.50),
(2, 'Parrillada Mixta', 'Principal', 25.00),
(3, 'Tarta de Quinoa', 'Postre', 8.75),
(4, 'Risotto de Mariscos', 'Principal', 18.40);

INSERT INTO Evento_Gastronomico VALUES 
(1, 'Sabores del Pacífico', '2025-07-10', 'Guayaquil'),
(2, 'Cumbre del Sabor', '2025-08-15', 'Lima'),
(3, 'Feria Fusión', '2025-09-05', 'Santiago'),
(4, 'Gastronomía Viva', '2025-10-12', 'Buenos Aires');

INSERT INTO Jurado VALUES 
(1, 'Beatriz Navas', 10),
(2, 'Miguel Torres', 7),
(3, 'Ana Ledesma', 5),
(4, 'Joaquín Salas', 12);

INSERT INTO Ingrediente VALUES 
(1, 'Camarón', 'Marino'),
(2, 'Quinoa', 'Grano'),
(3, 'Carne de res', 'Cárnico'),
(4, 'Pimiento', 'Vegetal');

INSERT INTO Patrocinador VALUES 
(1, 'AguaVida', 5000.00),
(2, 'ChefStore', 3000.00),
(3, 'Sabores Naturales', 4000.00),
(4, 'GastroTech', 6000.00);

INSERT INTO Plato_Ingrediente VALUES 
(1, 1),
(2, 3),
(3, 2),
(4, 1);

INSERT INTO Evento_Chef VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- JOINS
SELECT ch.nombre, r.nombre AS restaurante
FROM Chef ch
JOIN Restaurante r ON ch.id_chef = r.id_restaurante;

SELECT p.nombre AS plato, i.nombre AS ingrediente
FROM Plato p
JOIN Plato_Ingrediente pi ON p.id_plato = pi.id_plato
JOIN Ingrediente i ON pi.id_ingrediente = i.id_ingrediente;

SELECT e.nombre AS evento, ch.nombre AS chef
FROM Evento_Gastronomico e
JOIN Evento_Chef ec ON e.id_evento = ec.id_evento
JOIN Chef ch ON ec.id_chef = ch.id_chef;

SELECT pl.nombre, pt.nombre AS patrocinador
FROM Plato pl
JOIN Restaurante r ON r.id_restaurante = pl.id_plato
JOIN Patrocinador pt ON pt.id_patrocinador = r.id_restaurante;

SELECT j.nombre AS jurado, e.nombre AS evento
FROM Jurado j
JOIN Evento_Gastronomico e ON j.id_jurado = e.id_evento;

-- FUNCIONES

SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Pla
to;

SELECT nombre, UPPER(nombre) AS nombre_mayus FROM Restaurante;

SELECT nombre, LOWER(nombre) AS nombre_minus FROM Chef;

SELECT precio, ROUND(precio, 0) AS precio_redondo FROM Plato;

SELECT CONCAT(nombre, ' - ', tipo) AS descripcion FROM Ingrediente;

SELECT fecha, YEAR(fecha) AS año FROM Evento_Gastronomico;

SELECT '2025-06-01' AS fecha, MONTH('2025-06-01') AS mes;

SELECT NOW() AS fecha_actual;

SELECT ABS(25.00 - 18.40) AS diferencia_precio;

SELECT nombre, SUBSTRING(nombre, 1, 4) AS abreviado FROM Patrocinador;

-- ALTER

ALTER TABLE Chef ADD COLUMN id_restaurante INT;

ALTER TABLE Chef ADD FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id_restaurante);

ALTER TABLE Evento_Gastronomico ADD COLUMN id_patrocinador INT;

ALTER TABLE Evento_Gastronomico ADD FOREIGN KEY (id_patrocinador) REFERENCES Patrocinador(id_patrocinador);

ALTER TABLE Plato ADD COLUMN id_chef INT;

ALTER TABLE Plato ADD FOREIGN KEY (id_chef) REFERENCES Chef(id_chef);

ALTER TABLE Jurado ADD COLUMN especialidad VARCHAR(50);

ALTER TABLE Restaurante ADD COLUMN estrellas INT;

-- UPDATE

UPDATE Chef SET id_restaurante = 1 WHERE id_chef = 1;

UPDATE Chef SET id_restaurante = 2 WHERE id_chef = 2;

UPDATE Evento_Gastronomico SET id_patrocinador = 1 WHERE id_evento = 1;

UPDATE Plato SET id_chef = 3 WHERE id_plato = 3;

UPDATE Restaurante SET estrellas = 4 WHERE id_restaurante = 1;

-- DELETE
DELETE FROM Evento_Chef WHERE id_evento = 4 AND id_chef = 4;

DELETE FROM Plato_Ingrediente WHERE id_plato = 2 AND id_ingrediente = 3;

DELETE FROM Patrocinador WHERE id_patrocinador = 4;

DELETE FROM Ingrediente WHERE id_ingrediente = 4;

DELETE FROM Restaurante WHERE id_restaurante = 4;

-- TRUNCATE
TRUNCATE TABLE Evento_Chef;

-- SUBCONSULTAS

SELECT nombre FROM Plato WHERE id_chef = (SELECT id_chef FROM Chef WHERE nombre = 'Lucía Blanco');

SELECT nombre FROM Restaurante WHERE id_restaurante = (SELECT id_restaurante FROM Chef WHERE nombre = 'Carlos Rivera');

SELECT nombre FROM Evento_Gastronomico WHERE id_patrocinador = (SELECT id_patrocinador FROM Patrocinador WHERE nombre = 'ChefStore');

SELECT nombre FROM Ingrediente WHERE tipo = (SELECT tipo FROM Ingrediente WHERE nombre = 'Camarón');

SELECT nombre FROM Jurado WHERE experiencia = (SELECT MAX(experiencia) FROM Jurado);
