select *from Paciente;
INSERT INTO Paciente (Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, Edad)
VALUES
  ('Juan', 'González', 'Pérez', '1990-03-15', 33),
  ('María', 'López', 'García', '1985-06-20', 38),
  ('Pedro', 'Ramírez', NULL, '1992-09-10', 30),
  ('Ana', 'Martínez', 'Hernández', '1988-11-25', 34),
  ('Sara', 'Jiménez', 'Rodríguez', '1995-02-05', 28),
  ('Carlos', 'Torres', NULL, '1998-07-18', 23),
  ('Laura', 'Díaz', 'Sánchez', '1993-04-30', 28),
  ('Luis', 'Rojas', NULL, '1991-08-12', 30),
  ('Mónica', 'Vargas', 'Gómez', '1987-12-08', 34),
  ('Daniel', 'Pérez', NULL, '1994-01-22', 29);
  
 
select *from clinica;
INSERT INTO Clinica (Nombre_Clinica, Calle, Numero, Ciudad, Numero_Consultorios)
VALUES
  ('Sonrisa Perfecta', 'Av. Insurgentes', 123, 'Benito Juárez', 5),
  ('DentalCare', 'Aldama', NULL, 'Iztapalapa', 3),
  ('Sonrisa Brillante', 'Horacio', 456, 'Miguel Hidalgo', 7),
  ('Dental Salud Bucal', 'Norte 45', NULL, 'Gustavo A. Madero', 4),
  ('Sonrisa Radiante', 'Reforma', 789, 'Cuauhtémoc', 6),
  ('Clínica Estética', 'Centenario', NULL, 'Álvaro Obregón', 5),
  ('DentalPro', 'Miguel Ángel', 234, 'Coyoacán', 4),
  ('Sonrisa Feliz', 'Av. Tlalpan', NULL, 'Tlalpan', 3),
  ('Sonrisa Integral', 'Francisco I. Madero', 567, 'Venustiano Carranza', 6),
  ('Dental Health', 'Azcapotzalco', NULL, 'Azcapotzalco', 7);


select *from Odontologo;
INSERT INTO Odontologo (Nombre, Apellido_Paterno, Apellido_Materno, Especialidad)
VALUES
  ('Miguel', 'Gómez', 'Hernández', 'Ortodoncia'),
  ('María', 'López', 'García', 'Implantología'),
  ('Pedro', 'Ramírez', NULL, 'Cirugía Oral'),
  ('Ana', 'Martínez', 'Hernández', 'Periodoncia'),
  ('Sara', 'Jiménez', 'Rodríguez', 'Endodoncia'),
  ('Carlos', 'Torres', NULL, 'Odontopediatría'),
  ('Laura', 'Díaz', 'Sánchez', 'Ortodoncia'),
  ('Luis', 'Rojas', NULL, 'Implantología'),
  ('Mónica', 'Vargas', 'Gómez', 'Cirugía Oral'),
  ('Daniel', 'Pérez', NULL, 'Endodoncia');
  
  
Select *from Direccion;
INSERT INTO Direccion (ID_Paciente, Calle, Numero, Colonia, Codigo_Postal)
VALUES
  (1, 'Av. Insurgentes', 12, 'Benito Juárez', 12345),
  (2, 'Aldama', 34, NULL, 23456),
  (3, 'Horacio', NULL, 'Miguel Hidalgo', 34567),
  (4, 'Norte 45', 56, 'Gustavo A. Madero', 45678),
  (5, 'Poniente', NULL, NULL, 56789),
  (6, 'Centenario', 78, 'Álvaro Obregón', 67890),
  (7, 'Principal', NULL, 'Coyoacán', 78901),
  (8, 'Av. Tlalpan', 90, 'Tlalpan', 89012),
  (9, 'Melchor', NULL, NULL, 90123),
  (10, '22 de Febrero', 12, 'Azcapotzalco', 01234);

