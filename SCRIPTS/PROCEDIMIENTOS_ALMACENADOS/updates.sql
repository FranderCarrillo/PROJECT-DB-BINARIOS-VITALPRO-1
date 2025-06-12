USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarCentroVitalPro
    @CodigoUnico INT,
    @Nombre VARCHAR(50),
    @Provincia VARCHAR(15),
    @Canton VARCHAR(20),
    @Distrito VARCHAR(40),
    @DireccionExacta TEXT,
    @NumContacto VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CentroVitalPro
    SET 
        Nombre = @Nombre,
        Provincia = @Provincia,
        Canton = @Canton,
        Distrito = @Distrito,
        DireccionExacta = @DireccionExacta,
        NumContacto = @NumContacto
    WHERE CodigoUnico = @CodigoUnico;
    AND Estado = 1; -- Asegurarse de que el centro esté activo
END
GO

/*
EXEC ActualizarCentroVitalPro
    @IdCentro = 1,
    @Nombre = 'Centro Vital Pro San José',
    @Provincia = 'San José',
    @Canton = 'Central',
    @Distrito = 'Hospital',
    @DireccionExacta = 'Avenida Segunda, 200 metros oeste del Teatro Nacional',
    @NumContacto = '2288-1122';
*/

-- procedimiento almacenado para realizar updates de centros vitales 1


USE VITALPRO
GO
    
CREATE PROCEDURE SP_ActualizarHorarioCentro
    @Id_Horario INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME,
    @CodigoUnicoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioCentro
    SET 
        DiaSemana = @DiaSemana,
        HoraInicio = @HoraInicio,
        HoraFin = @HoraFin,
        CodigoUnicoCentro = @CodigoUnicoCentro
    WHERE Id_Horario = @Id_Horario;
    AND Estado = 1; -- Asegurarse de que el horario esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el horario con IdHorarioCentro = 1

EXEC ActualizarHorarioCentro
    @IdHorarioCentro = 1,
    @DiaSemana = 'Martes',
    @HoraInicio = '09:00:00',
    @HoraFin = '18:00:00',
    @CodigoUnicoCentro = 3;
*/

-- procedimiento almacenado para realizar updates de horarios de centros 2


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarProfesional
    @CodigoProfesional INT,
    @Nombre VARCHAR(30),
    @Apellido1 VARCHAR(30),
    @Apellido2 VARCHAR(30),
    @CedProfesional VARCHAR(50),
    @AniosExperiencia INT,
    @CodigoCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Profesional
    SET 
        Nombre = @Nombre,
        Apellido1 = @Apellido1,
        Apellido2 = @Apellido2,
        CedProfesional = @CedProfesional,
        AniosExperiencia = @AniosExperiencia,
        CodigoCentro = @CodigoCentro
    WHERE CodigoProfesional = @CodigoProfesional;
    AND Estado = 1; -- Asegurarse de que el profesional esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza al profesional con Código = 1

EXEC ActualizarProfesional
    @CodigoProfesional = 1,
    @Nombre = 'María Fernanda',
    @Apellido1 = 'Gómez',
    @Apellido2 = 'López',
    @CedProfesional = 'P987654321',
    @AniosExperiencia = 7,
    @CodigoCentro = 3;
*/

-- procedimiento almacenado para realizar updates de profesionales 3



USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarHorarioProfesional
    @IdHorario INT,
    @CodigoProfesional INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioProfesional
    SET 
        CodigoProfesional = @CodigoProfesional,
        DiaSemana = @DiaSemana,
        HoraInicio = @HoraInicio,
        HoraFin = @HoraFin
    WHERE IdHorario = @IdHorario;
    AND Estado = 1; -- Asegurarse de que el horario esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el horario con IdHorario = 1

EXEC ActualizarHorarioProfesional
    @IdHorario = 1,
    @CodigoProfesional = 2,
    @DiaSemana = 'Miércoles',
    @HoraInicio = '10:00:00',
    @HoraFin = '18:00:00';
