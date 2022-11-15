CREATE DATABASE hotel_EF;
USE hotel_EF;
-- MODULO HOTEL --
CREATE TABLE tbl_habitacion (
codigo_habitacion int not null,
tipo_habitacion varchar(50),
numero_habitacion int not null,
estado_habitacion int not null,
primary key (codigo_habitacion)
);

CREATE TABLE tbl_cliente (
codigo_cliente int not null,
nombre_cliente varchar(50),
apellido_cliente varchar(50),
estado_cliente int not null,
primary key (codigo_cliente)
);

CREATE TABLE tbl_reserva (
codigo_reserva int not null,
fk_cliente_reserva int not null,
fk_habitacion_reserva int not null,
fecha_entrada varchar(50),
fecha_salida varchar(50),
cantidad_personas int not null,
primary key (codigo_reserva),
foreign key (fk_cliente_reserva) references tbl_cliente (codigo_cliente),
foreign key (fk_habitacion_reserva) references tbl_habitacion (codigo_habitacion)
);

CREATE TABLE tbl_registro_huesped (
codigo_registro int not null,
fk_habitacion_registro int not null,
fk_cliente_registro int not null,
fk_reserva_registro int not null,
primary key (codigo_registro),
foreign key (fk_habitacion_registro) references tbl_habitacion (codigo_habitacion),
foreign key (fk_cliente_registro) references tbl_cliente (codigo_cliente),
foreign key (fk_reserva_registro) references tbl_reserva (codigo_reserva)
);

--  MODULO SEGURIDAD --
CREATE TABLE tbl_modulos (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (`pk_id_modulos`)
);

CREATE TABLE tbl_aplicaciones (
	pk_id_aplicacion INT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (`pk_id_aplicacion`)
);


CREATE TABLE tbl_AsignacionModuloAplicacion (
  fk_id_modulos INT NOT NULL,
  fk_id_aplicacion INT NOT NULL, 
  PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion` ),
  FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


CREATE TABLE tbl_usuarios (
  pk_id_usuario INT AUTO_INCREMENT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  username_usuario VARCHAR(20) NOT NULL,
  password_usuario VARCHAR(100) NOT NULL,
  email_usuario VARCHAR(50) NOT NULL,
  ultima_conexion_usuario DATETIME NULL DEFAULT NULL,
  estado_usuario TINYINT DEFAULT 0 NOT NULL,
  pregunta varchar(50) not null,
  respuesta varchar(50) not null,
  PRIMARY KEY (`pk_id_usuario`)
);


CREATE TABLE tbl_perfiles (
	pk_id_perfil INT AUTO_INCREMENT NOT NULL,
    nombre_perfil VARCHAR(50) NOT NULL,
    descripcion_perfil VARCHAR(150) NOT NULL,
    estado_perfil TINYINT DEFAULT 0,
    primary key (pk_id_perfil)
);

CREATE TABLE tbl_permisosAplicacionesUsuario (
  fk_id_aplicacion INT NOT NULL, 
  fk_id_usuario INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS tbl_permisosAplicacionPerfil (
  fk_id_perfil INT NOT NULL, 
  fk_id_aplicacion INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (fk_id_perfil,fk_id_aplicacion),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion),
  FOREIGN KEY (fk_id_perfil) REFERENCES tbl_perfiles (pk_id_perfil)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS tbl_asignacionesPerfilsUsuario (
  fk_id_usuario INT NOT NULL, 
  fk_id_perfil INT NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil` ),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS tbl_bitacoraDeEventos (
  pk_id_bitacora INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL,
  fk_id_aplicacion INT NOT NULL,
  fecha_bitacora DATE NOT NULL,
  hora_bitacora TIME NOT NULL,
  host_bitacora VARCHAR(100) NOT NULL,
  ip_bitacora VARCHAR(100) NOT NULL,
  accion_bitacora VARCHAR(100) NOT NULL,
  PRIMARY KEY (pk_id_bitacora),
  FOREIGN KEY (fk_id_usuario) REFERENCES tbl_usuarios (pk_id_usuario),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


-- INSERTS --
INSERT INTO `tbl_usuarios` VALUES 
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '2022-07-02 21:00:48', '1','COLOR FAVORITO','TdX9j/kyyKM='),
('5', 'hotel', 'hotel', 'hotel', 'X9yc1/l1b2A==', 'hotel@gmail.com', '2022-07-02 21:00:48', '1','COLOR FAVORITO','TdX9j/kyyKM='),
('9', 'Seguridad', 'Seguridad', 'seguridad', 'X9yc1/l1b2A==', 'seguridad@gmail.com', '2022-07-02 21:00:48', '1','COLOR FAVORITO','TdX9j/kyyKM=');

