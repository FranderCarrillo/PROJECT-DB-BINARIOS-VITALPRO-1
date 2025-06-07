USE master
GO

Create database VITALPRO
ON PRIMARY
(NAME = VITALPRO_Data,
FILENAME = 'C:\SqlData\VITALPRO_Data.mdf',
SIZE = 10MB,
MAXSIZE = 15MB, 
FILEGROWTH = 1MB
)
LOG ON
(NAME = VITALPRO_Log,
FILENAME = 'C:\SqlLog\VITALPRO_Log.ldf',
SIZE = 100MB,
MAXSIZE = 150MB, 
FILEGROWTH = 5MB
)
GO

EXEC sp_helpDB VITALPRO
GO

USE MASTER
Go
ALTER DATABASE VITALPRO
ADD FILEGROUP Entrenamiento
Go

USE master
GO
ALTER DATABASE VITALPRO
ADD FILE(
NAME = Entrenamiento_Data,
FILENAME = 'C:\SqlData\Entrenamiento_Data.ndf'
)
TO FILEGROUP Entrenamiento
GO

USE MASTER
Go
ALTER DATABASE VITALPRO
ADD FILEGROUP Nutricion
Go

USE master
GO
ALTER DATABASE VITALPRO
ADD FILE(
NAME = Nutricion_Data,
FILENAME = 'C:\SqlData\Nutricion_Data.ndf'
)
TO FILEGROUP Nutricion
GO









USE VITALPRO
GO

CREATE TABLE EvaluacionFisica
(
    Id_EvaluacionFisica INT NOT NULL,
    Fecha DATE NOT NULL,
    Peso FLOAT NOT NULL,
    Estatura FLOAT NOT NULL,
    GrasaCorporal FLOAT NOT NULL,
    MasaMuscular FLOAT NOT NULL,
    NivelResistencia VARCHAR(20) NULL,
    Flexibilidad VARCHAR(20) NULL,
    CodigoUnicoCentro INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    NumAfiliacion INT NOT NULL,

    CONSTRAINT PK_Id_EvaluacionFisica PRIMARY KEY (Id_EvaluacionFisica),

    
) ON Entrenamiento
GO

USE VITALPRO
GO

CREATE TABLE PlanPersonalizado
(
    idPlanPersonalizado INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    IdRutina INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    CodigoPlan INT NOT NULL,

    CONSTRAINT PK_idPlanPersonalizado PRIMARY KEY (idPlanPersonalizado),

  
) on [primary]
GO

USE VITALPRO
GO

CREATE TABLE PlanAlimenticio
(
    CodigoPlan INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    metalNutricional VARCHAR(100),
    caloriasDiariasEstim INT,
    observaciones TEXT,
    CodigoUnicoCentro INT NOT NULL,
    id_Nutricionista INT NOT NULL,

    CONSTRAINT PK_CodigoPlan PRIMARY KEY (CodigoPlan),

    
) ON Nutricion 
GO

exec sp_help PlanPersonalizado
go

exec sp_help PlanAlimenticio
go

exec sp_help EvaluacionFisica
go

-- Agregar claves foráneas a EvaluacionFisica
use VITALPRO
go
ALTER TABLE EvaluacionFisica
ADD CONSTRAINT FK_EvaluacionFisica_
    FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnicoCentro),
    
    CONSTRAINT FK_EvaluacionFisica_Profesional
    FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional),
    
    CONSTRAINT FK_EvaluacionFisica_Clientes
    FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion);
GO

-- Agregar claves foráneas a PlanPersonalizado
ALTER TABLE PlanPersonalizado
ADD CONSTRAINT FK_PlanPersonalizado_Rutina
    FOREIGN KEY (IdRutina) REFERENCES Rutina(IdRutina),
    
    CONSTRAINT FK_PlanPersonalizado_Clientes
    FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion),
    
    CONSTRAINT FK_PlanPersonalizado_PlanAlimenticio
    FOREIGN KEY (CodigoPlan) REFERENCES PlanAlimenticio(CodigoPlan);
GO

-- Agregar claves foráneas a PlanAlimenticio
ALTER TABLE PlanAlimenticio
ADD CONSTRAINT FK_PA_Centro
    FOREIGN KEY (CodigoUnicoCentro) REFERENCES Centro(CodigoUnicoCentro),
    
    CONSTRAINT FK_PA_Nutricionista
    FOREIGN KEY (id_Nutricionista) REFERENCES Nutricionista(id_Nutricionista);
GO


