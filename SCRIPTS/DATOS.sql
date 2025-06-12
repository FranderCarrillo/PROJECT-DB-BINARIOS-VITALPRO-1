EXECUTE SP_InsertarCentroVitalPro 
   'Hojancha Vital Pro', 
   'Guanacaste', 
   'Hojancha', 
   'Hojancha', 
   '50 metros al este de la casa de Samuel', 
   '2659-3333';
GO



EXECUTE SP_InsertarHorarioCentro 
    'Lunes', 
    '08:00:00', 
    '20:00:00', 
    1;
GO

EXECUTE SP_InsertarProfesional 
   'María', 
   'Gómez', 
   'López', 
   '507960123', 
   4, 
   1;
GO

EXECUTE SP_InsertarHorarioProfesional 
   1, 
   'Martes', 
   '09:00:00', 
   '17:00:00';
GO


EXECUTE SP_InsertarEntrenador 
   '2023-01-01', 
   NULL, 
   1;
GO

Select * from Entrenador
GO


EXECUTE SP_InsertarEspecialidadEntrenador 
   'Cardio'
GO

USE VITALPRO
GO
Select * from Especialidad_Entrenador
GO


EXECUTE SP_InsertarEntrenadorEspecialidad 
   'E001',
	'ES001'
GO



EXECUTE SP_InsertarNutricionista 
   '2023-01-15', 
   NULL, 
   1;
GO

EXECUTE SP_InsertarEspecialidadNutricionista 
   'Adapatacion';
GO


EXECUTE SP_InsertarNutricionistaEspecialidad 
   'N001',
   'SN001';


EXECUTE SP_InsertarValorNutricional 
   250, 
   15.5,
   40.0;
GO

USe VITALPRO
GO
EXECUTE SP_InsertarReceta 
   'Ensalada Vegana', 
   10, 
   1;

   EXECUTE SP_InsertarUnidadMedida 
   'Gramos';
GO

EXECUTE SP_InsertarIngrediente 
   'Pollo', 
   'U001';
GO

EXECUTE SP_InsertarRecetaIngrediente 
   1, 
   1, 
   100.0, 
   5;
GO

EXECUTE SP_InsertarPlanAlimenticio 
   'Plan Vegano', 
   'Perder peso', 
   1500, 
   'Plan personalizado para bajar grasa', 
   'N001';
GO


 
EXECUTE SP_InsertarComida 
   'Desayuno', 
   1;
GO

EXECUTE SP_InsertarComidaReceta 
   1, 
   1;
GO


EXECUTE SP_InsertarPlanAlimenticioComida 
   1, 
   1;
GO


EXECUTE SP_InsertarEjercicio 
   'Sentadillas', 
   'Piernas', 
   12, 
   0;
GO

EXECUTE SP_InsertarRutinaEntrenamiento 
   'Volumen', 
   'Avanzado',
   4, 
   'E001';
GO

EXECUTE SP_InsertarRutinaSemana 
   'Martes', 
   '08:00:00', 
   '10:00:00',
   1;
GO


EXECUTE SP_InsertarRutinaEjercicio 
   1, 
   1;
GO


EXECUTE SP_InsertarCliente 
   'Juan', 
   'Pérez', 
   'Gomez',
   '501230456',
   'M',
   '1990-05-05',
   '8888-9999',
   'juan@gmail.com',
   '2024-01-01',
   'E001',
   1;
GO


EXECUTE SP_InsertarPlanPersonalizado 
   '2024-01-01', 
   '2024-12-31', 
   1, 
   1, 
   1;
GO

EXECUTE SP_InsertarSesion 
   'Entrenamiento', 
   '2024-01-15', 
   '10:00:00', 
   60,
   1, 
   1, 
   1;
GO

EXECUTE SP_InsertarEvaluacionFisica 
   '2024-03-10',
   68.2,
   1.68,
   17.3,
   28.5,
   'Intermedio',
   'Buena',
   1,
   1,
   1;
GO