INSERT INTO `tbl_modulos` VALUES
('1000', 'SEGURIDAD', 'Seguridad', 1),
('2000', 'LOGISTICA', 'Logistica', 1),
('3000', 'COMPRAS Y VENTAS', 'Compras y Ventas', 1),
('5000', 'PRODUCCIÓN', 'Produccion', 1),
('6000', 'NOMINAS', 'Nominas', 1),
('7000', 'BANCOS', 'Bancos', 1),
('8000', 'CONTABILIDAD', 'Contabilidad', 1);

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES
('1', 'Login', 'Login', '1'),
('999', 'Logout', 'Logout', '1'),
('1000', 'MDI SEGURIDAD', 'PARA SEGURIDAD', '1'),
('1001', 'Mant. Usuario', 'PARA SEGURIDAD', '1'),
('1002', 'Mant. Aplicación', 'PARA SEGURIDAD', '1'),
('1003', 'Mant. Modulo', 'PARA SEGURIDAD', '1'),
('1004', 'Mant. Perfil', 'PARA SEGURIDAD', '1'),
('1101', 'Asign. Modulo Aplicacion', 'PARA SEGURIDAD', '1'),
('1102', 'Asign. Aplicacion Perfil', 'PARA SEGURIDAD', '1'),
('1103', 'Asign. Perfil Usuario', 'PARA SEGURIDAD', '1'),
('1201', 'Pcs. Cambio Contraseña', 'PARA SEGURIDAD', '1'),
('1301', 'Pcs. BITACORA', 'PARA SEGURIDAD', '1'),
('2000', 'MDI LOGISTICA', 'PARA LOGISTICA', '1'),
('3000', 'MDI COMPRAS Y VENTAS', 'PARA COMPRAS Y VENTAS', '1'),
('5000', 'MDI PRODUCCIÓN', 'PARA PRODUCCIÓN', '1'),
('6000', 'MDI NOMINAS', 'PARA NOMINAS', '1'),
('6001', 'Mant. Trabajadores', 'PARA NOMINAS', '1'),
('6002', 'Mant. Puestos de Trabajo', 'PARA NOMINAS', '1'),
('6003', 'Mant. Departamentos', 'PARA NOMINAS', '1'),
('6004', 'Mant. Contratos', 'PARA NOMINAS', '1'),
('6005', 'Mant. Percepciones', 'PARA NOMINAS', '1'),
('6006', 'Mant. Horas Extras', 'PARA NOMINAS', '1'),
('6007', 'Mant. Faltas', 'PARA NOMINAS', '1'),
('6101', 'Asgn. Puesto - Depto.', 'PARA NOMINAS', '1'),
('6102', 'Asgn. Puesto - Trabajador', 'PARA NOMINAS', '1'),
('6103', 'Asgn. Contrato Trabajador', 'PARA NOMINAS', '1'),
('6104', 'Asgn. Prestaciones Contrato', 'PARA NOMINAS', '1'),
('6105', 'Asgn. Prestaciones Individual', 'PARA NOMINAS', '1'),
('6106', 'Prcs. Nomina', 'PARA NOMINAS', '1'),
('6201', 'Rpt. Planillas', 'PARA NOMINAS', '1'),
('6202', 'Rpt. Contratos', 'PARA NOMINAS', '1'),
('6203', 'Rpt. Trabajadores', 'PARA NOMINAS', '1'),
('6301', 'ACCESO SEGURIDAD', 'PARA NOMINAS', '1'),
('7000', 'MDI BANCOS', 'PARA BANCOS', '1'),
('8000', 'MDI CONTRABILIDAD', 'PARA CONTRABILIDAD', '1');


