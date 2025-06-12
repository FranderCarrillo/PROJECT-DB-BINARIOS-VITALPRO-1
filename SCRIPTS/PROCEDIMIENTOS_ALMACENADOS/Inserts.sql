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

EXECUTE SP_InsertarCentroVitalPro 
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

CREATE PROCEDURE SP_InsertarHorarioCentro
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

EXECUTE SP_InsertarHorarioCentro 
    'Lunes', 
    '08:00:00', 
    '20:00:00', 
    1;
GO

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

    INSERT INTO Profesional (
        Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro
    )
    VALUES (
        @Nombre, @Apellido1, @Apellido2, @CedProfesional, @AniosExperiencia, @CodigoCentro
    );
END
GO

EXECUTE SP_InsertarProfesional 
    'María', 
    'Gómez', 
    'López', 
    'P987654321', 
    4, 
    1;
GO

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

    INSERT INTO HorarioProfesional (
        CodigoProfesional, DiaSemana, HoraInicio, HoraFin
    )
    VALUES (
        @CodigoProfesional, @DiaSemana, @HoraInicio, @HoraFin
    );
END
GO

EXECUTE SP_InsertarHorarioProfesional 
    1, 
    'Martes', 
    '09:00:00', 
    '17:00:00';
GO

SELECT * FROM HorarioProfesional;

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

    INSERT INTO Entrenador (
        FechaInicio, FechaFinal, CodigoProfesional
    )
    VALUES (
        @FechaInicio, @FechaFinal, @CodigoProfesional
    );
END
GO

EXECUTE SP_InsertarEntrenador 
    '2023-01-01', 
    NULL, 
    1;
GO

Select * from Entrenador
GO
-- procedimiento almacenado para crear inserts de entrenadores 5

CREATE PROCEDURE SP_InsertarEspecialidadEntrenador
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (
        SELECT 1 
        FROM Especialidad_Entrenador 
        WHERE NombreEspecialidad = @NombreEspecialidad
    )
        INSERT INTO Especialidad_Entrenador (NombreEspecialidad)
        VALUES (@NombreEspecialidad);
END
GO

EXECUTE SP_InsertarEspecialidadEntrenador 
    'Cardio'
GO

USE VITALPRO
GO
Select * from Especialidad_Entrenador
GO
-- procedimiento almacenado para crear inserts de especialidades de entrenadores 6


CREATE PROCEDURE SP_InsertarEntrenadorEspecialidad
    @IdEntrenador VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Entrenador_Especialidad (
        IdEntrenador, IdEspecialidad
    )
    VALUES (
        @IdEntrenador, @IdEspecialidad
    );
END
GO

EXECUTE SP_InsertarEntrenadorEspecialidad 
    'E001',
	'ES001'
GO

select * from Entrenador_Especialidad
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

    INSERT INTO Nutricionista (
        FechaInicio, FechaFinal, CodigoProfesional
    )
    VALUES (
        @FechaInicio, @FechaFinal, @CodigoProfesional
    );
END
GO


EXECUTE SP_InsertarNutricionista 
    '2023-01-15', 
    NULL, 
    1;
GO
SELECT * FROM Nutricionista;
GO
-- procedimiento almacenado para crear inserts de nutricionistas 8 



CREATE PROCEDURE SP_InsertarEspecialidadNutricionista
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (
        SELECT 1 
        FROM Especialidad_Nutricionista 
        WHERE NombreEspecialidad = @NombreEspecialidad
    )
    BEGIN
        INSERT INTO Especialidad_Nutricionista (NombreEspecialidad)
        VALUES (@NombreEspecialidad);
    END
END
GO


EXECUTE SP_InsertarEspecialidadNutricionista 
    'Adapatacion';
GO
-- procedimiento almacenado para crear inserts de especialidades de nutricionistas 9

SELECT * FROM Especialidad_Nutricionista;
GO

CREATE PROCEDURE SP_InsertarNutricionistaEspecialidad
    @IdNutricionista VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Nutricionista_Especialidad (
        IdNutricionista, IdEspecialidad
    )
    VALUES (
        @IdNutricionista, @IdEspecialidad
    );
END
GO

EXECUTE SP_InsertarNutricionistaEspecialidad 
    'N001',
    'SN001';

SELECT * FROM Nutricionista_Especialidad;
GO
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

