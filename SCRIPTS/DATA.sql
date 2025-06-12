EXECUTE SP_InsertarCentroVitalPro 
    'Hojancha Vital Pro', 
    'Guanacaste', 
    'Hojancha', 
    'Hojancha', 
    '50 metros al este de la casa de Samuel', 
    '2659-3331';
GO

EXECUTE SP_InsertarCentroVitalPro 
    'Nandayure Vital Pro', 
    'Guanacaste', 
    'Nandayure', 
    'Carmona', 
    '50 metros al este de la casa de Frander', 
    '2659-3332';
GO

EXECUTE SP_InsertarCentroVitalPro 
    'Moracia Vital Pro', 
    'Guanacaste', 
    'Nicoya', 
    'Moracia', 
    '50 metros al este de la casa de Brenda', 
    '2659-3333';
GO

EXECUTE SP_InsertarCentroVitalPro 
    'Rio Cañas Vital Pro', 
    'Guanacaste', 
    'Belén', 
    'Río Cañas', 
    '50 metros al este de la casa de Nixon', 
    '2659-3334';
GO

EXECUTE SP_InsertarCentroVitalPro 
    'Santa Cruz Vital Pro', 
    'Guanacaste', 
    'Santa Cruz', 
    'Santa Cruz', 
    '50 metros al este de la casa del Profe', 
    '2659-3335';
GO

SELECT * from CentroVitalPro
-- inserts de centro vitalproUSE VITALPRO


-- Centro 1
EXECUTE SP_InsertarHorarioCentro 'Lunes',    '08:00:00', '20:00:00', 1;
EXECUTE SP_InsertarHorarioCentro 'Martes',   '08:00:00', '20:00:00', 1;
EXECUTE SP_InsertarHorarioCentro 'Miércoles','08:00:00', '20:00:00', 1;
EXECUTE SP_InsertarHorarioCentro 'Jueves',   '08:00:00', '20:00:00', 1;
EXECUTE SP_InsertarHorarioCentro 'Viernes',  '08:00:00', '20:00:00', 1;
EXECUTE SP_InsertarHorarioCentro 'Sábado',   '08:00:00', '20:00:00', 1;

-- Centro 2
EXECUTE SP_InsertarHorarioCentro 'Lunes',    '08:00:00', '20:00:00', 2;
EXECUTE SP_InsertarHorarioCentro 'Martes',   '08:00:00', '20:00:00', 2;
EXECUTE SP_InsertarHorarioCentro 'Miércoles','08:00:00', '20:00:00', 2;
EXECUTE SP_InsertarHorarioCentro 'Jueves',   '08:00:00', '20:00:00', 2;
EXECUTE SP_InsertarHorarioCentro 'Viernes',  '08:00:00', '20:00:00', 2;
EXECUTE SP_InsertarHorarioCentro 'Sábado',   '08:00:00', '20:00:00', 2;

-- Centro 3
EXECUTE SP_InsertarHorarioCentro 'Lunes',    '08:00:00', '20:00:00', 3;
EXECUTE SP_InsertarHorarioCentro 'Martes',   '08:00:00', '20:00:00', 3;
EXECUTE SP_InsertarHorarioCentro 'Miércoles','08:00:00', '20:00:00', 3;
EXECUTE SP_InsertarHorarioCentro 'Jueves',   '08:00:00', '20:00:00', 3;
EXECUTE SP_InsertarHorarioCentro 'Viernes',  '08:00:00', '20:00:00', 3;
EXECUTE SP_InsertarHorarioCentro 'Sábado',   '08:00:00', '20:00:00', 3;

-- Centro 4
EXECUTE SP_InsertarHorarioCentro 'Lunes',    '08:00:00', '20:00:00', 4;
EXECUTE SP_InsertarHorarioCentro 'Martes',   '08:00:00', '20:00:00', 4;
EXECUTE SP_InsertarHorarioCentro 'Miércoles','08:00:00', '20:00:00', 4;
EXECUTE SP_InsertarHorarioCentro 'Jueves',   '08:00:00', '20:00:00', 4;
EXECUTE SP_InsertarHorarioCentro 'Viernes',  '08:00:00', '20:00:00', 4;
EXECUTE SP_InsertarHorarioCentro 'Sábado',   '08:00:00', '20:00:00', 4;

-- Centro 5
EXECUTE SP_InsertarHorarioCentro 'Lunes',    '08:00:00', '20:00:00', 5;
EXECUTE SP_InsertarHorarioCentro 'Martes',   '08:00:00', '20:00:00', 5;
EXECUTE SP_InsertarHorarioCentro 'Miércoles','08:00:00', '20:00:00', 5;
EXECUTE SP_InsertarHorarioCentro 'Jueves',   '08:00:00', '20:00:00', 5;
EXECUTE SP_InsertarHorarioCentro 'Viernes',  '08:00:00', '20:00:00', 5;
EXECUTE SP_InsertarHorarioCentro 'Sábado',   '08:00:00', '20:00:00', 5;
GO
-- inserts de horarios de centros


-- Centro 1
EXECUTE SP_InsertarProfesional 'Ana',     'González', 'Mora',    'CED001', 5, 1;
EXECUTE SP_InsertarProfesional 'Luis',    'Ramírez',  'Castro',  'CED002', 7, 1;
EXECUTE SP_InsertarProfesional 'Carlos',  'Solís',    'Vargas',  'CED003', 3, 1;
EXECUTE SP_InsertarProfesional 'Laura',   'Martínez', 'Chaves',  'CED004', 6, 1;

