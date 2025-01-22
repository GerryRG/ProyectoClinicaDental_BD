-- 1) Genere una vista donde visualice que odontologo atiende a que paciente.
drop view Vista_Ondontologos_Pacientes;
CREATE VIEW Vista_Ondontologos_Pacientes AS
SELECT ' El Odontologo '||o.nombre||' con numero de trabajador '||o.numero_trabajador||' atiende al paciente con id '|| c.ID_Paciente 
FROM Consulta c
JOIN Odontologo o ON c.Numero_Trabajador = o.Numero_Trabajador;

SELECT * FROM Vista_Ondontologos_Pacientes;

--2)Genere un reporte donde se recupere que tratamiento realiza cada odontologo.
SELECT 
    'El Odontólogo ' || o.Nombre || ' con numero de trabajador '||o.numero_trabajador||
    ' hace el tratamiento ' || t.Nombre_Clave AS Reporte
FROM Odontologo o
JOIN Tratamiento t ON o.Numero_Trabajador = t.Numero_Trabajador;

--3) En que Clinica trabaja que odontologos
SELECT C.Nombre_Clinica, O.Nombre, O.Apellido_Paterno,O.Apellido_Materno, O.Numero_Trabajador
FROM Clinica C
JOIN Odontologo_Trabaja_Clinica OT ON C.Nombre_Clinica = OT.Nombre_Clinica
JOIN Odontologo O ON OT.Numero_Trabajador = O.Numero_Trabajador;

--4)Genere una funcion que a partir de introducir el nombre completo´del paciente genere lo siguiente:
-- | Nombre_completo_Pcaiente | Edad | Tratamiento | Precio | Nombre_completo_Odontologo | Cedula | Clinica

CREATE OR REPLACE FUNCTION ObtenerInformacionPaciente(nombre_completo_paciente varchar)
  RETURNS TABLE (
    Nombre_completo_Paciente varchar,
    Edad integer,
    Tratamiento varchar,
    Precio float,
    Nombre_completo_Odontologo varchar,
    Cedula integer,
    Clinica varchar
  )
AS $$
BEGIN
  RETURN QUERY
    SELECT
      p.Nombre || ' ' || p.Apellido_Paterno || ' ' || p.Apellido_Materno AS Nombre_completo_Paciente,
      p.Edad,
      t.Nombre_Clave AS Tratamiento,
      t.Precio,
      o.Nombre || ' ' || o.Apellido_Paterno || ' ' || o.Apellido_Materno AS Nombre_completo_Odontologo,
      o.Numero_Trabajador AS Cedula,
      c.Nombre_Clinica AS Clinica
    FROM
      Paciente p
      JOIN Consulta co ON p.ID_Paciente = co.ID_Paciente
      JOIN Tratamiento t ON co.Numero_Consulta = t.Numero_Consulta
      JOIN Odontologo o ON co.Numero_Trabajador = o.Numero_Trabajador
      JOIN Clinica c ON co.Nombre_Clinica = c.Nombre_Clinica
    WHERE
      p.Nombre || ' ' || p.Apellido_Paterno || ' ' || p.Apellido_Materno = nombre_completo_paciente;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ObtenerInformacionPaciente('María López García');
select *from paciente;
--5)Ingrese la siguiente informacion:
--Juan Ramirez Iñiguez de 38 años, ingreso a la clinica dentalink para un tratamiento de carillas, el cual tiene un costo
-- de $500.00, para ello el odontologo que lo atiende se llama Maria Angeles Peña con especialidad en ortodoncia.

-- Insertar datos del paciente
INSERT INTO Paciente (Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento ,Edad)
VALUES ('Juan', 'Ramirez', 'Iñiguez','1985-06-20', 38);

select *from Paciente;
--24

-- Insertar datos del odontólogo
INSERT INTO Odontologo (Nombre, Apellido_Paterno, Apellido_Materno, Especialidad)
VALUES ('Maria', 'Angeles', 'Peña', 'Ortodoncia');
select *from Odontologo;
--21

--Inserta datos de Clínica 
INSERT INTO Clinica(Nombre_Clinica, Calle, Ciudad, Numero_Consultorios)VALUES('Dentalink', 'Montevideo', 'Gustavo A Madero', 5);
select *from Clinica;

--Insertar datos de Consulta
INSERT INTO Consulta(Fecha, ID_Paciente, Nombre_Clinica, Numero_Trabajador) VALUES(CURRENT_DATE, 24, 'Dentalink', 21);
select *from Consulta;

-- Insertar tratamiento de carillas para Juan Ramirez Iñiguez
INSERT INTO Tratamiento (Nombre_Clave, Precio, Fecha_Inicio, Numero_Trabajador, Numero_Consulta)
VALUES ('Carillas', 500.00, CURRENT_DATE, 21, 21);
Select *from Tratamiento;


SELECT 
    p.Nombre||' '|| p.Apellido_Paterno||' '|| p.Apellido_Materno|| ' de '|| p.Edad||' años, ingresó a la clínica '|| c.Nombre_Clinica||
    ' para un tratamiento de '|| t.Nombre_Clave|| ', el cual tiene un costo de $'|| t.Precio|| '. Para ello, el odontólogo que lo atiende se llama '||
    o.Nombre||' '|| o.Apellido_Paterno||' '||o.Apellido_Materno|| ' con especialidad en '|| o.Especialidad||'.'
