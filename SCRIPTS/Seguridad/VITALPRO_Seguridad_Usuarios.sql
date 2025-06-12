
-- =========================
-- 1. CREACIÓN DE LOGINS
-- =========================
USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'admin_user')
    CREATE LOGIN admin_user WITH PASSWORD = 'AdminPass123';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'prof_user')
    CREATE LOGIN prof_user WITH PASSWORD = 'ProfPass123';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'entrenador_user')
    CREATE LOGIN entrenador_user WITH PASSWORD = 'Entrena123';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'nutricionista_user')
    CREATE LOGIN nutricionista_user WITH PASSWORD = 'Nutri123';
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'cliente_user')
    CREATE LOGIN cliente_user WITH PASSWORD = 'Cliente123';
GO

-- =========================
-- 2. CREACIÓN DE USUARIOS EN LA BASE DE DATOS
-- =========================
USE VITALPRO;
GO

CREATE USER admin_user FOR LOGIN admin_user;
CREATE USER prof_user FOR LOGIN prof_user;
CREATE USER entrenador_user FOR LOGIN entrenador_user;
CREATE USER nutricionista_user FOR LOGIN nutricionista_user;
CREATE USER cliente_user FOR LOGIN cliente_user;
GO

-- =========================
-- 3. REMOVER ACCESOS ADMINISTRATIVOS POR DEFECTO
-- =========================
EXEC sp_droprolemember 'db_owner', 'admin_user';
EXEC sp_droprolemember 'db_owner', 'prof_user';
EXEC sp_droprolemember 'db_owner', 'entrenador_user';
EXEC sp_droprolemember 'db_owner', 'nutricionista_user';
EXEC sp_droprolemember 'db_owner', 'cliente_user';
GO

-- =========================
-- 4. PERMISOS POR ROL
-- =========================

-- PROFESIONAL: Solo lectura a tablas clave
GRANT SELECT ON dbo.Profesional TO prof_user;
GRANT SELECT ON dbo.HorarioProfesional TO prof_user;
GRANT SELECT ON dbo.CentroVitalPro TO prof_user;
GRANT SELECT ON dbo.Sesion TO prof_user;
GRANT SELECT ON dbo.Clientes TO prof_user;
GRANT SELECT ON dbo.EvaluacionFisica TO prof_user;
GO

-- ENTRENADOR: acceso a rutinas, ejercicios y clientes
GRANT SELECT, INSERT, UPDATE ON dbo.Entrenador TO entrenador_user;
GRANT SELECT, INSERT, UPDATE ON dbo.RutinaEntrenamiento TO entrenador_user;
GRANT SELECT ON dbo.RutinaSemana TO entrenador_user;
GRANT SELECT ON dbo.RutinaEjercicio TO entrenador_user;
GRANT SELECT ON dbo.Ejercicio TO entrenador_user;
GRANT SELECT ON dbo.Clientes TO entrenador_user;
GO

-- NUTRICIONISTA: acceso a recetas, planes, alimentos
GRANT SELECT, INSERT, UPDATE ON dbo.Nutricionista TO nutricionista_user;
GRANT SELECT, INSERT, UPDATE ON dbo.PlanAlimenticio TO nutricionista_user;
GRANT SELECT, INSERT, UPDATE ON dbo.Receta TO nutricionista_user;
GRANT SELECT ON dbo.ValorNutricional TO nutricionista_user;
GRANT SELECT ON dbo.RecetaIngrediente TO nutricionista_user;
GRANT SELECT ON dbo.Comida TO nutricionista_user;
GRANT SELECT ON dbo.PlanAlimenticio_Comida TO nutricionista_user;
GO

-- CLIENTE: solo lectura y autoevaluación
GRANT SELECT ON dbo.Clientes TO cliente_user;
GRANT SELECT ON dbo.PlanPersonalizado TO cliente_user;
GRANT SELECT ON dbo.EvaluacionFisica TO cliente_user;
GRANT INSERT ON dbo.EvaluacionFisica TO cliente_user;
GRANT SELECT ON dbo.RutinaEntrenamiento TO cliente_user;
GRANT SELECT ON dbo.PlanAlimenticio TO cliente_user;
GO

-- ADMIN: Control total sobre todas las tablas (lectura, escritura, modificación, eliminación)
USE VITALPRO;
GO

