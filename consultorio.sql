CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE Paciente (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY, 
    identificacion VARCHAR(20) UNIQUE,        
    nombres VARCHAR(50),                   
    apellidos VARCHAR(50),                  
    genero ENUM('Femenino', 'Masculino'),      
    fechaNacimiento DATE                      
);

CREATE TABLE Medicos (
    idMedico INT AUTO_INCREMENT PRIMARY KEY,   
    nombres VARCHAR(50),                       
    apellidos VARCHAR(50),                    
    correo VARCHAR(50) UNIQUE,                 
    especialidad VARCHAR(50)                 
);

CREATE TABLE Citas (
    idCita INT AUTO_INCREMENT PRIMARY KEY,   
    idPaciente INT,                            
    idMedico INT,                              
    fechaCita DATE,                            
    horaCita TIME,                            
    estado ENUM('Solicitada', 'Atendida', 'Cancelada') DEFAULT 'Solicitada',
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente), 
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)     
);

# 1

INSERT INTO Paciente (identificacion, nombres, apellidos, genero, fechaNacimiento)
VALUES
('1001', 'Ana', 'Perez', 'Femenino', '1990-05-15'),
('1002', 'Luisa', 'Gomez', 'Femenino', '1995-07-20'),
('1003', 'Marta', 'Rios', 'Femenino', '1985-09-10'),
('1004', 'Carlos', 'Rodríguez', 'Masculino', '1988-11-30'),
('1005', 'Juan', 'Lopez', 'Masculino', '1992-03-22');

# 2
SELECT * FROM Paciente;

# 3 
INSERT INTO Medicos (nombres, apellidos, correo, especialidad)
VALUES
('Pedro', 'Diaz', 'pedro.diaz@gmail.com', 'General'),
('Maria', 'Fernandez', 'maria.fernandez@gmail.com', 'Pediatria'),
('Luis', 'Castro', 'luis.castro@gmail.com', 'Odontologia');


# 4 
SELECT * FROM Medicos;


# 5 
INSERT INTO Citas (idPaciente, idMedico, fechaCita, horaCita)
VALUES
(1, 1, '2024-12-01', '10:00:00'), 
(2, 1, '2024-12-02', '11:00:00'), 
(3, 2, '2024-12-03', '09:30:00'), 
(4, 2, '2024-12-04', '14:00:00'), 
(5, 3, '2024-12-05', '16:00:00'); 

# 6
SELECT * FROM Citas;

# 7 

UPDATE Citas
SET fechaCita = '2024-12-12'
WHERE idCita = 5;

# 8

SELECT * FROM Citas
WHERE MONTH(fechaCita) = 12;

# 9
UPDATE Paciente
SET nombres = 'Jose Maria', apellidos = 'Dorado'
WHERE idPaciente = 1;

# 10
SELECT * FROM Paciente;

#11 

UPDATE Citas
SET estado = 'Cancelada'
WHERE idCita IN (
    SELECT * FROM (
        SELECT idCita FROM Citas WHERE fechaCita = '2024-12-12'
    ) AS demo
);



# 14 
INSERT INTO Medicos (nombres, apellidos, correo, especialidad)
VALUES ('Carlos', 'Martinez', 'carlos.martinez@gmail.com', 'General');


# 15 
SELECT * FROM Medicos
WHERE especialidad = 'General';

# 16

SET SQL_SAFE_UPDATES = 0;

UPDATE Medicos
SET especialidad = 'Medicina General'
WHERE especialidad = 'General';

-- error 
porque el modo seguro esta activado ha influido desde los inicios 
en talleres debo desactivarlo
para que me rinda el taller evaluativo
la otra froma de hacerlo se que es una subconsulta 
pero debido al tiempo no alcanzo


# 17
SELECT * FROM Medicos;