-- Centro 2
EXECUTE SP_InsertarProfesional 'Jorge',   'Rojas',    'Araya',   'CED005', 4, 2;
EXECUTE SP_InsertarProfesional 'María',   'Pérez',    'Méndez',  'CED006', 8, 2;
EXECUTE SP_InsertarProfesional 'Elena',   'Vega',     'Soto',    'CED007', 2, 2;
EXECUTE SP_InsertarProfesional 'Marco',   'Jiménez',  'Ruiz',    'CED008', 9, 2;

-- Centro 3
EXECUTE SP_InsertarProfesional 'Daniel',  'Alvarado', 'Campos',  'CED009', 5, 3;
EXECUTE SP_InsertarProfesional 'Rosa',    'Aguilar',  'Navarro', 'CED010', 6, 3;
EXECUTE SP_InsertarProfesional 'Pedro',   'Salazar',  'López',   'CED011', 4, 3;
EXECUTE SP_InsertarProfesional 'Natalia', 'Cordero',  'Brenes',  'CED012', 7, 3;

-- Centro 4
EXECUTE SP_InsertarProfesional 'Kevin',   'Ureña',    'Sánchez', 'CED013', 3, 4;
EXECUTE SP_InsertarProfesional 'Andrea',  'Sequeira', 'Rojas',   'CED014', 5, 4;
EXECUTE SP_InsertarProfesional 'Mauricio','Venegas',  'Picado',  'CED015', 6, 4;
EXECUTE SP_InsertarProfesional 'Estefany','Vargas',   'Chacón',  'CED016', 8, 4;

-- Centro 5
EXECUTE SP_InsertarProfesional 'Pablo',   'Fonseca',  'Quesada', 'CED017', 9, 5;
EXECUTE SP_InsertarProfesional 'Gabriela','Zúñiga',   'León',    'CED018', 2, 5;
EXECUTE SP_InsertarProfesional 'David',   'Mata',     'Camacho', 'CED019', 4, 5;
EXECUTE SP_InsertarProfesional 'Verónica','Herrera',  'Alpízar', 'CED020', 7, 5;
GO


-- insert de profesionales por centro


-- Profesionales del 1 al 20 con horario de lunes a sábado
-- Profesional 1
EXECUTE SP_InsertarHorarioProfesional 1, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 1, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 1, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 1, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 1, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 1, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 2
EXECUTE SP_InsertarHorarioProfesional 2, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 2, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 2, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 2, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 2, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 2, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 3
EXECUTE SP_InsertarHorarioProfesional 3, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 3, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 3, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 3, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 3, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 3, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 4
EXECUTE SP_InsertarHorarioProfesional 4, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 4, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 4, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 4, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 4, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 4, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 5
EXECUTE SP_InsertarHorarioProfesional 5, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 5, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 5, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 5, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 5, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 5, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 6
EXECUTE SP_InsertarHorarioProfesional 6, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 6, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 6, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 6, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 6, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 6, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 7
EXECUTE SP_InsertarHorarioProfesional 7, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 7, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 7, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 7, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 7, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 7, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 8
EXECUTE SP_InsertarHorarioProfesional 8, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 8, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 8, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 8, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 8, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 8, 'Sábado', '09:00:00', '17:00:00';


-- Profesional 9
EXECUTE SP_InsertarHorarioProfesional 9, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 9, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 9, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 9, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 9, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 9, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 10
EXECUTE SP_InsertarHorarioProfesional 10, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 10, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 10, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 10, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 10, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 10, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 11
EXECUTE SP_InsertarHorarioProfesional 11, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 11, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 11, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 11, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 11, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 11, 'Sábado', '09:00:00', '17:00:00';


-- Profesional 12
EXECUTE SP_InsertarHorarioProfesional 12, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 12, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 12, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 12, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 12, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 12, 'Sábado', '09:00:00', '17:00:00';


-- Profesional 13
EXECUTE SP_InsertarHorarioProfesional 13, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 13, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 13, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 13, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 13, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 13, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 14
EXECUTE SP_InsertarHorarioProfesional 14, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 14, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 14, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 14, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 14, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 14, 'Sábado', '09:00:00', '17:00:00';


-- Profesional 15
EXECUTE SP_InsertarHorarioProfesional 15, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 15, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 15, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 15, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 15, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 15, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 16
EXECUTE SP_InsertarHorarioProfesional 16, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 16, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 16, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 16, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 16, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 16, 'Sábado', '09:00:00', '17:00:00';


-- Profesional 17
EXECUTE SP_InsertarHorarioProfesional 17, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 17, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 17, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 17, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 17, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 17, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 18
EXECUTE SP_InsertarHorarioProfesional 18, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 18, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 18, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 18, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 18, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 18, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 19
EXECUTE SP_InsertarHorarioProfesional 19, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 19, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 19, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 19, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 19, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 19, 'Sábado', '09:00:00', '17:00:00';

-- Profesional 20
EXECUTE SP_InsertarHorarioProfesional 20, 'Lunes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 20, 'Martes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 20, 'Miércoles', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 20, 'Jueves', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 20, 'Viernes', '09:00:00', '17:00:00';
EXECUTE SP_InsertarHorarioProfesional 20, 'Sábado', '09:00:00', '17:00:00';


-- Y así sucesivamente hasta el profesional 20...



-- Entrenadores correspondientes a los profesionales 1, 2 y 3
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 1;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 2;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 3;

