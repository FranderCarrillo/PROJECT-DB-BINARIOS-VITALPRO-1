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

    -- Obtener el último número usado (el más alto)
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
