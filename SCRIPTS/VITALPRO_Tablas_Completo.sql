--USE master
--GO
--ALTER DATABASE VITALPRO SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--GO
--DROP DATABASE VITALPRO;
--GO

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

-- ==============================================
-- Script de Creación de Tablas - Proyecto VITALPRO
-- Formato estándar con PK y FK explícitas
-- ==============================================

-- CENTRO VITAL PRO

Use VITALPRO
GO
CREATE TABLE CentroVitalPro (
    CodigoUnico INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Provincia VARCHAR(50) NOT NULL,
    Canton VARCHAR(50) NOT NULL,
    Distrito VARCHAR(50) NOT NULL,
    DireccionExacta VARCHAR(100) NOT NULL,
    NumContacto VARCHAR(15) NOT NULL,
    CONSTRAINT PK_CentroVitalPro PRIMARY KEY (CodigoUnico)
)
GO

-- PROFESIONAL
CREATE TABLE Profesional (
    CodigoProfesional INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    CedProfesional VARCHAR(50) NOT NULL,
    AniosExperiencia INT NOT NULL,
    CodigoCentro INT,
    CONSTRAINT PK_Profesional PRIMARY KEY (CodigoProfesional),
    CONSTRAINT FK_Profesional_Centro FOREIGN KEY (CodigoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

-- HORARIO PROFESIONAL
CREATE TABLE HorarioProfesional (
    IdHorario INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    DiaSemana VARCHAR(10) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    CONSTRAINT PK_idHorario PRIMARY KEY (IdHorario),
    CONSTRAINT FK_HorarioProfesional_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
GO

-- ENTRENADOR
CREATE TABLE Entrenador (
    IdEntrenador INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE,
    CodigoProfesional INT NOT NULL,
    CONSTRAINT PK_Entrenador PRIMARY KEY (IdEntrenador),
    CONSTRAINT FK_Entrenador_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
GO

-- ESPECIALIDAD ENTRENADOR
CREATE TABLE Especialidad_Entrenador (
    IdEspecialidad INT NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Especialidad_Entrenador PRIMARY KEY (IdEspecialidad)
)
GO

-- ENTRENADOR_ESPECIALIDAD
CREATE TABLE Entrenador_Especialidad (
    Id INT NOT NULL,
    IdEntrenador INT NOT NULL,
    IdEspecialidad INT NOT NULL,
    CONSTRAINT PK_Entrenador_Especialidad PRIMARY KEY (Id),
    CONSTRAINT UQ_Entrenador_Especialidad UNIQUE (IdEntrenador, IdEspecialidad),
    CONSTRAINT FK_EE_Entrenador FOREIGN KEY (IdEntrenador) REFERENCES Entrenador(IdEntrenador),
    CONSTRAINT FK_EE_Especialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad_Entrenador(IdEspecialidad)
)
GO

-- NUTRICIONISTA
CREATE TABLE Nutricionista (
    IdNutricionista INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE,
    CodigoProfesional INT NOT NULL,
    CONSTRAINT PK_Nutricionista PRIMARY KEY (IdNutricionista),
    CONSTRAINT FK_Nutricionista_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional)
)
GO

-- ESPECIALIDAD NUTRICIONISTA
CREATE TABLE Especialidad_Nutricionista (
    IdEspecialidad INT NOT NULL,
    NombreEspecialidad VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Especialidad_Nutricionista PRIMARY KEY (IdEspecialidad)
)
GO

-- NUTRICIONISTA_ESPECIALIDAD
CREATE TABLE Nutricionista_Especialidad (
    Id INT NOT NULL,
    IdNutricionista INT NOT NULL,
    IdEspecialidad INT NOT NULL,
    CONSTRAINT PK_Nutricionista_Especialidad PRIMARY KEY (Id),
    CONSTRAINT UQ_Nutricionista_Especialidad UNIQUE (IdNutricionista, IdEspecialidad),
    CONSTRAINT FK_NE_Nutricionista FOREIGN KEY (IdNutricionista) REFERENCES Nutricionista(IdNutricionista),
    CONSTRAINT FK_NE_Especialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad_Nutricionista(IdEspecialidad)
)
GO



-- ==============================================
-- Script de Creación de Tablas - Proyecto VITALPRO
-- Parte 2: Clientes, Rutinas, Evaluaciones, Comidas
-- ==============================================

-- CLIENTES
CREATE TABLE Clientes (
    NumAfiliacion INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    Cedula VARCHAR(12) NOT NULL,
    Genero VARCHAR(1) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    FechaIngreso DATE NOT NULL,
    Id_Entrenador INT NOT NULL,
    CodigoPlanAlimenticio INT NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY (NumAfiliacion),
    CONSTRAINT FK_Clientes_Entrenador FOREIGN KEY (Id_Entrenador) REFERENCES Entrenador(IdEntrenador),
    CONSTRAINT FK_Clientes_Plan FOREIGN KEY (CodigoPlanAlimenticio) REFERENCES PlanAlimenticio(CodigoPlan),
    CONSTRAINT FK_Clientes_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

-- SESION
CREATE TABLE Sesion (
    Id_Sesion INT NOT NULL,
    TipoSesion VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    PersonalAsignado VARCHAR(50) NOT NULL,
    Duracion INT NOT NULL,
    Sede VARCHAR(50) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    CONSTRAINT PK_Sesion PRIMARY KEY (Id_Sesion),
    CONSTRAINT FK_Sesion_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_Sesion_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional),
    CONSTRAINT FK_Sesion_Clientes FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion)
)
GO

-- HORARIO CENTRO
CREATE TABLE HorarioCentro (
    Id_Horario INT NOT NULL,
    DiaSemana VARCHAR(20) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    CodigoUnicoCentro INT NOT NULL,
    CONSTRAINT PK_HorarioCentro PRIMARY KEY (Id_Horario),
    CONSTRAINT FK_HorarioCentro_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

-- EVALUACION FISICA
CREATE TABLE EvaluacionFisica (
    Id_EvaluacionFisica INT NOT NULL,
    Fecha DATE NOT NULL,
    Peso FLOAT NOT NULL,
    Estatura FLOAT NOT NULL,
    GrasaCorporal FLOAT NOT NULL,
    MasaMuscular FLOAT NOT NULL,
    NivelResistencia VARCHAR(20),
    Flexibilidad VARCHAR(20),
    CodigoUnicoCentro INT NOT NULL,
    CodigoProfesional INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    CONSTRAINT PK_EvaluacionFisica PRIMARY KEY (Id_EvaluacionFisica),
    CONSTRAINT FK_EF_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_EF_Profesional FOREIGN KEY (CodigoProfesional) REFERENCES Profesional(CodigoProfesional),
    CONSTRAINT FK_EF_Cliente FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion)
)
GO



-- ==============================================
-- Script de Creación de Tablas - Proyecto VITALPRO
-- Parte 3: Plan Alimenticio, Comidas, Recetas, Rutinas
-- ==============================================

-- PLAN ALIMENTICIO
CREATE TABLE PlanAlimenticio (
    CodigoPlan INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    MetalNutricional VARCHAR(100),
    CaloriasDiariasEstim INT,
    Observaciones TEXT,
    CodigoUnicoCentro INT NOT NULL,
    Id_Nutricion INT NOT NULL,
    CONSTRAINT PK_PlanAlimenticio PRIMARY KEY (CodigoPlan),
    CONSTRAINT FK_PlanAlimenticio_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_PlanAlimenticio_Nutricionista FOREIGN KEY (Id_Nutricion) REFERENCES Nutricionista(IdNutricionista)
)
GO

-- COMIDA
CREATE TABLE Comida (
    Id_Comida INT NOT NULL,
    TipoComida VARCHAR(50) NOT NULL,
    CodigoPlan INT NOT NULL,
    CONSTRAINT PK_Comida PRIMARY KEY (Id_Comida),
    CONSTRAINT FK_Comida_Plan FOREIGN KEY (CodigoPlan) REFERENCES PlanAlimenticio(CodigoPlan)
)
GO

-- COMIDA RECETA
CREATE TABLE ComidaReceta (
    Id_ComidaReceta INT NOT NULL,
    Id_Comida INT NOT NULL,
    Id_Receta INT NOT NULL,
    CONSTRAINT PK_ComidaReceta PRIMARY KEY (Id_ComidaReceta),
    CONSTRAINT FK_ComidaReceta_Comida FOREIGN KEY (Id_Comida) REFERENCES Comida(Id_Comida),
    CONSTRAINT FK_ComidaReceta_Receta FOREIGN KEY (Id_Receta) REFERENCES Receta(Id_Receta)
)
GO

-- INGREDIENTES
CREATE TABLE Ingredientes (
    Id_Ingrediente INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Unidad VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Ingredientes PRIMARY KEY (Id_Ingrediente)
)
GO

-- RECETA
CREATE TABLE Receta (
    Id_Receta INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    TiempoPreparacion INT NOT NULL,
    IdValorNutricional INT,
    CONSTRAINT PK_Receta PRIMARY KEY (Id_Receta),
    CONSTRAINT FK_Receta_ValorNutricional FOREIGN KEY (IdValorNutricional) REFERENCES ValorNutricional(IdValorNutricional)
)
GO

-- RECETA INGREDIENTE
CREATE TABLE RecetaIngrediente (
    Id_RecetaIngredientes INT NOT NULL,
    Id_Receta INT NOT NULL,
    Id_Ingrediente INT NOT NULL,
    Cantidad FLOAT NOT NULL,
    TiempoPreparacion INT NOT NULL,
    CONSTRAINT PK_RecetaIngrediente PRIMARY KEY (Id_RecetaIngredientes),
    CONSTRAINT FK_RecetaIngrediente_Receta FOREIGN KEY (Id_Receta) REFERENCES Receta(Id_Receta),
    CONSTRAINT FK_RecetaIngrediente_Ingrediente FOREIGN KEY (Id_Ingrediente) REFERENCES Ingredientes(Id_Ingrediente)
)
GO

-- VALOR NUTRICIONAL
CREATE TABLE ValorNutricional (
    IdValorNutricional INT NOT NULL IDENTITY(1,1),
    Calorias INT NOT NULL,
    Proteinas FLOAT NOT NULL,
    Carbohidratos FLOAT NOT NULL,
    CONSTRAINT PK_ValorNutricional PRIMARY KEY (IdValorNutricional)
)
GO

-- RUTINA ENTRENAMIENTO
CREATE TABLE RutinaEntrenamiento (
    Id_Rutina INT NOT NULL,
    DescripcionObjetivo VARCHAR(100) NOT NULL,
    Nivel VARCHAR(20) NOT NULL,
    DuracionTotalxSemana INT NOT NULL,
    EjerciciosXDia INT NOT NULL,
    CodigoUnicoCcentro INT NOT NULL,
    Id_Entrenador INT NOT NULL,
    CONSTRAINT PK_Rutina PRIMARY KEY (Id_Rutina),
    CONSTRAINT FK_Rutina_Centro FOREIGN KEY (CodigoUnicoCcentro) REFERENCES CentroVitalPro(CodigoUnico),
    CONSTRAINT FK_Rutina_Entrenador FOREIGN KEY (Id_Entrenador) REFERENCES Entrenador(IdEntrenador)
)
GO



-- ==============================================
-- Script de Creación de Tablas - Proyecto VITALPRO
-- Parte 4: PlanPersonalizado, RutinaSemana, RutinaEjercicio
-- ==============================================

-- PLAN PERSONALIZADO
CREATE TABLE PlanPersonalizado (
    IdPlanPersonalizado INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    IdRutina INT NOT NULL,
    NumAfiliacion INT NOT NULL,
    CodigoPlan INT NOT NULL,
    CodigoUnicoCentro INT,
    CONSTRAINT PK_PlanPersonalizado PRIMARY KEY (IdPlanPersonalizado),
    CONSTRAINT FK_PP_Rutina FOREIGN KEY (IdRutina) REFERENCES RutinaEntrenamiento(Id_Rutina),
    CONSTRAINT FK_PP_Cliente FOREIGN KEY (NumAfiliacion) REFERENCES Clientes(NumAfiliacion),
    CONSTRAINT FK_PP_Plan FOREIGN KEY (CodigoPlan) REFERENCES PlanAlimenticio(CodigoPlan),
    CONSTRAINT FK_PP_Centro FOREIGN KEY (CodigoUnicoCentro) REFERENCES CentroVitalPro(CodigoUnico)
)
GO

-- EJERCICIO
CREATE TABLE Ejercicio (
    Id_Ejercicio INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    GrupoMuscularTrabajado VARCHAR(50) NOT NULL,
    CantidadRepeticiones INT NOT NULL,
    EquipamientoEspecial BIT NOT NULL,
    CONSTRAINT PK_Ejercicio PRIMARY KEY (Id_Ejercicio)
)
GO

-- RUTINA SEMANA
CREATE TABLE RutinaSemana (
    Id_RutinaSemana INT NOT NULL,
    DiaSemana VARCHAR(10) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Id_Rutina INT NOT NULL,
    CONSTRAINT PK_RutinaSemana PRIMARY KEY (Id_RutinaSemana),
    CONSTRAINT FK_RutinaSemana_Rutina FOREIGN KEY (Id_Rutina) REFERENCES RutinaEntrenamiento(Id_Rutina)
)
GO

-- RUTINA EJERCICIO
CREATE TABLE RutinaEjercicio (
    Id_RutinaEjercicio INT NOT NULL,
    Id_Ejercicio INT NOT NULL,
    Id_RutinaSemana INT NOT NULL,
    CONSTRAINT PK_RutinaEjercicio PRIMARY KEY (Id_RutinaEjercicio),
    CONSTRAINT FK_RE_Ejercicio FOREIGN KEY (Id_Ejercicio) REFERENCES Ejercicio(Id_Ejercicio),
    CONSTRAINT FK_RE_RutinaSemana FOREIGN KEY (Id_RutinaSemana) REFERENCES RutinaSemana(Id_RutinaSemana)
)
GO


