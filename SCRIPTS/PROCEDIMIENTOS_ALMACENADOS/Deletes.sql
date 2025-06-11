USE VITALPRO
GO

ALTER PROCEDURE EliminarCentroVitalPro
    @IdCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CentroVitalPro
    SET Estado = 0
    WHERE IdCentro = @IdCentro;
END
GO

ALTER PROCEDURE EliminarHorarioCentro
    @IdHorarioCentro INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioCentro
    SET Estado = 0
    WHERE IdHorarioCentro = @IdHorarioCentro;
END
GO

ALTER PROCEDURE EliminarProfesional
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Profesional
    SET Estado = 0
    WHERE CodigoProfesional = @CodigoProfesional;
END
GO

ALTER PROCEDURE EliminarHorarioProfesional
    @IdHorario INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioProfesional
    SET Estado = 0
    WHERE IdHorario = @IdHorario;
END
GO

ALTER PROCEDURE EliminarEntrenador
    @IdEntrenador INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador
    SET Estado = 0
    WHERE IdEntrenador = @IdEntrenador;
END
GO

ALTER PROCEDURE EliminarEspecialidadEntrenador
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Entrenador
    SET Estado = 0
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

ALTER PROCEDURE EliminarEntrenadorEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador_Especialidad
    SET Estado = 0
    WHERE Id = @Id;
END
GO

ALTER PROCEDURE EliminarNutricionista
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Nutricionista
    SET Estado = 0
    WHERE IdNutricionista = @IdNutricionista;
END
GO

ALTER PROCEDURE EliminarEspecialidadNutricionista
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Nutricionista
    SET Estado = 0
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

ALTER PROCEDURE EliminarNutricionistaEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Nutricionista
    SET Estado = 0
    WHERE Id = @Id;
END
GO

ALTER PROCEDURE EliminarValorNutricional
    @IdValorNutricional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ValorNutricional
    SET Estado = 0
    WHERE IdValorNutricional = @IdValorNutricional;
END
GO

ALTER PROCEDURE EliminarReceta
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Receta
    SET Estado = 0
    WHERE Id_Receta = @Id_Receta;
END
GO

ALTER PROCEDURE EliminarUnidadMedida
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE UnidadMedida
    SET Estado = 0
    WHERE Id_Unidad = @Id_Unidad;
END
GO

ALTER PROCEDURE EliminarIngrediente
    @IdIngrediente INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ingrediente
    SET Estado = 0
    WHERE IdIngrediente = @IdIngrediente;
END
GO

ALTER PROCEDURE EliminarRecetaIngrediente
    @Id_RecetaIngredientes INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RecetaIngrediente
    SET Estado = 0
    WHERE Id_RecetaIngredientes = @Id_RecetaIngredientes;
END
GO

ALTER PROCEDURE EliminarComida
    @Id_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Comida
    SET Estado = 0
    WHERE Id_Comida = @Id_Comida;
END
GO

ALTER PROCEDURE EliminarComidaReceta
    @Id_ComidaReceta INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ComidaReceta
    SET Estado = 0
    WHERE Id_ComidaReceta = @Id_ComidaReceta;
END
GO

ALTER PROCEDURE EliminarPlanAlimenticio
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio
    SET Estado = 0
    WHERE CodigoPlan = @CodigoPlan;
END
GO

ALTER PROCEDURE EliminarPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio_Comida
    SET Estado = 0
    WHERE Id_PlanAlimenticio_Comida = @Id_PlanAlimenticio_Comida;
END
GO

ALTER PROCEDURE EliminarEjercicio
    @Id_Ejercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ejercicio
    SET Estado = 0
    WHERE Id_Ejercicio = @Id_Ejercicio;
END
GO

ALTER PROCEDURE EliminarRutinaSemana
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaSemana
    SET Estado = 0
    WHERE Id_RutinaSemana = @Id_RutinaSemana;
END
GO

ALTER PROCEDURE EliminarRutinaEjercicio
    @Id_RutinaEjercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaEjercicio
    SET Estado = 0
    WHERE Id_RutinaEjercicio = @Id_RutinaEjercicio;
END
GO

ALTER PROCEDURE EliminarRutinaEntrenamiento
    @Id_Rutina INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaEntrenamiento
    SET Estado = 0
    WHERE Id_Rutina = @Id_Rutina;
END
GO

ALTER PROCEDURE EliminarCliente
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Clientes
    SET Estado = 0
    WHERE NumAfiliacion = @NumAfiliacion;
END
GO

ALTER PROCEDURE EliminarPlanPersonalizado
    @IdPlanPersonalizado INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanPersonalizado
    SET Estado = 0
    WHERE IdPlanPersonalizado = @IdPlanPersonalizado;
END
GO

ALTER PROCEDURE EliminarSesion
    @Id_Sesion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Sesion
    SET Estado = 0
    WHERE Id_Sesion = @Id_Sesion;
END
GO

ALTER PROCEDURE EliminarEvaluacionFisica
    @Id_EvaluacionFisica INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE EvaluacionFisica
    SET Estado = 0
    WHERE Id_EvaluacionFisica = @Id_EvaluacionFisica;
END
GO
