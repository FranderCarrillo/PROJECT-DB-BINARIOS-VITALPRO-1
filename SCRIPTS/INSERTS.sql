USE VITALPRO
GO
INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro Nicoya', 'Guanacaste', 'Nicoya', 'San Martín', 'Frente al parque central', '8888-8888');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro Liberia', 'Guanacaste', 'Liberia', 'Barrio La Cruz', 'Contiguo al Hospital de Liberia', '8888-1111');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro Santa Cruz', 'Guanacaste', 'Santa Cruz', 'Tamarindo', 'Detrás del supermercado ABC', '8888-2222');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro Puntarenas', 'Puntarenas', 'Puntarenas', 'Barrio El Carmen', 'Frente al muelle', '8888-3333');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro Cartago', 'Cartago', 'Cartago', 'Occidental', '100 metros norte de la Basílica', '8888-4444');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro San José', 'San José', 'San José', 'Catedral', 'Avenida Central, Edificio Vital', '8888-5555');

INSERT INTO CentroVitalPro (Nombre, Provincia, Canton, Distrito, DireccionExacta, NumContacto)
VALUES ('Centro San José', 'San José', 'San José', 'Catedral', 'Avenida Central, Edificio Vital', '8988-5555');


Select * from CentroVitalPro
go



INSERT INTO Profesional (Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro)
VALUES ('Carlos', 'Ramírez', 'Solano', 'P123456789', 5, 1);

INSERT INTO Profesional (Nombre, Apellido1, Apellido2, CedProfesional, AniosExperiencia, CodigoCentro)
VALUES ('José Daniel', 'Román', 'Fernández', 'P123456619', 4, 3);


INSERT INTO Entrenador (IdEntrenador, FechaInicio, FechaFinal, CodigoProfesional)
VALUES ('E001', '2023-01-01', NULL, 1);
GO

INSERT INTO Entrenador (FechaInicio, FechaFinal, CodigoProfesional)
VALUES ('2025-04-01', NULL, 2);



INSERT INTO Especialidad_Entrenador (IdEspecialidad, NombreEspecialidad)
VALUES ('ESP01', 'Cardio Fitness');


INSERT INTO Entrenador_Especialidad (Id, IdEntrenador, IdEspecialidad)
VALUES ('EE01', 'E001', 'ESP01');

INSERT INTO Nutricionista (IdNutricionista, FechaInicio, FechaFinal, CodigoProfesional)
VALUES ('N001', '2023-01-15', NULL, 1);


INSERT INTO Especialidad_Nutricionista (IdEspecialidad, NombreEspecialidad)
VALUES ('EN01', 'Dieta Vegana');

INSERT INTO Nutricionista_Especialidad (Id, IdNutricionista, IdEspecialidad)
VALUES ('NE01', 'N001', 'EN01');


INSERT INTO ValorNutricional (Calorias, Proteinas, Carbohidratos)
VALUES (300, 15.5, 40.0);

INSERT INTO Receta (Id_Receta, Nombre, TiempoPreparacion, IdValorNutricional)
VALUES (1, 'Ensalada Vegana', 10, 1);

INSERT INTO UnidadMedida (Id_Unidad, NombreUnidad)
VALUES ('GRM', 'Gramos');


INSERT INTO Ingrediente (Nombre, Id_Unidad)
VALUES ('Lechuga', 'GRM');


INSERT INTO RecetaIngrediente (Id_RecetaIngredientes, Id_Receta, Id_Ingrediente, Cantidad, TiempoPreparacion)
VALUES (1, 1, 1, 100.0, 5);

INSERT INTO PlanAlimenticio (CodigoPlan, Nombre, MetaNutricional, CaloriasDiariasEstim, Observaciones, IdNutricionista)
VALUES (1, 'Plan Vegano', 'Perder peso', 1500, 'Plan personalizado para bajar grasa', 'N001');

INSERT INTO Comida (Id_Comida, TipoComida, CodigoPlan)
VALUES (1, 'Almuerzo', 1);

INSERT INTO ComidaReceta (Id_ComidaReceta, Id_Comida, Id_Receta)
VALUES (1, 1, 1);

INSERT INTO PlanAlimenticio_Comida (Id_PlanAlimenticio_Comida, Id_Comida, CodigoPlan)
VALUES (1, 1, 1);

INSERT INTO Ejercicio (Id_Ejercicio, Nombre, GrupoMuscularTrabajado, CantidadRepeticiones, EquipamientoEspecial)
VALUES (1, 'Sentadillas', 'Piernas', 12, 0);

INSERT INTO RutinaSemana (Id_RutinaSemana, DiaSemana, HoraInicio, HoraFin)
VALUES (1, 'Lunes', '07:00', '08:00');

INSERT INTO RutinaEntrenamiento (Id_Rutina, DescripcionObjetivo, Nivel, DuracionTotalxSemana, EjerciciosXDia, IdEntrenador, Id_RutinaSemana)
VALUES (1, 'Bajar grasa corporal', 'Intermedio', 5, 4, 'E001', 1);


INSERT INTO RutinaEjercicio (Id_RutinaEjercicio, Id_Ejercicio, Id_RutinaSemana)
VALUES (1, 1, 1);

INSERT INTO HorarioCentro (DiaSemana, HoraInicio, HoraFin, CodigoUnicoCentro)
VALUES ('Lunes', '08:00', '16:00', 1);

INSERT INTO HorarioProfesional (CodigoProfesional, DiaSemana, HoraInicio, HoraFin)
VALUES (1, 'Martes', '09:00', '15:00');


INSERT INTO Clientes (NumAfiliacion, Nombre, Apellido1, Apellido2, Cedula, Genero, FechaNacimiento, Telefono, CorreoElectronico, FechaIngreso, IdEntrenador, CodigoUnicoCentro)
VALUES (1, 'María', 'Pérez', 'López', '206580134', 'F', '1995-06-12', '8888-1111', 'maria@example.com', '2024-01-01', 'E001', 1);