EXECUTE SP_InsertarValorNutricional 
    300, 
    15.5, 
    40.0;
GO
SELECT * FROM ValorNutricional;
GO
-- procedimiento almacenado para crear inserts de valores nutricionales 11
USE VITALPRO
GO

CREATE PROCEDURE SP_InsertarReceta
    @Nombre VARCHAR(50),
    @TiempoPreparacion INT,
    @IdValorNutricional INT -- permite nulo
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Receta (
        Nombre, TiempoPreparacion, IdValorNutricional
    )
    VALUES (
        @Nombre, @TiempoPreparacion, @IdValorNutricional
    );
END
GO

EXECUTE SP_InsertarReceta 
    'Ensalada Vegana', 
    10, 
    1;

SELECT * FROM Receta;
GO   
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

EXECUTE SP_InsertarUnidadMedida 
    'Gramos';
GO
SELECT * FROM UnidadMedida;
GO
-- procedimiento almacenado para crear inserts de unidades de medida 13

CREATE PROCEDURE SP_InsertarIngrediente
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

EXECUTE SP_InsertarIngrediente 
    'Pollo', 
    'U001';
GO
SELECT * FROM Ingrediente;
GO
-- procedimiento almacenado para crear inserts de ingredientes 14

CREATE PROCEDURE SP_InsertarRecetaIngrediente
    @Id_Receta INT,
    @Id_Ingrediente INT,
    @Cantidad FLOAT,
    @TiempoPreparacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RecetaIngrediente (
        Id_Receta, Id_Ingrediente, Cantidad, TiempoPreparacion
    )
    VALUES (
        @Id_Receta, @Id_Ingrediente, @Cantidad, @TiempoPreparacion
    );
END
GO

EXECUTE SP_InsertarRecetaIngrediente 
    1, 
    1, 
    100.0, 
    5;
SELECT * FROM RecetaIngrediente;
GO
-- procedimiento almacenado para crear inserts de ingredientes en recetas 15


CREATE PROCEDURE SP_InsertarComida
    @TipoComida VARCHAR(50),
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Comida (
        TipoComida, CodigoPlan
    )
    VALUES (
        @TipoComida, @CodigoPlan
    );
END
GO

EXECUTE SP_InsertarComida 
    'Almuerzo', 
    1;
SELECT * FROM Comida;
GO
-- procedimiento almacenado para crear inserts de comidas 16

CREATE PROCEDURE SP_InsertarComidaReceta
    @Id_Comida INT,
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ComidaReceta (
        Id_Comida, Id_Receta
    )
    VALUES (
        @Id_Comida, @Id_Receta
    );
END
GO

EXECUTE SP_InsertarComidaReceta 
    1, 
    1;

SELECT * FROM ComidaReceta;
GO
-- procedimiento almacenado para crear inserts de recetas asociadas a comidas 17 

CREATE PROCEDURE SP_InsertarPlanAlimenticio
    @Nombre VARCHAR(50),
    @MetaNutricional VARCHAR(100) = NULL,
    @CaloriasDiariasEstim INT = NULL,
    @Observaciones TEXT = NULL,
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PlanAlimenticio (
        Nombre, MetaNutricional, CaloriasDiariasEstim, Observaciones, IdNutricionista
    )
    VALUES (
        @Nombre, @MetaNutricional, @CaloriasDiariasEstim, @Observaciones, @IdNutricionista
    );
END
GO

EXECUTE SP_InsertarPlanAlimenticio 
    'Plan Vegano', 
    'Perder peso', 
    1500, 
    'Plan personalizado para bajar grasa', 
    'N001';

SELECT * FROM PlanAlimenticio;
GO

-- procedimiento almacenado para crear inserts de planes alimenticios 18

CREATE PROCEDURE SP_InsertarPlanAlimenticioComida
    @Id_Comida INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PlanAlimenticio_Comida (
        Id_Comida, CodigoPlan
    )
    VALUES (
        @Id_Comida, @CodigoPlan
    );
END
GO

EXECUTE SP_InsertarPlanAlimenticioComida 
    1, 
    1;

SELECT * FROM PlanAlimenticio_Comida;
GO
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

EXECUTE SP_InsertarEjercicio 
    'Sentadillas', 
    'Piernas', 
    12, 
    0;

