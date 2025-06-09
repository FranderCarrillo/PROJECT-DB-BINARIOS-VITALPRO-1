use VITALPRO
go
CREATE TABLE Auditoria_Clientes (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    NumAfiliacion INT,
    Nombre VARCHAR(30),
    Apellido1 VARCHAR(30),
    Apellido2 VARCHAR(30),
    Cedula VARCHAR(12),
    Genero VARCHAR(1),
    FechaNacimiento DATE,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    FechaIngreso DATE,
    IdEntrenador VARCHAR(4),
    CodigoUnicoCentro INT
)

CREATE TABLE Auditoria_Profesional (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdProfesional INT,
    Nombre VARCHAR(30),
    Apellido1 VARCHAR(30),
    Apellido2 VARCHAR(30),
    CedProfesional VARCHAR(50),
    AniosExperiencia INT,
    CodigoCentro INT
)
GO

CREATE TABLE Auditoria_Entrenador (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdEntrenador VARCHAR(4),
    FechaInicio DATE,
    FechaFinal DATE,
    CodigoProfesional INT
)
GO

CREATE TABLE Auditoria_Nutricionista (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdNutricionista VARCHAR(4),
    CodigoNutricionista VARCHAR(30),
    IdProfesional VARCHAR(4)
)

CREATE TABLE Auditoria_PlanAlimenticio (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdPlanAlimenticio INT,
    Descripcion TEXT,
    IdNutricionista VARCHAR(4)
)

-----------------------------------------

CREATE TABLE Auditoria_PlanPersonalizado (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdPlanPersonalizado INT,
    FechaInicio DATE,
    FechaFin DATE,
    IdRutina INT,
    NumAfiliacion INT,
    CodigoPlan INT
)
GO

CREATE TABLE Auditoria_RutinaEntrenamiento (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    IdRutina INT,
    DescripcionObjetivo VARCHAR(100),
    Nivel VARCHAR(20),
    DuracionTotalxSemana INT,
    EjerciciosXDia INT,
    IdEntrenador VARCHAR(4),
    Id_RutinaSemana INT
)
GO

CREATE TABLE Auditoria_Receta (
    Id_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    Usuario VARCHAR(100),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    Id_Receta INT,
    Nombre VARCHAR(50),
    TiempoPreparacion INT,
    IdValorNutricional INT
)
GO

USE VITALPRO
GO
CREATE OR ALTER TRIGGER trg_Auditoria_Clientes
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert y Update (usando inserted)
    INSERT INTO Auditoria_Clientes (
        Operacion, Usuario, NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero, FechaNacimiento, 
        Telefono, CorreoElectronico, FechaIngreso, IdEntrenador, CodigoUnicoCentro)
    SELECT 
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) THEN 'UPDATE'
        END,
        SYSTEM_USER,
        NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero, FechaNacimiento,
        Telefono, CorreoElectronico, FechaIngreso, IdEntrenador, CodigoUnicoCentro

		--NumAfiliacion INT NOT NULL,
	  --  Nombre VARCHAR(30) NOT NULL,
	  --  Apellido1 VARCHAR(30) NOT NULL,
	  --  Apellido2 VARCHAR(30) NOT NULL,
	  --  Cedula VARCHAR(12) NOT NULL,
	  --  Genero VARCHAR(1) NOT NULL,
	  --  FechaNacimiento DATE NOT NULL,
	  --  Telefono VARCHAR(15) NOT NULL,
	  --  CorreoElectronico VARCHAR(100) NOT NULL,
	  --  FechaIngreso DATE NOT NULL,
	  --  IdEntrenador VARCHAR(4) NOT NULL,
	  --  CodigoUnicoCentro INT NOT NULL,

    FROM inserted
    WHERE EXISTS(SELECT * FROM inserted);

    -- Delete (usando deleted)
    INSERT INTO Auditoria_Clientes (
        Operacion, Usuario, NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero, FechaNacimiento, 
        Telefono, CorreoElectronico, FechaIngreso, IdEntrenador, CodigoUnicoCentro)
    SELECT
        'DELETE',
        SYSTEM_USER,
        NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero, FechaNacimiento,
        Telefono, CorreoElectronico, FechaIngreso, IdEntrenador, CodigoUnicoCentro
    FROM deleted;
