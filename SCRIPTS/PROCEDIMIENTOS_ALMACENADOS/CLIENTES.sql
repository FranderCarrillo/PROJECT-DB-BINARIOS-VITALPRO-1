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
EXECUTE SP_CLIENTES_SIN_ASISTENCIA_EL_ULTIMO_MES;
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
EXECUTE SP_CLIENTES_SIN_EVALUACION;
--FIN