EXECUTE SP_InsertarNutricionista '2023-01-01', NULL, 4;
GO

select *  from Nutricionista

-- Entrenadores correspondientes a los profesionales 5, 6 y 7
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 5;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 6;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 7;

-- Nutricionista correspondiente al profesional 8
EXECUTE SP_InsertarNutricionista '2023-01-01', NULL, 8;
GO

-- Entrenadores correspondientes a los profesionales 9, 10 y 11
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 9;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 10;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 11;

-- Nutricionista correspondiente al profesional 12
EXECUTE SP_InsertarNutricionista '2023-01-01', NULL, 12;
GO

-- Entrenadores correspondientes a los profesionales 13, 14 y 15
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 13;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 14;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 15;

-- Nutricionista correspondiente al profesional 16
EXECUTE SP_InsertarNutricionista '2023-01-01', NULL, 16;
GO

-- Entrenadores correspondientes a los profesionales 17, 18 y 19
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 17;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 18;
EXECUTE SP_InsertarEntrenador '2023-01-01', NULL, 19;

-- Nutricionista correspondiente al profesional 20
EXECUTE SP_InsertarNutricionista '2023-01-01', NULL, 20;
GO
-- inserts de nutricionistas y entrenadores


EXECUTE SP_InsertarEspecialidadEntrenador 'Cardio';
EXECUTE SP_InsertarEspecialidadEntrenador 'Fuerza';
EXECUTE SP_InsertarEspecialidadEntrenador 'Resistencia';
EXECUTE SP_InsertarEspecialidadEntrenador 'HIIT';
EXECUTE SP_InsertarEspecialidadEntrenador 'Funcional';
EXECUTE SP_InsertarEspecialidadEntrenador 'CrossFit';
EXECUTE SP_InsertarEspecialidadEntrenador 'Musculación';
EXECUTE SP_InsertarEspecialidadEntrenador 'Pilates';
EXECUTE SP_InsertarEspecialidadEntrenador 'Rehabilitación Física';
EXECUTE SP_InsertarEspecialidadEntrenador 'Entrenamiento Deportivo';
GO
-- especialidades para entrenadors 


EXECUTE SP_InsertarEntrenadorEspecialidad 'E001', 'ES001'; -- Cardio
EXECUTE SP_InsertarEntrenadorEspecialidad 'E002', 'ES002'; -- Fuerza
EXECUTE SP_InsertarEntrenadorEspecialidad 'E003', 'ES003'; -- Resistencia

EXECUTE SP_InsertarEntrenadorEspecialidad 'E004', 'ES004'; -- HIIT
EXECUTE SP_InsertarEntrenadorEspecialidad 'E005', 'ES005'; -- Funcional
EXECUTE SP_InsertarEntrenadorEspecialidad 'E006', 'ES006'; -- CrossFit

EXECUTE SP_InsertarEntrenadorEspecialidad 'E007', 'ES007'; -- Musculación
EXECUTE SP_InsertarEntrenadorEspecialidad 'E008', 'ES008'; -- Pilates
EXECUTE SP_InsertarEntrenadorEspecialidad 'E009', 'ES009'; -- Rehabilitación Física

EXECUTE SP_InsertarEntrenadorEspecialidad 'E010', 'ES010'; -- Entrenamiento Deportivo
EXECUTE SP_InsertarEntrenadorEspecialidad 'E011', 'ES001'; -- Cardio
EXECUTE SP_InsertarEntrenadorEspecialidad 'E012', 'ES002'; -- Fuerza

EXECUTE SP_InsertarEntrenadorEspecialidad 'E013', 'ES003'; -- Resistencia
EXECUTE SP_InsertarEntrenadorEspecialidad 'E014', 'ES004'; -- HIIT
EXECUTE SP_InsertarEntrenadorEspecialidad 'E015', 'ES005'; -- Funcional
GO
-- asignarle la especialidad a los entrenadores


EXECUTE SP_InsertarEspecialidadNutricionista 'Adaptación';
EXECUTE SP_InsertarEspecialidadNutricionista 'Pérdida de peso';
EXECUTE SP_InsertarEspecialidadNutricionista 'Aumento de masa muscular';
EXECUTE SP_InsertarEspecialidadNutricionista 'Nutrición deportiva';
EXECUTE SP_InsertarEspecialidadNutricionista 'Trastornos digestivos';
EXECUTE SP_InsertarEspecialidadNutricionista 'Diabetes y control glucémico';
EXECUTE SP_InsertarEspecialidadNutricionista 'Nutrición infantil';
EXECUTE SP_InsertarEspecialidadNutricionista 'Salud cardiovascular';
EXECUTE SP_InsertarEspecialidadNutricionista 'Alimentación vegana/vegetariana';
EXECUTE SP_InsertarEspecialidadNutricionista 'Planificación alimentaria personalizada';
GO
-- especialidades para nutricionistas


-- Nutricionista N001
EXECUTE SP_InsertarNutricionistaEspecialidad 'N001', 'SN001'; -- Adaptación

-- Nutricionista N002
EXECUTE SP_InsertarNutricionistaEspecialidad 'N002', 'SN002'; -- Pérdida de peso

-- Nutricionista N003
EXECUTE SP_InsertarNutricionistaEspecialidad 'N003', 'SN003'; -- Aumento de masa muscular

-- Nutricionista N004
EXECUTE SP_InsertarNutricionistaEspecialidad 'N004', 'SN004'; -- Nutrición deportiva
GO



