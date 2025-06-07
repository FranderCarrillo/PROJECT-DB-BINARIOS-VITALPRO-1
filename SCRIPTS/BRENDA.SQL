use VITALPRO
go
CREATE TABLE CentroVitalPro
(
	CodigoUnico integer NOT NULL,
	Nombre varchar(50) NOT NULL,
	Provincia varchar (50) NOT NULL,
	Cantón varchar(50) NOT NULL,
	Distrito varchar(50) NOT NULL,
	DireccionExacta varchar(100) NOT NULL,
	NumContacto varchar (15) NULL
    CONSTRAINT PK_CentroVitalPro
    PRIMARY KEY CLUSTERED (CodigoUnico)
)
go

use VITALPRO
go
CREATE TABLE HorarioCentro
(
	Id_Horario integer NOT NULL,
	DíaSemana varchar(20) NOT NULL,
	HoraInicio time NOT NULL,
	HoraFin time NOT NULL,
	CodigoUnicoCentro integer NOT NULL
    CONSTRAINT PK_HorarioCentro
    PRIMARY KEY CLUSTERED (Id_Horario)
)
go
CREATE TABLE Sesion
(
	Id_Sesion integer NOT NULL,
	TipoSesion varchar(50) NOT NULL,
	Fecha date NOT NULL,
	Hora time  NULL,
	PersonalAsignado varchar(50) NOT NULL,
	Duracion integer NOT NULL,
	Sede varchar (50) NOT NULL,
	Estado varchar (20) NOT NULL,
	CodigoUnicoCentro integer NOT NULL,
	CodigoProfesional integer NOT NULL,
	NumAfiliación integer NOT NULL
    CONSTRAINT PK_Sesion
    PRIMARY KEY CLUSTERED (Id_Sesion)
)
go
CREATE TABLE Clientes
(
	NumAfiliacion integer NOT NULL,
	Nombre varchar(30) NOT NULL,
	Apellido1 varchar(30) NOT NULL,
	Apellido2 varchar(30) NOT NULL,
	Cedula varchar(12) NOT NULL,
	Genero varchar(1) NOT NULL,
	FechaNacimento date NOT NULL,
	Telefono varchar (15) NOT NULL,
	CorreoElectronico varchar(100) NOT NULL,
	FechaIngreso date NOT NULL,
	Id_Entrenador integer NOT NULL,
	CodigoPlanAlimenticio integer NOT NULL,
	CodigoUnicoCentro integer NOT NULL
    CONSTRAINT PK_Clientes
    PRIMARY KEY CLUSTERED (NumAfiliacion)
)
go
execute sp_help CentroVitalPro
go
execute sp_help HorarioCentro
go
execute sp_help Sesion
go
execute sp_help Clientes
go

--------------FOREIGN KEY---------------
----------------CLIENTES----------------
use VITALPRO
go
ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_CentroVitalPro
FOREIGN KEY (CodigoUnicoCentro)
REFERENCES CentroVitalPro(CodigoUnico)
go

use VITALPRO
go
ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_PlanAlimenticio
FOREIGN KEY (CodigoPlanAlimenticio)
REFERENCES PlanAlimenticio(CodigoPlan)
go

ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_Entrenador
FOREIGN KEY (Id_Entrenador)
REFERENCES 	Entrenador(IdEntrenador)
go
---------------SESION-------------------
ALTER TABLE Sesion
ADD CONSTRAINT FK_Sesion_CentroVitalPro
FOREIGN KEY (CodigoUnicoCentro)
REFERENCES 	CentroVitalPro(CodigoUnico)
go

ALTER TABLE Sesion
ADD CONSTRAINT FK_Sesion_Profesional
FOREIGN KEY (CodigoProfesional)
REFERENCES 	Profesional(CodigoProfesional)
go

ALTER TABLE Sesion
ADD CONSTRAINT FK_Sesion_Clientes
FOREIGN KEY (NumAfiliación)
REFERENCES 	Clientes(NumAfiliacion)
go
-----------HorarioCentro----------------
ALTER TABLE HorarioCentro
ADD CONSTRAINT FK_HorarioCentro_CentroVitalPro
FOREIGN KEY (CodigoUnicoCentro)
REFERENCES 	CentroVitalPro(CodigoUnico)
go