-- INSERT tabla EvaluacionFisica
use VITALPRO
go
INSERT INTO EvaluacionFisica (
    Id_EvaluacionFisica, Fecha, Peso, Estatura, GrasaCorporal,
    MasaMuscular, NivelResistencia, Flexibilidad,
    CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
)
VALUES (
    1, '2025-06-01', 70.5, 1.75, 15.2, 30.5,
    'Media', 'Buena', 1, 100, 200
)
INSERT INTO EvaluacionFisica (
    Id_EvaluacionFisica, Fecha, Peso, Estatura, GrasaCorporal, MasaMuscular,
    NivelResistencia, Flexibilidad, CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
)
VALUES (
    2, '2025-06-05', 68.0, 1.68, 18.0, 28.0,
    'Alta', 'Excelente', 1, 101, 201
)


INSERT INTO EvaluacionFisica (
    Id_EvaluacionFisica, Fecha, Peso, Estatura, GrasaCorporal, MasaMuscular,
    NivelResistencia, Flexibilidad, CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
)
VALUES (
    3, '2025-06-10', 82.3, 1.80, 22.5, 34.7,
    'Baja', 'Regular', 2, 102, 202
)


INSERT INTO EvaluacionFisica (
    Id_EvaluacionFisica, Fecha, Peso, Estatura, GrasaCorporal, MasaMuscular,
    NivelResistencia, Flexibilidad, CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
)
VALUES (
    4, '2025-06-12', 59.2, 1.60, 19.5, 26.3,
    'Media', 'Buena', 2, 103, 203
)


INSERT INTO EvaluacionFisica (
    Id_EvaluacionFisica, Fecha, Peso, Estatura, GrasaCorporal, MasaMuscular,
    NivelResistencia, Flexibilidad, CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
)
VALUES (
    5, '2025-06-15', 75.0, 1.72, 17.0, 32.0,
    'Alta', 'Excelente', 1, 100, 204
)

-- INSERT tabla PlanAlimenticio
INSERT INTO PlanAlimenticio (
    CodigoPlan, nombre, metalNutricional, caloriasDiariasEstim,
    observaciones, CodigoUnicoCentro, id_Nutricionista
)
VALUES (
    10, 'Plan Bajo en Carbohidratos', 'Reducción de peso corporal',
    1800, 'Incluir más vegetales y proteínas magras', 1, 300
)

INSERT INTO PlanAlimenticio (
    CodigoPlan, nombre, metalNutricional, caloriasDiariasEstim, observaciones,
    CodigoUnicoCentro, id_Nutricionista
)
VALUES (
    1,                                 
    'Plan bajo en carbohidratos',    
    'Reducción de grasa corporal',    
    1800,                             
    'Evitar azúcares refinados y harinas blancas.', 
    1,                                 
    300                                
)


INSERT INTO PlanAlimenticio (
    CodigoPlan, nombre, metalNutricional, caloriasDiariasEstim, observaciones,
    CodigoUnicoCentro, id_Nutricionista
)
VALUES (
    2, 
    'Plan alto en proteínas',
    'Aumento de masa muscular',
    2500,
    'Incluir suplementos de proteína y carnes magras.',
    2,
    301
)


INSERT INTO PlanAlimenticio (
    CodigoPlan, nombre, metalNutricional, caloriasDiariasEstim, observaciones,
    CodigoUnicoCentro, id_Nutricionista
)
VALUES (
    3,
    'Plan balanceado',
    'Mantenimiento del peso ideal',
    2000,
    'Distribuir 5 comidas al día con raciones moderadas.',
    1,
    300
)


INSERT INTO PlanAlimenticio (
    CodigoPlan, nombre, metalNutricional, caloriasDiariasEstim, observaciones,
    CodigoUnicoCentro, id_Nutricionista
)
VALUES (
    4,
    'Plan vegetariano',
    'Desintoxicación y control digestivo',
    1900,
    'Evitar productos de origen animal. Reforzar hierro y vitamina B12.',
    2,
    302
)



-- INSERT tabla PlanPersonalizado
INSERT INTO PlanPersonalizado (
    idPlanPersonalizado, FechaInicio, FechaFin,
    IdRutina, NumAfiliacion, CodigoPlan
)
VALUES (
    1, '2025-06-01', '2025-08-31', 400, 200, 10
)


INSERT INTO PlanPersonalizado (
    idPlanPersonalizado, FechaInicio, FechaFin, IdRutina,
    NumAfiliacion, CodigoPlan
)
VALUES (
    5,                     
    '2025-06-01',         
    '2025-07-01',         
    10,                    
    200,                   
    1                     
)
	
