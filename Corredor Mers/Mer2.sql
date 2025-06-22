CREATE DATABASE Sistema_de_Reservas_para_Consultorios_Médicos;

-- Paciente
CREATE TABLE Paciente (
  id_paciente INT PRIMARY KEY,
  nombre VARCHAR(100),
  documento VARCHAR(20),
  telefono VARCHAR(15),
  correo VARCHAR(100)
);

-- Medico
CREATE TABLE Medico (
  id_medico INT PRIMARY KEY,
  nombre VARCHAR(100),
  registro_profesional VARCHAR(50),
  correo VARCHAR(100),
  telefono VARCHAR(15)
);

-- Consultorio
CREATE TABLE Consultorio (
  id_consultorio INT PRIMARY KEY,
  nombre VARCHAR(50),
  ubicacion VARCHAR(100),
  piso INT,
  capacidad INT
);

-- Especialidad
CREATE TABLE Especialidad (
  id_especialidad INT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion VARCHAR(200)
);

-- Servicio
CREATE TABLE Servicio (
  id_servicio INT PRIMARY KEY,
  nombre VARCHAR(100),
  costo DECIMAL(10,2),
  duracion_min INT
);

-- Cita
CREATE TABLE Cita (
  id_cita INT PRIMARY KEY,
  id_paciente INT,
  id_medico INT,
  id_consultorio INT,
  fecha DATE,
  hora TIME,
  estado VARCHAR(20),
  FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
  FOREIGN KEY (id_consultorio) REFERENCES Consultorio(id_consultorio)
);

-- Factura
CREATE TABLE Factura (
  id_factura INT PRIMARY KEY,
  id_cita INT,
  fecha DATE,
  total DECIMAL(10,2),
  metodo_pago VARCHAR(30),
  FOREIGN KEY (id_cita) REFERENCES Cita(id_cita)
);

-- Pivote: Médico - Especialidad
CREATE TABLE MedicoEspecialidad (
  id_medico INT,
  id_especialidad INT,
  PRIMARY KEY (id_medico, id_especialidad),
  FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
  FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad)
);