-- UnidadMedida
EXECUTE sp_InsertarUnidadMedida 'Gramos';
EXECUTE sp_InsertarUnidadMedida 'Mililitros';
EXECUTE sp_InsertarUnidadMedida 'Unidad';

SELECT * from UnidadMedida

-- Ingrediente
EXECUTE sp_InsertarIngrediente 'Pollo', 'U001';
EXECUTE sp_InsertarIngrediente 'Arroz Integral', 'U001';
EXECUTE sp_InsertarIngrediente 'Aceite de oliva', 'U002';

-- PlanAlimenticio (asumiendo que existen nutricionistas N001 y N002)
EXECUTE sp_InsertarPlanAlimenticio 'Plan Bajo en Grasa', 'Pérdida de peso', 1800, 'Plan semanal personalizado', 'N001';
EXECUTE sp_InsertarPlanAlimenticio 'Plan Energético', 'Aumento masa muscular', 2500, 'Incluye suplementación', 'N002';

-- Comida (asumiendo CodigoPlan 1 y 2)
EXECUTE sp_InsertarComida 'Desayuno', 1;
EXECUTE sp_InsertarComida 'Almuerzo', 1;
EXECUTE sp_InsertarComida 'Cena', 2;

-- Receta (asumiendo IdValorNutricional 1, 2, 3 ya existen)
EXECUTE sp_InsertarReceta 'Pechuga a la plancha', 25, 1;
EXECUTE sp_InsertarReceta 'Ensalada verde', 15, 2;
EXECUTE sp_InsertarReceta 'Arroz integral', 30, 3;

select * from Receta

-- RecetaIngrediente (asumiendo Id_Receta y Id_Ingrediente generados secuencialmente desde 1)
EXECUTE sp_InsertarRecetaIngrediente 1, 1, 150.0, 20; -- Pollo en Pechuga
EXECUTE sp_InsertarRecetaIngrediente 2, 2, 100.0, 10; -- Arroz en Ensalada
EXECUTE sp_InsertarRecetaIngrediente 3, 3, 10.0, 5;  -- Aceite en Arroz

-- ComidaReceta
EXECUTE sp_InsertarComidaReceta 1, 1, 1;
EXECUTE sp_InsertarComidaReceta 2, 2, 1;
EXECUTE sp_InsertarComidaReceta 3, 3, 1;

-- PlanAlimenticio_Comida
EXECUTE sp_InsertarPlanAlimenticioComida 1, 1, 1;
EXECUTE sp_InsertarPlanAlimenticioComida 2, 1, 1;
EXECUTE sp_InsertarPlanAlimenticioComida 3, 2, 1;

GO





-- asingar especialidades a nutricionistas._




-- Recetas asociadas a los valores nutricionales insertados
EXECUTE SP_InsertarReceta 'Ensalada Vegana', 10, 1;
EXECUTE SP_InsertarReceta 'Pechuga de Pollo con Brócoli', 25, 2;
EXECUTE SP_InsertarReceta 'Smoothie de Frutas', 8, 3;
EXECUTE SP_InsertarReceta 'Avena con Almendras', 12, 4;
EXECUTE SP_InsertarReceta 'Arroz Integral con Atún', 20, 5;
EXECUTE SP_InsertarReceta 'Ensalada Mediterránea', 15, 6;
EXECUTE SP_InsertarReceta 'Batido Proteico', 5, 7;
EXECUTE SP_InsertarReceta 'Tostadas con Aguacate', 7, 8;
EXECUTE SP_InsertarReceta 'Sopa de Verduras', 30, 9;
EXECUTE SP_InsertarReceta 'Omelette de Claras', 10, 10;
GO

-- insertar unidades de medida
EXECUTE SP_InsertarUnidadMedida 'Gramos';         -- U001
EXECUTE SP_InsertarUnidadMedida 'Mililitros';     -- U002
EXECUTE SP_InsertarUnidadMedida 'Tazas';          -- U003
EXECUTE SP_InsertarUnidadMedida 'Cucharadas';     -- U004
EXECUTE SP_InsertarUnidadMedida 'Cucharaditas';   -- U005
EXECUTE SP_InsertarUnidadMedida 'Unidades';       -- U006
EXECUTE SP_InsertarUnidadMedida 'Rodajas';        -- U007
EXECUTE SP_InsertarUnidadMedida 'Rebanadas';      -- U008
EXECUTE SP_InsertarUnidadMedida 'Piezas';         -- U009
EXECUTE SP_InsertarUnidadMedida 'Porciones';      -- U010
GO

-- insertar ingredientes
EXECUTE SP_InsertarIngrediente 'Pollo', 'U001';         -- Gramos
EXECUTE SP_InsertarIngrediente 'Agua', 'U002';          -- Mililitros
EXECUTE SP_InsertarIngrediente 'Avena', 'U003';         -- Tazas
EXECUTE SP_InsertarIngrediente 'Aceite de oliva', 'U004'; -- Cucharadas
EXECUTE SP_InsertarIngrediente 'Sal', 'U005';           -- Cucharaditas
EXECUTE SP_InsertarIngrediente 'Huevo', 'U006';         -- Unidades
EXECUTE SP_InsertarIngrediente 'Pepino', 'U007';        -- Rodajas
EXECUTE SP_InsertarIngrediente 'Pan integral', 'U008';  -- Rebanadas
EXECUTE SP_InsertarIngrediente 'Manzana', 'U009';       -- Piezas
EXECUTE SP_InsertarIngrediente 'Yogurt natural', 'U010';-- Porciones
GO


