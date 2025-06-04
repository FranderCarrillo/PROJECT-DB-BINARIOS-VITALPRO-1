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