INSERT INTO PlanPersonalizado (
    idPlanPersonalizado, FechaInicio, FechaFin, IdRutina,
    NumAfiliacion, CodigoPlan
)
VALUES (
    2,
    '2025-06-05',
    '2025-07-05',
    11,
    201,
    2
)


INSERT INTO PlanPersonalizado (
    idPlanPersonalizado, FechaInicio, FechaFin, IdRutina,
    NumAfiliacion, CodigoPlan
)
VALUES (
    3,
    '2025-06-10',
    '2025-07-10',
    12,
    202,
    3
)


INSERT INTO PlanPersonalizado (
    idPlanPersonalizado, FechaInicio, FechaFin, IdRutina,
    NumAfiliacion, CodigoPlan
)
VALUES (
    4,
    '2025-06-12',
    '2025-07-12',
    13,
    203,
    4
)
go

-- =======================
-- ACTUALIZAR Y ELIMINAR EvaluacionFisica
-- =======================

UPDATE EvaluacionFisica
SET Peso = 72
WHERE Id_EvaluacionFisica = 1;

DELETE FROM EvaluacionFisica
WHERE Id_EvaluacionFisica = 1;

UPDATE EvaluacionFisica
SET Peso = 67.5
WHERE Id_EvaluacionFisica = 2;

DELETE FROM EvaluacionFisica
WHERE Id_EvaluacionFisica = 2;

UPDATE EvaluacionFisica
SET GrasaCorporal = 21.0
WHERE Id_EvaluacionFisica = 3;

DELETE FROM EvaluacionFisica
WHERE Id_EvaluacionFisica = 3;

UPDATE EvaluacionFisica
SET Flexibilidad = 'Excelente'
WHERE Id_EvaluacionFisica = 4;

DELETE FROM EvaluacionFisica
WHERE Id_EvaluacionFisica = 4;

UPDATE EvaluacionFisica
SET MasaMuscular = 33.0
WHERE Id_EvaluacionFisica = 5;

DELETE FROM EvaluacionFisica
WHERE Id_EvaluacionFisica = 5;

-- =======================
-- ACTUALIZAR Y ELIMINAR PlanAlimenticio
-- =======================

UPDATE PlanAlimenticio
SET caloriasDiariasEstim = 1700
WHERE CodigoPlan = 10;

DELETE FROM PlanAlimenticio
WHERE CodigoPlan = 10;

UPDATE PlanAlimenticio
SET nombre = 'Plan cetogénico'
WHERE CodigoPlan = 1;

DELETE FROM PlanAlimenticio
WHERE CodigoPlan = 1;

UPDATE PlanAlimenticio
SET observaciones = 'Agregar batidos post entrenamiento.'
WHERE CodigoPlan = 2;

DELETE FROM PlanAlimenticio
WHERE CodigoPlan = 2;

UPDATE PlanAlimenticio
SET caloriasDiariasEstim = 2100
WHERE CodigoPlan = 3;

DELETE FROM PlanAlimenticio
WHERE CodigoPlan = 3;

UPDATE PlanAlimenticio
SET observaciones = 'Incluir tofu y legumbres.'
WHERE CodigoPlan = 4;

DELETE FROM PlanAlimenticio
WHERE CodigoPlan = 4;

-- =======================
-- ACTUALIZAR Y ELIMINAR PlanPersonalizado
-- =======================

UPDATE PlanPersonalizado
SET FechaFin = '2025-09-01'
WHERE idPlanPersonalizado = 1;

DELETE FROM PlanPersonalizado
WHERE idPlanPersonalizado = 1;

UPDATE PlanPersonalizado
SET FechaFin = '2025-07-15'
WHERE idPlanPersonalizado = 5;

DELETE FROM PlanPersonalizado
WHERE idPlanPersonalizado = 5;

UPDATE PlanPersonalizado
SET IdRutina = 20
WHERE idPlanPersonalizado = 2;

DELETE FROM PlanPersonalizado
WHERE idPlanPersonalizado = 2;

UPDATE PlanPersonalizado
SET CodigoPlan = 5
WHERE idPlanPersonalizado = 3;

DELETE FROM PlanPersonalizado
WHERE idPlanPersonalizado = 3;

UPDATE PlanPersonalizado
SET FechaInicio = '2025-06-11'
WHERE idPlanPersonalizado = 4;

DELETE FROM PlanPersonalizado
WHERE idPlanPersonalizado = 4;


