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
EXECUTE SP_NUTRICIONISTAS_CON_EL_CENTRO;
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
EXECUTE SP_PLANES_ALIMENTICIOS_POR_NUTRICIONISTA;
--FIN
