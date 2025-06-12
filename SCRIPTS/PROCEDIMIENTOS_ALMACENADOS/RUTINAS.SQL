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
EXECUTE SP_RUTINAS_ACTIVAS_POR_NIVEL;
--FIN

