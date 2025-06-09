-- se crea un login (genera credenciales )
USE master
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


-- Crea los usuarios en la Base de Datos
USE VITALPRO
GO
CREATE USER admin_user FOR LOGIN admin_user;
CREATE USER prof_user FOR LOGIN prof_user;
CREATE USER entrenador_user FOR LOGIN entrenador_user;
CREATE USER nutricionista_user FOR LOGIN nutricionista_user;
CREATE USER cliente_user FOR LOGIN cliente_user;
GO
-- Crea los roles 
CREATE ROLE Administrador;
CREATE ROLE Profesional;
CREATE ROLE Entrenador;
CREATE ROLE Nutricionista;
CREATE ROLE Cliente;
GO
-- le asigna roles a los usuarios 
EXEC sp_addrolemember 'Administrador', 'admin_user';
EXEC sp_addrolemember 'Profesional', 'prof_user';
EXEC sp_addrolemember 'Entrenador', 'entrenador_user';
EXEC sp_addrolemember 'Nutricionista', 'nutricionista_user';
EXEC sp_addrolemember 'Cliente', 'cliente_user';
GO