SELECT * FROM Ejercicio;
GO
-- procedimiento almacenado para crear inserts de ejercicios 20


CREATE PROCEDURE SP_InsertarRutinaSemana
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RutinaSemana (
        DiaSemana, HoraInicio, HoraFin
    )
    VALUES (
        @DiaSemana, @HoraInicio, @HoraFin
    );
END
GO

EXECUTE SP_InsertarRutinaSemana 
    'Lunes', 
    '08:00:00', 
    '10:00:00';

SELECT * FROM RutinaSemana;
GO
-- procedimiento almacenado para crear inserts de rutina semanal 21


CREATE PROCEDURE SP_InsertarRutinaEjercicio
    @Id_Ejercicio INT,
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RutinaEjercicio (
        Id_Ejercicio, Id_RutinaSemana
    )
    VALUES (
        @Id_Ejercicio, @Id_RutinaSemana
    );
END
GO

EXECUTE SP_InsertarRutinaEjercicio 
    1, 
    1;

SELECT * FROM RutinaEjercicio;
GO
-- procedimiento almacenado para crear inserts de ejercicios en rutina semanal 22


CREATE PROCEDURE SP_InsertarRutinaEntrenamiento
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
        DescripcionObjetivo, Nivel, DuracionTotalxSemana, EjerciciosXDia, IdEntrenador, Id_RutinaSemana
    )
    VALUES (
        @DescripcionObjetivo, @Nivel, @DuracionTotalxSemana, @EjerciciosXDia, @IdEntrenador, @Id_RutinaSemana
    );
END
GO

EXECUTE SP_InsertarRutinaEntrenamiento 
    'Bajar grasa corporal', 
    'Intermedio', 
    5, 
    4, 
    'E001', 
    1;

SELECT * FROM RutinaEntrenamiento;
GO
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
GO

EXECUTE SP_InsertarCliente 
    'Juan', 
    'Pérez', 
    'Gomez',
    '501230456',
    'M',
    '1990-05-05',
    '8888-9999',
    'juan@gmail.com',
    '2024-01-01',
    'E001',
    1;

SELECT * FROM Clientes;
GO
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

    INSERT INTO PlanPersonalizado (
        FechaInicio, FechaFin, IdRutina, NumAfiliacion, CodigoPlan
    )
    VALUES (
        @FechaInicio, @FechaFin, @IdRutina, @NumAfiliacion, @CodigoPlan
    );
END
GO

EXECUTE SP_InsertarPlanPersonalizado 
    '2024-01-01', 
    '2024-12-31', 
    1, 
    1, 
    1;

SELECT * FROM PlanPersonalizado;
GO
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

    INSERT INTO Sesion (
        TipoSesion, Fecha, Hora, Duracion,
        CodigoUnicoCentro, CodigoProfesional, NumAfiliacion
    )
    VALUES (
        @TipoSesion, @Fecha, @Hora, @Duracion,
        @CodigoUnicoCentro, @CodigoProfesional, @NumAfiliacion
    );
END
GO

EXECUTE SP_InsertarSesion 
    'Entrenamiento Personalizado', 
    '2024-01-15', 
    '10:00:00', 
    60,
    1, 
    1, 
    1;
GO

USE VITALPRO
SELECT * FROM Sesion;
GO
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

    INSERT INTO EvaluacionFisica (
        Fecha, 
		Peso, 
		Estatura, 
		PorcentajeGrasaCorporal,
        MasaMuscular, 
		NivelResistencia, Flexibilidad, CodigoUnicoCentro,
        CodigoProfesional, NumAfiliacion
    )
    VALUES (
        @Fecha, @Peso, @Estatura, @PorcentajeGrasaCorporal,
        @MasaMuscular, @NivelResistencia, @Flexibilidad, @CodigoUnicoCentro,
        @CodigoProfesional, @NumAfiliacion
    );
END
GO

EXECUTE SP_InsertarEvaluacionFisica 
    '2024-03-10',
    68.2,
    1.68,
    17.3,
    28.5,
    'Medio',
    'Buena',
    1,
    1,
    1;
GO
-- procedimiento almacenado para crear inserts de evaluaciones físicas 27
SELECT * FROM EvaluacionFisica;
GO
-- procedimiento almacenado para crear inserts de evaluaciones físicas 27
