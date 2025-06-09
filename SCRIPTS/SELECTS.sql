-- Seguimiento de progreso físico por cliente
USE VITALPRO
GO
CREATE PROCEDURE SP_SEGUIMIENTO_PROGRESO_FISICO
AS
BEGIN
SELECT 
    EvaluacionFisica.NumAfiliacion,
    Clientes.Nombre + ' ' + Clientes.Apellido1 + ' ' + Clientes.Apellido2 AS NombreCompleto,
    EvaluacionFisica.Fecha,
    EvaluacionFisica.Peso,
    EvaluacionFisica.Estatura,
    EvaluacionFisica.PorcentajeGrasaCorporal,
    EvaluacionFisica.MasaMuscular,
    EvaluacionFisica.NivelResistencia,
    EvaluacionFisica.Flexibilidad
FROM EvaluacionFisica inner JOIN Clientes ON EvaluacionFisica.NumAfiliacion = Clientes.NumAfiliacion
ORDER BY EvaluacionFisica.NumAfiliacion, EvaluacionFisica.Fecha;
END
GO
--FIN

--Reservas por profesional en una semana
USE VITALPRO
GO
CREATE PROCEDURE SP_RESERVAS_POR_PROFESIONAL_EN_UNA_SEMANA
AS
BEGIN
SELECT 
Profesional.CodigoProfesional,
Profesional.Nombre + ' ' + Profesional.Apellido1 + ' ' + Profesional.Apellido2 AS NombreCompleto,
DATEPART(WEEK, Sesion.Fecha) AS Semana,
COUNT(*) AS TotalSesiones
FROM Sesion inner JOIN Profesional ON Sesion.CodigoProfesional = Profesional.CodigoProfesional
GROUP BY Profesional.CodigoProfesional, Profesional.Nombre, Profesional.Apellido1, Profesional.Apellido2, DATEPART(WEEK, Sesion.Fecha)
ORDER BY Semana;
END
GO
-- FIN

-- RUTINAS ACTIVAS POR NIVEL
USE VITALPRO
GO
CREATE PROCEDURE SP_RUTINAS_ACTIVAS_POR_NIVEL
AS
BEGIN
SELECT 
    RutinaEntrenamiento.Nivel,
    COUNT(RutinaEntrenamiento.Id_Rutina) AS TotalRutinasActivas
FROM RutinaEntrenamiento
GROUP BY RutinaEntrenamiento.Nivel
ORDER BY RutinaEntrenamiento.Nivel;
END
GO
--FIN

--Recetas más utilizadas por tipo de plan
USE VITALPRO
GO
CREATE PROCEDURE SP_RECETAS_MAS_UTILIZADAS_POR_TIPO_DE_PLAN
AS
BEGIN
SELECT 
    PlanAlimenticio.Nombre AS TipoPlan,
    Receta.Nombre AS NombreReceta,
    COUNT(ComidaReceta.Id_ComidaReceta) AS FrecuenciaUso
FROM PlanAlimenticio
INNER JOIN PlanAlimenticio_Comida ON PlanAlimenticio.CodigoPlan = PlanAlimenticio_Comida.CodigoPlan
INNER JOIN Comida ON PlanAlimenticio_Comida.Id_Comida = Comida.Id_Comida
INNER JOIN ComidaReceta ON Comida.Id_Comida = ComidaReceta.Id_Comida
INNER JOIN Receta ON ComidaReceta.Id_Receta = Receta.Id_Receta
GROUP BY 
    PlanAlimenticio.Nombre,
    Receta.Nombre
ORDER BY 
    PlanAlimenticio.Nombre,
    FrecuenciaUso DESC;
END
GO
--FIN

-- Clientes con mayor adherencia (porcentaje de sesiones asistidas vs. reservadas)
USE VITALPRO
GO
CREATE PROCEDURE SP_CLIENTES_CON_MAYOR_ADERENCIAS 
AS 
BEGIN 
SELECT 
    Clientes.NumAfiliacion,
    RTRIM(Clientes.Nombre) + ' ' + 
    RTRIM(Clientes.Apellido1) + ' ' + 
    RTRIM(Clientes.Apellido2) AS NombreCompleto,
    COUNT(Sesion.Id_Sesion) AS TotalReservadas,
    SUM(CASE WHEN Sesion.Estado = 'Completada' THEN 1 ELSE 0 END) AS TotalAsistidas,
    CAST(
        SUM(CASE WHEN Sesion.Estado = 'Completada' THEN 1.0 ELSE 0 END) 
        / COUNT(Sesion.Id_Sesion) * 100 AS DECIMAL(5,2)
    ) AS PorcentajeAdherencia
FROM Sesion
INNER JOIN Clientes ON Sesion.NumAfiliacion = Clientes.NumAfiliacion
GROUP BY 
    Clientes.NumAfiliacion, 
    Clientes.Nombre, 
    Clientes.Apellido1, 
    Clientes.Apellido2
ORDER BY PorcentajeAdherencia DESC;
END
GO
--FIN

-- hace una lista de los entrenadores con el centro 
USE VITALPRO
GO
CREATE PROCEDURE SP_ENTRENADOR_CON_EL_CENTRO 
AS
BEGIN
SELECT 
Entrenador.IdEntrenador,
RTRIM(Profesional.Nombre) + ' ' + 
RTRIM(Profesional.Apellido1) + ' ' + 
RTRIM(Profesional.Apellido2) AS NombreCompleto,
CentroVitalPro.Nombre
from Profesional inner join Entrenador on Profesional.CodigoProfesional = Entrenador.CodigoProfesional
				inner join CentroVitalPro on Profesional.CodigoCentro = CentroVitalPro.CodigoUnico
END
GO
--FIN 

-- hace una lista de los nutricionistas con el centro 
USE VITALPRO
GO
CREATE PROCEDURE SP_NUTRICIONISTAS_CON_EL_CENTRO 
AS
BEGIN
SELECT
Nutricionista.IdNutricionista,
RTRIM(Profesional.Nombre)+' '+
RTRIM(Profesional.Apellido1)+ ' '+
RTRIM(Profesional.Apellido2) AS NombreCompleto,
CentroVitalPro.Nombre
FROM Profesional inner join Nutricionista on Profesional.CodigoProfesional = Nutricionista.CodigoProfesional
                inner join CentroVitalPro on Profesional.CodigoCentro = CentroVitalPro.CodigoUnico 
END
GO
--FIN 

-- CLIENTES QUE NO HAN TENIDO SESIONES EN EL ULTIMO MES
USE VITALPRO
GO
CREATE PROCEDURE SP_CLIENTES_SIN_ASISTENCIA_EL_ULTIMO_MES
AS
BEGIN
SELECT 
Clientes.NumAfiliacion,
RTRIM(Clientes.Nombre) +' '+
RTRIM(Clientes.Apellido1) +' '+
RTRIM(Clientes.Apellido2) AS NombreCompleto,
MAX(Sesion.Fecha) AS UltiimaSesion
FROM Clientes left join Sesion on Clientes.NumAfiliacion = Sesion.NumAfiliacion
GROUP BY Clientes.NumAfiliacion, Clientes.Nombre, Clientes.Apellido1, Clientes.Apellido2
HAVING MAX(Sesion.Fecha) < DATEADD(MONTH, -1, GETDATE()) OR MAX(SESION.Fecha) IS NULL
ORDER BY UltiimaSesion
END
GO
-- FIN 
