CREATE DATABASE Plataforma_cursos_online;

-- MER 1: Plataforma de Cursos Online

-- 1. Estudiante
CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    fecha_registro DATE
);

-- 2. Profesor
CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    especialidad VARCHAR(100)
);

-- 3. CategoriaCurso
CREATE TABLE CategoriaCurso (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    area VARCHAR(50)
);

-- 4. Curso
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    titulo VARCHAR(100),
    nivel VARCHAR(50),
    id_profesor INT,
    id_categoria INT,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    FOREIGN KEY (id_categoria) REFERENCES CategoriaCurso(id_categoria)
);

-- 5. Modulo
CREATE TABLE Modulo (
    id_modulo INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracion INT,
    tipo VARCHAR(50)
);

-- 6. Calificacion
CREATE TABLE Calificacion (
    id_calificacion INT PRIMARY KEY,
    id_estudiante INT,
    id_modulo INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo)
);

-- 7. Certificado
CREATE TABLE Certificado (
    id_certificado INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_emision DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 8. Inscripcion (pivot)
CREATE TABLE Inscripcion (
    id_inscripcion INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    estado VARCHAR(50),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 9. AsignacionModulo (pivot)
CREATE TABLE AsignacionModulo (
    id_asignacion INT PRIMARY KEY,
    id_curso INT,
    id_modulo INT,
    obligatorio BOOLEAN,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo)
);

--Inserts

INSERT INTO Estudiante VALUES 
(1, 'Laura Ríos', 'laura@mail.com', '2024-05-01'),
(2, 'Pedro Díaz', 'pedro@mail.com', '2024-05-02'),
(3, 'Ana Torres', 'ana@mail.com', '2024-05-03'),
(4, 'Luis Mejía', 'luis@mail.com', '2024-05-04');

INSERT INTO Profesor VALUES 
(1, 'Carlos Gómez', 'Matemáticas', 'cgomez@mail.com'),
(2, 'María López', 'Programación', 'mlopez@mail.com'),
(3, 'Andrés Ruiz', 'Historia', 'aruiz@mail.com'),
(4, 'Paola Salas', 'Inglés', 'psalas@mail.com');

INSERT INTO CategoriaCurso VALUES 
(1, 'Ciencias', 'Cursos de ciencia básica', 'Académico'),
(2, 'Tecnología', 'Cursos digitales', 'Técnico'),
(3, 'Lenguas', 'Idiomas modernos', 'Idiomas'),
(4, 'Sociales', 'Cultura e historia', 'Humanidades');

INSERT INTO Curso VALUES 
(1, 'Álgebra Básica', 'Básico', 1, 1),
(2, 'Programación I', 'Intermedio', 2, 2),
(3, 'Inglés A1', 'Básico', 4, 3),
(4, 'Historia Mundial', 'Avanzado', 3, 4);

INSERT INTO Modulo VALUES 
(1, 'Variables y ecuaciones', 10, 'Teórico'),
(2, 'Sintaxis básica', 8, 'Práctico'),
(3, 'Gramática básica', 6, 'Teórico'),
(4, 'Primera Guerra Mundial', 9, 'Teórico');

INSERT INTO Calificacion VALUES 
(1, 1, 1, 4.5),
(2, 2, 2, 3.8),
(3, 3, 3, 5.0),
(4, 4, 4, 4.2);

INSERT INTO Certificado VALUES 
(1, 1, 1, '2024-06-01'),
(2, 2, 2, '2024-06-02'),
(3, 3, 3, '2024-06-03'),
(4, 4, 4, '2024-06-04');

--PIVOTE
INSERT INTO Inscripcion VALUES 
(1, 1, 1, 'Activo'),
(2, 2, 2, 'Activo'),
(3, 3, 3, 'Inactivo'),
(4, 4, 4, 'Activo');

INSERT INTO AsignacionModulo VALUES 
(1, 1, 1, TRUE),
(2, 2, 2, TRUE),
(3, 3, 3, TRUE),
(4, 4, 4, TRUE);

--Joins

SELECT e.nombre AS estudiante, c.titulo AS curso
FROM Estudiante e
INNER JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
INNER JOIN Curso c ON i.id_curso = c.id_curso;

SELECT p.nombre AS profesor, c.titulo AS curso
FROM Profesor p
INNER JOIN Curso c ON p.id_profesor = c.id_profesor;

SELECT c.titulo AS curso, cat.nombre AS categoria
FROM Curso c
LEFT JOIN CategoriaCurso cat ON c.id_categoria = cat.id_categoria;

SELECT c.titulo AS curso, m.titulo AS modulo
FROM Curso c
RIGHT JOIN AsignacionModulo am ON c.id_curso = am.id_curso
RIGHT JOIN Modulo m ON am.id_modulo = m.id_modulo;

SELECT e.nombre AS estudiante, m.titulo AS modulo, ca.nota
FROM Calificacion ca
INNER JOIN Estudiante e ON ca.id_estudiante = e.id_estudiante
INNER JOIN Modulo m ON ca.id_modulo = m.id_modulo;

--Funciones

SELECT nombre, LENGTH(nombre) AS longitud
FROM Estudiante;

SELECT titulo, UPPER(titulo) AS titulo_mayus
FROM Curso;

SELECT correo, LOWER(correo) AS correo_min
FROM Profesor;

SELECT nota, ROUND(nota, 0) AS nota_redondeada
FROM Calificacion;

SELECT CONCAT(nombre, ' - ', correo) AS info
FROM Estudiante;

SELECT fecha_emision, YEAR(fecha_emision) AS año
FROM Certificado;

SELECT '2024-06-01' AS fecha, MONTH('2024-06-01') AS mes;

SELECT NOW() AS fecha_actual;

SELECT ABS(4.5 - 3.8) AS diferencia;

SELECT titulo, SUBSTRING(titulo, 1, 3) AS abreviatura
FROM Curso;

--Alter

ALTER TABLE Estudiante
ADD telefono VARCHAR(15);

ALTER TABLE Curso
ADD duracion_horas INT;

ALTER TABLE Profesor
CHANGE correo correo_electronico VARCHAR(100);

ALTER TABLE Inscripcion
MODIFY estado VARCHAR(20) NOT NULL;

ALTER TABLE Calificacion
ADD observaciones TEXT;

--Update

UPDATE Estudiante
SET correo = 'laura.rios@mail.com'
WHERE id_estudiante = 1;

UPDATE Curso
SET titulo = 'Programación Básica'
WHERE id_curso = 2;

UPDATE Modulo
SET duracion_horas = duracion_horas + 1;

UPDATE Inscripcion
SET estado = 'Inactivo'
WHERE id_inscripcion = 2;

UPDATE Calificacion
SET observaciones = 'Excelente rendimiento'
WHERE id_calificacion = 3;

--Delete

DELETE FROM Estudiante
WHERE id_estudiante = 4;

DELETE FROM Curso
WHERE id_curso = 4;

DELETE FROM Inscripcion
WHERE id_inscripcion = 3;

DELETE FROM Calificacion
WHERE id_calificacion = 2;

DELETE FROM Certificado
WHERE id_certificado = 1;

--Truncate

TRUNCATE TABLE AsignacionModulo;

--Subconsultas

SELECT nombre 
FROM Estudiante 
WHERE id_estudiante = (
    SELECT id_estudiante 
    FROM Calificacion 
    ORDER BY nota DESC 
    LIMIT 1
);

SELECT titulo 
FROM Curso 
WHERE id_profesor = (
    SELECT id_profesor 
    FROM Profesor 
    WHERE area = 'Programación'
);

SELECT e.nombre
FROM (
    SELECT id_estudiante 
    FROM Certificado 
    WHERE id_certificado = 3
) AS sub
JOIN Estudiante e ON e.id_estudiante = sub.id_estudiante;

SELECT c.titulo
FROM (
    SELECT id_curso, COUNT(*) AS total
    FROM Inscripcion
    GROUP BY id_curso
    ORDER BY total DESC
    LIMIT 1
) AS sub
JOIN Curso c ON c.id_curso = sub.id_curso;

SELECT titulo, duracion_horas
FROM Modulo
WHERE duracion_horas = (
    SELECT MIN(duracion_horas)
    FROM (
        SELECT duracion_horas
        FROM Modulo
    ) AS sub
);
