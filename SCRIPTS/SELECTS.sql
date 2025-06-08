-- Seguimiento de progreso físico por cliente
USE VITALPRO
GO
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
GO

--Reservas por profesional en una semana
SELECT 
Profesional.CodigoProfesional,
Profesional.Nombre + ' ' + Profesional.Apellido1 + ' ' + Profesional.Apellido2 AS NombreCompleto,
DATEPART(WEEK, Sesion.Fecha) AS Semana,
COUNT(*) AS TotalSesiones
FROM Sesion inner JOIN Profesional ON Sesion.CodigoProfesional = Profesional.CodigoProfesional
GROUP BY Profesional.CodigoProfesional, Profesional.Nombre, Profesional.Apellido1, Profesional.Apellido2, DATEPART(WEEK, Sesion.Fecha)
ORDER BY Semana;
GO

-- RUTINAS ACTIVAS POR NIVEL
USE VITALPRO
GO
SELECT 
    RutinaEntrenamiento.Nivel,
    COUNT(RutinaEntrenamiento.Id_Rutina) AS TotalRutinasActivas
FROM RutinaEntrenamiento
GROUP BY RutinaEntrenamiento.Nivel
ORDER BY RutinaEntrenamiento.Nivel;
GO

--Recetas más utilizadas por tipo de plan
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
GO

-- Clientes con mayor adherencia (porcentaje de sesiones asistidas vs. reservadas)
SELECT 
    Clientes.NumAfiliacion,
    RTRIM(Clientes.Nombre + ' ' + Clientes.Apellido1 + ' ' + Clientes.Apellido2) AS NombreCompleto,
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
GO

select 
Entrenador.IdEntrenador,
RTRIM(Profesional.Nombre) + ' ' + RTRIM(Profesional.Apellido1) + ' ' + RTRIM(Profesional.Apellido2) AS NombreCompleto,
CentroVitalPro.Nombre
from Profesional inner join Entrenador on Profesional.CodigoProfesional = Entrenador.CodigoProfesional
				 inner join CentroVitalPro on Profesional.CodigoCentro = CentroVitalPro.CodigoUnico
GO