# Sistema de Gestión para Clínica Odontológica

Este proyecto tiene como objetivo el desarrollo de un sistema de base de datos para una clínica odontológica utilizando PostgreSQL. El sistema fue partiendo del planteamiento del problema avanzando a través de todas las fases del diseño y construcción de la base de datos.

El desarrollo abarcó desde la elaboración del diagrama Entidad-Relación (ER/EER) hasta la creación del esquema relacional, la implementación de las tablas en PostgreSQL, la inserción de registros de prueba y la ejecución de consultas para evaluar su funcionamiento.

## Índice
1.	Planteamiento del problema
2.	Diagrama ER/EER
3.	Esquema Relacional
4.	Descripción de las tablas (Diccionario de Datos)
5.	Creación de las tablas mediante código SQL
6.	Descripción de los procedimientos almacenados y disparadores
7.	Inserción de datos
8.	Consultas para evaluación

Nota: En el documento [ProyectoClinicaDental.pdf](https://github.com/GerryRG/ProyectoClinicaDental_BD/blob/main/DatabaseDocs/ProyectoClinicaDental.pdf) se encuentra el desglose detallado de cada sección.

## Planteamiento del problema
Una nueva clínica abre sus instalaciones con la problemática de que necesita un sistema que le ayude a administrar desde sus tratamientos, hasta los diversos pacientes que atiende, para ello la clínica busca almacenar toda la información referente a los diversos pacientes que atenderá. Para ello el sistema guardará, paciente su nombre compuesto de nombre, apellido paterno y materno, la dirección dada por la calle, numero, colonia y el código postal, su fecha de nacimiento por la cual el sistema deberá calcular la edad.
Este paciente podrá solicitar vía telefónica una consulta, por lo que se le proporcionará la fecha de su consulta, y el número de su consulta. Cabe aclarar que este número de consulta ayudara a saber cual fue la consulta en el tiempo de vida de la clínica y no en el día. Cada consulta es brindada por un odontólogo el cual el administrador registrara su nombre completo dividido en su nombre y apellido, así como la especialidad en el área que tiene; es por ello por lo que dentro de la clínica se le dará automáticamente un numero de trabajador.
Durante cada consulta en la cual este odontólogo, se realizarán diversos tratamientos los cuales tienen un precio. Estos tratamientos recibirán un nombre clave, ya que son distintos para cada consulta, por lo que el sistema deberá almacenar los tratamientos mediante una fecha de inicio del tratamiento y el odontólogo podrá seleccionar la opción de terminado en caso de que el tratamiento haya finalizado, lo que arroja la fecha de fin.
Debido a que esta clínica ya tenia una sucursal cercana y se planea abrir una tercera clínica, el sistema guardara el local desde donde el odontólogo trabaja apoyándose que cada local le daremos un nombre característico, así como la calle, el número y la ciudad. Por parte del odontólogo el sistema deberá registrar el día en que fue a laborar en ese local, el horario de inicio y de fin en el que se retiró del local. Esto también aplica cuando tenga que asistir a dicho local por casos de emergencia.
Por último, debido a que cada clínica estará conectada al sistema del local en donde se encuentre se debe tener un registro que puede existir más de un consultorio en cada local por lo que necesitamos saber en todo momento con cuantos consultorios cuenta esa clínica, así como el equipo que posee.
Durante la realización de cada inventario, cada equipo se registra por su número de serie, el tipo de equipo y la última fecha en la que se le dio mantenimiento. 

## Diagrama ER/EER
Se diseñó un diagrama Entidad-Relación (ER/EER) inicial basado en el planteamiento del problema. Luego, se aplicó un proceso de normalización para optimizar la estructura de los datos y evitar redundancias.
Como resultado, se desarrolló un segundo diagrama ER/EER mejorado, reflejando un modelo más eficiente alineado con las mejores prácticas de bases de datos.
Estos diagramas definen las entidades principales, sus atributos y las relaciones entre ellas. A partir del modelo final, se establecieron las bases para la construcción del esquema relacional.

## Esquema relacional 
El esquema relacional define la estructura de las tablas y sus relaciones, organizando eficientemente los datos. Por ejemplo, algunas entidades principales incluyen:
- Pacientes
- Clinica
- Odontólogos
- Consulta
- Tratamientos
  
Cada entidad está relacionada con las demás siguiendo las reglas de negocio de la clínica, garantizando la integridad de los datos y facilitando su consulta y recuperación eficiente.

Nota: En la carpeta [Diagramas_sin_Normalizacion](https://github.com/GerryRG/ProyectoClinicaDental_BD/tree/main/DatabaseDocs/Diagramas_sin_Normalizacion)  y  [Diagramas_con_Normalizacion](https://github.com/GerryRG/ProyectoClinicaDental_BD/tree/main/DatabaseDocs/Diagramas_con_Normalizacion) se encuentran dichos diagramas y esquemas.

## Descripción de las tablas (Diccionario de Datos)

Se elaboró un [diccionario de datos](https://github.com/GerryRG/ProyectoClinicaDental_BD/blob/main/DatabaseDocs/Diccionaro_Datos.xlsx) en formato XLSX, donde se documenta cada tabla de la base de datos. Este documento incluye:
- Nombre de la tabla
- Descripción
- Fecha de creación y modificación
- Campos: Nombre, descripción, tipo de dato, longitud y atributos
- Referencias: Llaves primarias (PK) y foráneas (FK)
El diccionario de datos es una herramienta esencial para comprender la estructura del sistema, facilitar su mantenimiento y documentar futuras mejoras o expansiones.

## Creación de las tablas mediante código SQL
Las tablas fueron creadas en PostgreSQL, asegurando una correcta definición de claves primarias y foráneas para mantener la integridad referencial del sistema.

## Descripción de los procedimientos almacenados y disparadores
Para optimizar la gestión de la base de datos, se implementaron procedimientos almacenados y disparadores que automatizan tareas clave, por ejemplo:
- Cálculo automático de la edad del paciente a partir de su fecha de nacimiento.
- Restricciones para garantizar la coherencia en las fechas de tratamientos.

## Inserción de datos
Se realizaron pruebas de inserción de datos en las tablas, asegurando que la base de datos almacene correctamente la información de pacientes, consultas, tratamientos, locales y equipos.

## Consultas para evaluación
Se diseñaron varias consultas SQL para evaluar el correcto funcionamiento del sistema

Nota: En la carpeta de [Scripts](https://github.com/GerryRG/ProyectoClinicaDental_BD/tree/main/Scripts) se encuentra los archivos con extension sql desde la creacion de las tablas hasta las consultas

## Conclusión
Este sistema de base de datos en PostgreSQL proporciona una solución eficiente para la administración de una clínica odontológica. Su diseño relacional garantiza la integridad de los datos, facilita su acceso y mejora la organización de la información.
Además, gracias a la implementación de procedimientos almacenados y disparadores, se automatizan procesos clave dentro del sistema, mejorando la eficiencia y optimizando la gestión operativa de la clínica.

