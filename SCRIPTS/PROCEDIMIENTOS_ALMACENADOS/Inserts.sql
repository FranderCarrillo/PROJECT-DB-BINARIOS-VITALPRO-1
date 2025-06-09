USE VITALPRO
GO

CREATE PROCEDURE InsertarCentroVitalPro
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

EXECUTE InsertarCentroVitalPro 
    'Centro Vital Pro', 
    'San José', 
    'San José', 
    'Carmen', 
    'Avenida Central, 100 metros al este de la Plaza de la Cultura', 
    '2222-3333';
GO

-- procedimiento almacenado para realizar inserts de centros 1

USE VITALPRO
GO

CREATE PROCEDURE InsertarHorarioCentro
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME,
    @CodigoUnicoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HorarioCentro (
        DiaSemana, HoraInicio, HoraFin, CodigoUnicoCentro
    )
    VALUES (
        @DiaSemana, @HoraInicio, @HoraFin, @CodigoUnicoCentro
    );
END
GO

EXECUTE InsertarHorarioCentro 
    'Lunes', 
    '08:00:00', 
    '20:00:00', 
    3;
GO

-- procedimiento almacenado para crear inerts de horarios para centros 2

USE VITALPRO
GO

CREATE PROCEDURE InsertarProfesional
    @Nombre VARCHAR(30),
    @Apellido1 VARCHAR(30),
    @Apellido2 VARCHAR(30),
    @CedProfesional VARCHAR(50),
    @AniosExperiencia INT,
    @CodigoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Profesional (
        Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro
    )
    VALUES (
        @Nombre, @Apellido1, @Apellido2, @CedProfesional, @AniosExperiencia, @CodigoCentro
    );
END
GO

EXECUTE InsertarProfesional 
    'María', 
    'Gómez', 
    'López', 
    'P987654321', 
    6, 
    3;
GO

-- prodecimiento almacenado pra crear inserts de profesionales 3

USE VITALPRO
GO

CREATE PROCEDURE InsertarHorarioProfesional
    @CodigoProfesional INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HorarioProfesional (
        CodigoProfesional, DiaSemana, HoraInicio, HoraFin
    )
    VALUES (
        @CodigoProfesional, @DiaSemana, @HoraInicio, @HoraFin
    );
END
GO

EXECUTE InsertarHorarioProfesional 
    2, 
    'Martes', 
    '09:00:00', 
    '17:00:00';
GO

SELECT * FROM HorarioProfesional;

-- procedimiento almacenado para crear inserts de profesionales 4

USE VITALPRO
GO

CREATE PROCEDURE InsertarEntrenador
    @FechaInicio DATE,
    @FechaFinal DATE = NULL, -- permite nulo
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Entrenador (
        FechaInicio, FechaFinal, CodigoProfesional
    )
    VALUES (
        @FechaInicio, @FechaFinal, @CodigoProfesional
    );
END
GO

EXECUTE InsertarEntrenador 
    '2023-01-01', 
    NULL, 
    5;
GO

-- procedimiento almacenado para crear inserts de entrenadores 5

CREATE PROCEDURE InsertarEspecialidadEntrenador
    @IdEspecialidad VARCHAR(5),
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Especialidad_Entrenador (
        IdEspecialidad, NombreEspecialidad
    )
    VALUES (
        @IdEspecialidad, @NombreEspecialidad
    );
END
GO

-- procedimiento almacenado para crear inserts de especialidades de entrenadores 6


CREATE PROCEDURE InsertarEntrenadorEspecialidad
    @Id VARCHAR(5),
    @IdEntrenador VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Entrenador_Especialidad (
        Id, IdEntrenador, IdEspecialidad
    )
    VALUES (
        @Id, @IdEntrenador, @IdEspecialidad
    );
END
GO

-- procedimiento almacenado para crear inserts de entrenador con especialidad 7 


CREATE PROCEDURE InsertarNutricionista
    @IdNutricionista VARCHAR(4),
    @FechaInicio DATE,
    @FechaFinal DATE = NULL, -- permite nulo
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Nutricionista (
        IdNutricionista, FechaInicio, FechaFinal, CodigoProfesional
    )
    VALUES (
        @IdNutricionista, @FechaInicio, @FechaFinal, @CodigoProfesional
    );
END
GO

-- procedimiento almacenado para crear inserts de nutricionistas 8 



CREATE PROCEDURE InsertarEspecialidadNutricionista
    @IdEspecialidad VARCHAR(5),
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Especialidad_Nutricionista (
        IdEspecialidad, NombreEspecialidad
    )
    VALUES (
        @IdEspecialidad, @NombreEspecialidad
    );
END
GO

-- procedimiento almacenado para crear inserts de especialidades de nutricionistas 9


