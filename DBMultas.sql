CREATE DATABASE DBMultas;
USE DBMultas;


CREATE TABLE conductor (
	idConductor INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    sexo VARCHAR(10) NOT NULL,    /* Masculino, Femenino o Indefinido */
	licenciaDeConducir VARCHAR(20) NOT NULL,
    PRIMARY KEY PK_idConductor(idConductor)
);

insert into conductor values('1','Sergio Joel','Rodas',18,'Masculino','A');

CREATE TABLE vehiculo (
	idVehiculo INT NOT NULL AUTO_INCREMENT,
    idConductor INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    linea VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    PRIMARY KEY PK_idVehiculo(idVehiculo),
    CONSTRAINT FK_conductor_vehiculo 
	FOREIGN KEY (idConductor) REFERENCES conductor(idConductor)
);

insert into vehiculo values('1','1','Toyota','Camioneta','2018');

CREATE TABLE municipalidad (
	idMunicipalidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(300) NOT NULL,
    PRIMARY KEY PK_idMunicipalidad(idMunicipalidad)
);

insert into municipalidad values('1','Mixco Guatemala','Zona 10 de Mixco');

CREATE TABLE agente (
	idAgente INT NOT NULL AUTO_INCREMENT,
    idMunicipalidad INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    sexo VARCHAR(10) NOT NULL,    /* Masculino, Femenino o Indefinido */
    salario REAL NOT NULL,
    PRIMARY KEY PK_idAgente(idAgente),
    CONSTRAINT FK_municipalidad_agente 
	FOREIGN KEY (idMunicipalidad) REFERENCES municipalidad(idMunicipalidad)
);

insert into agente values('1','1','Ariel','Lopez','Masculino',6000);


CREATE TABLE multa (
	idMulta INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(200) NOT NULL,
    PRIMARY KEY PK_idMulta(idMulta)
);

insert into multa values('1','Exeso de Alcohol');
select * from multa;

CREATE TABLE multaAlConductor (
	idMultaAlConductor INT NOT NULL AUTO_INCREMENT,
    idMulta INT NOT NULL,
    idConductor INT NOT NULL,
    idAgente INT NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    costo INT NOT NULL,
    PRIMARY KEY PK_idMultaAlConductor(idMultaAlConductor),
    CONSTRAINT FK_multa_multaAlConductor
	FOREIGN KEY (idMulta) REFERENCES multa(idMulta),
    CONSTRAINT FK_conductor_multaAlConductor
	FOREIGN KEY (idConductor) REFERENCES conductor(idConductor),
	CONSTRAINT FK_agente_multaAlConductor
	FOREIGN KEY (idAgente) REFERENCES agente(idAgente)
);

insert into multaAlConductor values('1','1','1','1','Desvio de carril',600);
select * from multaAlConductor;

CREATE TABLE multaAlVehiculo (
	idMultaAlVehiculo INT NOT NULL AUTO_INCREMENT,
    idMulta INT NOT NULL,
    idVehiculo INT NOT NULL,
    idAgente INT NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    costo INT NOT NULL,
    PRIMARY KEY PK_idMultaAlVehiculo(idMultaAlVehiculo),
    CONSTRAINT FK_multa_multaAlVehiculo
	FOREIGN KEY (idMulta) REFERENCES multa(idMulta),
	CONSTRAINT FK_vehiculo_multaAlVehiculo
	FOREIGN KEY (idVehiculo) REFERENCES vehiculo(idVehiculo),
	CONSTRAINT FK_agente_multaAlVehiculo
	FOREIGN KEY (idAgente) REFERENCES agente(idAgente)
);
