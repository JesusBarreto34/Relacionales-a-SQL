# Profesor #

```SQL
# Imagenes De Relacionales Profesor

-- 1. Creación de la tabla PROFESOR (Entidad Principal)
CREATE TABLE PROFESOR (
    NumProf INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Profesor PRIMARY KEY (NumProf)
);
GO

-- 2. Creación de la tabla CURSO (Relación 1 - N con PROFESOR)
CREATE TABLE CURSO (
    NumCurso INT IDENTITY(1,1) NOT NULL,
    NombreCurso VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    NumProf INT NOT NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Curso PRIMARY KEY (NumCurso),
    
    -- Clave Foránea
    CONSTRAINT FK_Curso_Profesor FOREIGN KEY (NumProf) 
        REFERENCES PROFESOR(NumProf)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
GO

-- 3. Creación de la tabla ESPECIALIDAD (Relación 1 - N con PROFESOR)
CREATE TABLE ESPECIALIDAD (
    NumEsp INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    NumProf INT NOT NULL,
    
    -- Clave Primaria
    CONSTRAINT PK_Especialidad PRIMARY KEY (NumEsp),
    
    -- Clave Foránea
    CONSTRAINT FK_Especialidad_Profesor FOREIGN KEY (NumProf) 
        REFERENCES PROFESOR(NumProf)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
GO
```

![alt text](image-2.png)
