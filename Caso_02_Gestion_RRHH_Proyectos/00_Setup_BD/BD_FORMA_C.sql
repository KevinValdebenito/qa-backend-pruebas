 
/* =====================================================
   ELIMINAR TABLAS EN ORDEN INVERSO DE DEPENDENCIA
===================================================== */
BEGIN EXECUTE IMMEDIATE 'DROP TABLE empleado_capacitacion CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE capacitacion CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE evaluacion_desempeno CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE licencia_medica CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE vacaciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE asistencia CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tarea CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE empleado_proyecto CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE proyecto CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE contacto_emergencia CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE correo_electronico CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE telefono CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE detalle_sueldo CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE empleado CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE bonificacion CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tipo_empleado CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departamento CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE direccion CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE persona CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE comuna CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE provincia CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE region CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
 
/* =====================================================
   ELIMINAR SECUENCIAS SI EXISTEN
===================================================== */
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_proyecto'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_tarea'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_asistencia'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_vacaciones'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_licencia_medica'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_evaluacion'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_capacitacion'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_telefono'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_correo'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_contacto_emergencia'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -2289 THEN RAISE; END IF; END;
/
 
/* =====================================================
   TABLAS GEOGRÁFICAS (REGION / PROVINCIA / COMUNA)
===================================================== */
 
/*Creación tabla region*/
create table region(
codigo number,
nombre varchar2(255) not null,
prioridad number not null,
primary key(codigo)
);
 
comment on table region is 'Tabla con las Regiones de Chile';
comment on column region.codigo is 'Código de la región';
comment on column region.nombre is 'Nombre de la región';
comment on column region.prioridad is 'Prioridad usada en las listas (combobox)';
 
insert into region(codigo, nombre, prioridad) values (15, 'Arica y Parinacota', 1);
insert into region(codigo, nombre, prioridad) values (1, 'Tarapacá', 2);
insert into region(codigo, nombre, prioridad) values (2, 'Antofagasta', 3);
insert into region(codigo, nombre, prioridad) values (3, 'Atacama', 4);
insert into region(codigo, nombre, prioridad) values (4, 'Coquimbo', 5);
insert into region(codigo, nombre, prioridad) values (5, 'Valparaíso', 6);
insert into region(codigo, nombre, prioridad) values (6, 'Lib. Gral. Bernardo O ''Higgins', 7);
insert into region(codigo, nombre, prioridad) values (7, 'Maule', 8);
insert into region(codigo, nombre, prioridad) values (8, 'Biobío', 9);
insert into region(codigo, nombre, prioridad) values (9, 'La Araucanía', 10);
insert into region(codigo, nombre, prioridad) values (14, 'Los Ríos', 11);
insert into region(codigo, nombre, prioridad) values (10, 'Los Lagos', 12);
insert into region(codigo, nombre, prioridad) values (11, 'Aysén del Gral. C. Ibáñez del Campo', 13);
insert into region(codigo, nombre, prioridad) values (12, 'Magallanes y Antártica Chilena', 14);
insert into region(codigo, nombre, prioridad) values (13, 'Metropolitana de Santiago', 15);
COMMIT;
 
/*Creación tabla provincia*/
create table provincia(
codigo number,
nombre varchar2(255) not null,
codigo_region number,
primary key(codigo),
foreign key(codigo_region) references region(codigo)
);
comment on table provincia is 'Tabla con las Provincias de Chile';
comment on column provincia.codigo is 'Código de la provincia';
comment on column provincia.nombre is 'Nombre de la provincia';
comment on column provincia.codigo_region is 'Referencia la tabla region(codigo)';
 
insert into provincia(codigo, nombre, codigo_region) values(1,  'Arica', 15);
insert into provincia(codigo, nombre, codigo_region) values(2,  'Parinacota', 15);
insert into provincia(codigo, nombre, codigo_region) values(3,  'Iquique', 1);
insert into provincia(codigo, nombre, codigo_region) values(4,  'Tamarugal', 1);
insert into provincia(codigo, nombre, codigo_region) values(5,  'Antofagasta', 2);
insert into provincia(codigo, nombre, codigo_region) values(6,  'El Loa', 2);
insert into provincia(codigo, nombre, codigo_region) values(7,  'Tocopilla', 2);
insert into provincia(codigo, nombre, codigo_region) values(8,  'Copiapó', 3);
insert into provincia(codigo, nombre, codigo_region) values(13,  'Limarí', 4);
insert into provincia(codigo, nombre, codigo_region) values(22,  'Cachapoal', 6);
insert into provincia(codigo, nombre, codigo_region) values(29,  'Concepción', 8);
insert into provincia(codigo, nombre, codigo_region) values(31,  'Biobío', 8);
insert into provincia(codigo, nombre, codigo_region) values(33,  'Cautín', 9);
insert into provincia(codigo, nombre, codigo_region) values(37,  'Llanquihue', 10);
insert into provincia(codigo, nombre, codigo_region) values(49,  'Santiago', 13);
insert into provincia(codigo, nombre, codigo_region) values(50,  'Cordillera', 13);
insert into provincia(codigo, nombre, codigo_region) values(51,  'Chacabuco', 13);
insert into provincia(codigo, nombre, codigo_region) values(52,  'Maipo', 13);
insert into provincia(codigo, nombre, codigo_region) values(53,  'Melipilla', 13);
insert into provincia(codigo, nombre, codigo_region) values(54,  'Talagante', 13);
COMMIT;
 
/*Creación tabla comuna*/
create table comuna(
codigo number,
nombre varchar2(255) not null,
codigo_provincia number,
primary key(codigo),
foreign key(codigo_provincia) references provincia(codigo)
);
comment on table comuna is 'Tabla con las Comunas de Chile';
comment on column comuna.codigo is 'Código de la comuna';
comment on column comuna.nombre is 'Nombre de la comuna';
comment on column comuna.codigo_provincia is 'Referencia la tabla provincia(codigo)';
 
