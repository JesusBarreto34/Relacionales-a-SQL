
CREATE TABLE ALUMNO (
    IdAlumno INT IDENTITY(1,1) NOT NULL,
    Matricula VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NULL,
    Semestre INT NOT NULL,
    
 
    CONSTRAINT PK_Alumno PRIMARY KEY (IdAlumno)
);
GO

CREATE TABLE MATERIA (
    IdMateria INT IDENTITY(1,1) NOT NULL,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    
    CONSTRAINT PK_Materia PRIMARY KEY (IdMateria)
);
GO


CREATE TABLE INSCRIBE (
    IdMateria INT NOT NULL,
    IdAlumno INT NOT NULL,
    FechaInscripcion DATE NOT NULL DEFAULT GETDATE(),
    Calificacion DECIMAL(4,2) NULL,
    
    
    CONSTRAINT PK_Inscribe PRIMARY KEY (IdMateria, IdAlumno),
    
 
    CONSTRAINT FK_Inscribe_Materia FOREIGN KEY (IdMateria) 
        REFERENCES MATERIA(IdMateria)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
    CONSTRAINT FK_Inscribe_Alumno FOREIGN KEY (IdAlumno) 
        REFERENCES ALUMNO(IdAlumno)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
GO
