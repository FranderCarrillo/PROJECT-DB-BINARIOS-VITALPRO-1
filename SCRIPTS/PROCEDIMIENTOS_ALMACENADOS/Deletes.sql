USE VITALPRO
GO

CREATE PROCEDURE EliminarCentroVitalPro
    @IdCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM CentroVitalPro
    WHERE IdCentro = @IdCentro;
END
GO

-- procedimiento almacenado para realizar deletes de centros 1


USE VITALPRO
GO

CREATE PROCEDURE EliminarHorarioCentro
    @IdHorarioCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM HorarioCentro
    WHERE IdHorarioCentro = @IdHorarioCentro;
END
GO

-- procedimiento almacenado para realizar deletes de horarios de centros 2


USE VITALPRO
GO

CREATE PROCEDURE EliminarProfesional
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Profesional
    WHERE CodigoProfesional = @CodigoProfesional;
END
GO

-- procedimiento almacenado para realizar deletes de profesionales 3


USE VITALPRO
GO

CREATE PROCEDURE EliminarHorarioProfesional
    @IdHorario INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM HorarioProfesional
    WHERE IdHorario = @IdHorario;
END
GO

-- procedimiento almacenado para realizar deletes de horarios de profesionales 4


USE VITALPRO
GO

CREATE PROCEDURE EliminarEntrenador
    @IdEntrenador INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Entrenador
    WHERE IdEntrenador = @IdEntrenador;
END
GO

-- procedimiento almacenado para realizar deletes de entrenadores 5


USE VITALPRO
GO

CREATE PROCEDURE EliminarEspecialidadEntrenador
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Especialidad_Entrenador
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

-- procedimiento almacenado para realizar deletes de especialidades de entrenadores 6


USE VITALPRO
GO

CREATE PROCEDURE EliminarEntrenadorEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Entrenador_Especialidad
    WHERE Id = @Id;
END
GO

-- procedimiento almacenado para realizar deletes de relación entrenador-especialidad 7

USE VITALPRO
GO

CREATE PROCEDURE EliminarNutricionista
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Nutricionista
    WHERE IdNutricionista = @IdNutricionista;
END
GO

-- procedimiento almacenado para realizar deletes de nutricionistas 8


USE VITALPRO
GO

CREATE PROCEDURE EliminarEspecialidadNutricionista
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Especialidad_Nutricionista
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

-- procedimiento almacenado para realizar deletes de especialidades de nutricionistas 9


USE VITALPRO
GO

CREATE PROCEDURE EliminarNutricionistaEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Especialidad_Nutricionista
    WHERE Id = @Id;
END
GO

-- procedimiento almacenado para realizar deletes de relación nutricionista-especialidad 10



USE VITALPRO
GO

CREATE PROCEDURE EliminarValorNutricional
    @IdValorNutricional INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ValorNutricional
    WHERE IdValorNutricional = @IdValorNutricional;
END
GO

-- procedimiento almacenado para realizar deletes de valores nutricionales 11


USE VITALPRO
GO

CREATE PROCEDURE EliminarReceta
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Receta
    WHERE Id_Receta = @Id_Receta;
END
GO

-- procedimiento almacenado para realizar deletes de recetas 12


USE VITALPRO
GO

CREATE PROCEDURE EliminarUnidadMedida
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM UnidadMedida
    WHERE Id_Unidad = @Id_Unidad;
END
GO

-- procedimiento almacenado para realizar deletes de unidades de medida 13


USE VITALPRO
GO

CREATE PROCEDURE EliminarIngrediente
    @IdIngrediente INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Ingrediente
    WHERE IdIngrediente = @IdIngrediente;
END
GO

-- procedimiento almacenado para realizar deletes de ingredientes 14


USE VITALPRO
GO

CREATE PROCEDURE EliminarRecetaIngrediente
    @Id_RecetaIngredientes INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM RecetaIngrediente
    WHERE Id_RecetaIngredientes = @Id_RecetaIngredientes;
END
GO

-- procedimiento almacenado para realizar deletes de ingredientes por receta 15


USE VITALPRO
GO

CREATE PROCEDURE EliminarComida
    @Id_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Comida
    WHERE Id_Comida = @Id_Comida;
END
GO

-- procedimiento almacenado para realizar deletes de comidas 16


USE VITALPRO
GO

CREATE PROCEDURE EliminarComidaReceta
    @Id_ComidaReceta INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ComidaReceta
    WHERE Id_ComidaReceta = @Id_ComidaReceta;
END
GO

-- procedimiento almacenado para realizar deletes de relaciones comida-receta 17


USE VITALPRO
GO

CREATE PROCEDURE EliminarPlanAlimenticio
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM PlanAlimenticio
    WHERE CodigoPlan = @CodigoPlan;
END
GO

-- procedimiento almacenado para realizar deletes de planes alimenticios 18


USE VITALPRO
GO

CREATE PROCEDURE EliminarPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM PlanAlimenticio_Comida
    WHERE Id_PlanAlimenticio_Comida = @Id_PlanAlimenticio_Comida;
END
GO

-- procedimiento almacenado para realizar deletes de relación plan alimenticio - comida 19


USE VITALPRO
GO

CREATE PROCEDURE EliminarEjercicio
    @Id_Ejercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Ejercicio
    WHERE Id_Ejercicio = @Id_Ejercicio;
END
GO

-- procedimiento almacenado para realizar deletes de ejercicios 20


USE VITALPRO
GO

CREATE PROCEDURE EliminarRutinaSemana
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM RutinaSemana
    WHERE Id_RutinaSemana = @Id_RutinaSemana;
END
GO

-- procedimiento almacenado para realizar deletes de rutina semanal 21


USE VITALPRO
GO

CREATE PROCEDURE EliminarRutinaEjercicio
    @Id_RutinaEjercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM RutinaEjercicio
    WHERE Id_RutinaEjercicio = @Id_RutinaEjercicio;
END
GO

-- procedimiento almacenado para realizar deletes de relación rutina-ejercicio 22


USE VITALPRO
GO

CREATE PROCEDURE EliminarRutinaEntrenamiento
    @Id_Rutina INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM RutinaEntrenamiento
    WHERE Id_Rutina = @Id_Rutina;
END
GO

-- procedimiento almacenado para realizar deletes de rutinas de entrenamiento 23



USE VITALPRO
GO

CREATE PROCEDURE EliminarCliente
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Clientes
    WHERE NumAfiliacion = @NumAfiliacion;
END
GO

-- procedimiento almacenado para realizar deletes de clientes 24


USE VITALPRO
GO

CREATE PROCEDURE EliminarPlanPersonalizado
    @IdPlanPersonalizado INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM PlanPersonalizado
    WHERE IdPlanPersonalizado = @IdPlanPersonalizado;
END
GO

-- procedimiento almacenado para realizar deletes de planes personalizados 25


USE VITALPRO
GO

CREATE PROCEDURE EliminarSesion
    @Id_Sesion INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Sesion
    WHERE Id_Sesion = @Id_Sesion;
END
GO

-- procedimiento almacenado para realizar deletes de sesiones 26


USE VITALPRO
GO

CREATE PROCEDURE EliminarEvaluacionFisica
    @Id_EvaluacionFisica INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM EvaluacionFisica
    WHERE Id_EvaluacionFisica = @Id_EvaluacionFisica;
END
GO

-- procedimiento almacenado para realizar deletes de evaluaciones físicas 27