END
GO

CREATE OR ALTER TRIGGER trg_Auditoria_Profesional
ON Profesional
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT y UPDATE
    INSERT INTO Auditoria_Profesional (
        Operacion, Usuario, FechaOperacion, IdProfesional, Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro
    )
    SELECT 
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            ELSE 'UPDATE'
        END,
        SYSTEM_USER,
        GETDATE(),
        CodigoProfesional,
        Nombre,
        Apellido1,
        Apellido2,
        CedProfesional,
        AniosExperiencia,
        CodigoCentro
    FROM inserted;

    -- DELETE
    INSERT INTO Auditoria_Profesional (
        Operacion, Usuario, FechaOperacion, IdProfesional, Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro
    )
    SELECT
        'DELETE',
        SYSTEM_USER,
        GETDATE(),
        CodigoProfesional,
        Nombre,
        Apellido1,
        Apellido2,
        CedProfesional,
        AniosExperiencia,
        CodigoCentro
    FROM deleted;
END
GO



-- 3. Auditoría Entrenador
CREATE OR ALTER TRIGGER trg_Auditoria_Entrenador
ON Entrenador
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT y UPDATE
    INSERT INTO Auditoria_Entrenador (
        Operacion, Usuario, FechaOperacion, IdEntrenador, FechaInicio, FechaFinal, CodigoProfesional
    )
    SELECT 
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            ELSE 'UPDATE'
        END,
        SYSTEM_USER,
        GETDATE(),
        IdEntrenador,
        FechaInicio,
        FechaFinal,
        CodigoProfesional
    FROM inserted;

    -- DELETE
    INSERT INTO Auditoria_Entrenador (
        Operacion, Usuario, FechaOperacion, IdEntrenador, FechaInicio, FechaFinal, CodigoProfesional
    )
    SELECT
        'DELETE',
        SYSTEM_USER,
        GETDATE(),
        IdEntrenador,
        FechaInicio,
        FechaFinal,
        CodigoProfesional
    FROM deleted;
END
GO


-- 4. Auditoría Nutricionista
CREATE OR ALTER TRIGGER trg_Auditoria_Nutricionista
ON Nutricionista
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert y Update
    INSERT INTO Auditoria_Nutricionista (
        Operacion, Usuario, IdNutricionista, CodigoNutricionista, IdProfesional)
    SELECT 
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) THEN 'UPDATE'
        END,
        SYSTEM_USER,
        IdNutricionista, IdNutricionista, CodigoProfesional
    FROM inserted
    WHERE EXISTS(SELECT * FROM inserted);

    -- Delete
    INSERT INTO Auditoria_Nutricionista (
        Operacion, Usuario, IdNutricionista, CodigoNutricionista, IdProfesional)
    SELECT
        'DELETE',
        SYSTEM_USER,
        IdNutricionista, IdNutricionista, CodigoProfesional
    FROM deleted;
END
GO


-- 5. Auditoría PlanAlimenticio
CREATE OR ALTER TRIGGER trg_Auditoria_PlanAlimenticio
ON PlanAlimenticio
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert y Update
    INSERT INTO Auditoria_PlanAlimenticio (
        Operacion, Usuario, IdPlanAlimenticio, Descripcion, IdNutricionista)
    SELECT
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) THEN 'UPDATE'
        END,
        SYSTEM_USER,
        CodigoPlan, Nombre, IdNutricionista
    FROM inserted
    WHERE EXISTS(SELECT * FROM inserted);

    -- Delete
    INSERT INTO Auditoria_PlanAlimenticio (
        Operacion, Usuario, IdPlanAlimenticio, Descripcion, IdNutricionista)
    SELECT
        'DELETE',
        SYSTEM_USER,
        CodigoPlan, Nombre, IdNutricionista
    FROM deleted;