CREATE PROCEDURE InsertarNutricionistaEspecialidad
    @Id VARCHAR(5),
    @IdNutricionista VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Especialidad_Nutricionista (
        Id, IdNutricionista, IdEspecialidad
    )
    VALUES (
        @Id, @IdNutricionista, @IdEspecialidad
    );
END
GO

-- procedimiento almacenado para crear inserts de nutricionista con especialidad 10


CREATE PROCEDURE InsertarValorNutricional
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

-- procedimiento almacenado para crear inserts de valores nutricionales 11



CREATE PROCEDURE InsertarReceta
    @Id_Receta INT,
    @Nombre VARCHAR(50),
    @TiempoPreparacion INT,
    @IdValorNutricional INT = NULL -- permite nulo
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Receta (
        Id_Receta, Nombre, TiempoPreparacion, IdValorNutricional
    )
    VALUES (
        @Id_Receta, @Nombre, @TiempoPreparacion, @IdValorNutricional
    );
END
GO

-- procedimiento almacenado para crear inserts de recetas 12


CREATE PROCEDURE InsertarUnidadMedida
    @Id_Unidad VARCHAR(4),
    @NombreUnidad VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO UnidadMedida (
        Id_Unidad, NombreUnidad
    )
    VALUES (
        @Id_Unidad, @NombreUnidad
    );
END
GO

-- procedimiento almacenado para crear inserts de unidades de medida 13

CREATE PROCEDURE InsertarIngrediente
    @Nombre VARCHAR(50),
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Ingrediente (
        Nombre, Id_Unidad
    )
    VALUES (
        @Nombre, @Id_Unidad
    );
END
GO

-- procedimiento almacenado para crear inserts de ingredientes 14

CREATE PROCEDURE InsertarRecetaIngrediente
    @Id_RecetaIngredientes INT,
    @Id_Receta INT,
    @Id_Ingrediente INT,
    @Cantidad FLOAT,
    @TiempoPreparacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RecetaIngrediente (
        Id_RecetaIngredientes, Id_Receta, Id_Ingrediente, Cantidad, TiempoPreparacion
    )
    VALUES (
        @Id_RecetaIngredientes, @Id_Receta, @Id_Ingrediente, @Cantidad, @TiempoPreparacion
    );
END
GO

-- procedimiento almacenado para crear inserts de ingredientes en recetas 15


CREATE PROCEDURE InsertarComida
    @Id_Comida INT,
    @TipoComida VARCHAR(50),
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Comida (
        Id_Comida, TipoComida, CodigoPlan
    )
    VALUES (
        @Id_Comida, @TipoComida, @CodigoPlan
    );
END
GO

-- procedimiento almacenado para crear inserts de comidas 16


CREATE PROCEDURE InsertarComidaReceta
    @Id_ComidaReceta INT,
    @Id_Comida INT,
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ComidaReceta (
        Id_ComidaReceta, Id_Comida, Id_Receta
    )
    VALUES (
        @Id_ComidaReceta, @Id_Comida, @Id_Receta
    );
END
GO

-- procedimiento almacenado para crear inserts de recetas asociadas a comidas 17 



CREATE PROCEDURE InsertarPlanAlimenticio
    @CodigoPlan INT,
    @Nombre VARCHAR(50),
    @MetaNutricional VARCHAR(100) = NULL,
    @CaloriasDiariasEstim INT = NULL,
    @Observaciones TEXT = NULL,
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PlanAlimenticio (
        CodigoPlan, Nombre, MetaNutricional, CaloriasDiariasEstim, Observaciones, IdNutricionista
    )
    VALUES (
        @CodigoPlan, @Nombre, @MetaNutricional, @CaloriasDiariasEstim, @Observaciones, @IdNutricionista
    );
END
GO

-- procedimiento almacenado para crear inserts de planes alimenticios 18



CREATE PROCEDURE InsertarPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida INT,
    @Id_Comida INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PlanAlimenticio_Comida (
        Id_PlanAlimenticio_Comida, Id_Comida, CodigoPlan
    )
    VALUES (
        @Id_PlanAlimenticio_Comida, @Id_Comida, @CodigoPlan
    );
END
GO

-- procedimiento almacenado para crear inserts de comidas asociadas a planes alimenticios 19



CREATE PROCEDURE InsertarEjercicio
    @Id_Ejercicio INT,
    @Nombre VARCHAR(50),
    @GrupoMuscularTrabajado VARCHAR(50),
    @CantidadRepeticiones INT,
    @EquipamientoEspecial BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Ejercicio (
        Id_Ejercicio, Nombre, GrupoMuscularTrabajado, CantidadRepeticiones, EquipamientoEspecial
    )
    VALUES (
        @Id_Ejercicio, @Nombre, @GrupoMuscularTrabajado, @CantidadRepeticiones, @EquipamientoEspecial
    );
