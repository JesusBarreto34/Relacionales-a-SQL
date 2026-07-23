-- 1. Creación de la tabla ALUMNO
CREATE TABLE ALUMNO (
    IdAlumno INT IDENTITY(1,1) NOT NULL,
    Matricula VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NULL,
    Semestre INT NOT NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Alumno PRIMARY KEY (IdAlumno)
);
GO

-- 2. Creación de la tabla MATERIA
CREATE TABLE MATERIA (
    IdMateria INT IDENTITY(1,1) NOT NULL,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Materia PRIMARY KEY (IdMateria)
);
GO

-- 3. Creación de la tabla intermedia INSCRIBE
CREATE TABLE INSCRIBE (
    IdMateria INT NOT NULL,
    IdAlumno INT NOT NULL,
    FechaInscripcion DATE NOT NULL DEFAULT GETDATE(),
    Calificacion DECIMAL(4,2) NULL,
    
    -- Clave Primaria Compuesta (Evita inscripciones duplicadas para el mismo alumno en la misma materia)
    CONSTRAINT PK_Inscribe PRIMARY KEY (IdMateria, IdAlumno),
    
    -- Claves Foráneas
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