USE MASTER
Go
ALTER DATABASE VITALPRO
ADD FILEGROUP Entrenamiento
Go

USE master
GO
ALTER DATABASE VITALPRO
ADD FILE(
NAME = Entrenamiento_Data,
FILENAME = 'C:\SqlData\Entrenamiento_Data.ndf'
)
TO FILEGROUP Entrenamiento
GO

EXEC Sp_HelpDB VITALPRO
go

-- TABLES
Use VITALPRO
GO
CREATE TABLE Ejercicio
(
	Id_Ejercicio			INT			 NOT NULL,
	Nombre					VARCHAR (50) NOT NULL,
	GrupoMuscularTrabajado  VARCHAR (50) NOT NULL, 
	CantidadRepeticiones	INT			 NOT NULL,
	EquipamientoEspecial	BIT			 NOT NULL,
	CONSTRAINT PK_Id_Ejercicio
	PRIMARY KEY (Id_Ejercicio)
) ON Entrenamiento
GO

EXEC Sp_Help Ejercicio
go

Use VITALPRO
GO
CREATE TABLE RutinaEntrenamiento
(
	Id_Rutina				INT			 NOT NULL,
	DescripcionObjetivo		VARCHAR (100)NOT NULL,
	Nivel					VARCHAR (20) NOT NULL, 
	DuracionTotalxSemana	INT			 NOT NULL,
	EjerciciosXDia			INT			 NOT NULL,
	CodigoUnicoCcentro		INT			 NOT NULL,
	Id_Entrenador			INT			 NOT NULL,
	CONSTRAINT PK_Id_Rutina
	PRIMARY KEY (Id_Rutina)
) ON Entrenamiento
GO

Use VITALPRO
GO
CREATE TABLE RutinaSemana
(
	Id_RutinaSemana			INT			 NOT NULL,
	DiaSemana				VARCHAR (10) NOT NULL,
	HoraInicio				TIME		 NOT NULL, 
	HoraFin					TIME		 NOT NULL,
	Id_Rutina				INT			 NOT NULL,
	CONSTRAINT PK_Id_RutinaSemana
	PRIMARY KEY (Id_RutinaSemana),
	CONSTRAINT FK_RutinaSemana_RutinaEntrenamiento
	FOREIGN KEY (Id_Rutina) REFERENCES RutinaEntrenamiento(Id_Rutina)
) ON Entrenamiento
GO

EXEC Sp_Help RutinaSemana
GO

Use VITALPRO
GO
CREATE TABLE RutinaEjercicio
(
	Id_RutinaEjercicio		INT			 NOT NULL,
	Id_Ejercicio			INT			 NOT NULL,
	Id_RutinaSemana			INT			 NOT NULL,
	CONSTRAINT PK_Id_RutinaEjercicio
	PRIMARY KEY (Id_RutinaEjercicio),
	CONSTRAINT FK_RutinaEjercicio_RutinaSemana
	FOREIGN KEY (Id_RutinaSemana) REFERENCES RutinaSemana(Id_RutinaSemana),
	CONSTRAINT FK_RutinaEjercicio_Ejercicio
	FOREIGN KEY (Id_Ejercicio) REFERENCES Ejercicio(Id_Ejercicio)
) ON Entrenamiento
GO

EXEC Sp_Help RutinaEjercicio
GO