END
GO

-- procedimiento almacenado para crear inserts de ejercicios 20


CREATE PROCEDURE InsertarRutinaSemana
    @Id_RutinaSemana INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RutinaSemana (
        Id_RutinaSemana, DiaSemana, HoraInicio, HoraFin
    )
    VALUES (
        @Id_RutinaSemana, @DiaSemana, @HoraInicio, @HoraFin
    );
END
GO

-- procedimiento almacenado para crear inserts de rutina semanal 21


CREATE PROCEDURE InsertarRutinaEjercicio
    @Id_RutinaEjercicio INT,
    @Id_Ejercicio INT,
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RutinaEjercicio (
        Id_RutinaEjercicio, Id_Ejercicio, Id_RutinaSemana
    )
    VALUES (
        @Id_RutinaEjercicio, @Id_Ejercicio, @Id_RutinaSemana
    );
END
GO

-- procedimiento almacenado para crear inserts de ejercicios en rutina semanal 22


CREATE PROCEDURE InsertarRutinaEntrenamiento
    @Id_Rutina INT,
    @DescripcionObjetivo VARCHAR(100),
    @Nivel VARCHAR(20),
    @DuracionTotalxSemana INT,
    @EjerciciosXDia INT,
    @IdEntrenador VARCHAR(4),
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RutinaEntrenamiento (
        Id_Rutina, DescripcionObjetivo, Nivel, DuracionTotalxSemana, EjerciciosXDia, IdEntrenador, Id_RutinaSemana
    )
    VALUES (
        @Id_Rutina, @DescripcionObjetivo, @Nivel, @DuracionTotalxSemana, @EjerciciosXDia, @IdEntrenador, @Id_RutinaSemana
    );
END
GO

-- procedimiento almacenado para crear inserts de rutinas de entrenamiento 23


CREATE PROCEDURE InsertarCliente
    @NumAfiliacion INT,
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

    INSERT INTO Clientes (
        NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero,
        FechaNacimiento, Telefono, CorreoElectronico, FechaIngreso,
        IdEntrenador, CodigoUnicoCentro
    )
    VALUES (
        @NumAfiliacion, @Nombre, @Apellido1, @Apellido2, @Cedula, @Genero,
        @FechaNacimiento, @Telefono, @CorreoElectronico, @FechaIngreso,
        @IdEntrenador, @CodigoUnicoCentro
    );
END
GO

-- procedimiento almacenado para crear inserts de clientes 24


CREATE PROCEDURE InsertarPlanPersonalizado
    @IdPlanPersonalizado INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @IdRutina INT,
    @NumAfiliacion INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PlanPersonalizado (
        IdPlanPersonalizado, FechaInicio, FechaFin, IdRutina, NumAfiliacion, CodigoPlan
    )
    VALUES (
        @IdPlanPersonalizado, @FechaInicio, @FechaFin, @IdRutina, @NumAfiliacion, @CodigoPlan
    );
END
GO

-- procedimiento almacenado para crear inserts de planes personalizados 25


CREATE PROCEDURE InsertarSesion
    @Id_Sesion INT,
    @TipoSesion VARCHAR(50),
    @Fecha DATE,
    @Hora TIME,
    @PersonalAsignado VARCHAR(50),
    @Duracion INT,
    @Sede VARCHAR(50),
    @Estado VARCHAR(20),
    @CodigoUnicoCentro INT,
    @CodigoProfesional INT,
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Sesion (
        Id_Sesion, TipoSesion, Fecha, Hora, PersonalAsignado, Duracion,
        Sede, Estado, CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
    )
    VALUES (
        @Id_Sesion, @TipoSesion, @Fecha, @Hora, @PersonalAsignado, @Duracion,
        @Sede, @Estado, @CodigoUnicoCentro, @CodigoProfesional, @NumAfiliacion
    );
END
GO

-- procedimiento almacenado para crear inserts de sesiones 26 


CREATE PROCEDURE InsertarEvaluacionFisica
    @Id_EvaluacionFisica INT,
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

    INSERT INTO EvaluacionFisica (
        Id_EvaluacionFisica, Fecha, Peso, Estatura, PorcentajeGrasaCorporal,
        MasaMuscular, NivelResistencia, Flexibilidad, CodigoUnicoCentro,
        CodigoProfesional, NumAfiliacion
    )
    VALUES (
        @Id_EvaluacionFisica, @Fecha, @Peso, @Estatura, @PorcentajeGrasaCorporal,
        @MasaMuscular, @NivelResistencia, @Flexibilidad, @CodigoUnicoCentro,
        @CodigoProfesional, @NumAfiliacion
    );
END
GO

-- procedimiento almacenado para crear inserts de evaluaciones físicas 27
