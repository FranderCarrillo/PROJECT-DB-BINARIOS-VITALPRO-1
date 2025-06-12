USE VITALPRO
GO

CREATE PROCEDURE SP_CambiodeEstadoCentroVitalPro
    @CodigoUnico INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CentroVitalPro
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE CodigoUnico = @CodigoUnico;
END
GO


CREATE PROCEDURE SP_CambiodeEstadoHorarioCentro
    @Id_Horario INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioCentro
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Horario = @Id_Horario;
END
GO

CREATE PROCEDURE SP_CambiardeEstadoProfesional
    @CodigoProfesional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Profesional
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE CodigoProfesional = @CodigoProfesional;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoHorarioProfesional
    @IdHorario INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HorarioProfesional
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdHorario = @IdHorario;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEntrenador
    @IdEntrenador INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdEntrenador = @IdEntrenador;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEspecialidadEntrenador
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Entrenador
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEntrenadorEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Entrenador_Especialidad
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id = @Id;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoNutricionista
    @IdNutricionista VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Nutricionista
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdNutricionista = @IdNutricionista;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEspecialidadNutricionista
    @IdEspecialidad VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad_Nutricionista
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdEspecialidad = @IdEspecialidad;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoNutricionistaEspecialidad
    @Id VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Nutricionista_Especialidad
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id = @Id;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoValorNutricional
    @IdValorNutricional INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ValorNutricional
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdValorNutricional = @IdValorNutricional;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoReceta
    @Id_Receta INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Receta
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Receta = @Id_Receta;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoUnidadMedida
    @Id_Unidad VARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE UnidadMedida
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Unidad = @Id_Unidad;
END
GO

CREATE PROCEDURE SP_CambioEstadoIngrediente
    @Id_Ingrediente INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ingrediente
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Ingrediente = @Id_Ingrediente;
END
GO


CREATE PROCEDURE SP_CambiodeEstadoRecetaIngrediente
    @Id_RecetaIngredientes INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RecetaIngrediente
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_RecetaIngredientes = @Id_RecetaIngredientes;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoComida
    @Id_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Comida
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Comida = @Id_Comida;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoComidaReceta
    @Id_ComidaReceta INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ComidaReceta
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_ComidaReceta = @Id_ComidaReceta;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoPlanAlimenticio
    @CodigoPlan INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE CodigoPlan = @CodigoPlan;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoPlanAlimenticioComida
    @Id_PlanAlimenticio_Comida INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanAlimenticio_Comida
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_PlanAlimenticio_Comida = @Id_PlanAlimenticio_Comida;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEjercicio
    @Id_Ejercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ejercicio
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Ejercicio = @Id_Ejercicio;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoRutinaSemana
    @Id_RutinaSemana INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaSemana
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_RutinaSemana = @Id_RutinaSemana;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoRutinaEjercicio
    @Id_RutinaEjercicio INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaEjercicio
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_RutinaEjercicio = @Id_RutinaEjercicio;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoRutinaEntrenamiento
    @Id_Rutina INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RutinaEntrenamiento
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Rutina = @Id_Rutina;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoCliente
    @NumAfiliacion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Clientes
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE NumAfiliacion = @NumAfiliacion;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoPlanPersonalizado
    @IdPlanPersonalizado INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PlanPersonalizado
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE IdPlanPersonalizado = @IdPlanPersonalizado;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoSesion
    @Id_Sesion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Sesion
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_Sesion = @Id_Sesion;
END
GO

CREATE PROCEDURE SP_CambiodeEstadoEvaluacionFisica
    @Id_EvaluacionFisica INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE EvaluacionFisica
    SET Estado = 
        CASE 
            WHEN Estado = 1 THEN 0
            ELSE 1
        END
    WHERE Id_EvaluacionFisica = @Id_EvaluacionFisica;
END
GO
