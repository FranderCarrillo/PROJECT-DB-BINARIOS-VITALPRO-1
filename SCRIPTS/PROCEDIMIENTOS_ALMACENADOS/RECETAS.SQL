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
EXECUTE SP_RECETAS_MAS_UTILIZADAS_POR_TIPO_DE_PLAN;
--FIN