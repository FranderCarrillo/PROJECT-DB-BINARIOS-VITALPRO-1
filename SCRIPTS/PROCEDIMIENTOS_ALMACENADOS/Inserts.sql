--restricción de CentroVitalPro Table 
USE VITALPRO
GO
ALTER TABLE CentroVitalPro
ADD CONSTRAINT UQ_Centro_NombreDistrito UNIQUE(Nombre,Distrito);
GO
ALTER TABLE CentroVitalPro
ADD CONSTRAINT UQ_Centro_Numero UNIQUE(NumContacto);

ALTER TABLE CentroVitalPro
ADD CONSTRAINT UQ_Centro_Codigo UNIQUE(CodigoUnico);

ALTER TABLE CentroVitalPro
ADD CONSTRAINT CHK_CentroVitalPro CHECK (
    LEN(LTRIM(RTRIM(Nombre)))>=3 AND
    LEN(LTRIM(RTRIM( NumContacto))) >=8
)
--restricción de Profesional Table 
USE VITALPRO
GO
ALTER TABLE Profesional
ADD CONSTRAINT UC_CodigoProfesional UNIQUE (CedProfesional);
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
ADD CONSTRAINT UQ_Horario_Codigo UNIQUE(IdHorario);
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
ADD CONSTRAINT UQ_Entrenador_Codigo UNIQUE(IdEntrenador);
ALTER TABLE Entrenador
ADD CONSTRAINT CHK_ENTRENADOR CHECK(
    IdEntrenador LIKE 'E%' AND
    (FechaFinal >= FechaInicio)
);
GO
-- FIN RESTRICCIONES ENTRENADOR
-- RESTRICCIONES CLIENTES
ALTER TABLE Clientes
ADD CONSTRAINT UQ_Clientes_Codigo UNIQUE(NumAfiliacion);
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
ADD CONSTRAINT UQ_HorarioCentro_Codigo UNIQUE(Id_Horario);
ALTER TABLE HorarioCentro 
ADD CONSTRAINT CHK_HorarioCentro CHECK(
    (HoraFin >= HoraInicio) AND
    DiaSemana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo')
);
GO
-- FIN RESTRICCIONES HORARIO CENTRO