*/

-- procedimiento almacenado para realizar updates de horarios de profesionales 4


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEntrenador
    @IdEntrenador INT,
    @FechaInicio DATE,
    @FechaFinal DATE = NULL,
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador
    SET 
        FechaInicio = @FechaInicio,
        FechaFinal = @FechaFinal,
        CodigoProfesional = @CodigoProfesional
    WHERE IdEntrenador = @IdEntrenador;
    AND Estado = 1; -- Asegurarse de que el entrenador esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza al entrenador con IdEntrenador = 1

EXEC ActualizarEntrenador
    @IdEntrenador = 1,
    @FechaInicio = '2023-01-01',
    @FechaFinal = '2024-01-01',
    @CodigoProfesional = 5;
*/

-- procedimiento almacenado para realizar updates de entrenadores 5


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEspecialidadEntrenador
    @IdEspecialidad VARCHAR(5),
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Entrenador
    SET 
        NombreEspecialidad = @NombreEspecialidad
    WHERE IdEspecialidad = @IdEspecialidad;
    AND Estado = 1; -- Asegurarse de que la especialidad esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la especialidad con IdEspecialidad = 'E001'

EXEC ActualizarEspecialidadEntrenador
    @IdEspecialidad = 'E001',
    @NombreEspecialidad = 'Entrenamiento Funcional';
*/

-- procedimiento almacenado para realizar updates de especialidades de entrenadores 6


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEntrenadorEspecialidad
    @Id VARCHAR(5),
    @IdEntrenador VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador_Especialidad
    SET 
        IdEntrenador = @IdEntrenador,
        IdEspecialidad = @IdEspecialidad
    WHERE Id = @Id;
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación con Id = 'R001'

EXEC ActualizarEntrenadorEspecialidad
    @Id = 'R001',
    @IdEntrenador = 'T002',
    @IdEspecialidad = 'E003';
*/

-- procedimiento almacenado para realizar updates de relación entrenador-especialidad 7


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarNutricionista
    @IdNutricionista VARCHAR(4),
    @FechaInicio DATE,
    @FechaFinal DATE = NULL,
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Nutricionista
    SET 
        FechaInicio = @FechaInicio,
        FechaFinal = @FechaFinal,
        CodigoProfesional = @CodigoProfesional
    WHERE IdNutricionista = @IdNutricionista;
    AND Estado = 1; -- Asegurarse de que el nutricionista esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza al nutricionista con IdNutricionista = 'N001'

EXEC ActualizarNutricionista
    @IdNutricionista = 'N001',
    @FechaInicio = '2023-01-01',
    @FechaFinal = '2024-01-01',
    @CodigoProfesional = 7;
*/

-- procedimiento almacenado para realizar updates de nutricionistas 8


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEspecialidadNutricionista
    @IdEspecialidad VARCHAR(5),
    @NombreEspecialidad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Nutricionista
    SET 
        NombreEspecialidad = @NombreEspecialidad
    WHERE IdEspecialidad = @IdEspecialidad;
    AND Estado = 1; -- Asegurarse de que la especialidad esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la especialidad de nutricionista con IdEspecialidad = 'EN001'

EXEC ActualizarEspecialidadNutricionista
    @IdEspecialidad = 'EN001',
    @NombreEspecialidad = 'Nutrición Deportiva';
*/

-- procedimiento almacenado para realizar updates de especialidades de nutricionistas 9


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarNutricionistaEspecialidad
    @Id VARCHAR(5),
    @IdNutricionista VARCHAR(4),
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Nutricionista
    SET 
        IdNutricionista = @IdNutricionista,
        IdEspecialidad = @IdEspecialidad
    WHERE Id = @Id;
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación con Id = 'NE001'