-- Receta 1: Ensalada Vegana
EXECUTE SP_InsertarRecetaIngrediente 1, 7, 5.0, 3;   -- Pepino
EXECUTE SP_InsertarRecetaIngrediente 1, 9, 1.0, 2;   -- Manzana

-- Receta 2: Pechuga de Pollo con Brócoli
EXECUTE SP_InsertarRecetaIngrediente 2, 1, 150.0, 10; -- Pollo
EXECUTE SP_InsertarRecetaIngrediente 2, 2, 100.0, 5;  -- Agua

-- Receta 3: Smoothie de Frutas
EXECUTE SP_InsertarRecetaIngrediente 3, 9, 1.0, 2;    -- Manzana
EXECUTE SP_InsertarRecetaIngrediente 3, 10, 1.0, 2;   -- Yogurt

-- Receta 4: Avena con Almendras
EXECUTE SP_InsertarRecetaIngrediente 4, 3, 1.0, 5;    -- Avena
EXECUTE SP_InsertarRecetaIngrediente 4, 5, 0.5, 1;    -- Sal

-- Receta 5: Arroz Integral con Atún
EXECUTE SP_InsertarRecetaIngrediente 5, 1, 120.0, 8;  -- Pollo
EXECUTE SP_InsertarRecetaIngrediente 5, 4, 1.0, 2;    -- Aceite

-- Receta 6: Ensalada Mediterránea
EXECUTE SP_InsertarRecetaIngrediente 6, 7, 4.0, 3;    -- Pepino
EXECUTE SP_InsertarRecetaIngrediente 6, 8, 2.0, 2;    -- Pan integral

-- Receta 7: Batido Proteico
EXECUTE SP_InsertarRecetaIngrediente 7, 10, 1.0, 2;   -- Yogurt
EXECUTE SP_InsertarRecetaIngrediente 7, 9, 1.0, 2;    -- Manzana

-- Receta 8: Tostadas con Aguacate
EXECUTE SP_InsertarRecetaIngrediente 8, 8, 2.0, 3;    -- Pan integral
EXECUTE SP_InsertarRecetaIngrediente 8, 4, 1.0, 1;    -- Aceite

-- Receta 9: Sopa de Verduras
EXECUTE SP_InsertarRecetaIngrediente 9, 2, 150.0, 10; -- Agua
EXECUTE SP_InsertarRecetaIngrediente 9, 5, 0.5, 2;    -- Sal

-- Receta 10: Omelette de Claras
EXECUTE SP_InsertarRecetaIngrediente 10, 6, 2.0, 5;   -- Huevo
EXECUTE SP_InsertarRecetaIngrediente 10, 5, 0.3, 1;   -- Sal
GO
-- insertar recetas ingredientes


-- Nutricionista N001
EXECUTE SP_InsertarPlanAlimenticio 
    'Plan Vegano', 
    'Perder peso', 
    1500, 
    'Plan personalizado para bajar grasa', 
    'N001';

-- Nutricionista N002
EXECUTE SP_InsertarPlanAlimenticio 
    'Plan Deportivo', 
    'Aumentar masa muscular', 
    2500, 
    'Diseñado para deportistas de alto rendimiento', 
    'N002';

-- Nutricionista N003
EXECUTE SP_InsertarPlanAlimenticio 
    'Plan Bajo en Sodio', 
    'Controlar presión arterial', 
    1800, 
    'Enfocado en pacientes con hipertensión', 
    'N003';

-- Nutricionista N004
EXECUTE SP_InsertarPlanAlimenticio 
    'Plan Infantil', 
    'Desarrollo saludable', 
    2000, 
    'Plan balanceado para niños entre 6 y 12 años', 
    'N004';
GO


 -- insertar planes de nutricion


-- Plan 1: Plan Vegano
EXECUTE SP_InsertarComida 'Desayuno', 1;
EXECUTE SP_InsertarComida 'Almuerzo', 1;
EXECUTE SP_InsertarComida 'Cena', 1;

-- Plan 2: Plan Deportivo
EXECUTE SP_InsertarComida 'Desayuno', 2;
EXECUTE SP_InsertarComida 'Merienda', 2;
EXECUTE SP_InsertarComida 'Almuerzo', 2;
EXECUTE SP_InsertarComida 'Cena', 2;

-- Plan 3: Plan Bajo en Sodio
EXECUTE SP_InsertarComida 'Desayuno', 3;
EXECUTE SP_InsertarComida 'Almuerzo', 3;
EXECUTE SP_InsertarComida 'Cena', 3;

-- Plan 4: Plan Infantil
EXECUTE SP_InsertarComida 'Desayuno', 4;
EXECUTE SP_InsertarComida 'Almuerzo', 4;
EXECUTE SP_InsertarComida 'Cena', 4;
EXECUTE SP_InsertarComida 'Merienda', 4;
GO



EXECUTE SP_InsertarComidaReceta 1, 1;
EXECUTE SP_InsertarComidaReceta 2, 5;
EXECUTE SP_InsertarComidaReceta 3, 4;

EXECUTE SP_InsertarComidaReceta 4, 3;
EXECUTE SP_InsertarComidaReceta 5, 7;
EXECUTE SP_InsertarComidaReceta 6, 2;
EXECUTE SP_InsertarComidaReceta 7, 10;