GRANT SELECT, INSERT, UPDATE ON CentroVitalPro TO admin_user;
GRANT SELECT, INSERT, UPDATE ON HorarioCentro TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Profesional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON HorarioProfesional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Entrenador TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Especialidad_Entrenador TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Entrenador_Especialidad TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Nutricionista TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Especialidad_Nutricionista TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Nutricionista_Especialidad TO admin_user;
GRANT SELECT, INSERT, UPDATE ON ValorNutricional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Receta TO admin_user;
GRANT SELECT, INSERT, UPDATE ON UnidadMedida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Ingrediente TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RecetaIngrediente TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Comida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON ComidaReceta TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanAlimenticio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanAlimenticio_Comida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Ejercicio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaSemana TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaEjercicio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaEntrenamiento TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Clientes TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanPersonalizado TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Sesion TO admin_user;
GRANT SELECT, INSERT, UPDATE ON EvaluacionFisica TO admin_user;
GO

-- ADMIN: Control total sobre todas las tablas (lectura, escritura, modificación, eliminación)
USE VITALPRO;
GO

GRANT SELECT, INSERT, UPDATE ON CentroVitalPro TO admin_user;
GRANT SELECT, INSERT, UPDATE ON HorarioCentro TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Profesional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON HorarioProfesional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Entrenador TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Especialidad_Entrenador TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Entrenador_Especialidad TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Nutricionista TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Especialidad_Nutricionista TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Nutricionista_Especialidad TO admin_user;
GRANT SELECT, INSERT, UPDATE ON ValorNutricional TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Receta TO admin_user;
GRANT SELECT, INSERT, UPDATE ON UnidadMedida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Ingrediente TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RecetaIngrediente TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Comida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON ComidaReceta TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanAlimenticio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanAlimenticio_Comida TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Ejercicio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaSemana TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaEjercicio TO admin_user;
GRANT SELECT, INSERT, UPDATE ON RutinaEntrenamiento TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Clientes TO admin_user;
GRANT SELECT, INSERT, UPDATE ON PlanPersonalizado TO admin_user;
GRANT SELECT, INSERT, UPDATE ON Sesion TO admin_user;
GRANT SELECT, INSERT, UPDATE ON EvaluacionFisica TO admin_user;
GO

USE VITALPRO;
GO

-- ================================
-- Permisos ADMIN - Acceso total
-- ================================
GRANT EXECUTE ON OBJECT::SP_InsertarCentroVitalPro TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarHorarioCentro TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarProfesional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarHorarioProfesional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEntrenador TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEspecialidadEntrenador TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEntrenadorEspecialidad TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarNutricionista TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEspecialidadNutricionista TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarNutricionistaEspecialidad TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarValorNutricional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarReceta TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarUnidadMedida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarIngrediente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRecetaIngrediente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarComida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarComidaReceta TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarPlanAlimenticio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarPlanAlimenticioComida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEjercicio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaSemana TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaEjercicio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaEntrenamiento TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarCliente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarPlanPersonalizado TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarSesion TO admin_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEvaluacionFisica TO admin_user;
GRANT EXECUTE ON SP_SEGUIMIENTO_PROGRESO_FISICO TO admin_user;
GRANT EXECUTE ON SP_RESERVAS_POR_PROFESIONAL_EN_UNA_SEMANA TO admin_user;
GRANT EXECUTE ON SP_RUTINAS_ACTIVAS_POR_NIVEL TO admin_user;
GRANT EXECUTE ON SP_RECETAS_MAS_UTILIZADAS_POR_TIPO_DE_PLAN TO admin_user;
GRANT EXECUTE ON SP_CLIENTES_CON_MAYOR_ADERENCIAS TO admin_user;
GRANT EXECUTE ON SP_ENTRENADOR_CON_EL_CENTRO TO admin_user;
GRANT EXECUTE ON SP_NUTRICIONISTAS_CON_EL_CENTRO TO admin_user;
GRANT EXECUTE ON SP_CLIENTES_SIN_ASISTENCIA_EL_ULTIMO_MES TO admin_user;
GRANT EXECUTE ON SP_CLIENTES_SIN_EVALUACION TO admin_user;
GRANT EXECUTE ON SP_SESIONES_CANCELADAS_POR_MES TO admin_user;
GRANT EXECUTE ON SP_PLANES_ALIMENTICIOS_POR_NUTRICIONISTA TO admin_user;
GRANT EXECUTE ON SP_PROFESIONALES_SIN_SESIONES TO admin_user;
GRANT EXECUTE ON SP_SESIONES_POR_ESTADO TO admin_user;
GO

