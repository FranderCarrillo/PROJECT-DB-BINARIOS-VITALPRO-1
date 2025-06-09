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
EXECUTE SP_PROFESIONALES_SIN_SESIONES;
--FIN

--Reservas por profesional en una semana 2
USE VITALPRO
GO
CREATE OR ALTER PROCEDURE SP_RESERVAS_POR_PROFESIONAL_EN_UNA_SEMANA
AS
BEGIN
    SELECT 
        Profesional.CodigoProfesional,
        RTRIM(Profesional.Nombre)+ ' ' +
        RTRIM(Profesional.Apellido1) + ' ' + 
        RTRIM(Profesional.Apellido2) AS NombreCompleto,
        DATEPART(WEEK, Sesion.Fecha) AS Semana,
        COUNT(Sesion.Id_Sesion) AS TotalSesiones
    FROM Sesion
    INNER JOIN Profesional ON Sesion.CodigoProfesional = Profesional.CodigoProfesional
    GROUP BY 
        Profesional.CodigoProfesional,
        Profesional.Nombre,
        Profesional.Apellido1,
        Profesional.Apellido2,
        DATEPART(WEEK, Sesion.Fecha)
    ORDER BY Semana;
END
GO
EXECUTE SP_RESERVAS_POR_PROFESIONAL_EN_UNA_SEMANA;
-- FIN