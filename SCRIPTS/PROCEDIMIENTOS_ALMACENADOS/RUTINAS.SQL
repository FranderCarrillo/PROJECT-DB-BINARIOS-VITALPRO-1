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
EXECUTE SP_EJERCICIOS_POR_RUTINA; 
--FIN



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

