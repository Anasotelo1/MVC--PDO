CREATE DATABASE senati;
USE senati;

CREATE TABLE cursos
(
   idcurso INT AUTO_INCREMENT PRIMARY KEY,
   nombrecurso VARCHAR(50) NOT NULL,
   especialidad VARCHAR(70) NOT NULL,
   complejidad CHAR(1) NOT NULL DEFAULT 'B',
   fechainicio DATE NOT NULL,
   precio DECIMAL(7,2) NOT NULL,
   fechacreacion DATETIME NOT NULL DEFAULT NOW(),
   fechaupdate DATETIME NULL,
   estado CHAR (1) NOT NULL DEFAULT '1'
   
)ENGINE = INNODB;

INSERT INTO cursos(nombrecurso,especialidad,complejidad,fechainicio,precio) VALUES
 ('Java', 'ETI', 'M', '2023-05-10', 180),
 ('Desarrollo Web', 'ETI', 'B', '2023-04-20', 190),
 ('Excel financiero', 'Administracion', 'A', '2023-05-14', 250),
 ('ERP SAP', 'Administracion', 'A', '2023-05-11', 400),
 ('Inventor', 'Mecanica', 'M', '2023-04-29', 380);
 
 SELECT * FROM cursos;
 
 -- STORE PROCEDURE
 -- Un procedimiento almacenado es un programa que se ejecuta desde el 
 -- motor de BD, y que permite recibir valores de entrada, realizar 
 -- diferentes tipos de calculo y entregar una salida.
 DELIMITER $$ 
 CREATE PROCEDURE spu_cursos_listar()
 BEGIN 
     SELECT  idcurso,
				 nombrecurso,
				 especialidad,
				 complejidad,
				 fechainicio,
				 precio
      FROM cursos
      WHERE estado = '1'
      ORDER BY idcurso DESC;
END $$

CALL spu_cursos_listar();



-- Procedimiento para registrar cursos 
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar
(
	IN _nombrecurso 	VARCHAR(50),
	IN _especialidad 	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio 	DATE,
	IN _precio 			DECIMAL(7,2)
)
BEGIN 
     INSERT INTO cursos(nombrecurso, especialidad, complejidad, fechainicio, precio)
     VALUES (_nombrecurso, _especialidad, _complejidad, _fechainicio, _precio);
END $$ 

CALL spu_cursos_registrar('Python para todos', 'ETI', 'B', '2023-05-10', 120);
CALL spu_cursos_registrar('C# para la web', 'ETI', 'A', '2023-05-11', 320);
CALL spu_cursos_listar();

-- Procedimiento eliminacion logica
DELIMITER $$
CREATE PROCEDURE spu_cursos_eliminar(IN _idcurso INT)
BEGIN
     UPDATE cursos 
			SET estado = '0' 	
			WHERE idcurso = _idcurso;
END $$ 


CALL spu_cursos_eliminar(1);
SELECT * FROM cursos;  

-- Lunes 10 abril 2023
DELIMITER $$
CREATE PROCEDURE spu_cursos_recuperar_id(IN _idcurso INT)
BEGIN 
     SELECT * FROM cursos WHERE idcurso = _idcurso;
END $$

CALL spu_cursos_recuperar_id(1);


DELIMITER $$
CREATE PROCEDURE spu_cursos_actualizar
(
	IN _idcurso			INT,
	IN _nombrecurso 	VARCHAR(50),
	IN _especialidad	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio	DATE,
	IN _precio		DECIMAL(7,2)
)
BEGIN
	UPDATE cursos SET
		nombrecurso = _nombrecurso,
		especialidad = _especialidad,
		complejidad = _complejidad,
		fechainicio = _fechainicio,
		precio = _precio,
		fechaupdate = NOW()
	WHERE idcurso = _idcurso;

END $$


SELECT * FROM cursos WHERE idcurso = 3;
CALL spu_cursos_actualizar(3, 'Excel para Gestion', 'ETI', 'A', '2023-06-21', 320);

CREATE TABLE usuarios
(
	idusuario 		INT AUTO_INCREMENT PRIMARY KEY,
	nombreusuario 	VARCHAR(30)		NOT NULL,
	claveacceso		VARCHAR(90)		NOT NULL,
	apellidos		VARCHAR(30)		NOT NULL,
	nombres			VARCHAR(30)		NOT NULL,
	nivelacceso		CHAR(1)			NOT NULL DEFAULT 'A',
	estado 			CHAR(1)			NOT NULL DEFAULT '1',
	fecharegistro	DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME 		NULL,
	CONSTRAINT uk_nombreusuario_usa	UNIQUE (nombreusuario)
	)ENGINE = INNODB;
	
	INSERT INTO usuarios (nombreusuario, claveacceso, apellidos, nombres) VALUES
		('ANA', '123456', 'Sotelo Cardenas', 'Ana Cecilia'),
		('Luis', '123456', 'diaz Magallames', 'Luis Otniel');
		
	SELECT * FROM usuarios;	