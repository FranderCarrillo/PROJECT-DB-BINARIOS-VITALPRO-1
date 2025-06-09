-- Seguimiento de progreso fisico por cliente  1
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

--Reservas por profesional en una semana 2
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

-- RUTINAS ACTIVAS POR NIVEL 3
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

--Recetas mas utilizadas por tipo de plan 4
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

-- Clientes con mayor adherencia (porcentaje de sesiones asistidas vs. reservadas) 5
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

-- hace una lista de los entrenadores con el centro 6
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

-- hace una lista de los nutricionistas con el centro 7
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

-- CLIENTES QUE NO HAN TENIDO SESIONES EN EL ULTIMO MES 8
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

--Clientes sin evaluacion fisica registrada 9 
USE VITALPRO
GO
CREATE PROCEDURE SP_CLIENTES_SIN_EVALUACION
AS
BEGIN
SELECT 
    Clientes.NumAfiliacion,
    RTRIM(Clientes.Nombre) + ' ' + 
    RTRIM(Clientes.Apellido1) + ' ' + 
    RTRIM(Clientes.Apellido2) AS NombreCompleto
FROM Clientes 
LEFT JOIN EvaluacionFisica ON Clientes.NumAfiliacion = EvaluacionFisica.NumAfiliacion
WHERE EvaluacionFisica.NumAfiliacion IS NULL
ORDER BY NombreCompleto
END
GO
--FIN

--Sesiones canceladas por mes 10
USE VITALPRO
GO
CREATE PROCEDURE SP_SESIONES_CANCELADAS_POR_MES
AS  
BEGIN
SELECT 
    MONTH(Sesion.Fecha) AS Mes,
    YEAR(Sesion.Fecha) AS years,
    COUNT(Sesion.Id_Sesion) AS TotalCanceladas
FROM Sesion
WHERE Sesion.Estado = 'Cancelada'
GROUP BY YEAR(Sesion.Fecha), MONTH(Sesion.Fecha)
ORDER BY years DESC, Mes DESC
END
GO
--FIN
-- Planes alimenticios por nutricionista 11
USE VITALPRO
GO
CREATE PROCEDURE SP_PLANES_ALIMENTICIOS_POR_NUTRICIONISTA
AS
BEGIN
SELECT 
    Nutricionista.IdNutricionista,
    RTRIM(Profesional.Nombre) + ' ' + 
    RTRIM(Profesional.Apellido1) + ' ' + 
    RTRIM(Profesional.Apellido2) AS NombreCompleto,
    COUNT(PlanAlimenticio.CodigoPlan) AS TotalPlanes
FROM Nutricionista
INNER JOIN Profesional     ON Nutricionista.CodigoProfesional = Profesional.CodigoProfesional
INNER JOIN PlanAlimenticio ON Nutricionista.IdNutricionista = PlanAlimenticio.IdNutricionista
GROUP BY Nutricionista.IdNutricionista, Profesional.Nombre, Profesional.Apellido1, Profesional.Apellido2
ORDER BY TotalPlanes DESC
END
GO
--FIN

--  Frecuencia de uso de ejercicios por rutina 12
USE VITALPRO
GO
CREATE PROCEDURE SP_EJERCICIOS_POR_RUTINA
AS
BEGIN
SELECT 
    RutinaEjercicio.Id_RutinaEjercicio,
    E.Nombre AS NombreEjercicio,
    COUNT(RutinaEjercicio.Id_Ejercicio) AS VecesUsado
FROM RutinaEjercicio 
INNER JOIN Ejercicio E ON RutinaEjercicio.Id_Ejercicio = E.Id_Ejercicio
GROUP BY RutinaEjercicio.Id_Ejercicio, E.Nombre
ORDER BY RutinaEjercicio.Id_Ejercicio, VecesUsado DESC
END
GO
--FIN

-- Profesionales sin sesiones asignadas 13
USE VITALPRO
GO
CREATE PROCEDURE SP_PROFESIONALES_SIN_SESIONES
AS
BEGIN
SELECT 
    Profesional.CodigoProfesional,
    RTRIM(Profesional.Nombre) + ' ' + 
    RTRIM(Profesional.Apellido1) + ' ' + 
    RTRIM(Profesional.Apellido2) AS NombreCompleto
FROM Profesional 
LEFT JOIN Sesion  ON Profesional.CodigoProfesional = Sesion.CodigoProfesional
WHERE Sesion.CodigoProfesional IS NULL
ORDER BY NombreCompleto
END
GO
--FIN

--Sesiones por estado general (Completadas, Canceladas, Pendientes) 14
USE VITALPRO
GO
CREATE PROCEDURE SP_SESIONES_POR_ESTADO
AS
BEGIN
    SELECT 
    Estado,
    COUNT(Sesion.Id_Sesion) AS Total
FROM Sesion
GROUP BY Estado
END
GO
--FIN

--Centros con mas clientes afiliados 15
SELECT 
    CentroVitalPro.Nombre AS Centro,
    COUNT(Profesional.CodigoProfesional) AS TotalProfesionales
FROM CentroVitalPro 
LEFT JOIN Profesional  ON CentroVitalPro.CodigoUnico = Profesional.CodigoCentro
GROUP BY CentroVitalPro.Nombre
ORDER BY TotalProfesionales DESC;
--FIN