EXEC ActualizarNutricionistaEspecialidad
    @Id = 'NE001',
    @IdNutricionista = 'N002',
    @IdEspecialidad = 'EN002';
*/

-- procedimiento almacenado para realizar updates de relación nutricionista-especialidad 10


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarValorNutricional
    @IdValorNutricional INT,
    @Calorias INT,
    @Proteinas FLOAT,
    @Carbohidratos FLOAT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ValorNutricional
    SET 
        Calorias = @Calorias,
        Proteinas = @Proteinas,
        Carbohidratos = @Carbohidratos
    WHERE IdValorNutricional = @IdValorNutricional;
    AND Estado = 1; -- Asegurarse de que el valor nutricional esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el valor nutricional con Id = 1

EXEC ActualizarValorNutricional
    @IdValorNutricional = 1,
    @Calorias = 250,
    @Proteinas = 20.5,
    @Carbohidratos = 30.2;
*/

-- procedimiento almacenado para realizar updates de valores nutricionales 11


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarReceta
    @Id_Receta INT,
    @Nombre VARCHAR(50),
    @TiempoPreparacion INT,
    @IdValorNutricional INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Receta
    SET 
        Nombre = @Nombre,
        TiempoPreparacion = @TiempoPreparacion,
        IdValorNutricional = @IdValorNutricional
    WHERE Id_Receta = @Id_Receta;
    AND Estado = 1; -- Asegurarse de que la receta esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la receta con Id_Receta = 1

EXEC ActualizarReceta
    @Id_Receta = 1,
    @Nombre = 'Ensalada de Quinoa',
    @TiempoPreparacion = 20,
    @IdValorNutricional = 3;
*/

-- procedimiento almacenado para realizar updates de recetas 12


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarUnidadMedida
    @Id_Unidad VARCHAR(4),
    @NombreUnidad VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE UnidadMedida
    SET 
        NombreUnidad = @NombreUnidad
    WHERE Id_Unidad = @Id_Unidad;
    AND Estado = 1; -- Asegurarse de que la unidad de medida esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la unidad con Id_Unidad = 'GRM'

EXEC ActualizarUnidadMedida
    @Id_Unidad = 'GRM',
    @NombreUnidad = 'Gramos';
*/

-- procedimiento almacenado para realizar updates de unidades de medida 13


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarIngrediente
    @Id_Ingrediente INT,
    @Nombre VARCHAR(50),
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ingrediente
    SET 
        Nombre = @Nombre,
        Id_Unidad = @Id_Unidad
    WHERE Id_Ingrediente = @Id_Ingrediente;
    AND Estado = 1; -- Asegurarse de que el ingrediente esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el ingrediente con IdIngrediente = 1

EXEC ActualizarIngrediente
    @IdIngrediente = 1,
    @Nombre = 'Avena Integral',
    @Id_Unidad = 'GRM';
*/

-- procedimiento almacenado para realizar updates de ingredientes 14


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarRecetaIngrediente
    @Id_RecetaIngredientes INT,
    @Id_Receta INT,
    @Id_Ingrediente INT,
    @Cantidad FLOAT,
    @TiempoPreparacion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RecetaIngrediente
    SET 
        Id_Receta = @Id_Receta,
        Id_Ingrediente = @Id_Ingrediente,
        Cantidad = @Cantidad,
        TiempoPreparacion = @TiempoPreparacion
    WHERE Id_RecetaIngredientes = @Id_RecetaIngredientes;
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación con Id_RecetaIngredientes = 1

EXEC ActualizarRecetaIngrediente
    @Id_RecetaIngredientes = 1,
    @Id_Receta = 2,
    @Id_Ingrediente = 3,
    @Cantidad = 150.5,
    @TiempoPreparacion = 15;
*/

-- procedimiento almacenado para realizar updates de ingredientes por receta 15



USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarComida
    @Id_Comida INT,
    @TipoComida VARCHAR(50),
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Comida
    SET 
        TipoComida = @TipoComida,
        CodigoPlan = @CodigoPlan
    WHERE Id_Comida = @Id_Comida;
    AND Estado = 1; -- Asegurarse de que la comida esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la comida con Id_Comida = 1

EXEC ActualizarComida
    @Id_Comida = 1,
    @TipoComida = 'Desayuno Especial',
    @CodigoPlan = 5;
*/

-- procedimiento almacenado para realizar updates de comidas 16


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarComidaReceta
    @Id_ComidaReceta INT,
    @Id_Comida INT,
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ComidaReceta
    SET 
        Id_Comida = @Id_Comida,
        Id_Receta = @Id_Receta
    WHERE Id_ComidaReceta = @Id_ComidaReceta; 
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación comida-receta con Id_ComidaReceta = 1

EXEC ActualizarComidaReceta
    @Id_ComidaReceta = 1,
    @Id_Comida = 2,
    @Id_Receta = 3;
*/

-- procedimiento almacenado para realizar updates de relaciones comida-receta 17


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarPlanAlimenticio
    @CodigoPlan INT,
    @Nombre VARCHAR(50),
    @MetaNutricional VARCHAR(100) = NULL,
    @CaloriasDiariasEstim INT = NULL,
    @Observaciones TEXT = NULL,
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio
    SET 
        Nombre = @Nombre,
        MetaNutricional = @MetaNutricional,
        CaloriasDiariasEstim = @CaloriasDiariasEstim,
        Observaciones = @Observaciones,
        IdNutricionista = @IdNutricionista
    WHERE CodigoPlan = @CodigoPlan;
    AND Estado = 1; -- Asegurarse de que el plan alimenticio esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el plan alimenticio con CodigoPlan = 1

EXEC ActualizarPlanAlimenticio
    @CodigoPlan = 1,
    @Nombre = 'Plan Alto en Proteínas',
    @MetaNutricional = 'Incrementar masa muscular',
    @CaloriasDiariasEstim = 2500,
    @Observaciones = 'Acompañado de rutina de fuerza',
    @IdNutricionista = 'N003';
*/

-- procedimiento almacenado para realizar updates de planes alimenticios 18


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida INT,
    @Id_Comida INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio_Comida
    SET 
        Id_Comida = @Id_Comida,
        CodigoPlan = @CodigoPlan
    WHERE Id_PlanAlimenticio_Comida = @Id_PlanAlimenticio_Comida;
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación con Id_PlanAlimenticio_Comida = 1

EXEC ActualizarPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida = 1,
    @Id_Comida = 2,
    @CodigoPlan = 1;
*/

-- procedimiento almacenado para realizar updates de relación plan alimenticio - comida 19


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEjercicio
    @Id_Ejercicio INT,
    @Nombre VARCHAR(50),
    @GrupoMuscularTrabajado VARCHAR(50),
    @CantidadRepeticiones INT,
    @EquipamientoEspecial BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ejercicio
    SET 
        Nombre = @Nombre,
        GrupoMuscularTrabajado = @GrupoMuscularTrabajado,
        CantidadRepeticiones = @CantidadRepeticiones,
        EquipamientoEspecial = @EquipamientoEspecial
    WHERE Id_Ejercicio = @Id_Ejercicio;
    AND Estado = 1; -- Asegurarse de que el ejercicio esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el ejercicio con Id_Ejercicio = 1

EXEC ActualizarEjercicio
    @Id_Ejercicio = 1,
    @Nombre = 'Sentadilla con barra',
    @GrupoMuscularTrabajado = 'Piernas',
    @CantidadRepeticiones = 12,
    @EquipamientoEspecial = 1;
*/