-- Pivote: Cita - Servicio
CREATE TABLE CitaServicio (
  id_cita INT,
  id_servicio INT,
  PRIMARY KEY (id_cita, id_servicio),
  FOREIGN KEY (id_cita) REFERENCES Cita(id_cita),
  FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

--INSERTS

-- Paciente
INSERT INTO Paciente (id_paciente, nombre, documento, telefono, correo) VALUES
(1, 'Laura Ríos', '12345678', '3110001111', 'laura@mail.com'),
(2, 'Carlos Gómez', '87654321', '3122223333', 'carlos@mail.com'),
(3, 'Mariana Ruiz', '11223344', '3104445555', 'mariana@mail.com'),
(4, 'Javier Salas', '99887766', '3133334444', 'javier@mail.com');

-- Medico
INSERT INTO Medico (id_medico, nombre, registro_profesional, correo, telefono) VALUES
(1, 'Dra. Fernanda Gil', 'MP00123', 'fgil@salud.com', '3155556666'),
(2, 'Dr. Tomás Villa', 'MP00456', 'tvilla@salud.com', '3166667777'),
(3, 'Dra. Camila Peña', 'MP00789', 'cpena@salud.com', '3177778888'),
(4, 'Dr. Andrés Mora', 'MP00999', 'amora@salud.com', '3188889999');

-- Consultorio
INSERT INTO Consultorio (id_consultorio, nombre, ubicacion, piso, capacidad) VALUES
(1, 'Consultorio Norte', 'Calle 10 #15-30', 2, 5),
(2, 'Consultorio Sur', 'Carrera 20 #45-60', 1, 3),
(3, 'Consultorio Central', 'Av. Siempre Viva 742', 3, 4),
(4, 'Consultorio Oeste', 'Diagonal 50 #70-20', 4, 2);

-- Especialidad
INSERT INTO Especialidad (id_especialidad, nombre, descripcion) VALUES
(1, 'Pediatría', 'Atención médica para niños'),
(2, 'Medicina Interna', 'Tratamiento de enfermedades del adulto'),
(3, 'Dermatología', 'Diagnóstico y tratamiento de la piel'),
(4, 'Cardiología', 'Atención del sistema cardiovascular');

-- Servicio
INSERT INTO Servicio (id_servicio, nombre, costo, duracion_min) VALUES
(1, 'Consulta General', 50000.00, 30),
(2, 'Electrocardiograma', 80000.00, 25),
(3, 'Curación menor', 30000.00, 15),
(4, 'Control pediátrico', 60000.00, 20);

-- Cita
INSERT INTO Cita (id_cita, id_paciente, id_medico, id_consultorio, fecha, hora, estado) VALUES
(1, 1, 1, 1, '2025-06-15', '09:00:00', 'Activa'),
(2, 2, 2, 2, '2025-06-16', '10:00:00', 'Activa'),
(3, 3, 3, 3, '2025-06-17', '11:30:00', 'Cancelada'),
(4, 4, 4, 4, '2025-06-18', '14:00:00', 'Activa');

-- Factura
INSERT INTO Factura (id_factura, id_cita, fecha, total, metodo_pago) VALUES
(1, 1, '2025-06-15', 50000.00, 'Efectivo'),
(2, 2, '2025-06-16', 80000.00, 'Tarjeta'),
(3, 3, '2025-06-17', 0.00, 'N/A'),
(4, 4, '2025-06-18', 90000.00, 'Transferencia');

-- Pivote: MedicoEspecialidad
INSERT INTO MedicoEspecialidad (id_medico, id_especialidad) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Pivote: CitaServicio
INSERT INTO CitaServicio (id_cita, id_servicio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- ALTER TABLE

ALTER TABLE Paciente ADD fecha_nacimiento DATE;
ALTER TABLE Medico ADD especialidad_principal VARCHAR(100);
ALTER TABLE Consultorio MODIFY capacidad INT NOT NULL;
ALTER TABLE Servicio ADD descripcion VARCHAR(150);
ALTER TABLE Factura ADD observaciones TEXT;

-- UPDATE

UPDATE Paciente SET telefono = '3109998888' WHERE id_paciente = 1;
UPDATE Medico SET correo = 'nuevocorreo@salud.com' WHERE id_medico = 2;
UPDATE Consultorio SET piso = 5 WHERE id_consultorio = 3;
UPDATE Cita SET estado = 'Finalizada' WHERE id_cita = 1;
UPDATE Servicio SET costo = 55000.00 WHERE id_servicio = 1;


-- DELETE

DELETE FROM CitaServicio WHERE id_cita = 3 AND id_servicio = 3;
DELETE FROM MedicoEspecialidad WHERE id_medico = 4 AND id_especialidad = 4;
DELETE FROM Factura WHERE id_factura = 3;
DELETE FROM Cita WHERE id_cita = 3;
DELETE FROM Paciente WHERE id_paciente = 4;


-- 6. TRUNCATE

TRUNCATE TABLE MedicoEspecialidad;

-- FUNCIONES

SELECT UPPER(nombre) AS nombre_mayus FROM Paciente;
SELECT LOWER(correo) AS correo_min FROM Medico;
SELECT LENGTH(nombre) AS longitud_nombre FROM Servicio;
SELECT ROUND(costo, 0) AS costo_redondeado FROM Servicio;
SELECT NOW() AS fecha_actual;
SELECT CONCAT(nombre, ' - ', documento) AS info FROM Paciente;
SELECT ABS(50000 - 70000) AS diferencia;
SELECT YEAR(fecha) AS año_factura FROM Factura;
SELECT MONTH(fecha) AS mes_factura FROM Factura;
SELECT SUBSTRING(nombre, 1, 5) AS abreviado FROM Consultorio;


-- JOINs

-- Citas con información del paciente
SELECT c.id_cita, p.nombre AS paciente, c.fecha, c.estado
FROM Cita c
INNER JOIN Paciente p ON c.id_paciente = p.id_paciente;

-- Citas con médico y consultorio
SELECT c.id_cita, m.nombre AS medico, cs.nombre AS consultorio
FROM Cita c
INNER JOIN Medico m ON c.id_medico = m.id_medico
INNER JOIN Consultorio cs ON c.id_consultorio = cs.id_consultorio;

-- Servicios por cita
SELECT cs.id_cita, s.nombre AS servicio
FROM CitaServicio cs
INNER JOIN Servicio s ON cs.id_servicio = s.id_servicio;

-- Médico con sus especialidades
SELECT m.nombre AS medico, e.nombre AS especialidad
FROM MedicoEspecialidad me
INNER JOIN Medico m ON me.id_medico = m.id_medico
INNER JOIN Especialidad e ON me.id_especialidad = e.id_especialidad;

-- Facturas con cita y paciente
SELECT f.id_factura, f.total, p.nombre AS paciente
FROM Factura f
INNER JOIN Cita c ON f.id_cita = c.id_cita
INNER JOIN Paciente p ON c.id_paciente = p.id_paciente;

-- SUBCONSULTAS 

-- Paciente con más citas
SELECT nombre FROM Paciente
WHERE id_paciente = (
  SELECT id_paciente
  FROM Cita
  GROUP BY id_paciente
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- Servicio más costoso
SELECT nombre FROM Servicio
WHERE costo = (
  SELECT MAX(costo) FROM Servicio
);

-- Consultorio con menor capacidad
SELECT nombre FROM Consultorio
WHERE capacidad = (
  SELECT MIN(capacidad) FROM Consultorio
);

-- Nombre de médico que emitió una cita específica (ID 1)
SELECT nombre FROM Medico
WHERE id_medico = (
  SELECT id_medico FROM Cita WHERE id_cita = 1
);

-- Subconsulta en FROM para obtener promedio de costo por duración
SELECT AVG(costo_por_min) AS promedio
FROM (
  SELECT (costo / duracion_min) AS costo_por_min
  FROM Servicio
) AS sub;