FROM Paciente p
JOIN Consulta co ON p.ID_Paciente = co.ID_Paciente
JOIN Clinica c ON co.Nombre_Clinica = c.Nombre_Clinica
JOIN Tratamiento t ON co.Numero_Consulta = t.Numero_Consulta
JOIN Odontologo o ON co.Numero_Trabajador = o.Numero_Trabajador
WHERE p.Nombre = 'Juan'
    AND p.Apellido_Paterno = 'Ramirez'
    AND p.Apellido_Materno = 'Iñiguez';

--6) Genere una funcion que me regrese los tratamientos que ha realizado un odontologo
--a partir de su nombre y de la fecha de inicio.

CREATE FUNCTION ObtenerTratamientosPorOdontologo(
    odontologo_nombre VARCHAR(100),
    fecha_ini DATE
) RETURNS TABLE (
    Tratamiento VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.Nombre_Clave AS Tratamiento
    FROM
        Odontologo o
        JOIN Consulta c ON o.Numero_Trabajador = c.Numero_Trabajador
        JOIN Tratamiento t ON c.Numero_Consulta = t.Numero_Consulta
    WHERE
        CONCAT(o.Nombre, ' ', o.Apellido_Paterno, ' ', o.Apellido_Materno) = odontologo_nombre
        AND t.Fecha_Inicio >= fecha_ini;
END;
$$ LANGUAGE plpgsql;


SELECT *FROM ObtenerTratamientosPorOdontologo('Miguel Gómez Hernández', '2022-05-01');
Select *from Odontologo;


--7) Ingrese 10 nuevos odontologos con informacion en todos los campos
INSERT INTO Odontologo (Nombre, Apellido_Paterno, Apellido_Materno, Especialidad)
VALUES
    ('Juan', 'Pérez', 'Gómez', 'Ortodoncia'),
    ('María', 'López', 'Fernández', 'Endodoncia'),
    ('Carlos', 'González', 'Ramírez', 'Cirugía Oral'),
    ('Ana', 'Martínez', 'Sánchez', 'Periodoncia'),
    ('Pedro', 'Rodríguez', 'Hernández', 'Implantología'),
    ('Laura', 'García', 'Torres', 'Odontopediatría'),
    ('Jorge', 'Vargas', 'Ruiz', 'Ortodoncia'),
    ('Sofía', 'Morales', 'Navarro', 'Endodoncia'),
    ('Luis', 'Herrera', 'Lara', 'Cirugía Oral'),
    ('Elena', 'Castillo', 'Vargas', 'Periodoncia');
select *from Odontologo;
select *from Odontologo_Trabaja_Clinica;

--8) Ingrese 10 nuevos clientes con sus tratamientos y asignelos a los nuevos odontologos 
--que ingreso. Minimo debe estar asignado a 4 de los nuevos odontologos
INSERT INTO Paciente (Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, Edad)
VALUES
    ('Alejandra', 'González', 'Hernández', '1992-08-10', 29),
    ('Luisa', 'Martínez', 'Pérez', '1995-03-25', 26),
    ('Fernando', 'Sánchez', 'López', '1989-11-18', 32),
    ('Gabriela', 'Torres', 'Ramírez', '1993-06-05', 28),
    ('Roberto', 'Hernández', 'Gómez', '1998-02-22', 23),
    ('Mariana', 'Lara', 'Fernández', '1990-07-15', 31),
    ('Ricardo', 'Vargas', 'Morales', '1987-12-08', 34),
    ('Paula', 'Fuentes', 'Jiménez', '1996-09-20', 25),
    ('Sergio', 'Ortega', 'Castillo', '1991-04-03', 30),
    ('Isabel', 'Cortés', 'Núñez', '1988-01-12', 33);
	
select *from Paciente;
select *from Clinica;
select *from Odontologo;

INSERT INTO Consulta (Fecha, ID_Paciente, Nombre_Clinica, Numero_Trabajador)
VALUES
    ('2023-01-15', 14, 'Clínica Dental', 20),
    ('2023-02-20', 15, 'Sonrisa Perfecta', 11),
    ('2023-03-10', 16, 'DentalCare', 12),
    ('2023-04-05', 17, 'Sonrisa Brillante', 13),
    ('2023-05-12', 18, 'Dental Salud Bucal', 14),
    ('2023-06-08', 19, 'Sonrisa Radiante', 15),
    ('2023-07-19', 20, 'Clínica Estética', 16),
    ('2023-08-24', 21, 'DentalPro', 17),
    ('2023-09-13', 22, 'Sonrisa Feliz', 18),
    ('2023-10-30', 23, 'Sonrisa Integral', 19);
	
select *From Consulta;

INSERT INTO Tratamiento (Nombre_Clave, Precio, Fecha_Inicio, Fecha_Fin, Numero_Trabajador, Numero_Consulta)
VALUES
    ('T11', 150.00, '2023-01-05', '2023-01-20', 11, 11),
    ('T12', 200.00, '2023-02-10', '2023-03-05', 12, 12),
    ('T13', 180.00, '2023-03-15', '2023-04-10', 13, 13),
    ('T14', 300.00, '2023-04-20', '2023-05-15', 14, 14),
    ('T15', 250.00, '2023-05-25', '2023-06-20', 15, 15),
    ('T16', 175.00, '2023-06-30', '2023-07-25', 16, 16),
    ('T17', 220.00, '2023-07-30', '2023-08-15', 17, 17),
    ('T18', 280.00, '2023-08-20', '2023-09-10', 18, 18),
    ('T19', 190.00, '2023-09-15', '2023-10-05', 19, 19),
    ('T20', 260.00, '2023-10-10', '2023-11-05', 20, 20);
	
select *from Tratamiento;