SELECT 
    Id_EvaluacionFisica,
    Fecha,
    Peso,
    Estatura,
    GrasaCorporal,
    MasaMuscular,
    NivelResistencia,
    Flexibilidad,
    CodigoUnicoCentro,
    CodigoProfesional,
    NumAfiliacion
FROM EvaluacionFisica


SELECT 
    idPlanPersonalizado,
    FechaInicio,
    FechaFin,
    IdRutina,
    NumAfiliacion,
    CodigoPlan
FROM PlanPersonalizado

SELECT 
    CodigoPlan,
    nombre,
    metalNutricional,
    caloriasDiariasEstim,
    observaciones,
    CodigoUnicoCentro,
    id_Nutricionista
FROM PlanAlimenticio

-- ============================================
-- Consulta 1: Evaluaciones físicas con cálculo de IMC y clasificación
-- ============================================
SELECT 
    Id_EvaluacionFisica,
    Fecha,
    Peso,
    Estatura,
    ROUND(Peso / (Estatura * Estatura), 2) AS IMC,
    CASE
        WHEN Peso / (Estatura * Estatura) < 18.5 THEN 'Bajo peso'
        WHEN Peso / (Estatura * Estatura) BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN Peso / (Estatura * Estatura) BETWEEN 25 AND 29.9 THEN 'Sobrepeso'
        ELSE 'Obesidad'
    END AS EstadoIMC,
    NivelResistencia,
    Flexibilidad,
    CodigoUnicoCentro,
    CodigoProfesional,
    NumAfiliacion
FROM EvaluacionFisica


-- ============================================
-- Consulta 2: Planes personalizados mostrando duración en días
-- ============================================
SELECT 
    idPlanPersonalizado,
    FechaInicio,
    FechaFin,
    DATEDIFF(DAY, FechaInicio, FechaFin) AS DuracionDias,
    IdRutina,
    NumAfiliacion,
    CodigoPlan
FROM PlanPersonalizado


-- ============================================
-- Consulta 3: Planes alimenticios con resumen de observaciones
-- ============================================
SELECT 
    CodigoPlan,
    nombre,
    metalNutricional,
    caloriasDiariasEstim,
    LEFT(CAST(observaciones AS VARCHAR(MAX)), 50) + 
        CASE WHEN LEN(CAST(observaciones AS VARCHAR(MAX))) > 50 THEN '...' ELSE '' END AS ObservacionResumen,
    CodigoUnicoCentro,
    id_Nutricionista
FROM PlanAlimenticio




-- ============================================
-- Consulta 4: Plan personalizado junto con nombre y calorías del plan alimenticio
-- ============================================
SELECT 
    p.idPlanPersonalizado,
    p.FechaInicio,
    p.FechaFin,
    p.IdRutina,
    p.NumAfiliacion,
    a.nombre AS NombrePlanAlimenticio,
    a.caloriasDiariasEstim
FROM PlanPersonalizado p
JOIN PlanAlimenticio a ON p.CodigoPlan = a.CodigoPlan

-- . Planes alimenticios que superan las 2000 calorías
SELECT 
    CodigoPlan,
    nombre,
    caloriasDiariasEstim,
    metalNutricional,
    observaciones
FROM PlanAlimenticio
WHERE caloriasDiariasEstim > 2000;
--Promedio de grasa corporal y masa muscular por centro
SELECT 
    CodigoUnicoCentro,
    AVG(GrasaCorporal) AS PromedioGrasaCorporal,
    AVG(MasaMuscular) AS PromedioMasaMuscular
FROM EvaluacionFisica
GROUP BY CodigoUnicoCentro;
-- 4. Cantidad de planes personalizados asignados por afiliado
SELECT 
    NumAfiliacion,
    COUNT(*) AS TotalPlanesAsignados
FROM PlanPersonalizado
GROUP BY NumAfiliacion
HAVING COUNT(*) > 1;
-- 5. Planes personalizados activos actualmente
SELECT 
    idPlanPersonalizado,
    FechaInicio,
    FechaFin,
    IdRutina,
    NumAfiliacion
FROM PlanPersonalizado
WHERE GETDATE() BETWEEN FechaInicio AND FechaFin;

 --Planes alimenticios y sus afiliados mediante relación con PlanPersonalizado
SELECT 
    p.CodigoPlan,
    p.nombre AS NombrePlan,
    pp.NumAfiliacion,
    pp.FechaInicio,
    pp.FechaFin
FROM PlanAlimenticio p
JOIN PlanPersonalizado pp ON p.CodigoPlan = pp.CodigoPlan
ORDER BY pp.NumAfiliacion, pp.FechaInicio;