-- ================================
-- Permisos ENTRENADOR
-- ================================
GRANT EXECUTE ON OBJECT::SP_InsertarEntrenador TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEspecialidadEntrenador TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEntrenadorEspecialidad TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEjercicio TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaSemana TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaEjercicio TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRutinaEntrenamiento TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarCliente TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_InsertarSesion TO entrenador_user;
GRANT EXECUTE ON SP_SEGUIMIENTO_PROGRESO_FISICO TO entrenador_user;
GRANT EXECUTE ON SP_RUTINAS_ACTIVAS_POR_NIVEL TO entrenador_user;
GRANT EXECUTE ON SP_CLIENTES_CON_MAYOR_ADERENCIAS TO entrenador_user;
GRANT EXECUTE ON SP_ENTRENADOR_CON_EL_CENTRO TO entrenador_user;
GRANT EXECUTE ON SP_CLIENTES_SIN_ASISTENCIA_EL_ULTIMO_MES TO entrenador_user;
GRANT EXECUTE ON SP_CLIENTES_SIN_EVALUACION TO entrenador_user;
GRANT EXECUTE ON SP_SESIONES_POR_ESTADO TO entrenador_user;
GO

-- ================================
-- Permisos NUTRICIONISTA
-- ================================
GRANT EXECUTE ON OBJECT::SP_InsertarNutricionista TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarEspecialidadNutricionista TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarNutricionistaEspecialidad TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarValorNutricional TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarReceta TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarUnidadMedida TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarIngrediente TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarRecetaIngrediente TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarComida TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarComidaReceta TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarPlanAlimenticio TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_InsertarPlanAlimenticioComida TO nutricionista_user;
GO

-- ================================
-- Permisos CLIENTE
-- ================================
GRANT EXECUTE ON OBJECT::SP_InsertarEvaluacionFisica TO cliente_user;
GO

USE VITALPRO;
GO

-- ================================
-- Permisos ADMIN - Acceso total
-- ================================
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoCentroVitalPro TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoHorarioCentro TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiardeEstadoProfesional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoHorarioProfesional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEntrenador TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEspecialidadEntrenador TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEntrenadorEspecialidad TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoNutricionista TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEspecialidadNutricionista TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoNutricionistaEspecialidad TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoValorNutricional TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoReceta TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoUnidadMedida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambioEstadoIngrediente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRecetaIngrediente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoComida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoComidaReceta TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoPlanAlimenticio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoPlanAlimenticioComida TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEjercicio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaSemana TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaEjercicio TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaEntrenamiento TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoCliente TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoPlanPersonalizado TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoSesion TO admin_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEvaluacionFisica TO admin_user;
GO


-- ================================
-- ENTRENADOR: permisos sobre rutinas, sesiones, clientes
-- ================================
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEntrenador TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaSemana TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaEjercicio TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRutinaEntrenamiento TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoCliente TO entrenador_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoSesion TO entrenador_user;
GO

-- ================================
-- NUTRICIONISTA: permisos sobre planes, recetas, comida
-- ================================
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoNutricionista TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoPlanAlimenticio TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoReceta TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoValorNutricional TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambioEstadoIngrediente TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoUnidadMedida TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoRecetaIngrediente TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoComida TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoComidaReceta TO nutricionista_user;
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoPlanAlimenticioComida TO nutricionista_user;
GRANT EXECUTE ON SP_RECETAS_MAS_UTILIZADAS_POR_TIPO_DE_PLAN TO nutricionista_user;
GRANT EXECUTE ON SP_NUTRICIONISTAS_CON_EL_CENTRO TO nutricionista_user;
GRANT EXECUTE ON SP_PLANES_ALIMENTICIOS_POR_NUTRICIONISTA TO nutricionista_user;
GO

