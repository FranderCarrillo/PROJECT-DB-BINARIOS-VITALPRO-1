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
EXECUTE SP_ENTRENADOR_CON_EL_CENTRO ;
--FIN 


