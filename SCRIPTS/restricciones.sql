USE VITALPRO
GO

-- Restricción UNIQUE para NumContacto
ALTER TABLE CentroVitalPro
ADD CONSTRAINT UC_NumContacto UNIQUE (NumContacto)
GO

ALTER TABLE CentroVitalPro
ADD CONSTRAINT UC_Nombre UNIQUE (Nombre)
GO
-- Restricción CHECK para validar que los campos de texto tengan al menos cierta longitud
ALTER TABLE CentroVitalPro
ADD CONSTRAINT CHK_CentroVitalPro CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(Provincia))) >= 3 AND
    LEN(LTRIM(RTRIM(Canton))) >= 3 AND
    LEN(LTRIM(RTRIM(Distrito))) >= 3 AND
    LEN(LTRIM(RTRIM(DireccionExacta))) >= 5 AND
    LEN(LTRIM(RTRIM(NumContacto))) >= 8 AND
    (Estado IN (0, 1))
)
GO

-- fin validaciones para vitalpro

USE VITALPRO
GO

-- Restricción CHECK para validar lógica de horario
ALTER TABLE HorarioCentro
ADD CONSTRAINT CHK_HorarioCentro_Horas CHECK (
    HoraInicio < HoraFin
)
GO

-- Restricción CHECK para validar los días de la semana
ALTER TABLE HorarioCentro
ADD CONSTRAINT CHK_HorarioCentro_DiaSemana CHECK (
    DiaSemana IN ('Lunes', 'Martes', 'Miércoles', 'Miercoles', 'Jueves', 'Viernes', 'Sábado', 'Sabado', 'Domingo')
)
GO

-- Restricción CHECK para valores válidos en Estado
ALTER TABLE HorarioCentro
ADD CONSTRAINT CHK_HorarioCentro_Estado CHECK (
    Estado IN (0, 1)
)
GO

-- validaciones para HorarioCentro




--restricción de Profesional Table 
USE VITALPRO
GO
ALTER TABLE Profesional
ADD CONSTRAINT UC_CodigoProfesional UNIQUE (CedProfesional) 
GO 
ALTER TABLE Profesional
ADD CONSTRAINT CHK_profesional CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(Apellido1))) >= 3 AND
    LEN(LTRIM(RTRIM(Apellido2))) >= 3 AND
    (AniosExperiencia>=0)
    );
GO

ALTER TABLE Profesional
ADD CONSTRAINT CHK_Profesional_Estado CHECK (
    Estado IN (0, 1)
)
GO
--FIN restricción de Profesional Table 

-- RESTRICCIONES HORARIO PROFESIONAL
USE VITALPRO
GO

-- Validar que la hora de inicio sea menor que la hora de fin
ALTER TABLE HorarioProfesional
ADD CONSTRAINT CHK_HorarioProfesional_Horas CHECK (
    HoraInicio < HoraFin
)
GO

-- Validar que el día de la semana sea uno de los valores permitidos
ALTER TABLE HorarioProfesional
ADD CONSTRAINT CHK_HorarioProfesional_Dia CHECK (
    DiaSemana IN ('Lunes', 'Martes', 'Miércoles', 'Miercoles', 'Jueves', 'Viernes', 'Sábado', 'Sabado', 'Domingo')
)
GO

-- Validar que el estado solo sea 0 o 1
ALTER TABLE HorarioProfesional
ADD CONSTRAINT CHK_HorarioProfesional_Estado CHECK (
    Estado IN (0, 1)
)
GO

-- FIN RESTRICCIONES HORARIO PROFESIONAL

-- RESTRICCIONES ENTRENADOR
USE VITALPRO
GO

-- Validar que la longitud del IdEntrenador sea exactamente 4 caracteres (como "E001", "N23A", etc.)
ALTER TABLE Entrenador
ADD CONSTRAINT CHK_Entrenador_Id CHECK (
    LEN(LTRIM(RTRIM(IdEntrenador))) = 4
)
GO

-- Validar que si se especifica FechaFinal, sea mayor o igual a FechaInicio
ALTER TABLE Entrenador
ADD CONSTRAINT CHK_Entrenador_Fechas CHECK (
    FechaFinal IS NULL OR FechaFinal >= FechaInicio
)
GO

