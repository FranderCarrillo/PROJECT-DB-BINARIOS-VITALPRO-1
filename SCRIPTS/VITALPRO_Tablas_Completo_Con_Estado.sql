 --USE master
 --GO
 --ALTER DATABASE VITALPRO SET SINGLE_USER WITH ROLLBACK IMMEDIATE
 --GO
 --DROP DATABASE VITALPRO;
 --GO

USE master
GO

Create database VITALPRO
ON PRIMARY
(NAME = VITALPRO_Data,
FILENAME = 'C:\SqlData\VITALPRO_Data.mdf',
SIZE = 1300MB,
MAXSIZE = 6GB,
FILEGROWTH = 390MB
)
LOG ON
(NAME = VITALPRO_Log,
FILENAME = 'C:\SqlLog\VITALPRO_Log.ldf',
SIZE = 500MB,
MAXSIZE = 2GB, 
FILEGROWTH = 100MB
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

-- ==============================================
-- Script de Creación de Tablas - Proyecto VITALPRO (Con atributo Estado)
-- ==============================================

USE VITALPRO
GO

-- Tabla CentroVitalPro
CREATE TABLE CentroVitalPro (
    CodigoUnico INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Provincia VARCHAR(15) NOT NULL,
    Canton VARCHAR(20) NOT NULL,
    Distrito VARCHAR(40) NOT NULL,
    DireccionExacta TEXT NOT NULL,
    NumContacto VARCHAR(20) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_CentroVitalPro PRIMARY KEY (CodigoUnico)
)
GO

EXECUTE sp_help CentroVitalPro
GO

-- Tabla HorarioCentro
CREATE TABLE HorarioCentro (
    Id_Horario INT NOT NULL IDENTITY(1,1),
    DiaSemana VARCHAR(12) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_HorarioCentro PRIMARY KEY (Id_Horario),
    CONSTRAINT FK_HorarioCentro_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

EXECUTE sp_help HorarioCentro
GO

-- Tabla Profesional
CREATE TABLE Profesional (
    CodigoProfesional INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    CedProfesional VARCHAR(50) NOT NULL,
    AniosExperiencia INT NOT NULL, 
    CodigoCentro INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Profesional PRIMARY KEY (CodigoProfesional),
    CONSTRAINT FK_Profesional_Centro FOREIGN KEY (CodigoCentro) REFERENCES CentroVitalPro(CodigoUnico)
) 
GO

EXECUTE sp_help Profesional
GO

-- Tabla HorarioProfesional
CREATE TABLE HorarioProfesional (
    IdHorario INT NOT NULL IDENTITY(1,1),
    CodigoProfesional INT NOT NULL,
    DiaSemana VARCHAR(12) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_idHorario PRIMARY KEY (IdHorario),
    CONSTRAINT FK_HorarioProfesional_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
GO

EXECUTE sp_help HorarioProfesional
GO

-- Tabla Entrenador
CREATE TABLE Entrenador (
    IdEntrenador VARCHAR(4) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE,
    CodigoProfesional INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Entrenador PRIMARY KEY (IdEntrenador),
    CONSTRAINT FK_Entrenador_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
ON Entrenamiento
GO

EXECUTE sp_help Entrenador
GO

-- Tabla Especialidad_Entrenador
CREATE TABLE Especialidad_Entrenador (
    IdEspecialidad VARCHAR(5) NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Especialidad_Entrenador PRIMARY KEY (IdEspecialidad)
)
ON Entrenamiento
GO

EXECUTE sp_help Especialidad_Entrenador
GO

-- Tabla Entrenador_Especialidad
CREATE TABLE Entrenador_Especialidad (
    Id VARCHAR(5) NOT NULL,
    IdEntrenador VARCHAR(4) NOT NULL,
    IdEspecialidad VARCHAR(5) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Entrenador_Especialidad PRIMARY KEY (Id),
    CONSTRAINT UQ_Entrenador_Especialidad UNIQUE (IdEntrenador, IdEspecialidad),
    CONSTRAINT FK_EE_Entrenador FOREIGN KEY (IdEntrenador) REFERENCES Entrenador(IdEntrenador),
    CONSTRAINT FK_EE_Especialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad_Entrenador(IdEspecialidad)
)
ON Entrenamiento
GO

EXECUTE sp_help Entrenador_Especialidad
GO

-- Tabla Nutricionista
CREATE TABLE Nutricionista (
    IdNutricionista VARCHAR(4) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE,
    CodigoProfesional INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Nutricionista PRIMARY KEY (IdNutricionista),
    CONSTRAINT FK_Nutricionista_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
ON Nutricion
GO

EXECUTE sp_help Nutricionista
GO

-- Tabla Especialidad_Nutricionista
CREATE TABLE Especialidad_Nutricionista (
    IdEspecialidad VARCHAR(5) NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Especialidad_Nutricionista PRIMARY KEY (IdEspecialidad)
)
ON Nutricion
GO

EXECUTE sp_help Especialidad_Nutricionista
GO

-- Tabla Nutricionista_Especialidad
CREATE TABLE Nutricionista_Especialidad (
    Id VARCHAR(5) NOT NULL,
    IdNutricionista VARCHAR(4) NOT NULL,
    IdEspecialidad VARCHAR(5) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Nutricionista_Especialidad PRIMARY KEY (Id),
    CONSTRAINT UQ_Nutricionista_Especialidad UNIQUE (IdNutricionista, IdEspecialidad),
    CONSTRAINT FK_NE_Nutricionista FOREIGN KEY (IdNutricionista) REFERENCES Nutricionista(IdNutricionista),
    CONSTRAINT FK_NE_Especialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad_Nutricionista(IdEspecialidad)
)
ON Nutricion
GO

EXECUTE sp_help Nutricionista_Especialidad
GO

-- Tabla ValorNutricional
CREATE TABLE ValorNutricional (
    IdValorNutricional INT NOT NULL IDENTITY(1,1),
    Calorias INT NOT NULL,
    Proteinas FLOAT NOT NULL,
    Carbohidratos FLOAT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_ValorNutricional PRIMARY KEY (IdValorNutricional)
)
ON Nutricion
GO

EXECUTE sp_help ValorNutricional
GO

-- Tabla Receta
CREATE TABLE Receta (
    Id_Receta INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    TiempoPreparacion INT NOT NULL,
    IdValorNutricional INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Receta PRIMARY KEY (Id_Receta),
    CONSTRAINT FK_Receta_ValorNutricional FOREIGN KEY (IdValorNutricional) REFERENCES ValorNutricional(IdValorNutricional)
)
ON Nutricion
GO

EXECUTE sp_help Receta
GO

-- Tabla UnidadMedida
CREATE TABLE UnidadMedida (
    Id_Unidad VARCHAR(4) NOT NULL,
    NombreUnidad VARCHAR(20) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_UnidadMedida PRIMARY KEY (Id_Unidad)
)
ON Nutricion
GO

EXECUTE sp_help UnidadMedida
GO

-- Tabla Ingrediente
CREATE TABLE Ingrediente (
    Id_Ingrediente INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Id_Unidad VARCHAR(4) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Ingredientes PRIMARY KEY (Id_Ingrediente),
    CONSTRAINT FK_Ingredientes_Unidad FOREIGN KEY (Id_Unidad) REFERENCES UnidadMedida(Id_Unidad)
)
ON Nutricion
GO

EXECUTE sp_help Ingrediente
GO

-- Tabla RecetaIngrediente
CREATE TABLE RecetaIngrediente (
    Id_RecetaIngredientes INT NOT NULL IDENTITY(1,1),
    Id_Receta INT NOT NULL,
    Id_Ingrediente INT NOT NULL,
    Cantidad FLOAT NOT NULL,
    TiempoPreparacion INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_RecetaIngrediente PRIMARY KEY (Id_RecetaIngredientes),
    CONSTRAINT FK_RecetaIngrediente_Receta FOREIGN KEY (Id_Receta) REFERENCES Receta(Id_Receta),
    CONSTRAINT FK_RecetaIngrediente_Ingrediente FOREIGN KEY (Id_Ingrediente) REFERENCES Ingrediente(Id_Ingrediente)
)
ON Nutricion
GO

EXECUTE sp_help RecetaIngrediente
GO

-- Tabla Comida
CREATE TABLE Comida (
    Id_Comida INT NOT NULL IDENTITY(1,1),
    TipoComida VARCHAR(50) NOT NULL,
    CodigoPlan INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Comida PRIMARY KEY (Id_Comida)
)
ON Nutricion
GO

EXECUTE sp_help Comida
GO

-- Tabla ComidaReceta
CREATE TABLE ComidaReceta (
    Id_ComidaReceta INT NOT NULL IDENTITY(1,1),
    Id_Comida INT NOT NULL,
    Id_Receta INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_ComidaReceta PRIMARY KEY (Id_ComidaReceta),
    CONSTRAINT FK_ComidaReceta_Comida FOREIGN KEY (Id_Comida) REFERENCES Comida(Id_Comida),
    CONSTRAINT FK_ComidaReceta_Receta FOREIGN KEY (Id_Receta) REFERENCES Receta(Id_Receta)
)
ON Nutricion
GO

EXECUTE sp_help ComidaReceta
GO

-- Tabla PlanAlimenticio
CREATE TABLE PlanAlimenticio (
    CodigoPlan INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    MetaNutricional VARCHAR(100),
    CaloriasDiariasEstim INT,
    Observaciones TEXT,
    IdNutricionista VARCHAR(4) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_PlanAlimenticio PRIMARY KEY (CodigoPlan),
    CONSTRAINT FK_PlanAlimenticio_Nutricionista FOREIGN KEY (IdNutricionista) REFERENCES Nutricionista(IdNutricionista)
)
ON Nutricion
GO

EXECUTE sp_help PlanAlimenticio
GO

-- Tabla PlanAlimenticio_Comida
CREATE TABLE PlanAlimenticio_Comida(
    Id_PlanAlimenticio_Comida INT NOT NULL IDENTITY(1,1),
    Id_Comida INT NOT NULL,
    CodigoPlan INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_PlanAlimenticio_Comida PRIMARY KEY (Id_PlanAlimenticio_Comida),
    CONSTRAINT FK_PlanAlimenticioComida_Comida FOREIGN KEY (Id_Comida) REFERENCES Comida(Id_Comida),
    CONSTRAINT FK_PlanAlimenticioComida_PlanAlimenticio FOREIGN KEY (CodigoPlan) REFERENCES PlanAlimenticio(CodigoPlan)
)
ON Nutricion
GO

EXECUTE sp_help PlanAlimenticio_Comida
GO

-- Tabla Ejercicio
CREATE TABLE Ejercicio (
    Id_Ejercicio INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    GrupoMuscularTrabajado VARCHAR(50) NOT NULL,
    CantidadRepeticiones INT NOT NULL,
    EquipamientoEspecial BIT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Ejercicio PRIMARY KEY (Id_Ejercicio)
)
ON Entrenamiento
GO

EXECUTE sp_help Ejercicio
GO

-- Tabla RutinaSemana
CREATE TABLE RutinaSemana (
    Id_RutinaSemana INT NOT NULL IDENTITY(1,1),
    DiaSemana VARCHAR(12) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_RutinaSemana PRIMARY KEY (Id_RutinaSemana)
)
ON Entrenamiento
GO

EXECUTE sp_help RutinaSemana
GO

-- Tabla RutinaEjercicio
CREATE TABLE RutinaEjercicio (
    Id_RutinaEjercicio INT NOT NULL IDENTITY(1,1),
    Id_Ejercicio INT NOT NULL,
    Id_RutinaSemana INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_RutinaEjercicio PRIMARY KEY (Id_RutinaEjercicio),
    CONSTRAINT FK_RE_Ejercicio FOREIGN KEY (Id_Ejercicio) REFERENCES Ejercicio(Id_Ejercicio),
    CONSTRAINT FK_RE_RutinaSemana FOREIGN KEY (Id_RutinaSemana) REFERENCES RutinaSemana(Id_RutinaSemana)
)
ON Entrenamiento
GO
EXECUTE sp_help RutinaEjercicio
GO

-- Tabla RutinaEntrenamiento
CREATE TABLE RutinaEntrenamiento (
    Id_Rutina INT NOT NULL IDENTITY(1,1),
    DescripcionObjetivo VARCHAR(100) NOT NULL,
    Nivel VARCHAR(20) NOT NULL,
    DuracionTotalxSemana INT NOT NULL,
    EjerciciosXDia INT NOT NULL,
    IdEntrenador VARCHAR(4) NOT NULL,
    Id_RutinaSemana INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Rutina PRIMARY KEY (Id_Rutina),
    CONSTRAINT FK_Rutina_Entrenador FOREIGN KEY (IdEntrenador) REFERENCES Entrenador(IdEntrenador),
    CONSTRAINT FK_RutinaSemana_Rutina FOREIGN KEY (Id_RutinaSemana) REFERENCES RutinaSemana(Id_RutinaSemana)
)
ON Entrenamiento
GO

EXECUTE sp_help RutinaEntrenamiento
GO

-- Tabla Clientes
CREATE TABLE Clientes (
    NumAfiliacion INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    Cedula VARCHAR(12) NOT NULL,
    Genero VARCHAR(1) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    FechaIngreso DATE NOT NULL,
    IdEntrenador VARCHAR(4) NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Clientes PRIMARY KEY (NumAfiliacion),
    CONSTRAINT FK_Clientes_Entrenador FOREIGN KEY (IdEntrenador) REFERENCES Entrenador(IdEntrenador),
    CONSTRAINT FK_Clientes_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

EXECUTE sp_help Clientes
GO

-- Tabla PlanPersonalizado
CREATE TABLE PlanPersonalizado (
    IdPlanPersonalizado INT NOT NULL IDENTITY(1,1),
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    IdRutina INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    CodigoPlan INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_PlanPersonalizado PRIMARY KEY (IdPlanPersonalizado),
    CONSTRAINT FK_PP_Rutina FOREIGN KEY (IdRutina) REFERENCES RutinaEntrenamiento(Id_Rutina),
    CONSTRAINT FK_PP_Cliente FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion),
    CONSTRAINT FK_PP_Plan FOREIGN KEY (CodigoPlan) REFERENCES PlanAlimenticio(CodigoPlan)
)
GO

ExECUTE sp_help PlanPersonalizado
GO

-- Tabla Sesion
CREATE TABLE Sesion (
    Id_Sesion INT NOT NULL IDENTITY(1,1),
    TipoSesion VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Duracion INT NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    Fase VARCHAR(20) NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_Sesion PRIMARY KEY (Id_Sesion),
    CONSTRAINT FK_Sesion_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_Sesion_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional),
    CONSTRAINT FK_Sesion_Clientes FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion)
)
GO

EXECUTE sp_help Sesion
GO

-- Tabla EvaluacionFisica
CREATE TABLE EvaluacionFisica (
    Id_EvaluacionFisica INT NOT NULL IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Peso FLOAT NOT NULL,
    Estatura FLOAT NOT NULL,
    PorcentajeGrasaCorporal FLOAT NOT NULL,
    MasaMuscular FLOAT NOT NULL,
    NivelResistencia VARCHAR(20),
    Flexibilidad VARCHAR(20),
    CodigoUnicoCentro INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    Estado BIT DEFAULT 1,
    CONSTRAINT PK_EvaluacionFisica PRIMARY KEY (Id_EvaluacionFisica),
    CONSTRAINT FK_EF_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_EF_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional),
    CONSTRAINT FK_EF_Cliente FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion)
)
GO

EXECUTE sp_help EvaluacionFisica
GO
