/* bastián mariangel | robinson campos | victor briso*/
create database trabajo_grupal_5;
use trabajo_grupal_5;
create table usuarios (
	id_usuario int(20) PRIMARY KEY auto_increment, /*dato numerico para generar relaciones con otras tablas, y permitir un gran numero de registros*/
    nombre varchar(50), -- campo de tipo texto para registrar los nombres del usuario con un maximo de 50 caracteres
    apellido varchar(50), -- campo de tipo texto para registrar los apellidos del usuario con un maximo de 50 caracteres
	contrasenha varchar(50), -- campo de tipo texto para registrar la contraseña del usuario con un maximo de 50 caracteres
    zona_horaria varchar(10) default 'UTC-3', -- campo de tipo texto para registrar la zona horaria usuario con un maximo de 10 caracteres
    genero bool, -- false para femenino y true para masculino
    fono int(10) -- campo de tipo numero para guardar el número de teléfono
);

create table registro_ingresos (
	id_ingreso int(20) PRIMARY KEY auto_increment, /*dato numerico para generar relaciones con otras tablas, y permitir un gran numero de registros*/
    id_usuario int(20), /*dato numerico para generar relaciones con otras tablas, y permitir un gran numero de registros*/
    fecha_hora_ingreso datetime default now(), -- permite giardar fecha y hora, según las necesidades del proyecto
    FOREIGN KEY (id_usuario) REFERENCES trabajo_grupal_5.usuarios (id_usuario)
);

ALTER TABLE usuarios ALTER COLUMN zona_horaria SET DEFAULT 'UTC-2';

insert into usuarios (nombre, apellido, contrasenha, genero, fono) values 
('juan', 'gonzalez', 1234, 1, 12345678),
('andres', 'escalante', 1234, 1, 12345678),
('renato', 'araya', 1234, 1, 12345678),
('gonzalo', 'perez', 1234, 1, 12345678),
('maria', 'perez', 1234, 1, 12345678),
('romaina', 'leiva', 1234, 1, 12345678),
('marcela', 'rios', 1234, 1, 12345678),
('loreto', 'berrios', 1234, 1, 12345678);

insert into registro_ingresos (id_usuario) values 
(1),
(5),
(8),
(2),
(2),
(7),
(6),
(2);

create table contactos (
	id_contacto int(20) PRIMARY KEY auto_increment, /*dato numerico para generar relaciones con otras tablas, y permitir un gran numero de registros*/
    id_usuario int(20), /*dato numerico para generar relaciones con otras tablas, y permitir un gran numero de registros*/
    numero_telefono int(10), -- campo de tipo numero para guardar el número de teléfono
	correo_electronico varchar(50), -- campo de tipo texto para guardar el mail del usuario y con un máximo de 50 caracteres
    FOREIGN KEY (id_usuario) REFERENCES trabajo_grupal_5.usuarios (id_usuario)
);
alter table usuarios drop column fono;