-- Validar que Estado sea 0 o 1
ALTER TABLE Entrenador
ADD CONSTRAINT CHK_Entrenador_Estado CHECK (
    Estado IN (0, 1)
)
GO

-- FIN RESTRICCIONES ENTRENADOR


--- validaciones especialidad entrenador
USE VITALPRO
GO

-- Validar que el ID tenga exactamente 5 caracteres
ALTER TABLE Especialidad_Entrenador
ADD CONSTRAINT CHK_EspecEntrenador_Id CHECK (
    LEN(LTRIM(RTRIM(IdEspecialidad))) = 5
)
GO

-- Validar que el nombre de la especialidad tenga al menos 3 caracteres
ALTER TABLE Especialidad_Entrenador
ADD CONSTRAINT CHK_EspecEntrenador_Nombre CHECK (
    LEN(LTRIM(RTRIM(NombreEspecialidad))) >= 3
)
GO

-- Validar que el estado sea 0 o 1
ALTER TABLE Especialidad_Entrenador
ADD CONSTRAINT CHK_EspecEntrenador_Estado CHECK (
    Estado IN (0, 1)
)
GO

-- fin validaciones especialidad entrenador

-- validaciones nutricionista
USE VITALPRO
GO

-- Validar que el ID del nutricionista tenga exactamente 4 caracteres
ALTER TABLE Nutricionista
ADD CONSTRAINT CHK_Nutricionista_Id CHECK (
    LEN(LTRIM(RTRIM(IdNutricionista))) = 4
)
GO

-- Validar que la fecha final (si se especifica) sea igual o posterior a la fecha de inicio
ALTER TABLE Nutricionista
ADD CONSTRAINT CHK_Nutricionista_Fechas CHECK (
    FechaFinal IS NULL OR FechaFinal >= FechaInicio
)
GO

-- Validar que el estado sea 0 o 1
ALTER TABLE Nutricionista
ADD CONSTRAINT CHK_Nutricionista_Estado CHECK (
    Estado IN (0, 1)
)
GO
-- fin validaciones nutricionista

 -- validaciones especialidad nutricionista
USE VITALPRO
GO

-- Validar que el ID tenga exactamente 5 caracteres
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT CHK_EspecNutricionista_Id CHECK (
    LEN(LTRIM(RTRIM(IdEspecialidad))) = 5
)
GO

-- Validar que el nombre tenga al menos 3 caracteres
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT CHK_EspecNutricionista_Nombre CHECK (
    LEN(LTRIM(RTRIM(NombreEspecialidad))) >= 3
)
GO

-- Validar que Estado sea 0 o 1
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT CHK_EspecNutricionista_Estado CHECK (
    Estado IN (0, 1)
)
GO

ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT UQ_EspecNutricionista_Nombre UNIQUE (NombreEspecialidad)
GO

 -- fin validaciones especialidad nutricionista


 -- validaciones valor nutricional
 USE VITALPRO
GO

-- Validar que los valores nutricionales no sean negativos
ALTER TABLE ValorNutricional
ADD CONSTRAINT CHK_VN_ValoresPositivos CHECK (
    Calorias >= 0 AND
    Proteinas >= 0 AND
    Carbohidratos >= 0
)
GO

-- Validar que Estado sea 0 o 1
ALTER TABLE ValorNutricional
ADD CONSTRAINT CHK_VN_Estado CHECK (
    Estado IN (0, 1)
)
GO


-- final validaciones valor nutricional


-- validaciones receta

USE VITALPRO
GO

-- Validar que el nombre tenga al menos 3 caracteres
ALTER TABLE Receta
ADD CONSTRAINT CHK_Receta_Nombre CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3
)
GO

-- Validar que el tiempo de preparación sea mayor o igual a 0
ALTER TABLE Receta
ADD CONSTRAINT CHK_Receta_TiempoPreparacion CHECK (
    TiempoPreparacion >= 0
)
GO

-- Validar que Estado sea 0 o 1
ALTER TABLE Receta
ADD CONSTRAINT CHK_Receta_Estado CHECK (
    Estado IN (0, 1)
)
GO


-- final validaciones receta