EXECUTE SP_InsertarComidaReceta 8, 9;
EXECUTE SP_InsertarComidaReceta 9, 6;
EXECUTE SP_InsertarComidaReceta 10, 4;

EXECUTE SP_InsertarComidaReceta 11, 10;
EXECUTE SP_InsertarComidaReceta 12, 5;
GO


-- Plan 1: Plan Vegano → Comidas 1, 2, 3
EXECUTE SP_InsertarPlanAlimenticioComida 1, 1;
EXECUTE SP_InsertarPlanAlimenticioComida 2, 1;
EXECUTE SP_InsertarPlanAlimenticioComida 3, 1;

-- Plan 2: Plan Deportivo → Comidas 4, 5, 6, 7
EXECUTE SP_InsertarPlanAlimenticioComida 4, 2;
EXECUTE SP_InsertarPlanAlimenticioComida 5, 2;
EXECUTE SP_InsertarPlanAlimenticioComida 6, 2;
EXECUTE SP_InsertarPlanAlimenticioComida 7, 2;

-- Plan 3: Plan Bajo en Sodio → Comidas 8, 9, 10
EXECUTE SP_InsertarPlanAlimenticioComida 8, 3;
EXECUTE SP_InsertarPlanAlimenticioComida 9, 3;
EXECUTE SP_InsertarPlanAlimenticioComida 10, 3;

-- Plan 4: Plan Infantil → Comidas 11, 12
EXECUTE SP_InsertarPlanAlimenticioComida 11, 4;
EXECUTE SP_InsertarPlanAlimenticioComida 12, 4;
GO


EXECUTE SP_InsertarEjercicio 'Sentadillas', 'Piernas', 12, 0;
EXECUTE SP_InsertarEjercicio 'Press de Banca', 'Pectorales', 10, 1;
EXECUTE SP_InsertarEjercicio 'Flexiones', 'Pectorales', 15, 0;
EXECUTE SP_InsertarEjercicio 'Peso Muerto', 'Espalda baja', 8, 1;
EXECUTE SP_InsertarEjercicio 'Curl de Bíceps', 'Bíceps', 12, 1;
EXECUTE SP_InsertarEjercicio 'Plancha', 'Abdominales', 1, 0;
EXECUTE SP_InsertarEjercicio 'Press Militar', 'Hombros', 10, 1;
EXECUTE SP_InsertarEjercicio 'Zancadas', 'Piernas', 12, 0;
EXECUTE SP_InsertarEjercicio 'Remo con Mancuernas', 'Espalda', 10, 1;
EXECUTE SP_InsertarEjercicio 'Elevaciones Laterales', 'Hombros', 15, 1;
GO


-- Rutina para pérdida de grasa - principiante
EXECUTE SP_InsertarRutinaEntrenamiento 
    'Rutina para pérdida de grasa', 
    'Principiante', 
    180, 
    'E001';

-- Rutina para ganancia muscular - intermedio
EXECUTE SP_InsertarRutinaEntrenamiento 
    'Rutina para ganancia de masa muscular', 
    'Intermedio', 
    240, 
    'E002';

-- Rutina de fuerza avanzada
EXECUTE SP_InsertarRutinaEntrenamiento 
    'Entrenamiento de fuerza máxima', 
    'Avanzado', 
    300, 
    'E003';

-- Rutina funcional sin equipo
EXECUTE SP_InsertarRutinaEntrenamiento 
    'Entrenamiento funcional sin equipamiento', 
    'Principiante', 
    150, 
    'E004';

-- Rutina de mantenimiento físico
EXECUTE SP_InsertarRutinaEntrenamiento 
    'Rutina para mantener condición física general', 
    'Intermedio', 
    200, 
    'E005';
GO


-- Rutina ID 1: Semana de entrenamiento
EXECUTE SP_InsertarRutinaSemana 'Lunes', '08:00:00', '10:00:00', 1;
EXECUTE SP_InsertarRutinaSemana 'Martes', '08:00:00', '10:00:00', 1;
EXECUTE SP_InsertarRutinaSemana 'Miércoles', '08:00:00', '10:00:00', 1;
EXECUTE SP_InsertarRutinaSemana 'Jueves', '08:00:00', '10:00:00', 1;
EXECUTE SP_InsertarRutinaSemana 'Viernes', '08:00:00', '10:00:00', 1;
EXECUTE SP_InsertarRutinaSemana 'Sábado', '09:00:00', '10:30:00', 1;
GO


-- Lunes (RutinaSemana ID 1)
EXECUTE SP_InsertarRutinaEjercicio 1, 1; -- Sentadillas
EXECUTE SP_InsertarRutinaEjercicio 2, 1; -- Press de Banca

-- Martes (RutinaSemana ID 2)
EXECUTE SP_InsertarRutinaEjercicio 3, 2; -- Flexiones
EXECUTE SP_InsertarRutinaEjercicio 4, 2; -- Peso Muerto

-- Miércoles (RutinaSemana ID 3)
EXECUTE SP_InsertarRutinaEjercicio 5, 3; -- Curl de Bíceps
EXECUTE SP_InsertarRutinaEjercicio 6, 3; -- Plancha

-- Jueves (RutinaSemana ID 4)
EXECUTE SP_InsertarRutinaEjercicio 7, 4; -- Press Militar
EXECUTE SP_InsertarRutinaEjercicio 8, 4; -- Zancadas