insert into comuna (codigo, nombre, codigo_provincia) values (2201, 'Calama', 6);
insert into comuna (codigo, nombre, codigo_provincia) values (8301, 'Los Ángeles', 31);
insert into comuna (codigo, nombre, codigo_provincia) values (13101, 'Santiago', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13102, 'Cerrillos', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13107, 'Huechuraba', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13114, 'Las Condes', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13116, 'Lo Espejo', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13119, 'Maipú', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13121, 'Pedro Aguirre Cerda', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13122, 'Peñalolén', 49);
insert into comuna (codigo, nombre, codigo_provincia) values (13123, 'Providencia', 49);
COMMIT;
 
/* =====================================================
   PERSONA Y DIRECCION
===================================================== */
 
create table persona(
rut varchar2(20),
nombres varchar2(255) not null,
apellido_pat varchar2(255) not null,
apellido_mat varchar2(255) not null,
fecha_nacimiento date not null,
genero CHAR(1),
primary key(rut)
);
 
comment on table persona is 'Tabla con los datos de los funcionarios de la empresa';
comment on column persona.rut is 'Rut del funcionario';
comment on column persona.nombres is 'Nombre del funcionario';
comment on column persona.apellido_pat is 'Apellido Paterno del funcionario';
comment on column persona.apellido_mat is 'Apellido Materno del funcionario';
comment on column persona.fecha_nacimiento is 'Fecha de Nacimiento del funcionario';
comment on column persona.genero is 'M: Masculino, F: Femenino';
 
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('1654711-6', 'Cristian Mauricio', 'Tapia', 'Villarroel', TO_DATE('17/06/1985', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('16678411-K', 'Martin', 'Muñoz', 'Tapia', TO_DATE('17/06/1976', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('57838820-6', 'Felipe Manolo', 'Ríos', 'Caceres', TO_DATE('23/12/1978', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('14576893-2', 'Pedro Mauricio', 'Leiva', 'Barra', TO_DATE('17/06/1985', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('12345678-9', 'Maria Jesús', 'Ubilla', 'Contreras', TO_DATE('28/09/1990', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('45773662-6', 'Ana Andrea Matilda', 'Norambuena', 'Díaz', TO_DATE('03/08/1991', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('62839944-8', 'Cristian Mauricio', 'Nuñez', 'Perez', TO_DATE('08/05/1967', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('15526378-0', 'Patricia Andrea', 'Barria', 'Castro', TO_DATE('21/01/1982', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('74789201-1', 'Maricel', 'Longueria', 'Ambrosio', TO_DATE('22/12/1971', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('12347579-3', 'Pedro Pablo', 'Lavin', 'Carrera', TO_DATE('09/11/1955', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('1199004-6', 'José Santiago', 'Allende', 'Lagos', TO_DATE('16/10/1984', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('37477867-7', 'Cecilia', 'Frei', 'Martinez', TO_DATE('15/08/1982', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('12345886-0', 'Claudia Andrea', 'Perez', 'Villarroel', TO_DATE('01/04/1977', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('176658589-3', 'Susana', 'Soto', 'Garcia', TO_DATE('02/05/1972', 'DD/MM/YYYY'), 'F');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('21338586-K', 'Andres', 'Rodriguez', 'Torres', TO_DATE('21/08/1979', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('46628290-1', 'Miguel Angel', 'Gonzales', 'Diaz', TO_DATE('20/09/1980', 'DD/MM/YYYY'), 'M');
insert into persona (rut, nombres, apellido_pat, apellido_mat, fecha_nacimiento, genero) values ('1-9', 'Juan', 'Gonzales', 'Riquelme', TO_DATE('20/09/1981', 'DD/MM/YYYY'), 'M');
COMMIT;
 
create table direccion(
calle varchar2(255) not null,
numero varchar2(15) not null,
codigo_comuna number,
rut_persona varchar2(20),
foreign key(codigo_comuna) references comuna(codigo),
foreign key(rut_persona) references persona(rut),
primary key(rut_persona, codigo_comuna)
);
comment on table direccion is 'Tabla con las direcciones de las personas';
comment on column direccion.codigo_comuna is 'Código de la comuna de la dirección';
comment on column direccion.calle is 'Nombre de la calle';
comment on column direccion.numero is 'Número de la calle';
comment on column direccion.rut_persona is 'Rut de la persona referencia Tabla persona';
 
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. Palena', '056788', 13119, '1654711-6');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Pajaritos', '25678', 13119, '16678411-K');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Central', '12345', 2201, '57838820-6');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. Blaco', '56633', 2201, '14576893-2');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Diagonal', '3456', 8301, '12345678-9');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Balmaceda', '04567', 8301, '45773662-6');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. Pedro Aguirre Cerda', '7890', 13101, '62839944-8');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. La Caleta', '56788', 13101, '15526378-0');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. 3 Poniente', '3427', 13101, '74789201-1');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Francisco Pizarro', '950603', 13102, '12347579-3');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. Sur de Chile', '5673', 13107, '1199004-6');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Norte', '455', 13116, '37477867-7');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Norte 5', '2235', 13116, '12345886-0');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Psje. Ajedrez', '2345', 13122, '176658589-3');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. El Sol', '79783', 13119, '21338586-K');
insert into direccion (calle, numero, codigo_comuna, rut_persona) values ('Av. Marte', '33647', 13121, '46628290-1');
COMMIT;
 
/* =====================================================
   ESTRUCTURA ORGANIZACIONAL Y EMPLEADOS
===================================================== */
 
create table departamento(
codigo number,
nombre varchar2(255) not null,
primary key(codigo)
);
comment on table departamento is 'Tabla de los departamentos de la empresa';
comment on column departamento.codigo is 'Codigo del departamento';
comment on column departamento.nombre is 'Descripción del departamento';
 
insert into departamento (codigo, nombre) values (1, 'Informática');
insert into departamento (codigo, nombre) values (2, 'Finanzas');
insert into departamento (codigo, nombre) values (3, 'Gerencia General');
insert into departamento (codigo, nombre) values (4, 'Recursos Humanos');
insert into departamento (codigo, nombre) values (5, 'Marketing');
insert into departamento (codigo, nombre) values (6, 'Producción');
COMMIT;
 
create table tipo_empleado(
codigo number,
nombre varchar2(255) not null,
codigo_departamento number not null,
foreign key(codigo_departamento) references departamento(codigo),
primary key(codigo)
);
comment on table tipo_empleado is 'Tabla de los tipos de empleados de la empresa';
 
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (1, 'Gerente General', 3);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (2, 'Gerente Informática', 1);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (3, 'Jefe de Proyecto', 1);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (4, 'Analista de Sistemas', 1);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (5, 'Programador', 1);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (6, 'Gerente Finanzas', 2);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (7, 'Jefe de Finanzas', 2);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (8, 'Analista Contable', 2);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (9, 'Gerente Recursos Humanos', 4);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (10, 'Jefe Recursos Humanos', 4);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (11, 'Analista Recursos Humanos', 4);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (12, 'Gerente Marketing', 5);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (13, 'Jefe de Marketing', 5);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (14, 'Publicista', 5);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (15, 'Gerente Producción', 6);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (16, 'Jefe Producción', 6);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (17, 'Operarios', 6);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (18, 'Operarios Nivel 2', 6);
insert into tipo_empleado (codigo, nombre, codigo_departamento) values (19, 'Publicista Nivel 2', 5);
COMMIT;
 
create table bonificacion (
codigo number,
tipo_empleado number,
pctj_bonificacion number,
foreign key(tipo_empleado) references tipo_empleado(codigo),
primary key(codigo)
);
comment on table bonificacion is 'Bonificación porcentual asociada a cada tipo de empleado';
 
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (1, 3, 7);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (2, 1, 5);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (3, 2, 5);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (4, 14, 10);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (5, 16, 7);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (6, 15, 8);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (7, 4, 15);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (8, 5, 15);
insert into bonificacion(codigo, tipo_empleado, pctj_bonificacion) values (9, 17, 30);
COMMIT;
 
create table empleado(
codigo number,
codigo_tipo_empleado number not null,
salario_bruto number(12) not null,
rut_persona varchar2(20) not null,
codigo_jefatura number,
fecha_contrato date not null,
foreign key(codigo_tipo_empleado) references tipo_empleado(codigo),
foreign key(rut_persona) references persona(rut),
foreign key(codigo_jefatura) references empleado(codigo),
primary key(codigo)
);
comment on table empleado is 'Tabla de los empleados de la empresa';
 
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (1, 1, 5550000, '1654711-6', null, TO_DATE('17/07/2001', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (2, 2, 2300000, '16678411-K', 1, TO_DATE('23/11/2011', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (3, 3, 1650000, '57838820-6', 2, TO_DATE('23/05/1990', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (4, 4, 808900, '14576893-2', 3, TO_DATE('04/06/2009', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (5, 5, 708800, '12345678-9', 3, TO_DATE('04/01/2003', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (6, 15, 2300000, '45773662-6', 1, TO_DATE('17/01/2001', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (7, 16, 810000, '62839944-8', 6, TO_DATE('25/04/2007', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (8, 16, 803000, '15526378-0', 6, TO_DATE('06/08/2009', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (9, 16, 808000, '74789201-1', 6, TO_DATE('12/12/2007', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (10, 14, 450000, '12347579-3', 7, TO_DATE('21/12/1990', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (11, 14, 460000, '1199004-6', 7, TO_DATE('24/06/2008', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (12, 14, 457000, '37477867-7', 8, TO_DATE('25/08/2001', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (13, 17, 458000, '12345886-0', 8, TO_DATE('17/01/2004', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (14, 14, 412000, '176658589-3', 9, TO_DATE('12/07/2008', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (15, 17, 425000, '21338586-K', 9, TO_DATE('12/10/2013', 'DD/MM/YYYY'));
insert into empleado (codigo, codigo_tipo_empleado, salario_bruto, rut_persona, codigo_jefatura, fecha_contrato) values (16, 17, 489000, '46628290-1', 9, TO_DATE('01/03/2015', 'DD/MM/YYYY'));
COMMIT;
 
create table detalle_sueldo (
codigo_empleado number,
fecha_pago date not null,
sueldo_bruto number(12) not null,
bonificacion number(12) not null,
sueldo_imponible number(12) not null,
dscto_prev number(12) not null,
dscto_salud number(12) not null,
dscto_sindical number(12) not null,
impuesto_renta number(12) not null,
total_haberes number(12) not null,
total_dsctos number(12) not null,
sueldo_liquido number(12) not null,
foreign key(codigo_empleado) references empleado(codigo),
primary key(codigo_empleado, fecha_pago)
);
comment on table detalle_sueldo is 'Tabla con el detalle del salario del empleado.';
 
/* ==========================================================================
   *********  NUEVAS TABLAS AGREGADAS AL MODELO  *********
   Áreas: Gestión de Proyectos, RR.HH. Extendido, Comunicaciones
   ========================================================================== */
 
/* =====================================================
   1) GESTIÓN DE PROYECTOS
===================================================== */
 
/*Creación tabla proyecto*/
create table proyecto (
codigo number,
nombre varchar2(255) not null,
descripcion varchar2(1000),
fecha_inicio date not null,
fecha_fin_estimada date not null,
fecha_fin_real date,
estado varchar2(20) default 'EN_CURSO' not null,
presupuesto number(14,2),
codigo_jefe_proyecto number,
codigo_departamento number,
foreign key(codigo_jefe_proyecto) references empleado(codigo),
foreign key(codigo_departamento) references departamento(codigo),
constraint chk_estado_proyecto check (estado in ('PLANIFICADO','EN_CURSO','PAUSADO','FINALIZADO','CANCELADO')),
primary key(codigo)
);
comment on table proyecto is 'Proyectos ejecutados por la empresa para sus clientes';
comment on column proyecto.codigo is 'Código único del proyecto';
comment on column proyecto.nombre is 'Nombre del proyecto';
comment on column proyecto.descripcion is 'Descripción extendida del proyecto';
comment on column proyecto.fecha_inicio is 'Fecha de inicio formal del proyecto';
comment on column proyecto.fecha_fin_estimada is 'Fecha de término estimada según plan';
comment on column proyecto.fecha_fin_real is 'Fecha real de cierre del proyecto (NULL si está vigente)';
comment on column proyecto.estado is 'Estado actual: PLANIFICADO, EN_CURSO, PAUSADO, FINALIZADO, CANCELADO';
comment on column proyecto.presupuesto is 'Presupuesto asignado al proyecto en pesos chilenos';
comment on column proyecto.codigo_jefe_proyecto is 'Empleado jefe de proyecto (referencia tabla empleado)';
comment on column proyecto.codigo_departamento is 'Departamento responsable del proyecto';
 
create sequence seq_proyecto start with 100 increment by 1 nocache;
 
insert into proyecto (codigo, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, presupuesto, codigo_jefe_proyecto, codigo_departamento) values (1, 'Sistema Remuneraciones BancoX', 'Automatización del proceso de cálculo y emisión de liquidaciones de sueldo para BancoX', TO_DATE('01/03/2024','DD/MM/YYYY'), TO_DATE('30/11/2024','DD/MM/YYYY'), null, 'EN_CURSO', 85000000, 3, 1);
insert into proyecto (codigo, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, presupuesto, codigo_jefe_proyecto, codigo_departamento) values (2, 'Portal Recursos Humanos', 'Construcción de portal web para autoatención de empleados (vacaciones, licencias, certificados)', TO_DATE('15/01/2025','DD/MM/YYYY'), TO_DATE('15/09/2025','DD/MM/YYYY'), null, 'EN_CURSO', 62000000, 3, 1);
insert into proyecto (codigo, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, presupuesto, codigo_jefe_proyecto, codigo_departamento) values (3, 'Migración ERP Producción', 'Migración del ERP de la línea de producción a una solución nube', TO_DATE('01/06/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'), TO_DATE('15/07/2024','DD/MM/YYYY'), 'FINALIZADO', 120000000, 3, 6);
insert into proyecto (codigo, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, presupuesto, codigo_jefe_proyecto, codigo_departamento) values (4, 'Campaña Branding Digital 2026', 'Estrategia de branding digital y posicionamiento SEO para clientes financieros', TO_DATE('05/02/2026','DD/MM/YYYY'), TO_DATE('30/12/2026','DD/MM/YYYY'), null, 'EN_CURSO', 45000000, 6, 5);
insert into proyecto (codigo, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, presupuesto, codigo_jefe_proyecto, codigo_departamento) values (5, 'Plataforma Reportería Financiera', 'Plataforma de informes regulatorios para sector financiero', TO_DATE('01/04/2026','DD/MM/YYYY'), TO_DATE('30/11/2026','DD/MM/YYYY'), null, 'PLANIFICADO', 95000000, 3, 2);
COMMIT;
 
/*Creación tabla empleado_proyecto (asignaciones M:N)*/
create table empleado_proyecto (
codigo_empleado number,
codigo_proyecto number,
fecha_asignacion date not null,
fecha_termino date,
rol_proyecto varchar2(100) not null,
horas_semanales number(3) not null,
foreign key(codigo_empleado) references empleado(codigo),
foreign key(codigo_proyecto) references proyecto(codigo),
constraint chk_horas_semanales check (horas_semanales between 1 and 60),
primary key(codigo_empleado, codigo_proyecto, fecha_asignacion)
);
comment on table empleado_proyecto is 'Asignación de empleados a proyectos (relación muchos a muchos)';
comment on column empleado_proyecto.codigo_empleado is 'Código del empleado asignado';
comment on column empleado_proyecto.codigo_proyecto is 'Código del proyecto al que se asigna';
comment on column empleado_proyecto.fecha_asignacion is 'Fecha en que el empleado se incorpora al proyecto';
comment on column empleado_proyecto.fecha_termino is 'Fecha en que el empleado deja el proyecto (NULL si sigue activo)';
comment on column empleado_proyecto.rol_proyecto is 'Rol que cumple el empleado en el proyecto';
comment on column empleado_proyecto.horas_semanales is 'Horas semanales dedicadas al proyecto';
 
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (3, 1, TO_DATE('01/03/2024','DD/MM/YYYY'), null, 'Jefe de Proyecto', 40);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (4, 1, TO_DATE('15/03/2024','DD/MM/YYYY'), null, 'Analista', 30);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (5, 1, TO_DATE('15/03/2024','DD/MM/YYYY'), null, 'Programador', 35);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (3, 2, TO_DATE('15/01/2025','DD/MM/YYYY'), null, 'Jefe de Proyecto', 20);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (4, 2, TO_DATE('20/01/2025','DD/MM/YYYY'), null, 'Analista', 30);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (5, 2, TO_DATE('20/01/2025','DD/MM/YYYY'), null, 'Programador', 40);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (3, 3, TO_DATE('01/06/2023','DD/MM/YYYY'), TO_DATE('15/07/2024','DD/MM/YYYY'), 'Jefe de Proyecto', 35);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (7, 3, TO_DATE('10/06/2023','DD/MM/YYYY'), TO_DATE('15/07/2024','DD/MM/YYYY'), 'Coordinador Producción', 25);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (10, 4, TO_DATE('05/02/2026','DD/MM/YYYY'), null, 'Publicista Líder', 30);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (11, 4, TO_DATE('05/02/2026','DD/MM/YYYY'), null, 'Publicista', 30);
insert into empleado_proyecto (codigo_empleado, codigo_proyecto, fecha_asignacion, fecha_termino, rol_proyecto, horas_semanales) values (14, 4, TO_DATE('10/02/2026','DD/MM/YYYY'), null, 'Publicista', 25);
COMMIT;
 
/*Creación tabla tarea*/
create table tarea (
codigo number,
codigo_proyecto number not null,
codigo_empleado_asignado number,
nombre varchar2(255) not null,
descripcion varchar2(500),
fecha_inicio date not null,
fecha_fin_estimada date not null,
fecha_fin_real date,
estado varchar2(20) default 'PENDIENTE' not null,
prioridad varchar2(10) default 'MEDIA' not null,
foreign key(codigo_proyecto) references proyecto(codigo),
foreign key(codigo_empleado_asignado) references empleado(codigo),
constraint chk_estado_tarea check (estado in ('PENDIENTE','EN_PROCESO','COMPLETADA','BLOQUEADA','CANCELADA')),
constraint chk_prioridad_tarea check (prioridad in ('BAJA','MEDIA','ALTA','CRITICA')),
primary key(codigo)
);
comment on table tarea is 'Tareas asociadas a un proyecto';
comment on column tarea.estado is 'Estado: PENDIENTE, EN_PROCESO, COMPLETADA, BLOQUEADA, CANCELADA';
comment on column tarea.prioridad is 'Prioridad: BAJA, MEDIA, ALTA, CRITICA';
 
create sequence seq_tarea start with 100 increment by 1 nocache;
 
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (1, 1, 4, 'Levantamiento de requerimientos', 'Entrevistas con stakeholders del cliente', TO_DATE('05/03/2024','DD/MM/YYYY'), TO_DATE('30/03/2024','DD/MM/YYYY'), TO_DATE('28/03/2024','DD/MM/YYYY'), 'COMPLETADA', 'ALTA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (2, 1, 5, 'Diseño base de datos', 'Modelo lógico y físico del sistema de remuneraciones', TO_DATE('01/04/2024','DD/MM/YYYY'), TO_DATE('30/04/2024','DD/MM/YYYY'), TO_DATE('05/05/2024','DD/MM/YYYY'), 'COMPLETADA', 'ALTA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (3, 1, 5, 'Desarrollo módulo cálculo', 'Implementación PL/SQL del cálculo de sueldo líquido', TO_DATE('06/05/2024','DD/MM/YYYY'), TO_DATE('30/07/2024','DD/MM/YYYY'), null, 'EN_PROCESO', 'CRITICA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (4, 2, 5, 'Prototipo portal RRHH', 'Mockups y prototipos navegables del portal', TO_DATE('20/01/2025','DD/MM/YYYY'), TO_DATE('20/02/2025','DD/MM/YYYY'), TO_DATE('22/02/2025','DD/MM/YYYY'), 'COMPLETADA', 'MEDIA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (5, 2, 4, 'Integración Active Directory', 'SSO contra AD del cliente', TO_DATE('01/03/2025','DD/MM/YYYY'), TO_DATE('30/04/2025','DD/MM/YYYY'), null, 'EN_PROCESO', 'ALTA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (6, 4, 11, 'Definición de KPIs de campaña', 'Metricas de seguimiento para la campaña 2026', TO_DATE('10/02/2026','DD/MM/YYYY'), TO_DATE('28/02/2026','DD/MM/YYYY'), TO_DATE('25/02/2026','DD/MM/YYYY'), 'COMPLETADA', 'MEDIA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (7, 4, 14, 'Diseño piezas gráficas', 'Producción de banners y posts para redes sociales', TO_DATE('01/03/2026','DD/MM/YYYY'), TO_DATE('30/04/2026','DD/MM/YYYY'), null, 'EN_PROCESO', 'MEDIA');
insert into tarea (codigo, codigo_proyecto, codigo_empleado_asignado, nombre, descripcion, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, prioridad) values (8, 5, null, 'Definición arquitectura', 'Definir arquitectura de plataforma de reportería', TO_DATE('01/04/2026','DD/MM/YYYY'), TO_DATE('30/04/2026','DD/MM/YYYY'), null, 'PENDIENTE', 'ALTA');
COMMIT;
 
/* =====================================================
   2) RR.HH. EXTENDIDO
===================================================== */
 
/*Creación tabla asistencia*/
create table asistencia (
codigo number,
codigo_empleado number not null,
fecha date not null,
hora_entrada timestamp,
hora_salida timestamp,
tipo_marcacion varchar2(20) default 'PRESENCIAL',
observacion varchar2(255),
foreign key(codigo_empleado) references empleado(codigo),
constraint chk_tipo_marcacion check (tipo_marcacion in ('PRESENCIAL','REMOTO','HIBRIDO','TERRENO')),
constraint uq_asistencia_dia unique (codigo_empleado, fecha),
primary key(codigo)
);
comment on table asistencia is 'Registro diario de asistencia de los empleados';
comment on column asistencia.tipo_marcacion is 'PRESENCIAL, REMOTO, HIBRIDO, TERRENO';
 
create sequence seq_asistencia start with 100 increment by 1 nocache;
 
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (1, 4, TO_DATE('05/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('05/05/2026 08:55:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('05/05/2026 18:10:00','DD/MM/YYYY HH24:MI:SS'), 'PRESENCIAL', null);
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (2, 5, TO_DATE('05/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('05/05/2026 09:05:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('05/05/2026 18:00:00','DD/MM/YYYY HH24:MI:SS'), 'REMOTO', 'Atraso 5 min');
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (3, 4, TO_DATE('06/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('06/05/2026 08:50:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2026 17:55:00','DD/MM/YYYY HH24:MI:SS'), 'PRESENCIAL', null);
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (4, 5, TO_DATE('06/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('06/05/2026 08:45:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2026 19:30:00','DD/MM/YYYY HH24:MI:SS'), 'PRESENCIAL', 'Hora extra autorizada');
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (5, 13, TO_DATE('06/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('06/05/2026 08:00:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2026 17:00:00','DD/MM/YYYY HH24:MI:SS'), 'PRESENCIAL', null);
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (6, 15, TO_DATE('06/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('06/05/2026 08:10:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2026 17:05:00','DD/MM/YYYY HH24:MI:SS'), 'PRESENCIAL', null);
insert into asistencia (codigo, codigo_empleado, fecha, hora_entrada, hora_salida, tipo_marcacion, observacion) values (7, 11, TO_DATE('07/05/2026','DD/MM/YYYY'), TO_TIMESTAMP('07/05/2026 09:00:00','DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('07/05/2026 18:00:00','DD/MM/YYYY HH24:MI:SS'), 'HIBRIDO', null);
COMMIT;
 
/*Creación tabla vacaciones*/
create table vacaciones (
codigo number,
codigo_empleado number not null,
fecha_solicitud date not null,
fecha_inicio date not null,
fecha_fin date not null,
dias_solicitados number(3) not null,
estado varchar2(20) default 'PENDIENTE' not null,
codigo_empleado_aprueba number,
fecha_aprobacion date,
observacion varchar2(255),
foreign key(codigo_empleado) references empleado(codigo),
foreign key(codigo_empleado_aprueba) references empleado(codigo),
constraint chk_estado_vac check (estado in ('PENDIENTE','APROBADA','RECHAZADA','TOMADA','CANCELADA')),
constraint chk_dias_vac check (dias_solicitados > 0 and dias_solicitados <= 30),
primary key(codigo)
);
comment on table vacaciones is 'Solicitudes y registros de vacaciones de empleados';
 
create sequence seq_vacaciones start with 100 increment by 1 nocache;
 
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (1, 4, TO_DATE('10/01/2026','DD/MM/YYYY'), TO_DATE('01/02/2026','DD/MM/YYYY'), TO_DATE('14/02/2026','DD/MM/YYYY'), 10, 'TOMADA', 3, TO_DATE('15/01/2026','DD/MM/YYYY'), 'Vacaciones de verano');
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (2, 5, TO_DATE('15/01/2026','DD/MM/YYYY'), TO_DATE('15/02/2026','DD/MM/YYYY'), TO_DATE('28/02/2026','DD/MM/YYYY'), 10, 'TOMADA', 3, TO_DATE('20/01/2026','DD/MM/YYYY'), null);
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (3, 11, TO_DATE('20/04/2026','DD/MM/YYYY'), TO_DATE('15/05/2026','DD/MM/YYYY'), TO_DATE('29/05/2026','DD/MM/YYYY'), 10, 'APROBADA', 7, TO_DATE('25/04/2026','DD/MM/YYYY'), null);
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (4, 13, TO_DATE('25/04/2026','DD/MM/YYYY'), TO_DATE('01/06/2026','DD/MM/YYYY'), TO_DATE('15/06/2026','DD/MM/YYYY'), 10, 'PENDIENTE', null, null, 'Pendiente revisión');
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (5, 15, TO_DATE('30/04/2026','DD/MM/YYYY'), TO_DATE('01/07/2026','DD/MM/YYYY'), TO_DATE('15/07/2026','DD/MM/YYYY'), 10, 'PENDIENTE', null, null, null);
insert into vacaciones (codigo, codigo_empleado, fecha_solicitud, fecha_inicio, fecha_fin, dias_solicitados, estado, codigo_empleado_aprueba, fecha_aprobacion, observacion) values (6, 14, TO_DATE('05/03/2026','DD/MM/YYYY'), TO_DATE('20/03/2026','DD/MM/YYYY'), TO_DATE('25/03/2026','DD/MM/YYYY'), 5, 'RECHAZADA', 9, TO_DATE('07/03/2026','DD/MM/YYYY'), 'Periodo de alta carga laboral');
COMMIT;
 
/*Creación tabla licencia_medica*/
create table licencia_medica (
codigo number,
codigo_empleado number not null,
fecha_emision date not null,
fecha_inicio date not null,
fecha_fin date not null,
dias number(3) not null,
diagnostico varchar2(500),
medico_emisor varchar2(255),
estado varchar2(20) default 'EMITIDA' not null,
foreign key(codigo_empleado) references empleado(codigo),
constraint chk_estado_lic check (estado in ('EMITIDA','APROBADA','RECHAZADA','EN_PAGO','PAGADA')),
primary key(codigo)
);
comment on table licencia_medica is 'Licencias médicas presentadas por los empleados';
 
create sequence seq_licencia_medica start with 100 increment by 1 nocache;
 
insert into licencia_medica (codigo, codigo_empleado, fecha_emision, fecha_inicio, fecha_fin, dias, diagnostico, medico_emisor, estado) values (1, 5, TO_DATE('10/03/2026','DD/MM/YYYY'), TO_DATE('10/03/2026','DD/MM/YYYY'), TO_DATE('14/03/2026','DD/MM/YYYY'), 5, 'Influenza A', 'Dr. Roberto Soto', 'PAGADA');
insert into licencia_medica (codigo, codigo_empleado, fecha_emision, fecha_inicio, fecha_fin, dias, diagnostico, medico_emisor, estado) values (2, 13, TO_DATE('20/04/2026','DD/MM/YYYY'), TO_DATE('20/04/2026','DD/MM/YYYY'), TO_DATE('27/04/2026','DD/MM/YYYY'), 7, 'Lumbago agudo', 'Dra. María Fuentes', 'APROBADA');
insert into licencia_medica (codigo, codigo_empleado, fecha_emision, fecha_inicio, fecha_fin, dias, diagnostico, medico_emisor, estado) values (3, 15, TO_DATE('01/05/2026','DD/MM/YYYY'), TO_DATE('01/05/2026','DD/MM/YYYY'), TO_DATE('05/05/2026','DD/MM/YYYY'), 5, 'Gastroenteritis', 'Dr. Andrés Vega', 'EN_PAGO');
insert into licencia_medica (codigo, codigo_empleado, fecha_emision, fecha_inicio, fecha_fin, dias, diagnostico, medico_emisor, estado) values (4, 11, TO_DATE('05/05/2026','DD/MM/YYYY'), TO_DATE('05/05/2026','DD/MM/YYYY'), TO_DATE('07/05/2026','DD/MM/YYYY'), 3, 'Migraña', 'Dr. Pablo Henríquez', 'EMITIDA');
COMMIT;
 
/*Creación tabla evaluacion_desempeno*/
create table evaluacion_desempeno (
codigo number,
codigo_empleado number not null,
codigo_evaluador number not null,
fecha_evaluacion date not null,
periodo varchar2(20) not null,
puntaje number(3) not null,
nivel varchar2(20),
comentarios varchar2(1000),
foreign key(codigo_empleado) references empleado(codigo),
foreign key(codigo_evaluador) references empleado(codigo),
constraint chk_puntaje check (puntaje between 0 and 100),
constraint chk_nivel_desemp check (nivel in ('NO_LOGRADO','INCIPIENTE','ACEPTABLE','BUENO','DESTACADO')),
primary key(codigo)
);
comment on table evaluacion_desempeno is 'Evaluaciones de desempeño de los empleados';
comment on column evaluacion_desempeno.periodo is 'Periodo evaluado, formato YYYY-S1, YYYY-S2 o YYYY';
 
create sequence seq_evaluacion start with 100 increment by 1 nocache;
 
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (1, 4, 3, TO_DATE('20/12/2025','DD/MM/YYYY'), '2025-S2', 88, 'BUENO', 'Cumple objetivos. Mejora continua en gestión de proyectos.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (2, 5, 3, TO_DATE('20/12/2025','DD/MM/YYYY'), '2025-S2', 95, 'DESTACADO', 'Excelente desempeño técnico. Líder informal del equipo.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (3, 11, 7, TO_DATE('22/12/2025','DD/MM/YYYY'), '2025-S2', 72, 'ACEPTABLE', 'Cumple, pero requiere mayor proactividad.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (4, 13, 8, TO_DATE('22/12/2025','DD/MM/YYYY'), '2025-S2', 65, 'ACEPTABLE', 'Buen compañero, falta foco en metas.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (5, 15, 9, TO_DATE('22/12/2025','DD/MM/YYYY'), '2025-S2', 50, 'INCIPIENTE', 'Requiere plan de mejora 2026.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (6, 14, 9, TO_DATE('22/12/2025','DD/MM/YYYY'), '2025-S2', 90, 'DESTACADO', 'Aporte clave al área de marketing.');
insert into evaluacion_desempeno (codigo, codigo_empleado, codigo_evaluador, fecha_evaluacion, periodo, puntaje, nivel, comentarios) values (7, 16, 9, TO_DATE('22/12/2025','DD/MM/YYYY'), '2025-S2', 78, 'BUENO', 'Buen desempeño operativo.');
COMMIT;
 
/*Creación tabla capacitacion*/
create table capacitacion (
codigo number,
nombre varchar2(255) not null,
descripcion varchar2(500),
modalidad varchar2(20) default 'ONLINE' not null,
fecha_inicio date not null,
fecha_fin date not null,
horas number(4) not null,
instructor varchar2(255),
costo number(10),
codigo_departamento number,
foreign key(codigo_departamento) references departamento(codigo),
constraint chk_modalidad check (modalidad in ('ONLINE','PRESENCIAL','HIBRIDA')),
primary key(codigo)
);
comment on table capacitacion is 'Catálogo de capacitaciones ofrecidas a los empleados';
 
create sequence seq_capacitacion start with 100 increment by 1 nocache;
 
insert into capacitacion (codigo, nombre, descripcion, modalidad, fecha_inicio, fecha_fin, horas, instructor, costo, codigo_departamento) values (1, 'Oracle SQL Avanzado', 'Curso intensivo de SQL avanzado y PL/SQL', 'ONLINE', TO_DATE('01/03/2026','DD/MM/YYYY'), TO_DATE('30/03/2026','DD/MM/YYYY'), 40, 'Oracle Academy', 350000, 1);
insert into capacitacion (codigo, nombre, descripcion, modalidad, fecha_inicio, fecha_fin, horas, instructor, costo, codigo_departamento) values (2, 'Liderazgo Ágil', 'Liderazgo en metodologías ágiles para jefes de proyecto', 'PRESENCIAL', TO_DATE('15/04/2026','DD/MM/YYYY'), TO_DATE('17/04/2026','DD/MM/YYYY'), 24, 'Carolina Pérez', 480000, 4);
insert into capacitacion (codigo, nombre, descripcion, modalidad, fecha_inicio, fecha_fin, horas, instructor, costo, codigo_departamento) values (3, 'Marketing Digital 2026', 'Tendencias y herramientas de marketing digital', 'HIBRIDA', TO_DATE('05/05/2026','DD/MM/YYYY'), TO_DATE('05/06/2026','DD/MM/YYYY'), 30, 'Estudio Norte', 290000, 5);
insert into capacitacion (codigo, nombre, descripcion, modalidad, fecha_inicio, fecha_fin, horas, instructor, costo, codigo_departamento) values (4, 'Seguridad de Datos', 'Buenas prácticas de seguridad y privacidad de datos', 'ONLINE', TO_DATE('10/06/2026','DD/MM/YYYY'), TO_DATE('30/06/2026','DD/MM/YYYY'), 20, 'CyberLab', 180000, 1);
insert into capacitacion (codigo, nombre, descripcion, modalidad, fecha_inicio, fecha_fin, horas, instructor, costo, codigo_departamento) values (5, 'Prevención de Riesgos', 'Capacitación obligatoria sobre ley 16.744', 'PRESENCIAL', TO_DATE('20/07/2026','DD/MM/YYYY'), TO_DATE('21/07/2026','DD/MM/YYYY'), 16, 'Mutual de Seguridad', 0, 6);
COMMIT;
 
/*Creación tabla empleado_capacitacion*/
create table empleado_capacitacion (
codigo_empleado number,
codigo_capacitacion number,
fecha_inscripcion date not null,
estado varchar2(20) default 'INSCRITO' not null,
calificacion number(3),
fecha_aprobacion date,
foreign key(codigo_empleado) references empleado(codigo),
foreign key(codigo_capacitacion) references capacitacion(codigo),
constraint chk_estado_cap check (estado in ('INSCRITO','EN_CURSO','APROBADO','REPROBADO','DESERTADO')),
constraint chk_calif_cap check (calificacion is null or calificacion between 0 and 100),
primary key(codigo_empleado, codigo_capacitacion)
);
comment on table empleado_capacitacion is 'Inscripción de empleados a capacitaciones';
 
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (4, 1, TO_DATE('25/02/2026','DD/MM/YYYY'), 'APROBADO', 85, TO_DATE('30/03/2026','DD/MM/YYYY'));
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (5, 1, TO_DATE('25/02/2026','DD/MM/YYYY'), 'APROBADO', 95, TO_DATE('30/03/2026','DD/MM/YYYY'));
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (3, 2, TO_DATE('05/04/2026','DD/MM/YYYY'), 'EN_CURSO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (6, 2, TO_DATE('05/04/2026','DD/MM/YYYY'), 'EN_CURSO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (10, 3, TO_DATE('25/04/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (11, 3, TO_DATE('25/04/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (14, 3, TO_DATE('25/04/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (5, 4, TO_DATE('05/06/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (15, 5, TO_DATE('15/07/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
insert into empleado_capacitacion (codigo_empleado, codigo_capacitacion, fecha_inscripcion, estado, calificacion, fecha_aprobacion) values (16, 5, TO_DATE('15/07/2026','DD/MM/YYYY'), 'INSCRITO', null, null);
COMMIT;
 
/* =====================================================
   3) COMUNICACIONES Y CONTACTOS
===================================================== */
 
/*Creación tabla telefono*/
create table telefono (
codigo number,
rut_persona varchar2(20) not null,
numero varchar2(20) not null,
tipo varchar2(15) default 'MOVIL' not null,
es_principal char(1) default 'N' not null,
foreign key(rut_persona) references persona(rut),
constraint chk_tipo_tel check (tipo in ('MOVIL','FIJO','TRABAJO','EMERGENCIA')),
constraint chk_es_principal_tel check (es_principal in ('S','N')),
primary key(codigo)
);
comment on table telefono is 'Teléfonos asociados a personas (una persona puede tener múltiples)';
 
create sequence seq_telefono start with 100 increment by 1 nocache;
 
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (1, '1654711-6', '+56987654321', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (2, '1654711-6', '+56226789012', 'TRABAJO', 'N');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (3, '16678411-K', '+56988887777', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (4, '57838820-6', '+56991234567', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (5, '14576893-2', '+56977773333', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (6, '12345678-9', '+56922334455', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (7, '12345678-9', '+56226778899', 'FIJO', 'N');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (8, '45773662-6', '+56955667788', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (9, '62839944-8', '+56944556677', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (10, '15526378-0', '+56933445566', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (11, '74789201-1', '+56922334411', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (12, '12347579-3', '+56911223344', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (13, '37477867-7', '+56988991122', 'MOVIL', 'S');
insert into telefono (codigo, rut_persona, numero, tipo, es_principal) values (14, '46628290-1', '+56977880011', 'MOVIL', 'S');
COMMIT;
 
/*Creación tabla correo_electronico*/
create table correo_electronico (
codigo number,
rut_persona varchar2(20) not null,
email varchar2(150) not null,
tipo varchar2(15) default 'LABORAL' not null,
es_principal char(1) default 'N' not null,
foreign key(rut_persona) references persona(rut),
constraint chk_tipo_correo check (tipo in ('LABORAL','PERSONAL','OTRO')),
constraint chk_es_principal_correo check (es_principal in ('S','N')),
constraint chk_correo_format check (email like '%@%.%'),
primary key(codigo)
);
comment on table correo_electronico is 'Direcciones de correo electrónico de las personas';
 
create sequence seq_correo start with 100 increment by 1 nocache;
 
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (1, '1654711-6', 'cristian.tapia@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (2, '1654711-6', 'ctapia@gmail.com', 'PERSONAL', 'N');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (3, '16678411-K', 'martin.munoz@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (4, '57838820-6', 'felipe.rios@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (5, '14576893-2', 'pedro.leiva@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (6, '12345678-9', 'maria.ubilla@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (7, '45773662-6', 'ana.norambuena@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (8, '62839944-8', 'cristian.nunez@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (9, '15526378-0', 'patricia.barria@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (10, '74789201-1', 'maricel.longueria@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (11, '12347579-3', 'pedro.lavin@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (12, '1199004-6', 'jose.allende@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (13, '37477867-7', 'cecilia.frei@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (14, '12345886-0', 'claudia.perez@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (15, '176658589-3', 'susana.soto@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (16, '21338586-K', 'andres.rodriguez@consultasbd.cl', 'LABORAL', 'S');
insert into correo_electronico (codigo, rut_persona, email, tipo, es_principal) values (17, '46628290-1', 'miguel.gonzales@consultasbd.cl', 'LABORAL', 'S');
COMMIT;
 
/*Creación tabla contacto_emergencia*/
create table contacto_emergencia (
codigo number,
rut_persona varchar2(20) not null,
nombre_contacto varchar2(255) not null,
parentesco varchar2(50) not null,
telefono varchar2(20) not null,
email varchar2(150),
direccion varchar2(255),
foreign key(rut_persona) references persona(rut),
primary key(codigo)
);
comment on table contacto_emergencia is 'Contactos de emergencia asociados a una persona';
 
create sequence seq_contacto_emergencia start with 100 increment by 1 nocache;
 
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (1, '1654711-6', 'María Villarroel Pérez', 'Esposa', '+56977701234', 'mvillarroel@hotmail.com', 'Psje. Palena 056788, Maipú');
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (2, '16678411-K', 'Roberto Muñoz Salazar', 'Padre', '+56988899900', null, 'Av. Pajaritos 25678, Maipú');
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (3, '14576893-2', 'Andrea Barra López', 'Madre', '+56977712233', 'andrea.b@gmail.com', null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (4, '12345678-9', 'Joaquín Ubilla', 'Hermano', '+56922110099', null, null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (5, '45773662-6', 'Patricia Díaz Vega', 'Madre', '+56955566677', 'pdiaz@yahoo.cl', null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (6, '62839944-8', 'Lorena Pérez', 'Esposa', '+56944455566', null, null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (7, '15526378-0', 'Carlos Castro', 'Esposo', '+56933344455', null, null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (8, '12347579-3', 'Carmen Carrera', 'Esposa', '+56911100099', 'cc.carrera@gmail.com', null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (9, '37477867-7', 'Jorge Frei', 'Padre', '+56988877766', null, null);
insert into contacto_emergencia (codigo, rut_persona, nombre_contacto, parentesco, telefono, email, direccion) values (10, '46628290-1', 'Sofía Gonzales', 'Hermana', '+56977766655', null, null);
COMMIT;
 
/* =====================================================
   FIN DEL SCRIPT
===================================================== */