--  RESTRICCIONES EvaluaciónFisica
USE VITALPRO
GO
ALTER TABLE EvaluacionFisica
ADD CONSTRAINT UQ_EvaluacionFisica_Codigo UNIQUE(Id_EvaluacionFisica);
ALTER TABLE EvaluacionFisica
ADD CONSTRAINT CHK_EvaluacionFisica CHECK (
    Fecha <= GETDATE() AND
    (Peso > 0) AND
    (Estatura > 0) AND
    (PorcentajeGrasaCorporal >= 0) AND
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
ADD CONSTRAINT UQ_EspecialidadEntrenador_Codigo UNIQUE(IdEspecialidad);
ALTER TABLE Especialidad_Entrenador
ADD CONSTRAINT CHK_Especialidad_Entrenador CHECK(
    LEN(LTRIM(RTRIM(NombreEspecialidad))) >= 3 
);
GO
-- FIN RESTRICCIONES ESPECIALIDAD ENTRENADOR

-- RESTRICCIONES Entrenador ESPECIALIDAD 
ALTER TABLE Entrenador_Especialidad
ADD CONSTRAINT UQ_EntrenadorEspecialidad_Codigo UNIQUE(Id);
ALTER TABLE Entrenador_Especialidad
ADD CONSTRAINT UQ_EntrenadorEspecialidad UNIQUE (IdEntrenador, IdEspecialidad);
--FIN
-- RESTRICCIONES NUTRICIONISTA
USE VITALPRO
GO
ALTER TABLE Nutricionista
ADD CONSTRAINT UQ_Nutricionista_Codigo UNIQUE(IdNutricionista);
ALTER TABLE Nutricionista
ADD CONSTRAINT CHK_Nutricionista CHECK(
    IdNutricionista LIKE 'E%' AND
    (FechaFinal >= FechaInicio)
);
-- FIN RESTRICCIONES NUTRICIONISTA

-- RESTRICCIONES Especialidad_Nutricionista
USE VITALPRO
GO
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT UQ_EspecialidadNutricionista_Codigo UNIQUE(IdEspecialidad);
ALTER TABLE Especialidad_Nutricionista
ADD CONSTRAINT CHK_Especialidad_Nutricionista CHECK(
    LEN(LTRIM(RTRIM(NombreEspecialidad))) >= 3 
);
GO
-- FIN RESTRICCIONES Especialidad_Nutricionista

-- RESTRICCIONES Nutricionista_Especialidad
ALTER TABLE Nutricionista_Especialidad
ADD CONSTRAINT UQ_NutricionistaEspecialidad_Codigo UNIQUE(Id);
ALTER TABLE Nutricionista_Especialidad
ADD CONSTRAINT UQ_NutricionistaEspecialidad UNIQUE (IdNutricionista, IdEspecialidad);
--FIN 

-- RESTRICCIONES VALOR NUTRICIONAL
USE VITALPRO
GO
ALTER TABLE ValorNutricional
ADD CONSTRAINT UQ_ValorNutricional_Codigo UNIQUE(IdValorNutricional);
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
ADD CONSTRAINT UQ_Receta_Codigo UNIQUE(Id_Receta);
ALTER TABLE Receta 
ADD CONSTRAINT Receta_Name UNIQUE(Nombre)
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
ADD CONSTRAINT UQ_UnidadMedida_Codigo UNIQUE(Id_Unidad);
ALTER TABLE UnidadMedida 
ADD CONSTRAINT UnidadMedida_Name UNIQUE(NombreUnidad)
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
ADD CONSTRAINT UQ_Ingrediente_Codigo UNIQUE(Id_Ingrediente);
ALTER TABLE Ingrediente 
ADD CONSTRAINT Ingrediente_Name UNIQUE(Nombre)
go 
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
ADD CONSTRAINT UQ_RecetaIngrediente_Codigo UNIQUE(Id_RecetaIngredientes);
ALTER TABLE RecetaIngrediente
ADD CONSTRAINT UQ_RecetaIngrediente UNIQUE (Id_Receta,Id_Ingrediente);
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
ALTER TABLE PlanAlimenticio
ADD CONSTRAINT UQ_PlanAlimenticio_Codigo UNIQUE(CodigoPlan);
ALTER TABLE PlanAlimenticio
ADD CONSTRAINT PlanAlimenticio_Name UNIQUE (Nombre)
GO
ALTER TABLE PlanAlimenticio
ADD CONSTRAINT CHK_PlanAlimenticio CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(MetaNutricional))) >= 5 AND
    (CaloriasDiariasEstim > 0)
)
GO
-- FIN RESTRICCIONES PlanAlimenticio 

-- RESTRICCIONES Ejercicio
USE VITALPRO
GO
ALTER TABLE Ejercicio
ADD CONSTRAINT UQ_Ejercicio_Codigo UNIQUE(Id_Ejercicio);
ALTER Table Ejercicio
ADD CONSTRAINT Ejercicio_Name UNIQUE (Nombre)
GO
ALTER TABLE Ejercicio
ADD CONSTRAINT CHK_Ejercicio CHECK (
    LEN(LTRIM(RTRIM(Nombre))) >= 3 AND
    LEN(LTRIM(RTRIM(GrupoMuscularTrabajado))) >= 3 AND
    CantidadRepeticiones > 0 AND
    EquipamientoEspecial IN (0, 1)
)
GO
-- FIN

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

-- Restricciones para PlanAlimenticio_Comida
USE VITALPRO
GO
ALTER TABLE PlanAlimenticio_Comida
ADD CONSTRAINT UQ_PlanComida UNIQUE (Id_Comida, CodigoPlan);
--FIN

