USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarCentroVitalPro
    @Nombre VARCHAR(50),
    @Provincia VARCHAR(15),
    @Canton VARCHAR(20),
    @Distrito VARCHAR(40),
    @DireccionExacta TEXT,
    @NumContacto VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO CentroVitalPro (
        Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto
    )
    VALUES (
        @Nombre, @Provincia, @Canton, @Distrito, @DireccionExacta, @NumContacto
    );
END
GO

--EXECUTE SP_InsertarCentroVitalPro 
--    'Hojancha Vital Pro', 
--    'Guanacaste', 
--    'Hojancha', 
--    'Hojancha', 
--    '50 metros al este de la casa de Samuel', 
--    '2659-3333';
--GO

--select * from CentroVitalPro
-- procedimiento almacenado para realizar inserts de centros 1

USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarHorarioCentro
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME,
    @CodigoUnicoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM CentroVitalPro 
        WHERE CodigoUnico = @CodigoUnicoCentro AND Estado = 1
    )
    BEGIN
        INSERT INTO HorarioCentro (
            DiaSemana, HoraInicio, HoraFin, CodigoUnicoCentro
        )
        VALUES (
            @DiaSemana, @HoraInicio, @HoraFin, @CodigoUnicoCentro
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar el horario porque el centro esta deshabilitado.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarHorarioCentro 
--    'Lunes', 
--    '08:00:00', 
--    '20:00:00', 
--    4;
--GO

--select * from HorarioCentro;


-- procedimiento almacenado para crear inerts de horarios para centros 2

USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarProfesional
    @Nombre VARCHAR(30),
    @Apellido1 VARCHAR(30),
    @Apellido2 VARCHAR(30),
    @CedProfesional VARCHAR(50),
    @AniosExperiencia INT,
    @CodigoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el centro está activo
    IF EXISTS (
        SELECT 1 
        FROM CentroVitalPro 
        WHERE CodigoUnico = @CodigoCentro AND Estado = 1
    )
    BEGIN
        INSERT INTO Profesional (
            Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro
        )
        VALUES (
            @Nombre, @Apellido1, @Apellido2, @CedProfesional, @AniosExperiencia, @CodigoCentro
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar el profesional porque el centro está deshabilitado.', 16, 1);
    END
END
GO


--EXECUTE SP_InsertarProfesional 
--    'María', 
--    'Gómez', 
--    'López', 
--    '507960123', 
--    4, 
--    1;
--GO

--select * from Profesional
-- prodecimiento almacenado pra crear inserts de profesionales 3

USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarHorarioProfesional
    @CodigoProfesional INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el profesional está activo
    IF EXISTS (
        SELECT 1 
        FROM Profesional 
        WHERE CodigoProfesional = @CodigoProfesional AND Estado = 1
    )
    BEGIN
        INSERT INTO HorarioProfesional (
            CodigoProfesional, DiaSemana, HoraInicio, HoraFin
        )
        VALUES (
            @CodigoProfesional, @DiaSemana, @HoraInicio, @HoraFin
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar el horario porque el profesional está deshabilitado.', 16, 1);
    END
END
GO


--EXECUTE SP_InsertarHorarioProfesional 
--    1, 
--    'Martes', 
--    '09:00:00', 
--    '17:00:00';
--GO

--SELECT * FROM HorarioProfesional;

-- procedimiento almacenado para crear inserts de profesionales 4

USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarEntrenador
    @FechaInicio DATE,
    @FechaFinal DATE = NULL, -- permite nulo
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el profesional está activo
    IF EXISTS (
        SELECT 1 
        FROM Profesional 
        WHERE CodigoProfesional = @CodigoProfesional AND Estado = 1
    )
    BEGIN
        INSERT INTO Entrenador (
            FechaInicio, FechaFinal, CodigoProfesional
        )
        VALUES (
            @FechaInicio, @FechaFinal, @CodigoProfesional
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar el entrenador porque el profesional está deshabilitado.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarEntrenador 
--    '2023-01-01', 
--    NULL, 
--    1;
--GO

--Select * from Entrenador
--GO
-- procedimiento almacenado para crear inserts de entrenadores 5

CREATE PROCEDURE SP_InsertarEspecialidadEntrenador
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

        INSERT INTO Especialidad_Entrenador (NombreEspecialidad)
        VALUES (@NombreEspecialidad);
END
GO

--EXECUTE SP_InsertarEspecialidadEntrenador 
--    'Cardio'
--GO

--USE VITALPRO
--GO
--Select * from Especialidad_Entrenador
--GO
-- procedimiento almacenado para crear inserts de especialidades de entrenadores 6


CREATE PROCEDURE SP_InsertarEntrenadorEspecialidad
    @IdEntrenador VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar que tanto el entrenador como la especialidad estén activos
    IF EXISTS (
        SELECT 1 
        FROM Entrenador 
        WHERE IdEntrenador = @IdEntrenador AND Estado = 1
    ) AND EXISTS (
        SELECT 1 
        FROM Especialidad_Entrenador 
        WHERE IdEspecialidad = @IdEspecialidad AND Estado = 1
    )
    BEGIN
        INSERT INTO Entrenador_Especialidad (
            IdEntrenador, IdEspecialidad
        )
        VALUES (
            @IdEntrenador, @IdEspecialidad
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar porque el entrenador o la especialidad están deshabilitados.', 16, 1);
    END
END
GO


--EXECUTE SP_InsertarEntrenadorEspecialidad 
--    'E001',
--	'ES001'
--GO

--select * from Entrenador_Especialidad
-- procedimiento almacenado para crear inserts de entrenador con especialidad 7 

USE VITALPRO
GO
CREATE PROCEDURE SP_InsertarNutricionista
    @FechaInicio DATE,
    @FechaFinal DATE = NULL, -- permite nulo
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el profesional está activo
    IF EXISTS (
        SELECT 1 
        FROM Profesional 
        WHERE CodigoProfesional = @CodigoProfesional AND Estado = 1
    )
    BEGIN
        INSERT INTO Nutricionista (
            FechaInicio, FechaFinal, CodigoProfesional
        )
        VALUES (
            @FechaInicio, @FechaFinal, @CodigoProfesional
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar porque el profesional está deshabilitado.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarNutricionista 
--    '2023-01-15', 
--    NULL, 
--    1;
--GO
--SELECT * FROM Nutricionista;
--GO
-- procedimiento almacenado para crear inserts de nutricionistas 8 



CREATE PROCEDURE SP_InsertarEspecialidadNutricionista
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN
        INSERT INTO Especialidad_Nutricionista (NombreEspecialidad)
        VALUES (@NombreEspecialidad);
    END
END
GO


--EXECUTE SP_InsertarEspecialidadNutricionista 
--    'Adapatacion';
--GO
---- procedimiento almacenado para crear inserts de especialidades de nutricionistas 9

--SELECT * FROM Especialidad_Nutricionista;
--GO

USE VITALPRO
GO
CREATE PROCEDURE SP_InsertarNutricionistaEspecialidad
    @IdNutricionista VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar que ambos registros estén activos
    IF EXISTS (
        SELECT 1
        FROM Nutricionista
        WHERE IdNutricionista = @IdNutricionista AND Estado = 1
    ) AND EXISTS (
        SELECT 1
        FROM Especialidad_Nutricionista
        WHERE IdEspecialidad = @IdEspecialidad AND Estado = 1
    )
    BEGIN
        INSERT INTO Nutricionista_Especialidad (
            IdNutricionista, IdEspecialidad
        )
        VALUES (
            @IdNutricionista, @IdEspecialidad
        );
    END
    ELSE
    BEGIN
        RAISERROR('No se puede insertar porque el nutricionista o la especialidad están deshabilitados.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarNutricionistaEspecialidad 
--    'N001',
--    'SN001';

--SELECT * FROM Nutricionista_Especialidad;
--GO
-- procedimiento almacenado para crear inserts de nutricionista con especialidad 10


CREATE PROCEDURE SP_InsertarValorNutricional
    @Calorias INT,
    @Proteinas FLOAT,
    @Carbohidratos FLOAT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ValorNutricional (
        Calorias, Proteinas, Carbohidratos
    )
    VALUES (
        @Calorias, @Proteinas, @Carbohidratos
    );
END
GO

--EXECUTE SP_InsertarValorNutricional 
--    250, 
--    15.5,
--    40.0;
--GO
--SELECT * FROM ValorNutricional;
--GO
-- procedimiento almacenado para crear inserts de valores nutricionales 11
USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarReceta
    @Nombre VARCHAR(50),
    @TiempoPreparacion INT,
    @IdValorNutricional INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el IdValorNutricional exista y esté activo
    IF EXISTS (
        SELECT 1 
        FROM ValorNutricional
        WHERE IdValorNutricional = @IdValorNutricional AND Estado = 1
    )
    BEGIN
        INSERT INTO Receta (
            Nombre, TiempoPreparacion, IdValorNutricional
        )
        VALUES (
            @Nombre, @TiempoPreparacion, @IdValorNutricional
        );
    END
    ELSE
    BEGIN
        RAISERROR('El valor nutricional no existe o está inactivo.', 16, 1);
    END
END
GO

--USe VITALPRO
--GO
--EXECUTE SP_InsertarReceta 
--    'Ensalada Vegana', 
--    10, 
--    1;

--SELECT * FROM Receta;
--GO   
-- procedimiento almacenado para crear inserts de recetas 12


CREATE PROCEDURE SP_InsertarUnidadMedida
    @NombreUnidad VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO UnidadMedida (
        NombreUnidad
    )
    VALUES (
        @NombreUnidad
    );
END
GO

--EXECUTE SP_InsertarUnidadMedida 
--    'Gramos';
--GO
--SELECT * FROM UnidadMedida;
--GO
-- procedimiento almacenado para crear inserts de unidades de medida 13

CREATE PROCEDURE SP_InsertarIngrediente
    @Nombre VARCHAR(50),
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que la unidad de medida exista y esté activa
    IF EXISTS (
        SELECT 1
        FROM UnidadMedida
        WHERE Id_Unidad = @Id_Unidad AND Estado = 1
    )
    BEGIN
        INSERT INTO Ingrediente (
            Nombre, Id_Unidad
        )
        VALUES (
            @Nombre, @Id_Unidad
        );
    END
    ELSE
    BEGIN
        RAISERROR('La unidad de medida no existe o está inactiva.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarIngrediente 
--    'Pollo', 
--    'U001';
--GO
--SELECT * FROM Ingrediente;
--GO
-- procedimiento almacenado para crear inserts de ingredientes 14

CREATE PROCEDURE SP_InsertarRecetaIngrediente
    @Id_Receta INT,
    @Id_Ingrediente INT,
    @Cantidad FLOAT,
    @TiempoPreparacion INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que la receta y el ingrediente existan y estén activos
    IF EXISTS (
        SELECT 1
        FROM Receta
        WHERE Id_Receta = @Id_Receta AND Estado = 1
    ) AND EXISTS (
        SELECT 1
        FROM Ingrediente
        WHERE Id_Ingrediente = @Id_Ingrediente AND Estado = 1
    )
    BEGIN
        INSERT INTO RecetaIngrediente (
            Id_Receta, Id_Ingrediente, Cantidad, TiempoPreparacion
        )
        VALUES (
            @Id_Receta, @Id_Ingrediente, @Cantidad, @TiempoPreparacion
        );
    END
    ELSE
    BEGIN
        RAISERROR('La receta o el ingrediente no existen o están inactivos.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarRecetaIngrediente 
--    1, 
--    1, 
--    100.0, 
--    5;
--SELECT * FROM RecetaIngrediente;
--GO
-- procedimiento almacenado para crear inserts de ingredientes en recetas 15

CREATE PROCEDURE SP_InsertarPlanAlimenticio
    @Nombre VARCHAR(50),
    @MetaNutricional VARCHAR(100) = NULL,
    @CaloriasDiariasEstim INT = NULL,
    @Observaciones TEXT = NULL,
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Nutricionista
        WHERE IdNutricionista = @IdNutricionista AND Estado = 1
    )
    BEGIN
        INSERT INTO PlanAlimenticio (
            Nombre, MetaNutricional, CaloriasDiariasEstim, Observaciones, IdNutricionista
        )
        VALUES (
            @Nombre, @MetaNutricional, @CaloriasDiariasEstim, @Observaciones, @IdNutricionista
        );
    END
END
GO


--EXECUTE SP_InsertarPlanAlimenticio 
--    'Plan Vegano', 
--    'Perder peso', 
--    1500, 
--    'Plan personalizado para bajar grasa', 
--    'N001';

--SELECT * FROM PlanAlimenticio;
--GO


CREATE PROCEDURE SP_InsertarComida
    @TipoComida VARCHAR(50),
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el plan alimenticio exista y esté activo
    IF EXISTS (
        SELECT 1
        FROM PlanAlimenticio
        WHERE CodigoPlan = @CodigoPlan AND Estado = 1
    )
    BEGIN
        INSERT INTO Comida (
            TipoComida, CodigoPlan
        )
        VALUES (
            @TipoComida, @CodigoPlan
        );
    END
    ELSE
    BEGIN
        RAISERROR('El plan alimenticio no existe o está inactivo.', 16, 1);
    END
END
GO

--EXECUTE SP_InsertarComida 
--    'Desayuno', 
--    1;
--GO
--SELECT * FROM Comida;
--GO
-- procedimiento almacenado para crear inserts de comidas 16

CREATE PROCEDURE SP_InsertarComidaReceta
    @Id_Comida INT,
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar existencia y estado activo de Comida y Receta
    IF EXISTS (
        SELECT 1 
        FROM Comida 
        WHERE Id_Comida = @Id_Comida AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 
        FROM Receta 
        WHERE Id_Receta = @Id_Receta AND Estado = 1
    )
    BEGIN
        INSERT INTO ComidaReceta (
            Id_Comida, Id_Receta
        )
        VALUES (
            @Id_Comida, @Id_Receta
        );
    END
    ELSE
    BEGIN
        RAISERROR('La comida o la receta no existen o están inactivas.', 16, 1);
    END
END
GO


--EXECUTE SP_InsertarComidaReceta 
--    1, 
--    1;
--GO
--SELECT * FROM ComidaReceta;
--GO
-- procedimiento almacenado para crear inserts de recetas asociadas a comidas 17 

-- procedimiento almacenado para crear inserts de planes alimenticios 18

CREATE PROCEDURE SP_InsertarPlanAlimenticioComida
    @Id_Comida INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM PlanAlimenticio PA
        INNER JOIN Nutricionista N ON PA.IdNutricionista = N.IdNutricionista
        INNER JOIN Comida C ON C.Id_Comida = @Id_Comida
        WHERE PA.CodigoPlan = @CodigoPlan
            AND N.Estado = 1
            AND C.Estado = 1
    )
    BEGIN
        INSERT INTO PlanAlimenticio_Comida (
            Id_Comida, CodigoPlan
        )
        VALUES (
            @Id_Comida, @CodigoPlan
        );
    END
END
GO


--EXECUTE SP_InsertarPlanAlimenticioComida 
--    1, 
--    1;
--GO
--SELECT * FROM PlanAlimenticio_Comida;
--GO
-- procedimiento almacenado para crear inserts de comidas asociadas a planes alimenticios 19



CREATE PROCEDURE SP_InsertarEjercicio
    @Nombre VARCHAR(50),
    @GrupoMuscularTrabajado VARCHAR(50),
    @CantidadRepeticiones INT,
    @EquipamientoEspecial BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Ejercicio (
        Nombre, GrupoMuscularTrabajado, CantidadRepeticiones, EquipamientoEspecial
    )
    VALUES (
        @Nombre, @GrupoMuscularTrabajado, @CantidadRepeticiones, @EquipamientoEspecial
    );
END
GO

--EXECUTE SP_InsertarEjercicio 
--    'Sentadillas', 
--    'Piernas', 
--    12, 
--    0;

--SELECT * FROM Ejercicio;
--GO

---- CAMBIAR RELACION
CREATE PROCEDURE SP_InsertarRutinaEntrenamiento
    @DescripcionObjetivo VARCHAR(100),
    @Nivel VARCHAR(20),
    @DuracionTotalxSemana INT,
    @IdEntrenador VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica que el entrenador esté activo
    IF EXISTS (
        SELECT 1
        FROM Entrenador
        WHERE IdEntrenador = @IdEntrenador AND Estado = 1
    )
    BEGIN
        INSERT INTO RutinaEntrenamiento (
            DescripcionObjetivo, Nivel, DuracionTotalxSemana, IdEntrenador
        )
        VALUES (
            @DescripcionObjetivo, @Nivel, @DuracionTotalxSemana, @IdEntrenador
        );
    END
END
GO


--EXECUTE SP_InsertarRutinaEntrenamiento 
--    'Volumen', 
--    'Avanzado',
--    4, 
--    'E001';
--GO
--SELECT * FROM RutinaEntrenamiento;
--GO

-- procedimiento almacenado para crear inserts de ejercicios 20

----- CAMBIAR RELACION
CREATE PROCEDURE SP_InsertarRutinaSemana
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME,
    @Id_RutinaEntrenamiento INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica que la rutina de entrenamiento esté activa
    IF EXISTS (
        SELECT 1
        FROM RutinaEntrenamiento
        WHERE Id_Rutina = @Id_RutinaEntrenamiento AND Estado = 1
    )
    BEGIN
        INSERT INTO RutinaSemana (
            DiaSemana, HoraInicio, HoraFin, Id_RutinaEntrenamiento
        )
        VALUES (
            @DiaSemana, @HoraInicio, @HoraFin, @Id_RutinaEntrenamiento
        );
    END
END
GO

--EXECUTE SP_InsertarRutinaSemana 
--    'Martes', 
--    '08:00:00', 
--    '10:00:00',
--    1;

--SELECT * FROM RutinaSemana;
--GO
-- procedimiento almacenado para crear inserts de rutina semanal 21


CREATE PROCEDURE SP_InsertarRutinaEjercicio
    @Id_Ejercicio INT,
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM Ejercicio 
        WHERE Id_Ejercicio = @Id_Ejercicio AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 
        FROM RutinaSemana 
        WHERE Id_RutinaSemana = @Id_RutinaSemana AND Estado = 1
    )
    BEGIN
        INSERT INTO RutinaEjercicio (
            Id_Ejercicio, Id_RutinaSemana
        )
        VALUES (
            @Id_Ejercicio, @Id_RutinaSemana
        );
    END
END
GO

--EXECUTE SP_InsertarRutinaEjercicio 
--    1, 
--    1;

--SELECT * FROM RutinaEjercicio;
--GO
-- procedimiento almacenado para crear inserts de ejercicios en rutina semanal 22

-- procedimiento almacenado para crear inserts de rutinas de entrenamiento 23


CREATE PROCEDURE SP_InsertarCliente
    @Nombre VARCHAR(30),
    @Apellido1 VARCHAR(30),
    @Apellido2 VARCHAR(30),
    @Cedula VARCHAR(12),
    @Genero VARCHAR(1),
    @FechaNacimiento DATE,
    @Telefono VARCHAR(15),
    @CorreoElectronico VARCHAR(100),
    @FechaIngreso DATE,
    @IdEntrenador VARCHAR(4),
    @CodigoUnicoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM CentroVitalPro
        WHERE CodigoUnico = @CodigoUnicoCentro AND Estado = 1
    )
    AND EXISTS (
        SELECT 1
        FROM Entrenador
        WHERE IdEntrenador = @IdEntrenador AND Estado = 1
    )
    BEGIN
        INSERT INTO Clientes (
            Nombre, Apellido1, Apellido2, Cedula, Genero,
            FechaNacimiento, Telefono, CorreoElectronico, FechaIngreso,
            IdEntrenador, CodigoUnicoCentro
        )
        VALUES (
            @Nombre, @Apellido1, @Apellido2, @Cedula, @Genero,
            @FechaNacimiento, @Telefono, @CorreoElectronico, @FechaIngreso,
            @IdEntrenador, @CodigoUnicoCentro
        );
    END
END
GO


--EXECUTE SP_InsertarCliente 
--    'Juan', 
--    'Pérez', 
--    'Gomez',
--    '501230456',
--    'M',
--    '1990-05-05',
--    '8888-9999',
--    'juan@gmail.com',
--    '2024-01-01',
--    'E001',
--    1;
--GO
--SELECT * FROM Clientes;
--GO
-- procedimiento almacenado para crear inserts de clientes 24


CREATE PROCEDURE SP_InsertarPlanPersonalizado
    @FechaInicio DATE,
    @FechaFin DATE,
    @IdRutina INT,
    @NumAfiliacion INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM RutinaEntrenamiento
        WHERE Id_Rutina = @IdRutina AND Estado = 1
    )
    AND EXISTS (
        SELECT 1
        FROM Clientes
        WHERE NumAfiliacion = @NumAfiliacion AND Estado = 1
    )
    AND EXISTS (
        SELECT 1
        FROM PlanAlimenticio
        WHERE CodigoPlan = @CodigoPlan AND Estado = 1
    )
    BEGIN
        INSERT INTO PlanPersonalizado (
            FechaInicio, FechaFin, IdRutina, NumAfiliacion, CodigoPlan
        )
        VALUES (
            @FechaInicio, @FechaFin, @IdRutina, @NumAfiliacion, @CodigoPlan
        );
    END
END
GO


--EXECUTE SP_InsertarPlanPersonalizado 
--    '2024-01-01', 
--    '2024-12-31', 
--    1, 
--    1, 
--    1;
--GO
--SELECT * FROM PlanPersonalizado;
--GO
-- procedimiento almacenado para crear inserts de planes personalizados 25

CREATE PROCEDURE SP_InsertarSesion
    @TipoSesion VARCHAR(50),
    @Fecha DATE,
    @Hora TIME,
    @Duracion INT,
    @CodigoUnicoCentro INT,
    @CodigoProfesional INT,
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM CentroVitalPro
        WHERE CodigoUnico = @CodigoUnicoCentro AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 FROM Profesional
        WHERE CodigoProfesional = @CodigoProfesional AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 FROM Clientes
        WHERE NumAfiliacion = @NumAfiliacion AND Estado = 1
    )
    BEGIN
        INSERT INTO Sesion (
            TipoSesion, Fecha, Hora, Duracion,
            CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
        )
        VALUES (
            @TipoSesion, @Fecha, @Hora, @Duracion,
            @CodigoUnicoCentro, @CodigoProfesional, @NumAfiliacion
        );
    END
END
GO

--EXECUTE SP_InsertarSesion 
--    'Entrenamiento', 
--    '2024-01-15', 
--    '10:00:00', 
--    60,
--    1, 
--    1, 
--    1;
--GO

--USE VITALPRO
--SELECT * FROM Sesion;
--GO

-- procedimiento almacenado para crear inserts de sesiones 26 


CREATE PROCEDURE SP_InsertarEvaluacionFisica
    @Fecha DATE,
    @Peso FLOAT,
    @Estatura FLOAT,
    @PorcentajeGrasaCorporal FLOAT,
    @MasaMuscular FLOAT,
    @NivelResistencia VARCHAR(20) = NULL,
    @Flexibilidad VARCHAR(20) = NULL,
    @CodigoUnicoCentro INT,
    @CodigoProfesional INT,
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM CentroVitalPro
        WHERE CodigoUnico = @CodigoUnicoCentro AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 FROM Profesional
        WHERE CodigoProfesional = @CodigoProfesional AND Estado = 1
    )
    AND EXISTS (
        SELECT 1 FROM Clientes
        WHERE NumAfiliacion = @NumAfiliacion AND Estado = 1
    )
    BEGIN
        INSERT INTO EvaluacionFisica (
            Fecha, 
            Peso, 
            Estatura, 
            PorcentajeGrasaCorporal,
            MasaMuscular, 
            NivelResistencia, 
            Flexibilidad, 
            CodigoUnicoCentro,
            CodigoProfesional, 
            NumAfiliacion
        )
        VALUES (
            @Fecha, @Peso, @Estatura, @PorcentajeGrasaCorporal,
            @MasaMuscular, @NivelResistencia, @Flexibilidad,
            @CodigoUnicoCentro, @CodigoProfesional, @NumAfiliacion
        );
    END
END
GO

--EXECUTE SP_InsertarEvaluacionFisica 
--    '2024-03-10',
--    68.2,
--    1.68,
--    17.3,
--    28.5,
--    'Intermedio',
--    'Buena',
--    1,
--    1,
--    1;
--GO
---- procedimiento almacenado para crear inserts de evaluaciones físicas 27
--SELECT * FROM EvaluacionFisica;
--GO