-- ================================
-- CLIENTE: permitir solo cambio sobre su evaluación
-- ================================
GRANT EXECUTE ON OBJECT::SP_CambiodeEstadoEvaluacionFisica TO cliente_user;
GRANT EXECUTE ON SP_SEGUIMIENTO_PROGRESO_FISICO TO cliente_user;
GO

-- Permisos para admin_user: acceso a todos los SPs
GRANT EXECUTE ON SP_ActualizarCentroVitalPro TO admin_user;
GRANT EXECUTE ON SP_ActualizarHorarioCentro TO admin_user;
GRANT EXECUTE ON SP_ActualizarProfesional TO admin_user;
GRANT EXECUTE ON SP_ActualizarHorarioProfesional TO admin_user;
GRANT EXECUTE ON SP_ActualizarEntrenador TO admin_user;
GRANT EXECUTE ON SP_ActualizarEspecialidadEntrenador TO admin_user;
GRANT EXECUTE ON SP_ActualizarEntrenadorEspecialidad TO admin_user;
GRANT EXECUTE ON SP_ActualizarNutricionista TO admin_user;
GRANT EXECUTE ON SP_ActualizarEspecialidadNutricionista TO admin_user;
GRANT EXECUTE ON SP_ActualizarNutricionistaEspecialidad TO admin_user;
GRANT EXECUTE ON SP_ActualizarValorNutricional TO admin_user;
GRANT EXECUTE ON SP_ActualizarReceta TO admin_user;
GRANT EXECUTE ON SP_ActualizarUnidadMedida TO admin_user;
GRANT EXECUTE ON SP_ActualizarIngrediente TO admin_user;
GRANT EXECUTE ON SP_ActualizarRecetaIngrediente TO admin_user;
GRANT EXECUTE ON SP_ActualizarComida TO admin_user;
GRANT EXECUTE ON SP_ActualizarComidaReceta TO admin_user;
GRANT EXECUTE ON SP_ActualizarPlanAlimenticio TO admin_user;
GRANT EXECUTE ON SP_ActualizarPlanAlimenticioComida TO admin_user;
GRANT EXECUTE ON SP_ActualizarEjercicio TO admin_user;
GRANT EXECUTE ON SP_ActualizarRutinaSemana TO admin_user;
GRANT EXECUTE ON SP_ActualizarRutinaEjercicio TO admin_user;
GRANT EXECUTE ON SP_ActualizarRutinaEntrenamiento TO admin_user;
GRANT EXECUTE ON SP_ActualizarCliente TO admin_user;
GRANT EXECUTE ON SP_ActualizarPlanPersonalizado TO admin_user;
GRANT EXECUTE ON SP_ActualizarSesion TO admin_user;
GRANT EXECUTE ON SP_ActualizarEvaluacionFisica TO admin_user;

-- Permisos para prof_user: acceso a clientes, sesiones, evaluación, rutina y profesional
GRANT EXECUTE ON SP_ActualizarCliente TO prof_user;
GRANT EXECUTE ON SP_ActualizarSesion TO prof_user;
GRANT EXECUTE ON SP_ActualizarEvaluacionFisica TO prof_user;
GRANT EXECUTE ON SP_ActualizarProfesional TO prof_user;
GRANT EXECUTE ON SP_ActualizarHorarioProfesional TO prof_user;

-- Permisos para entrenador_user: acceso a rutinas y cliente
GRANT EXECUTE ON SP_ActualizarRutinaEntrenamiento TO entrenador_user;
GRANT EXECUTE ON SP_ActualizarRutinaSemana TO entrenador_user;
GRANT EXECUTE ON SP_ActualizarRutinaEjercicio TO entrenador_user;
GRANT EXECUTE ON SP_ActualizarCliente TO entrenador_user;
GRANT EXECUTE ON SP_ActualizarSesion TO entrenador_user;

-- Permisos para nutricionista_user: acceso a planes, recetas, evaluación y cliente
GRANT EXECUTE ON SP_ActualizarPlanAlimenticio TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarPlanAlimenticioComida TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarComida TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarReceta TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarRecetaIngrediente TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarIngrediente TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarValorNutricional TO nutricionista_user;
GRANT EXECUTE ON SP_ActualizarCliente TO nutricionista_user;

-- Permisos para cliente_user: solo puede actualizar su propia evaluación (si aplica)
GRANT EXECUTE ON SP_ActualizarEvaluacionFisica TO cliente_user;