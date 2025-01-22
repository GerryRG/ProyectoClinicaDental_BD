--Calcular Edad
CREATE OR REPLACE FUNCTION CalcularEdadPaciente()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Edad := EXTRACT(YEAR FROM AGE(CURRENT_DATE, NEW.Fecha_Nacimiento));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ActualizarEdadPaciente
BEFORE INSERT OR UPDATE OF Fecha_Nacimiento ON Paciente
FOR EACH ROW
EXECUTE FUNCTION CalcularEdadPaciente();

INSERT INTO Paciente (Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento)
VALUES ('Juan', 'Pérez', 'Gómez', '1990-05-15');
select *from Paciente;

INSERT INTO Paciente (Nombre, Apellido_Paterno, Fecha_Nacimiento, Edad)
VALUES ('Juan', 'Pérez', '2002-03-09',20);
select *from Paciente;

--Evitar 0 consultorios
CREATE OR REPLACE FUNCTION VerificarNumeroConsultorios()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Numero_Consultorios < 1 THEN
        RAISE EXCEPTION 'No se permite registrar una clínica con 0 o menos consultorios.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EvitarClinicasCeroConsultorios
BEFORE INSERT OR UPDATE ON Clinica
FOR EACH ROW
EXECUTE FUNCTION VerificarNumeroConsultorios();

INSERT INTO Clinica (Nombre_Clinica, Calle, Numero, Ciudad, Numero_Consultorios)
VALUES ('Clínica ABC', 'Calle Principal', 123, 'Ciudad XYZ', -1);

select *from clinica;

--Evitar horas de trabajo negativas
CREATE OR REPLACE FUNCTION VerificarHoras()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Horario_Fin < NEW.Hora_Inicio THEN
        RAISE EXCEPTION 'La hora de fin no puede ser menor a la hora de inicio.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EvitarHoraFinMenor
BEFORE INSERT OR UPDATE ON Odontologo_Trabaja_Clinica
FOR EACH ROW
EXECUTE FUNCTION VerificarHoras();

INSERT INTO Clinica (Nombre_Clinica, Calle, Numero, Ciudad, Numero_Consultorios)
VALUES ('Clínica Dental', 'Calle Principal', 123, 'Ciudad XYZ', 5);

INSERT INTO Odontologo (Numero_Trabajador, Nombre, Apellido_Paterno, Apellido_Materno, Especialidad)
VALUES (123, 'Juan', 'Pérez', 'Gómez', 'Especialidad Dental');

INSERT INTO Odontologo_Trabaja_Clinica (Nombre_Clinica, Numero_Trabajador, Hora_Inicio, Horario_Fin, Fecha, Descripcion)
VALUES ('Clínica Dental', 123, '08:00:00', '07:30:00', '2023-06-24', 'Horarios incorrectos');

--Evitar tratamiendo con la fecha mal 
CREATE OR REPLACE FUNCTION VerificarFechas()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Fecha_Fin < NEW.Fecha_Inicio THEN
        RAISE EXCEPTION 'La fecha de fin no puede ser anterior a la fecha de inicio.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EvitarFechaFinAnterior
BEFORE INSERT OR UPDATE ON Tratamiento
FOR EACH ROW
EXECUTE FUNCTION VerificarFechas();

INSERT INTO Consulta (Numero_Consulta, Fecha, ID_Paciente, Nombre_Clinica, Numero_Trabajador)
VALUES (456, '2023-06-24', 2, 'Clínica Dental', 123);

INSERT INTO Tratamiento (Nombre_Clave, Precio, Fecha_Inicio, Fecha_Fin, Numero_Trabajador, Numero_Consulta)
VALUES ('Tratamiento1', 100.0, '2023-06-01', '2023-05-31', 123, 456);

--Evitar precios negativos
CREATE OR REPLACE FUNCTION VerificarPrecio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Precio < 0 THEN
        RAISE EXCEPTION 'El precio no puede ser negativo.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EvitarPrecioNegativo
BEFORE INSERT OR UPDATE ON Tratamiento
FOR EACH ROW
EXECUTE FUNCTION VerificarPrecio();

INSERT INTO Tratamiento (Nombre_Clave, Precio, Fecha_Inicio, Fecha_Fin, Numero_Trabajador, Numero_Consulta)
VALUES ('Tratamiento1', -100.0, '2023-06-01', '2023-06-30', 123, 456);
