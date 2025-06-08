
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
--FIN restricción de Profesional Table 

-- RESTRICCIONES HORARIO PROFESIONAL
USE VITALPRO
GO
ALTER TABLE HorarioProfesional
ADD CONSTRAINT CHK_HorarioProfesional CHECK(
    LEN(LTRIM(RTRIM(DiaSemana))) >= 3 AND
    (HoraFin > HoraInicio)  
);
GO
-- FIN RESTRICCIONES HORARIO PROFESIONAL

-- RESTRICCIONES ENTRENADOR
USE VITALPRO
GO
ALTER TABLE Entrenador
ADD CONSTRAINT CHK_ENTRENADOR CHECK(
    (FechaFinal >= FechaInicio)
);
GO
-- FIN RESTRICCIONES ENTRENADOR
-- RESTRICCIONES CLIENTES
ALTER TABLE Clientes
ADD CONSTRAINT CHK_Clientes CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(Apellido1))) >= 3 AND
    LEN(LTRIM(RTRIM(Apellido2))) >= 3 AND
    LEN(LTRIM(RTRIM(Cedula))) >= 9 AND
    Genero IN ('M', 'F') AND
    FechaNacimiento <= GETDATE() AND
    LEN(LTRIM(RTRIM(Telefono))) >= 8 AND
    CorreoElectronico LIKE '_%@__%.__%' AND
    FechaIngreso >= FechaNacimiento
)
GO
--cédula única 
ALTER TABLE Clientes
ADD CONSTRAINT UQ_Clientes_Cedula UNIQUE (Cedula)
GO
-- telefono único 
ALTER TABLE Clientes
ADD CONSTRAINT UQ_Clientes_Telefono UNIQUE (Telefono)
GO
-- FIN RESTRICCIONES CLIENTES

-- RESTRICCIONES HORARIO CENTRO
USE VITALPRO
GO
ALTER TABLE HorarioCentro 
ADD CONSTRAINT CHK_HorarioCentro CHECK(
    (FechaFinal >= FechaInicio)
);
GO
-- FIN RESTRICCIONES HORARIO CENTRO

--  RESTRICCIONES EvaluaciónFisica
USE VITALPRO
GO

ALTER TABLE EvaluacionFisica
ADD CONSTRAINT CHK_EvaluacionFisica CHECK (
    Fecha <= GETDATE() AND
    (Peso > 0) AND
    (Estatura > 0) AND
    (GrasaCorporal >= 0) AND
    (MasaMuscular >= 0) AND
    LTRIM(RTRIM(NivelResistencia)) >= 3 AND
    LTRIM(RTRIM(Flexibilidad)) >= 3
)
GO
--  FIN RESTRICCIONES EvaluaciónFisica

-- RESTRICCIONES ESPECIALIDAD ENTRENADOR
USE VITALPRO
GO
ALTER TABLE Especialidad_Entrenador
ADD CONSTRAINT CHK_Especialidad_Entrenador CHECK(
    LEN(LTRIM(RTRIM(Nombre))) >= 3 
);
GO
-- FIN RESTRICCIONES ESPECIALIDAD ENTRENADOR


-- RESTRICCIONES NUTRICIONISTA
USE VITALPRO
GO
ALTER TABLE Nutricionista
ADD CONSTRAINT CHK_Nutricionista CHECK(
    (FechaFinal >= FechaInicio)
);
-- FIN RESTRICCIONES NUTRICIONISTA

-- RESTRICCIONES Especialidad_Nutricionista
USE VITALPRO
GO
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT CHK_Especialidad_Nutricionista CHECK(
    LEN(LTRIM(RTRIM(Nombre))) >= 3 
);
GO
-- FIN RESTRICCIONES Especialidad_Nutricionista


-- RESTRICCIONES VALOR NUTRICIONAL
USE VITALPRO
GO
ALTER TABLE ValorNutricional
ADD CONSTRAINT CHK_ValorNutricional CHECK (
    Calorias > 0 AND
    Proteinas >= 0 AND
    Carbohidratos >= 0 AND
    Calorias <= 10000 AND
    Proteinas <= 500 AND
    Carbohidratos <= 1000
)
GO
-- FIN RESTRICCIONES VALOR NUTRICIONAL

