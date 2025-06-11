--Centros con mas clientes afiliados 15
USE VITALPRO
GO
CREATE PROCEDURE CENTROS_CON_MAS_CLIENTES_AFILIADOS
AS
BEGIN
SELECT 
    CentroVitalPro.Nombre AS Centro,
    COUNT(Profesional.CodigoProfesional) AS TotalProfesionales
FROM CentroVitalPro 
LEFT JOIN Profesional  ON CentroVitalPro.CodigoUnico = Profesional.CodigoCentro
GROUP BY CentroVitalPro.Nombre
ORDER BY TotalProfesionales DESC;
END
GO 
--FIN
EXECUTE CENTROS_CON_MAS_CLIENTES_AFILIADOS;
GO


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
EXECUTE SP_ENTRENADOR_CON_EL_CENTRO;
--FIN 

--Centros con mas clientes afiliados 15
USE VITALPRO
GO
CREATE PROCEDURE SP_CENTROS_CON_MAS_AFILIADOS
AS
BEGIN
SELECT 
    CentroVitalPro.Nombre AS Centro,
    COUNT(Profesional.CodigoProfesional) AS TotalProfesionales
FROM CentroVitalPro 
LEFT JOIN Profesional  ON CentroVitalPro.CodigoUnico = Profesional.CodigoCentro
GROUP BY CentroVitalPro.Nombre
ORDER BY TotalProfesionales DESC;
END
GO
EXECUTE SP_CENTROS_CON_MAS_AFILIADOS;
--FIN