-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES
('1', 'ADMINISTRADOR', 'contiene todos los permisos del programa', 1),
('2', 'SEGURIDAD', 'contiene todos los permisos de seguridad', 1),
('3', 'LOGISTICA', 'contiene todos los permisos de logistica', 1),
('4', 'COMPRAS Y VENTAS', 'contiene todos los permisos de compras y ventas', 1),
('5', 'PRODUCCIÓN', 'contiene todos los permisos de producción', 1),
('6', 'NOMINAS', 'contiene todos los permisos de nominas', 1),
('7', 'BANCOS', 'contiene todos los permisos de bancos', 1),
('8', 'CONTABILIDAD', 'contiene todos los permisos de contabilidad', 1);

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES
('1000', '1000'),
('1000', '1001'),
('1000', '1002'),
('1000', '1003'),
('1000', '1004'),
('1000', '1102'),
('1000', '1103'),
('1000', '1201'),
('1000', '1301'),
('2000', '2000'),
('3000', '3000'),
('5000', '5000'),
('6000', '6000'),
('6000', '6001'),
('6000', '6002'),
('6000', '6003'),
('6000', '6004'),
('6000', '6005'),
('6000', '6006'),
('6000', '6007'),
('6000', '6101'),
('6000', '6102'),
('6000', '6103'),
('6000', '6104'),
('6000', '6105'),
('6000', '6106'),
('6000', '6201'),
('6000', '6202'),
('6000', '6203'),
('6000', '6301'),
('7000', '7000'),
('8000', '8000');

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES
('1', '1000', '1', '1', '1', '1', '1'),
('1', '1001', '1', '1', '1', '1', '1'),
('1', '1002', '1', '1', '1', '1', '1'),
('1', '1003', '1', '1', '1', '1', '1'),
('1', '1004', '1', '1', '1', '1', '1'),
('1', '1101', '1', '1', '1', '1', '1'),
('1', '1102', '1', '1', '1', '1', '1'),
('1', '1103', '1', '1', '1', '1', '1'),
('1', '1201', '1', '1', '1', '1', '1'),
('1', '1301', '1', '1', '1', '1', '1'),
('1', '2000', '1', '1', '1', '1', '1'),
('1', '3000', '1', '1', '1', '1', '1'),
('1', '5000', '1', '1', '1', '1', '1'),
('1', '6000', '1', '1', '1', '1', '1'),
('1', '6001', '1', '1', '1', '1', '1'),
('1', '6002', '1', '1', '1', '1', '1'),
('1', '6003', '1', '1', '1', '1', '1'),
('1', '6004', '1', '1', '1', '1', '1'),
('1', '6005', '1', '1', '1', '1', '1'),
('1', '6006', '1', '1', '1', '1', '1'),
('1', '6007', '1', '1', '1', '1', '1'),
('1', '6101', '1', '1', '1', '1', '1'),
('1', '6102', '1', '1', '1', '1', '1'),
('1', '6103', '1', '1', '1', '1', '1'),
('1', '6104', '1', '1', '1', '1', '1'),
('1', '6105', '1', '1', '1', '1', '1'),
('1', '6106', '1', '1', '1', '1', '1'),
('1', '6201', '1', '1', '1', '1', '1'),
('1', '6202', '1', '1', '1', '1', '1'),
('1', '6203', '1', '1', '1', '1', '1'),
('1', '6301', '1', '1', '1', '1', '1'),
('1', '7000', '1', '1', '1', '1', '1'),
('1', '8000', '1', '1', '1', '1', '1'),
('2', '1000', '1', '1', '1', '1', '1'),
('3', '2000', '1', '1', '1', '1', '1'),
('4', '3000', '1', '1', '1', '1', '1'),
('5', '5000', '1', '1', '1', '1', '1'),
('6', '6000', '1', '1', '1', '1', '1'),
('6', '6001', '1', '1', '1', '1', '1'),
('6', '6002', '1', '1', '1', '1', '1'),
('6', '6003', '1', '1', '1', '1', '1'),
('6', '6004', '1', '1', '1', '1', '1'),
('6', '6005', '1', '1', '1', '1', '1'),
('6', '6006', '1', '1', '1', '1', '1'),
('6', '6007', '1', '1', '1', '1', '1'),
('6', '6101', '1', '1', '1', '1', '1'),
('6', '6102', '1', '1', '1', '1', '1'),
('6', '6103', '1', '1', '1', '1', '1'),
('6', '6104', '1', '1', '1', '1', '1'),
('6', '6105', '1', '1', '1', '1', '1'),
('6', '6106', '1', '1', '1', '1', '1'),
('6', '6201', '1', '1', '1', '1', '1'),
('6', '6202', '1', '1', '1', '1', '1'),
('6', '6203', '1', '1', '1', '1', '1'),
('6', '6301', '1', '1', '1', '1', '1'),
('7', '7000', '1', '1', '1', '1', '1'),
('8', '8000', '1', '1', '1', '1', '1');

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `hotel_ef`.`tbl_asignacionesPerfilsUsuario` (`fk_id_usuario`, `fk_id_perfil`) VALUES ('5', '6');