-- procedimiento almacenado para realizar updates de ejercicios 20


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarRutinaSemana
    @Id_RutinaSemana INT,
    @DiaSemana VARCHAR(12),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaSemana
    SET 
        DiaSemana = @DiaSemana,
        HoraInicio = @HoraInicio,
        HoraFin = @HoraFin
    WHERE Id_RutinaSemana = @Id_RutinaSemana;
    AND Estado = 1; -- Asegurarse de que la rutina semanal esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la rutina semanal con Id_RutinaSemana = 1

EXEC ActualizarRutinaSemana
    @Id_RutinaSemana = 1,
    @DiaSemana = 'Viernes',
    @HoraInicio = '07:00:00',
    @HoraFin = '08:30:00';
*/

-- procedimiento almacenado para realizar updates de rutina semanal 21


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarRutinaEjercicio
    @Id_RutinaEjercicio INT,
    @Id_Ejercicio INT,
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaEjercicio
    SET 
        Id_Ejercicio = @Id_Ejercicio,
        Id_RutinaSemana = @Id_RutinaSemana
    WHERE Id_RutinaEjercicio = @Id_RutinaEjercicio;
    AND Estado = 1; -- Asegurarse de que la relación esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la relación rutina-ejercicio con Id_RutinaEjercicio = 1

EXEC ActualizarRutinaEjercicio
    @Id_RutinaEjercicio = 1,
    @Id_Ejercicio = 4,
    @Id_RutinaSemana = 2;
*/

-- procedimiento almacenado para realizar updates de relación rutina-ejercicio 22


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarRutinaEntrenamiento
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

    UPDATE RutinaEntrenamiento
    SET 
        DescripcionObjetivo = @DescripcionObjetivo,
        Nivel = @Nivel,
        DuracionTotalxSemana = @DuracionTotalxSemana,
        EjerciciosXDia = @EjerciciosXDia,
        IdEntrenador = @IdEntrenador,
        Id_RutinaSemana = @Id_RutinaSemana
    WHERE Id_Rutina = @Id_Rutina;
    AND Estado = 1; -- Asegurarse de que la rutina de entrenamiento esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la rutina de entrenamiento con Id_Rutina = 1

EXEC ActualizarRutinaEntrenamiento
    @Id_Rutina = 1,
    @DescripcionObjetivo = 'Fuerza y resistencia general',
    @Nivel = 'Intermedio',
    @DuracionTotalxSemana = 4,
    @EjerciciosXDia = 5,
    @IdEntrenador = 'E001',
    @Id_RutinaSemana = 3;
*/

-- procedimiento almacenado para realizar updates de rutinas de entrenamiento 23



USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarCliente
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

    UPDATE Clientes
    SET 
        Nombre = @Nombre,
        Apellido1 = @Apellido1,
        Apellido2 = @Apellido2,
        Cedula = @Cedula,
        Genero = @Genero,
        FechaNacimiento = @FechaNacimiento,
        Telefono = @Telefono,
        CorreoElectronico = @CorreoElectronico,
        FechaIngreso = @FechaIngreso,
        IdEntrenador = @IdEntrenador,
        CodigoUnicoCentro = @CodigoUnicoCentro
    WHERE NumAfiliacion = @NumAfiliacion;
    AND Estado = 1; -- Asegurarse de que el cliente esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza al cliente con NumAfiliacion = 1001

EXEC ActualizarCliente
    @NumAfiliacion = 1001,
    @Nombre = 'Daniela',
    @Apellido1 = 'Rodríguez',
    @Apellido2 = 'Mora',
    @Cedula = '204050607',
    @Genero = 'F',
    @FechaNacimiento = '1995-06-15',
    @Telefono = '8888-8888',
    @CorreoElectronico = 'daniela.mora@email.com',
    @FechaIngreso = '2024-01-15',
    @IdEntrenador = 'E002',
    @CodigoUnicoCentro = 3;
*/

-- procedimiento almacenado para realizar updates de clientes 24


USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarPlanPersonalizado
    @IdPlanPersonalizado INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @IdRutina INT,
    @NumAfiliacion INT,
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanPersonalizado
    SET 
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        IdRutina = @IdRutina,
        NumAfiliacion = @NumAfiliacion,
        CodigoPlan = @CodigoPlan
    WHERE IdPlanPersonalizado = @IdPlanPersonalizado;
    AND Estado = 1; -- Asegurarse de que el plan personalizado esté activo
END
GO

/*
-- Ejemplo de uso:
-- Actualiza el plan personalizado con IdPlanPersonalizado = 1

EXEC ActualizarPlanPersonalizado
    @IdPlanPersonalizado = 1,
    @FechaInicio = '2024-03-01',
    @FechaFin = '2024-06-01',
    @IdRutina = 2,
    @NumAfiliacion = 1001,
    @CodigoPlan = 5;
*/

-- procedimiento almacenado para realizar updates de planes personalizados 25



USE VITALPRO
GO


CREATE PROCEDURE SP_ActualizarSesion
    @Id_Sesion INT,
    @TipoSesion VARCHAR(50),
    @Fecha DATE,
    @Hora TIME,
    @Duracion INT,
    @CodigoUnicoCentro INT,
    @CodigoProfesional INT,
    @NumAfiliacion INT,
    @Fase VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Sesion
    SET 
        TipoSesion = @TipoSesion,
        Fecha = @Fecha,
        Hora = @Hora,
        Duracion = @Duracion,
        CodigoUnicoCentro = @CodigoUnicoCentro,
        CodigoProfesional = @CodigoProfesional,
        NumAfiliacion = @NumAfiliacion,
        Fase = @Fase
    WHERE Id_Sesion = @Id_Sesion;
    AND Estado = 1; -- Asegurarse de que la sesión esté activa
END
GO


/*
-- Ejemplo de uso:
-- Actualiza la sesión con Id_Sesion = 1

EXEC ActualizarSesion
    @Id_Sesion = 1,
    @TipoSesion = 'Fisioterapia',
    @Fecha = '2024-07-10',
    @Hora = '10:00:00',
    @PersonalAsignado = 'Lic. Karen Rojas',
    @Duracion = 60,
    @Sede = 'Centro Vital Pro Liberia',
    @Estado = 'Completada',
    @CodigoUnicoCentro = 3,
    @CodigoProfesional = 12,
    @NumAfiliacion = 1001;
*/

-- procedimiento almacenado para realizar updates de sesiones 26



USE VITALPRO
GO

CREATE PROCEDURE SP_ActualizarEvaluacionFisica
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

    UPDATE EvaluacionFisica
    SET 
        Fecha = @Fecha,
        Peso = @Peso,
        Estatura = @Estatura,
        PorcentajeGrasaCorporal = @PorcentajeGrasaCorporal,
        MasaMuscular = @MasaMuscular,
        NivelResistencia = @NivelResistencia,
        Flexibilidad = @Flexibilidad,
        CodigoUnicoCentro = @CodigoUnicoCentro,
        CodigoProfesional = @CodigoProfesional,
        NumAfiliacion = @NumAfiliacion
    WHERE Id_EvaluacionFisica = @Id_EvaluacionFisica;
    AND  Estado = 1; -- Asegurarse de que la evaluación física esté activa
END
GO

/*
-- Ejemplo de uso:
-- Actualiza la evaluación física con Id_EvaluacionFisica = 1

EXEC ActualizarEvaluacionFisica
    @Id_EvaluacionFisica = 1,
    @Fecha = '2024-06-30',
    @Peso = 70.5,
    @Estatura = 1.68,
    @PorcentajeGrasaCorporal = 18.2,
    @MasaMuscular = 28.7,
    @NivelResistencia = 'Alta',
    @Flexibilidad = 'Media',
    @CodigoUnicoCentro = 2,
    @CodigoProfesional = 6,
    @NumAfiliacion = 1001;
*/

-- procedimiento almacenado para realizar updates de evaluaciones físicas 27
