-------------------------------------------------------
USE master
GO
ALTER DATABASE VITALPRO
ADD FILEGROUP  Nutricionista
Go
-------------------------------------------------------
USE master
GO
ALTER DATABASE VITALPRO
ADD FILE(
NAME = Nutricionista_Data,
FILENAME = 'C:\SqlData\Nutricionista_Data.ndf'
)
TO FILEGROUP  Nutricionista
GO
-------------------------------------------------------
USE VITALPRO
GO
CREATE TABLE Ingredientes
(
	id_Ingrediente int NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Unidad VARCHAR(20) NOT NULL
)
ON Nutricionista
GO
-------------------------------------------------------
Use VITALPRO 
go
ALTER TABLE Ingredientes
ADD CONSTRAINT PK_Ingredientes
PRIMARY KEY (id_Ingrediente)
go
-------------------------------------------------------
USE VITALPRO
GO
CREATE TABLE Receta
(	
	id_Receta int NOT NULL,
	Nombre VARCHAR (50) NOT NULL,
	TiempoPreparación int NOT NULL
)
ON Nutricionista
GO
-------------------------------------------------------
Use VITALPRO 
GO
ALTER TABLE Receta
ADD CONSTRAINT PK_Receta
PRIMARY KEY (id_Receta)
go
-------------------------------------------------------
USE VITALPRO
GO
CREATE TABLE RecetaIngrediente
(
	id_RecetaIngredientes int NOT NULL,
	Cantidad FLOAT NOT NULL,
	TiempoPreparación int NOT NULL
)
ON Nutricionista
GO
-------------------------------------------------------
Use VITALPRO 
GO
ALTER TABLE RecetaIngrediente
ADD CONSTRAINT PK_RecetaIngrediente
PRIMARY KEY (id_RecetaIngredientes)
GO
-------------------------------------------------------
USE VITALPRO
GO
CREATE TABLE Comida
(
	id_Comida int NOT NULL,
	TipoComida VARCHAR(50) NOT NULL,	
	CodigoPlan int NOT NULL
)
ON Nutricionista
GO
-------------------------------------------------------
Use VITALPRO 
GO
ALTER TABLE Comida
ADD CONSTRAINT PK_Comida
PRIMARY KEY (id_Comida)
GO
-------------------------------------------------------
USE VITALPRO
GO
CREATE TABLE ComidaReceta
(
	id_ComidaReceta int NOT NULL
)
ON  Nutricionista
GO
-------------------------------------------------------
USE VITALPRO 
GO
ALTER TABLE ComidaReceta
ADD CONSTRAINT PK_ComidaReceta
PRIMARY KEY (id_ComidaReceta)
GO
-------------------------------------------------------
USE VITALPRO;
GO
ALTER TABLE ComidaReceta
ADD CONSTRAINT FK_ComidaReceta_Comida
FOREIGN KEY (id_ComidaReceta)
REFERENCES Comida(id_Comida);
GO

ALTER TABLE ComidaReceta
ADD CONSTRAINT FK_ComidaReceta_Receta
FOREIGN KEY (id_ComidaReceta)
REFERENCES Receta(id_Receta);
GO
-------------------------------------------------------
ALTER TABLE RecetaIngrediente
ADD CONSTRAINT FK_RecetaIngrediente_Receta
FOREIGN KEY (id_RecetaIngredientes)
REFERENCES Receta(id_Receta);
GO

ALTER TABLE RecetaIngrediente
ADD CONSTRAINT FK_RecetaIngrediente_Ingrediente
FOREIGN KEY (id_RecetaIngredientes)
REFERENCES Ingredientes(id_Ingrediente);
GO
