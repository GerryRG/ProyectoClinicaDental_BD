CREATE TABLE Paciente(ID_Paciente Serial NOT NULL , 
Nombre varchar(30) NOT NULL, 
Apellido_Paterno varchar(15) NULL,
Apellido_Materno varchar(15) NULL, 
Fecha_Nacimiento date NOT NULL,
Edad integer NULL,
constraint PK_PACIENTE primary key (ID_Paciente));

CREATE TABLE Clinica(Nombre_Clinica varchar(20) NOT NULL, 
Calle varchar(20) NOT NULL, 
Numero integer NULL, 
Ciudad varchar(20) NOT NULL, 
Numero_Consultorios integer NOT NULL,
constraint PK_CLINICA primary key (Nombre_Clinica));

CREATE TABLE Odontologo(Numero_Trabajador serial NOT NULL, 
Nombre varchar(30) NOT NULL, 
Apellido_Paterno varchar(15) NULL, 
Apellido_Materno varchar(15) NULL, 
Especialidad varchar(20) NULL,
constraint PK_ODONTOLOGO primary key (Numero_Trabajador));

CREATE TABLE Direccion(ID_Paciente integer NOT NULL, 
Calle varchar(20) NOT NULL,
Numero integer NULL,
Colonia varchar(20) NULL, 
Codigo_Postal integer NOT NULL,
constraint FK_DIRECCION_PACIENTE foreign key (ID_Paciente) references Paciente(ID_Paciente));

CREATE TABLE Consulta(Numero_Consulta serial NOT NULL,
Fecha date NOT NULL,
ID_Paciente integer NOT NULL,
Nombre_Clinica varchar(20) NOT NULL, 
Numero_Trabajador integer NOT NULL,
constraint PK_CONSULTA primary key (Numero_Consulta),
constraint FK_CONSULTA_PACIENTE foreign key (ID_Paciente) references Paciente(ID_Paciente),
constraint FK_CONSULTA_CLINICA foreign key (Nombre_Clinica) references Clinica(Nombre_Clinica),
constraint FK_CONSULTA_TRABAJADOR foreign key (Numero_Trabajador) references Odontologo(Numero_Trabajador));

CREATE TABLE Tratamiento(Nombre_Clave varchar(20) NOT NULL,
Precio float NULL,
Fecha_Inicio date NOT NULL,
Fecha_Fin date NULL,
Numero_Trabajador integer NOT NULL, 
Numero_Consulta integer NOT NULL,
constraint PK_TRATAMIENTO primary key (Nombre_Clave),
constraint FK_TRATAMIENTO_TRABAJADOR foreign key (Numero_Trabajador) references Odontologo(Numero_Trabajador),
constraint FK_TRATAMIENTO_CONSULTA foreign key (Numero_Consulta) references Consulta(Numero_Consulta)); 


CREATE TABLE Equipo(Numero_Serie integer NOT NULL, 
Tipo varchar(15) NULL, 
Ultima_Fecha_Mantenimiento date NULL, 
Nombre_Clinica varchar(20) NOT NULL,
constraint PK_EQUIPO primary key (Numero_Serie),
constraint FK_EQUIPO_CLINICA foreign key (Nombre_Clinica) references Clinica(Nombre_Clinica));


CREATE TABLE Odontologo_Trabaja_Clinica(Nombre_Clinica varchar(20) NOT NULL, 
Numero_Trabajador integer NOT NULL,
Hora_Inicio time NULL,
Horario_Fin time NULL, 
Fecha date NOT NULL,
Descripcion varchar(50) NULL,
constraint FK_TRABAJA_TRABAJADOR foreign key (Numero_Trabajador) references Odontologo(Numero_Trabajador),
constraint FK_TRABAJA_CLINICA foreign key (Nombre_Clinica) references Clinica(Nombre_Clinica));