select*from Consulta;
INSERT INTO Consulta (Fecha, ID_Paciente, Nombre_Clinica, Numero_Trabajador)
VALUES
  ('2022-05-01', 1, 'Sonrisa Perfecta', 1),
  ('2022-05-02', 2, 'DentalCare', 2),
  ('2022-05-03', 3, 'Sonrisa Brillante', 3),
  ('2022-05-04', 4, 'Dental Salud Bucal', 4),
  ('2022-05-05', 5, 'Sonrisa Radiante', 5),
  ('2022-05-06', 6, 'Clínica Estética', 6),
  ('2022-05-07', 7, 'DentalPro', 7),
  ('2022-05-08', 8, 'Sonrisa Feliz', 8),
  ('2022-05-09', 9, 'Sonrisa Integral', 9),
  ('2022-05-10', 10, 'Dental Health', 10);

Select *from Tratamiento;
  INSERT INTO Tratamiento (Nombre_Clave, Precio, Fecha_Inicio, Fecha_Fin, Numero_Trabajador, Numero_Consulta)
VALUES
  ('T1', 500.00, '2022-05-01', '2022-05-15', 1, 1),
  ('T2', 800.00, '2022-05-02', '2022-05-16', 2, 2),
  ('T3', 1200.00, '2022-05-03', '2022-05-17', 3, 3),
  ('T4', 900.00, '2022-05-04', '2022-05-18', 4, 4),
  ('T5', 1500.00, '2022-05-05', '2022-05-19', 5, 5),
  ('T6', 1000.00, '2022-05-06', '2022-05-20', 6, 6),
  ('T7', 700.00, '2022-05-07', '2022-05-21', 7, 7),
  ('T8', 1100.00, '2022-05-08', '2022-05-22', 8, 8),
  ('T9', 0.00, '2022-05-09', NULL, 9, 9),
  ('T10', 1300.00, '2022-05-10', '2022-05-24', 10, 10);

select *from Equipo;
  INSERT INTO Equipo (Numero_Serie, Tipo, Ultima_Fecha_Mantenimiento, Nombre_Clinica)
VALUES
  (1, 'Alicates', '2022-04-01', 'Sonrisa Perfecta'),
  (2, 'Pinzas', '2022-04-02', 'DentalCare'),
  (3, 'Jeringuillas', '2022-04-03', 'Sonrisa Brillante'),
  (4, 'Rayos X', '2022-04-04', 'Dental Salud Bucal'),
  (5, 'Escaladores', '2022-04-05', 'Sonrisa Radiante'),
  (6, 'Amalgamadores', '2022-04-06', 'Clínica Estética'),
  (7, 'Compresor', NULL, 'DentalPro'),
  (8, 'Sensor RVG', '2022-04-08', 'Sonrisa Feliz'),
  (9, 'Turbina dental', '2022-04-09', 'Sonrisa Integral'),
  (10, 'Cámara oral', '2022-04-10', 'Dental Health');


select *from Odontologo_Trabaja_Clinica;
  INSERT INTO Odontologo_Trabaja_Clinica (Nombre_Clinica, Numero_Trabajador, Hora_Inicio, Horario_Fin, Fecha, Descripcion)
VALUES
  ('Sonrisa Perfecta', 1, '09:00:00', '17:00:00', '2022-05-01', 'Urgencia'),
  ('DentalCare', 2, '08:00:00', '16:00:00', '2022-05-02', 'Limpieza bucal'),
  ('Sonrisa Brillante', 3, '10:00:00', '18:00:00', '2022-05-03', 'Chequeo dental'),
  ('Dental Salud Bucal', 4, '11:00:00', '19:00:00', '2022-05-04', 'Extracción de muelas'),
  ('Sonrisa Radiante', 5, '13:00:00', '21:00:00', '2022-05-05', 'Tratamiento de conducto'),
  ('Clínica Estética', 6, '12:00:00', '20:00:00', '2022-05-06', 'Ortodoncia'),
  ('DentalPro', 7, '14:00:00', '22:00:00', '2022-05-07', 'Implantes dentales'),
  ('Sonrisa Feliz', 8, '09:00:00', '17:00:00', '2022-05-08', 'Blanqueamiento dental'),
  ('Sonrisa Integral', 9, '08:00:00', '16:00:00', '2022-05-09', 'Profilaxis'),
  ('Dental Health', 10, '10:00:00', '18:00:00', '2022-05-10', 'Revisión de caries');
select *from Odontologo_Trabaja_Clinica;