-- Viernes (RutinaSemana ID 5)
EXECUTE SP_InsertarRutinaEjercicio 9, 5; -- Remo con Mancuernas
EXECUTE SP_InsertarRutinaEjercicio 10, 5; -- Elevaciones Laterales

-- Sábado (RutinaSemana ID 6)
EXECUTE SP_InsertarRutinaEjercicio 1, 6; -- Sentadillas
EXECUTE SP_InsertarRutinaEjercicio 6, 6; -- Plancha
GO


-- Centro 1: Hojancha Vital Pro (entrenadores E001–E004)
EXECUTE SP_InsertarCliente 'Luis',    'Castro',   'Morales',  '101010101', 'M', '1990-01-01', '8888-0001', 'luis1@vitalpro.com', '2024-01-15', 'E001', 1;
EXECUTE SP_InsertarCliente 'María',   'Zamora',   'Jiménez',  '101010102', 'F', '1992-02-01', '8888-0002', 'maria1@vitalpro.com', '2024-01-16', 'E002', 1;
EXECUTE SP_InsertarCliente 'Carlos',  'Rojas',    'González', '101010103', 'M', '1988-03-01', '8888-0003', 'carlos1@vitalpro.com','2024-01-17', 'E003', 1;
EXECUTE SP_InsertarCliente 'Sofía',   'León',     'Navarro',  '101010104', 'F', '1995-04-01', '8888-0004', 'sofia1@vitalpro.com', '2024-01-18', 'E004', 1;

-- Centro 2: Nandayure Vital Pro (entrenadores E005–E008)
EXECUTE SP_InsertarCliente 'Gabriel', 'Méndez',   'Cruz',     '202020201', 'M', '1991-05-01', '8888-0005', 'gabriel2@vitalpro.com','2024-01-15', 'E005', 2;
EXECUTE SP_InsertarCliente 'Valeria', 'Ruiz',     'Campos',   '202020202', 'F', '1993-06-01', '8888-0006', 'valeria2@vitalpro.com','2024-01-16', 'E006', 2;
EXECUTE SP_InsertarCliente 'Esteban', 'Alvarado', 'Soto',     '202020203', 'M', '1990-07-01', '8888-0007', 'esteban2@vitalpro.com','2024-01-17', 'E007', 2;
EXECUTE SP_InsertarCliente 'Camila',  'Mora',     'López',    '202020204', 'F', '1996-08-01', '8888-0008', 'camila2@vitalpro.com', '2024-01-18', 'E008', 2;

-- Centro 3: Moracia Vital Pro (entrenadores E009–E012)
EXECUTE SP_InsertarCliente 'Fernando','Salas',    'Quesada',  '303030301', 'M', '1987-09-01', '8888-0009', 'fernando3@vitalpro.com','2024-01-15', 'E009', 3;
EXECUTE SP_InsertarCliente 'Isabel',  'Brenes',   'Araya',    '303030302', 'F', '1994-10-01', '8888-0010', 'isabel3@vitalpro.com', '2024-01-16', 'E010', 3;
EXECUTE SP_InsertarCliente 'Javier',  'Sánchez',  'Vega',     '303030303', 'M', '1992-11-01', '8888-0011', 'javier3@vitalpro.com', '2024-01-17', 'E011', 3;
EXECUTE SP_InsertarCliente 'Natalia', 'Ureña',    'Corrales', '303030304', 'F', '1990-12-01', '8888-0012', 'natalia3@vitalpro.com','2024-01-18', 'E012', 3;

-- Centro 4: Río Cañas Vital Pro (entrenadores E013–E016)
EXECUTE SP_InsertarCliente 'Ricardo', 'Chaves',   'Picado',   '404040401', 'M', '1989-01-01', '8888-0013', 'ricardo4@vitalpro.com','2024-01-15', 'E013', 4;
EXECUTE SP_InsertarCliente 'Daniela', 'Solano',   'Marín',    '404040402', 'F', '1996-02-01', '8888-0014', 'daniela4@vitalpro.com','2024-01-16', 'E014', 4;
EXECUTE SP_InsertarCliente 'Tomás',   'Zúñiga',   'Espinoza', '404040403', 'M', '1991-03-01', '8888-0015', 'tomas4@vitalpro.com',  '2024-01-17', 'E015', 4;
EXECUTE SP_InsertarCliente 'Lucía',   'Núñez',    'Acuña',    '404040404', 'F', '1993-04-01', '8888-0016', 'lucia4@vitalpro.com',  '2024-01-18', 'E016', 4;

-- Centro 5: Santa Cruz Vital Pro (entrenadores E017–E020)
EXECUTE SP_InsertarCliente 'Jorge',   'Calvo',    'Venegas',  '505050501', 'M', '1988-05-01', '8888-0017', 'jorge5@vitalpro.com',  '2024-01-15', 'E017', 5;
EXECUTE SP_InsertarCliente 'Patricia','Córdoba',  'Leiva',    '505050502', 'F', '1997-06-01', '8888-0018', 'patricia5@vitalpro.com','2024-01-16', 'E018', 5;
EXECUTE SP_InsertarCliente 'Andrés',  'Herrera',  'Solís',    '505050503', 'M', '1994-07-01', '8888-0019', 'andres5@vitalpro.com', '2024-01-17', 'E019', 5;
EXECUTE SP_InsertarCliente 'Mónica',  'Reyes',    'Fallas',   '505050504', 'F', '1991-08-01', '8888-0020', 'monica5@vitalpro.com', '2024-01-18', 'E020', 5;
GO


