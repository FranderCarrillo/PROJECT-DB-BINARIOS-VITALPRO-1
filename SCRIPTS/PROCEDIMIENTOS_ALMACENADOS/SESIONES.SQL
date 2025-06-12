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
WHERE Sesion.Fase = 'Cancelada'
GROUP BY YEAR(Sesion.Fecha), MONTH(Sesion.Fecha)
ORDER BY years DESC, Mes DESC
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
    Fase,
    COUNT(Sesion.Id_Sesion) AS Total
FROM Sesion
GROUP BY Fase
END
GO
--FIN