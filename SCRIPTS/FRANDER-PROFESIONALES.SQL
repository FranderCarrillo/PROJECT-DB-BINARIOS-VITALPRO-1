USE VITALPRO
GO
CREATE TABLE Profesional
(
    CodigoProfesional INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    CedProfesional VARCHAR(50) NOT NULL,
    AniosExperiencia INT NOT NULL
)
GO
exec sp_help Profesional
GO

USE VITALPRO
GO
ALTER TABLE Profesional 
ADD CONSTRAINT PK_CodigoProfesional
PRIMARY KEY (CodigoProfesional)
GO
exec sp_help Profesional
GO


--  CREACION DE LA TABLA PROFESIONAL, COMO TABLA MADRE  CON SU RESPECTIVA PRIMARY KEY 


USE VITALPRO
GO
CREATE TABLE Nutricionista
(
    IdNutricionista INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NULL,
    CodigoProfesional INT NOT NULL,
    IdEspecialidad INT NOT NULL
)
ON Nutricion
GO
exec sp_help Nutricionista
GO
-- SE CREA LA TABLA Nutricionista

USE VITALPRO
GO
ALTER TABLE Nutricionista 
ADD CONSTRAINT PK_IdNutricionista
PRIMARY KEY (IdNutricionista)
GO
exec sp_help Nutricionista
GO
-- SE AÑADE LA LLAVE PRIMARIA a NUTRICIONISTA


USE VITALPRO
GO
ALTER TABLE Nutricionista
ADD CONSTRAINT FK_Nutricionista_Profesional
FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional);
GO
exec sp_help Nutricionista
GO
-- AGREGAR LA LLAVE FORANEA DE PROFESIONAL A NUTRICIONISTA

--  CREACION DE LA TABLA NUTRICIONISTA DONDE SE GUARDA SU FECHA DE INGRESO Y SU FECHA DEL MOMENTO QUE DEJA DE TRABAJAR Y SE AGREGA SUS LLAVES FORANEAS Y PRIMARIAS 

USE VITALPRO
GO
CREATE TABLE Especialidad_nutricionista
(
    IdEspecialidad INT NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL
)
ON Nutricion
GO
exec sp_help Especialidad_nutricionista
GO
-- CREACION DE LA TABLA QUE CONTIENE LAS ESPECIALIDADES PARA NUTRICIONISTA

USE VITALPRO
GO
ALTER TABLE Especialidad_nutricionista
ADD CONSTRAINT PK_IdEspecialidad
PRIMARY KEY (IdEspecialidad)
GO
exec sp_help Especialidad_nutricionista
GO
-- CREACION DE LA PK PARA LA ESPECIALIDAD NUTRICIONISTA


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

-- USE VITALPRO
-- GO
-- DROP TABLE Nutricionista
-- GO
-- DROP TABLE Profesional
-- GO
-- Drop table Especialidad_nutricionista
-- go
-- pruebas 

use VITALPRO
GO
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
 
-- exec sp_help Clientes

