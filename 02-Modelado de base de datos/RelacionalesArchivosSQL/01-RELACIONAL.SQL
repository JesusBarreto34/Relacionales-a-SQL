-- 1. Creación de la tabla PACIENTE
CREATE TABLE PACIENTE (
    NumPac INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Paciente PRIMARY KEY (NumPac)
);
GO

-- 2. Creación de la tabla EXPEDIENTE
CREATE TABLE EXPEDIENTE (
    NumExp INT IDENTITY(1,1) NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    Diagnostico VARCHAR(MAX) NULL,
    NumPac INT NOT NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Expediente PRIMARY KEY (NumExp),
    
    -- Clave Foránea
    CONSTRAINT FK_Expediente_Paciente FOREIGN KEY (NumPac) 
        REFERENCES PACIENTE(NumPac)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
    -- Restricción UNIQUE para garantizar la relación 1 - 1
    -- (Evita que un mismo paciente tenga más de un expediente)
    CONSTRAINT UQ_Expediente_NumPac UNIQUE (NumPac)
);
GO