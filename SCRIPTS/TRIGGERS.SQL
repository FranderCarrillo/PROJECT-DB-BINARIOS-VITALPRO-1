USE VITALPRO
GO

CREATE TRIGGER trg_CentroVitalPro_Insert
ON CentroVitalPro
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
    SELECT 
        Nombre,
        Provincia,
        Canton,
        Distrito,
        DireccionExacta,
        CASE 
            WHEN LEFT(NumContacto, 4) = '+506' THEN NumContacto
            ELSE '+506' + NumContacto 
        END
    FROM INSERTED;
END;
GO

CREATE TRIGGER trg_Insert_Entrenador
ON Entrenador
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(4);

    -- Obtener el �ltimo n�mero usado (el m�s alto)
    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(IdEntrenador, 2, LEN(IdEntrenador)) AS INT)), 0) + 1
    FROM Entrenador;

    -- Formatear con ceros a la izquierda (E001, E002, etc.)
    SET @FormattedId = 'E' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    -- Insertar con el nuevo IdEntrenador generado
    INSERT INTO Entrenador (IdEntrenador, FechaInicio, FechaFinal, CodigoProfesional)
    SELECT 
        @FormattedId,
        FechaInicio,
        FechaFinal,
        CodigoProfesional
    FROM INSERTED;
END;
GO

-- trigger para para asignar el consecutivo a los entreadores
CREATE TRIGGER trg_Insert_Especialidad_Entrenador
ON Especialidad_Entrenador
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(5);

    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(IdEspecialidad, 3, LEN(IdEspecialidad)) AS INT)), 0) + 1
    FROM Especialidad_Entrenador;

    SET @FormattedId = 'ES' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    INSERT INTO Especialidad_Entrenador (IdEspecialidad, NombreEspecialidad)
    SELECT 
        @FormattedId,
        NombreEspecialidad
    FROM INSERTED;
END;
GO
-- trigger para para asignar el consecutivo a la especialidad de los entreadores

CREATE TRIGGER trg_Insert_Entrenador_Especialidad
ON Entrenador_Especialidad
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(5);

    -- Obtener el número más alto después del prefijo (últimos 3 caracteres)
    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(Id, 3, 3) AS INT)), 0) + 1
    FROM Entrenador_Especialidad;

    -- Formatear el ID como EN001, EN002, etc.
    SET @FormattedId = 'EN' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    -- Insertar con el nuevo ID
    INSERT INTO Entrenador_Especialidad (Id, IdEntrenador, IdEspecialidad)
    SELECT 
        @FormattedId,
        IdEntrenador,
        IdEspecialidad
    FROM INSERTED;
END;
GO
-- trigger para para asignar el consecutivo a la tabla de entradores y sus especialidades




CREATE TRIGGER trg_Insert_Nutricionista
ON Nutricionista
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(4);

    -- Obtener el número más alto existente y sumarle 1
    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(IdNutricionista, 2, LEN(IdNutricionista)) AS INT)), 0) + 1
    FROM Nutricionista;

    -- Formatear con ceros a la izquierda (N001, N002, etc.)
    SET @FormattedId = 'N' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    -- Insertar los datos con el nuevo IdNutricionista generado
    INSERT INTO Nutricionista (IdNutricionista, FechaInicio, FechaFinal, CodigoProfesional)
    SELECT 
        @FormattedId,
        FechaInicio,
        FechaFinal,
        CodigoProfesional
    FROM INSERTED;
END;
GO

-- trigger para para asignar el consecutivo a los nutricionistas


CREATE TRIGGER trg_Insert_Especialidad_Nutricionista
ON Especialidad_Nutricionista
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(5);

    -- Obtener el número más alto basado en los últimos 3 caracteres del ID
    SELECT @NextNumber =
        ISNULL(MAX(CAST(SUBSTRING(IdEspecialidad, 3, 3) AS INT)), 0) + 1
    FROM Especialidad_Nutricionista;

    -- Generar nuevo ID con formato SN001, SN002, etc.
    SET @FormattedId = 'SN' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    -- Insertar con el nuevo ID generado
    INSERT INTO Especialidad_Nutricionista (IdEspecialidad, NombreEspecialidad)
    SELECT
        @FormattedId,
        NombreEspecialidad
    FROM INSERTED;
END;
GO

-- trigger para para asignar el consecutivo a la especialdiad de los nutricionitas


CREATE TRIGGER trg_Insert_Nutricionista_Especialidad
ON Nutricionista_Especialidad
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(5);

    -- Obtener el número más alto de ID ya insertado
    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(Id, 3, 3) AS INT)), 0) + 1
    FROM Nutricionista_Especialidad;

    -- Formatear como NS001, NS002, etc.
    SET @FormattedId = 'NS' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

    -- Insertar con el ID generado
    INSERT INTO Nutricionista_Especialidad (Id, IdNutricionista, IdEspecialidad)
    SELECT
        @FormattedId,
        IdNutricionista,
        IdEspecialidad
    FROM INSERTED;
END;
GO

-- trigger para para asignar el consecutivo a los nutricionistas con sus especialidad


CREATE TRIGGER trg_Insert_UnidadMedida
ON UnidadMedida
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextNumber INT;
    DECLARE @FormattedId VARCHAR(4);

   
    SELECT @NextNumber = 
        ISNULL(MAX(CAST(SUBSTRING(Id_Unidad, 2, LEN(Id_Unidad)) AS INT)), 0) + 1
    FROM UnidadMedida;

  
    SET @FormattedId = 'U' + RIGHT('000' + CAST(@NextNumber AS VARCHAR), 3);

   
    INSERT INTO UnidadMedida (Id_Unidad, NombreUnidad)
    SELECT 
        @FormattedId,
        NombreUnidad
    FROM INSERTED;
END;
GO

-- trigger unidad de medidad, asignar automaticamente el consecutivo
-- Se durmio a las 2:00 am, y se desperto a las 6:00 am, y no pudo dormir mas, por eso se hizo este trigger

