USE VITALPRO
GO
CREATE TABLE Profesional
(
    CodigoProfesional INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    CedProfesional VARCHAR(50) NOT NULL,
    AniosExperiencia INT NOT NULL,
    CONSTRAINT PK_CodigoProfesional
    PRIMARY KEY (CodigoProfesional)
)
GO
exec sp_help Profesional
GO

--  CREACION DE LA TABLA PROFESIONAL, COMO TABLA MADRE  CON SU RESPECTIVA PRIMARY KEY 

--  Horario profesional
USE VITALPRO
GO
CREATE TABLE HorarioProfesional (
    IdHorario INT PRIMARY KEY,
    CodigoProfesional INT NOT NULL,
    DiaSemana VARCHAR(10) NOT NULL, 
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
GO
exec sp_help HorarioProfesional
GO
--  Horario profesional


USE VITALPRO
GO
CREATE TABLE Nutricionista
(
    IdNutricionista INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NULL,
    CodigoProfesional INT NOT NULL,
    IdEspecialidad INT NOT NULL,
    CONSTRAINT PK_IdNutricionista -- PK DE NUTRICIONISTA 
    PRIMARY KEY (IdNutricionista), 
    CONSTRAINT FK_Nutricionista_Profesional -- FK DE PROFESIONAL
    FOREIGN KEY (CodigoProfesional)
    REFERENCES Profesional(CodigoProfesional)
)
ON Nutricion
GO
exec sp_help Nutricionista
GO
-- SE CREA LA TABLA Nutricionista

--  CREACION DE LA TABLA NUTRICIONISTA DONDE SE GUARDA SU FECHA DE INGRESO Y SU FECHA DEL MOMENTO QUE DEJA DE TRABAJAR Y SE AGREGA SUS LLAVES FORANEAS Y PRIMARIAS 

USE VITALPRO
GO
CREATE TABLE Especialidad_nutricionista
(
    IdEspecialidad INT NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL,
    CONSTRAINT PK_IdEspecialidad -- PK DE LA TABLA,
    PRIMARY KEY (IdEspecialidad)
)
ON Nutricion
GO
exec sp_help Especialidad_nutricionista
GO
-- CREACION DE LA TABLA QUE CONTIENE LAS ESPECIALIDADES PARA NUTRICIONISTA


USE VITALPRO
GO
ALTER TABLE Nutricionista
ADD CONSTRAINT FK_Nutricionista_Especialidad
FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad_nutricionista(IdEspecialidad);
GO
exec sp_help Nutricionista
GO
-- CREACION DE LA LLAVE FORANEA DE LAS ESPECIALIDADES EN LA TABLA DE NUTRICIONISTA 


use VITALPRO
GO
-- Profesionales generales
INSERT INTO Profesional (CodigoProfesional, Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia)
VALUES 
(1, 'Laura', 'Ramírez', 'Mora', '203450678', 5),
(2, 'Javier', 'Soto', 'Gómez', '109876543', 8);
GO

-- Especialidades disponibles
INSERT INTO Especialidad_nutricionista (IdEspecialidad, NombreEspecialidad)
VALUES 
(1, 'Nutrición Deportiva'),
(2, 'Nutrición Clínica'),
(3, 'Nutrición Pediátrica');
GO

-- Nutricionista vinculado al profesional #1 con especialidad 2 (Clínica)
INSERT INTO Nutricionista (IdNutricionista, FechaInicio, FechaFinal, CodigoProfesional, IdEspecialidad)
VALUES 
(1, '2022-02-01', NULL, 1, 2);
GO

-- Nutricionista vinculado al profesional #2 con especialidad 1 (Deportiva)
INSERT INTO Nutricionista (IdNutricionista, FechaInicio, FechaFinal, CodigoProfesional, IdEspecialidad)
VALUES 
(2, '2021-05-15', '2024-05-30', 2, 1);
GO

-- Horarios del profesional 1 (Laura Ramírez)
INSERT INTO HorarioProfesional (IdHorario, CodigoProfesional, DiaSemana, HoraInicio, HoraFin)
VALUES
(1, 1, 'Lunes', '08:00', '16:00'),
(2, 1, 'Martes', '08:00', '16:00'),
(3, 1, 'Miércoles', '08:00', '16:00'),
(4, 1, 'Jueves', '08:00', '16:00'),
(5, 1, 'Viernes', '08:00', '14:00');
GO

-- Horarios del profesional 2 (Javier Soto)
INSERT INTO HorarioProfesional (IdHorario, CodigoProfesional, DiaSemana, HoraInicio, HoraFin)
VALUES
(6, 2, 'Lunes', '09:00', '17:00'),
(7, 2, 'Miércoles', '09:00', '17:00'),
(8, 2, 'Viernes', '09:00', '15:00');
GO

-- SELECTS

-- Consulta general de nutricionistas con especialidades
SELECT 
    n.IdNutricionista,
    p.Nombre + ' ' + p.Apellido1 + ' ' + p.Apellido2 AS NombreCompleto,
    p.CedProfesional,
    p.AniosExperiencia,
    e.NombreEspecialidad,
    n.FechaInicio,
    n.FechaFinal
FROM Nutricionista n
JOIN Profesional p ON n.CodigoProfesional = p.CodigoProfesional
JOIN Especialidad_nutricionista e ON n.IdEspecialidad = e.IdEspecialidad;
GO

-- Consulta de horarios por profesional
SELECT 
    p.Nombre + ' ' + p.Apellido1 + ' ' + p.Apellido2 AS Profesional,
    h.DiaSemana,
    FORMAT(h.HoraInicio, 'hh\:mm') AS HoraInicio,
    FORMAT(h.HoraFin, 'hh\:mm') AS HoraFin
FROM HorarioProfesional h
JOIN Profesional p ON p.CodigoProfesional = h.CodigoProfesional
ORDER BY p.CodigoProfesional,
         CASE
            WHEN h.DiaSemana = 'Lunes' THEN 1
            WHEN h.DiaSemana = 'Martes' THEN 2
            WHEN h.DiaSemana = 'Miércoles' THEN 3
            WHEN h.DiaSemana = 'Jueves' THEN 4
            WHEN h.DiaSemana = 'Viernes' THEN 5
            WHEN h.DiaSemana = 'Sábado' THEN 6
            WHEN h.DiaSemana = 'Domingo' THEN 7
         END;
GO

-- FINAL NUTRICIONISTA





USE VITALPRO
GO
CREATE TABLE Entrenador
(
    IdEntrenador INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NULL, 
)
ON Entrenamiento
GO
exec sp_help Entrenador
GO

--  CREACION DE LA TABLA ENTRENADOR CON SU FECHA DE INGRESO Y FECHA DEL MOMENTO QUE DEJA DE TRABAJAR

USE VITALPRO
GO
CREATE TABLE Especialidad_Entrenador
(
    IdEspecialidad INT NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL
)
ON Entrenamiento
GO
exec sp_help Especialidad_Entrenador
GO

--  CREACION DE LA TABLA DE ESPECIALIDADES PARA ENTRENADOR PARA ASOCIARLAS A UN ENTRENAADOR




-- USE Ejemplo
-- GO
-- ALTER TABLE Departamento
-- ADD CONSTRAINT PK_departamento_dep
-- PRIMARY KEY (dep)
-- GO
-- exec sp_help Departamento
-- go

-- Use Ejemplo
-- GO
-- CREATE TABLE Clientes
-- (
--     Nombre          varchar(35) NOT NULL,
--     Apellido1       varchar(40) NOT NULL,
--     Apellido2       varchar(40) NOT NULL,
--     Monto_credito   money     NULL,
--     Empresa         varchar(50) NULL
-- )
-- go
 