-- RESTRICCIONES  RECETA
USE VITALPRO
GO

ALTER TABLE Receta
ADD CONSTRAINT CHK_Receta CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
 (TiempoPreparacion > 0) AND
    (TiempoPreparacion <= 600)
)
GO
-- FIN RESTRICCIONES RECETA

-- RESTRICCIONES  UnidadMedida
USE VITALPRO
GO

ALTER TABLE UnidadMedida
ADD CONSTRAINT CHK_UnidadMedida CHECK (
    LEN(LTRIM(RTRIM(NombreUnidad))) >= 3
)
GO
-- FIN RESTRICCIONES  UnidadMedida
-- RESTRICCIONES Ingredientes 
USE VITALPRO
GO

ALTER TABLE Ingrediente
ADD CONSTRAINT CHK_Ingrediente CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(Id_Unidad))) > 0
)
GO
-- FIN RESTRICCIONES Ingredientes 

-- RESTRICCIONES RecetaIngredientes 
USE VITALPRO
GO
ALTER TABLE RecetaIngrediente
ADD CONSTRAINT CHK_RecetaIngrediente CHECK (
    Cantidad > 0 AND
    TiempoPreparacion > 0 AND
    TiempoPreparacion <= 180
)
GO
-- FIN RESTRICCIONES RecetaIngredientes

-- RESTRICCIONES PlanAlimenticio 
USE VITALPRO
GO
ALTER TABLE PlanAlimenticios
ADD CONSTRAINT CHK_PlanAlimenticio CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(MetaNutricional))) >= 5 AND
    (CaloriasDiariasEstim > 0)
)
GO
-- FIN RESTRICCIONES PlanAlimenticio 

-- RESTRICCIONES PlanAlimenticio 
USE VITALPRO
GO
ALTER TABLE Ejercicio
ADD CONSTRAINT CHK_Ejercicio CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(GrupoMuscularTrabajado))) >= 3 AND
    CantidadRepeticiones > 0 AND
    EquipamientoEspecial IN (0, 1)
)
GO
-- FIN RESTRICCIONES PlanAlimenticio 

-- RESTRICCIONES RutinaSemana
USE VITALPRO
GO
ALTER TABLE RutinaSemana
ADD CONSTRAINT CHK_RutinaSemana CHECK (
    LEN(LTRIM(RTRIM(DiaSemana))) >= 3 AND
    HoraFin > HoraInicio
)
GO
-- FIN RESTRICCIONES RutinaSemana

-- RESTRICCIONES rutina entrenamiento  
USE VITALPRO
GO

ALTER TABLE RutinaEntrenamiento
ADD CONSTRAINT CHK_RutinaEntrenamiento CHECK (
    LEN(LTRIM(RTRIM(DescripcionObjetivo))) >= 5 AND
    LEN(LTRIM(RTRIM(Nivel))) >= 3 AND
    (DuracionTotalxSemana > 0) AND
    (EjerciciosXDia > 0)
)
GO
-- FIN RESTRICCIONES rutina entrenamiento 

-- RESTRICCIONES PLANPERSONALIZADO
USE VITALPRO
GO

ALTER TABLE PlanPersonalizado
ADD CONSTRAINT CHK_PlanPersonalizado CHECK (
    (FechaFin >= FechaInicio)
)
-- FIN RESTRICCIONES PLANPERSONALIZADO

-- RESTRICCIONES EJERCICIO
USE VITALPRO
GO

ALTER TABLE Ejercicio
ADD CONSTRAINT CHK_Ejercicio CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(GrupoMuscularTrabajado))) >= 3 AND
    (CantidadRepeticiones > 0) AND
    EquipamientoEspecial IN (0, 1) -- opcional, consultar, lo hace de tip BIT
)
GO
-- FIN RESTRICCIONES EJERCICIO

-- RESTRICCIONES RUTINASEMANA
USE VITALPRO
GO

ALTER TABLE RutinaSemana
ADD CONSTRAINT CHK_RutinaSemana CHECK (
    LEN(LTRIM(RTRIM(DiaSemana))) >= 3 AND
    (HoraFin > HoraInicio)
)
GO
-- FIN RESTRICCIONES RUTINASEMANA
