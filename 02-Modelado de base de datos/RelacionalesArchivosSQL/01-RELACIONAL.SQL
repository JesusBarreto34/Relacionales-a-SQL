CREATE TABLE PACIENTE (
    NumPac INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NULL,
    
 
    CONSTRAINT PK_Paciente PRIMARY KEY (NumPac)
);
GO


CREATE TABLE EXPEDIENTE (
    NumExp INT IDENTITY(1,1) NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    Diagnostico VARCHAR(MAX) NULL,
    NumPac INT NOT NULL,
    
   
    CONSTRAINT PK_Expediente PRIMARY KEY (NumExp),
    
    CONSTRAINT FK_Expediente_Paciente FOREIGN KEY (NumPac) 
        REFERENCES PACIENTE(NumPac)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
   
    CONSTRAINT UQ_Expediente_NumPac UNIQUE (NumPac)
);
GO