END
GO


-- 6. Auditoría PlanPersonalizado
CREATE OR ALTER TRIGGER trg_Auditoria_PlanPersonalizado
ON PlanPersonalizado
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT y UPDATE
    INSERT INTO Auditoria_PlanPersonalizado (
        Operacion, Usuario, FechaOperacion, IdPlanPersonalizado, FechaInicio, FechaFin, IdRutina, NumAfiliacion, CodigoPlan
    )
    SELECT
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            ELSE 'UPDATE'
        END,
        SYSTEM_USER,
        GETDATE(),
        IdPlanPersonalizado,
        FechaInicio,
        FechaFin,
        IdRutina,
        NumAfiliacion,
        CodigoPlan
    FROM inserted;

    -- DELETE
    INSERT INTO Auditoria_PlanPersonalizado (
        Operacion, Usuario, FechaOperacion, IdPlanPersonalizado, FechaInicio, FechaFin, IdRutina, NumAfiliacion, CodigoPlan
    )
    SELECT
        'DELETE',
        SYSTEM_USER,
        GETDATE(),
        IdPlanPersonalizado,
        FechaInicio,
        FechaFin,
        IdRutina,
        NumAfiliacion,
        CodigoPlan
    FROM deleted;
END
GO

-- 7. Auditoría RutinaEntrenamiento
CREATE OR ALTER TRIGGER trg_Auditoria_RutinaEntrenamiento
ON RutinaEntrenamiento
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT y UPDATE
    INSERT INTO Auditoria_RutinaEntrenamiento (
        Operacion, Usuario, FechaOperacion, IdRutina, DescripcionObjetivo, Nivel, DuracionTotalxSemana, 
        EjerciciosXDia, IdEntrenador, Id_RutinaSemana
    )
    SELECT
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            ELSE 'UPDATE'
        END,
        SYSTEM_USER,
        GETDATE(),
        Id_Rutina,
        DescripcionObjetivo,
        Nivel,
        DuracionTotalxSemana,
        EjerciciosXDia,
        IdEntrenador,
        Id_RutinaSemana
    FROM inserted;

    -- DELETE
    INSERT INTO Auditoria_RutinaEntrenamiento (
        Operacion, Usuario, FechaOperacion, IdRutina, DescripcionObjetivo, Nivel, DuracionTotalxSemana, 
        EjerciciosXDia, IdEntrenador, Id_RutinaSemana
    )
    SELECT
        'DELETE',
        SYSTEM_USER,
        GETDATE(),
        Id_Rutina,
        DescripcionObjetivo,
        Nivel,
        DuracionTotalxSemana,
        EjerciciosXDia,
        IdEntrenador,
        Id_RutinaSemana
    FROM deleted;
END
GO


-- 8. Auditoría Receta
CREATE OR ALTER TRIGGER trg_Auditoria_Receta
ON Receta
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT y UPDATE
    INSERT INTO Auditoria_Receta (
        Operacion, Usuario, FechaOperacion, Id_Receta, Nombre, TiempoPreparacion, IdValorNutricional
    )
    SELECT
        CASE 
            WHEN EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) THEN 'INSERT'
            ELSE 'UPDATE'
        END,
        SYSTEM_USER,
        GETDATE(),
        Id_Receta,
        Nombre,
        TiempoPreparacion,
        IdValorNutricional
    FROM inserted;

    -- DELETE
    INSERT INTO Auditoria_Receta (
        Operacion, Usuario, FechaOperacion, Id_Receta, Nombre, TiempoPreparacion, IdValorNutricional
    )
    SELECT
        'DELETE',
        SYSTEM_USER,
        GETDATE(),
        Id_Receta,
        Nombre,
        TiempoPreparacion,
        IdValorNutricional
    FROM deleted;
END
GO