-- Clientes 1–5 → rutina 1, plan 1
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 1, 1, 1;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 1, 2, 1;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 1, 3, 1;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 1, 4, 1;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 1, 5, 1;

-- Clientes 6–10 → rutina 2, plan 2
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 2, 6, 2;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 2, 7, 2;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 2, 8, 2;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 2, 9, 2;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 2, 10, 2;

-- Clientes 11–15 → rutina 3, plan 3
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 3, 11, 3;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 3, 12, 3;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 3, 13, 3;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 3, 14, 3;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 3, 15, 3;

-- Clientes 16–20 → rutina 4, plan 4
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 4, 16, 4;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 4, 17, 4;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 4, 18, 4;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 4, 19, 4;
EXECUTE SP_InsertarPlanPersonalizado '2024-01-01', '2024-12-31', 4, 20, 4;
GO



-- Centro 1 (profesionales 1–4, clientes 1–4)
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-15', '08:00:00', 60, 1, 1, 1;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-15', '09:00:00', 60, 1, 2, 2;
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-15', '10:00:00', 60, 1, 3, 3;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-15', '11:00:00', 60, 1, 4, 4;

-- Centro 2 (profesionales 5–8, clientes 5–8)
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-16', '08:00:00', 60, 2, 5, 5;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-16', '09:00:00', 60, 2, 6, 6;
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-16', '10:00:00', 60, 2, 7, 7;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-16', '11:00:00', 60, 2, 8, 8;

-- Centro 3 (profesionales 9–12, clientes 9–12)
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-17', '08:00:00', 60, 3, 9, 9;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-17', '09:00:00', 60, 3, 10, 10;
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-17', '10:00:00', 60, 3, 11, 11;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-17', '11:00:00', 60, 3, 12, 12;

-- Centro 4 (profesionales 13–16, clientes 13–16)
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-18', '08:00:00', 60, 4, 13, 13;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-18', '09:00:00', 60, 4, 14, 14;
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-18', '10:00:00', 60, 4, 15, 15;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-18', '11:00:00', 60, 4, 16, 16;

-- Centro 5 (profesionales 17–20, clientes 17–20)
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-19', '08:00:00', 60, 5, 17, 17;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-19', '09:00:00', 60, 5, 18, 18;
EXECUTE SP_InsertarSesion 'Entrenamiento', '2024-01-19', '10:00:00', 60, 5, 19, 19;
EXECUTE SP_InsertarSesion 'Nutricion',    '2024-01-19', '11:00:00', 60, 5, 20, 20;
GO


-- Centro 1 (Clientes 1–4)
EXECUTE SP_InsertarEvaluacionFisica '2024-03-10', 68.2, 1.68, 17.3, 28.5, 'Medio', 'Buena', 1, 1, 1;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-10', 59.5, 1.60, 22.1, 24.0, 'Bajo', 'Regular', 1, 2, 2;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-10', 74.0, 1.75, 18.0, 30.5, 'Alto', 'Buena', 1, 3, 3;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-10', 62.3, 1.62, 20.0, 26.2, 'Medio', 'Excelente', 1, 4, 4;

-- Centro 2 (Clientes 5–8)
EXECUTE SP_InsertarEvaluacionFisica '2024-03-11', 80.0, 1.82, 19.5, 33.1, 'Alto', 'Buena', 2, 5, 5;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-11', 55.8, 1.58, 24.3, 22.4, 'Medio', 'Regular', 2, 6, 6;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-11', 70.5, 1.70, 21.0, 29.0, 'Bajo', 'Limitada', 2, 7, 7;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-11', 64.0, 1.65, 20.5, 27.0, 'Medio', 'Buena', 2, 8, 8;

-- Centro 3 (Clientes 9–12)
EXECUTE SP_InsertarEvaluacionFisica '2024-03-12', 77.7, 1.80, 18.5, 31.2, 'Alto', 'Buena', 3, 9, 9;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-12', 58.6, 1.63, 23.0, 24.5, 'Medio', 'Regular', 3, 10, 10;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-12', 69.9, 1.76, 20.2, 28.9, 'Medio', 'Buena', 3, 11, 11;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-12', 60.4, 1.60, 25.0, 23.8, 'Bajo', 'Limitada', 3, 12, 12;

-- Centro 4 (Clientes 13–16)
EXECUTE SP_InsertarEvaluacionFisica '2024-03-13', 85.2, 1.85, 16.0, 35.0, 'Alto', 'Excelente', 4, 13, 13;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-13', 66.1, 1.68, 21.7, 27.4, 'Medio', 'Buena', 4, 14, 14;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-13', 73.3, 1.78, 18.9, 30.1, 'Alto', 'Buena', 4, 15, 15;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-13', 61.2, 1.64, 22.5, 25.2, 'Medio', 'Regular', 4, 16, 16;

-- Centro 5 (Clientes 17–20)
EXECUTE SP_InsertarEvaluacionFisica '2024-03-14', 78.5, 1.79, 20.0, 30.8, 'Alto', 'Buena', 5, 17, 17;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-14', 57.9, 1.61, 23.8, 23.7, 'Medio', 'Regular', 5, 18, 18;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-14', 72.1, 1.73, 19.5, 28.3, 'Medio', 'Buena', 5, 19, 19;
EXECUTE SP_InsertarEvaluacionFisica '2024-03-14', 63.7, 1.67, 21.0, 26.5, 'Medio', 'Buena', 5, 20, 20;
GO







    

