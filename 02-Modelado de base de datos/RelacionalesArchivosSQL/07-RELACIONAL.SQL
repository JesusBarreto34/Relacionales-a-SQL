
CREATE TABLE Alumno (
    Matricula INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido1 VARCHAR(50),
    Apellido2 VARCHAR(50),
    Correo VARCHAR(100),
    FechaNaci DATE
);
GO

CREATE TABLE Departamento (
    NumDep INT PRIMARY KEY,
    Nombredep VARCHAR(50),
    Edificio VARCHAR(50)
);
GO

CREATE TABLE Proyecto (
    NumProy INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Presupuesto DECIMAL(12,2)
);
GO



CREATE TABLE Telefono (
    ClaveTel INT NOT NULL,
    Matricula INT NOT NULL,
    Telefono VARCHAR(15),
    
    CONSTRAINT PK_Telefono PRIMARY KEY (ClaveTel, Matricula),
    CONSTRAINT FK_Telefono_Alumno FOREIGN KEY (Matricula) REFERENCES Alumno(Matricula)
);

GO

CREATE TABLE Credencial (
    NumeroCredenecial INT PRIMARY KEY,
    FechaExp DATE,
    Vigencia VARCHAR(20),
    Matricula INT NOT NULL UNIQUE,
    
    CONSTRAINT FK_Credencial_Alumno FOREIGN KEY (Matricula) REFERENCES Alumno(Matricula)
);
GO

CREATE TABLE Profesor (
    NumProf INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido1 VARCHAR(50),
    Apellido2 VARCHAR(50),
    Numdep INT NOT NULL,
    
    CONSTRAINT FK_Profesor_Departamento FOREIGN KEY (Numdep) REFERENCES Departamento(NumDep)
);
GO



CREATE TABLE Dependiente (
    NombreDep VARCHAR(50) NOT NULL,
    NumProf INT NOT NULL,
    FechaNaci DATE,
    Parentesco VARCHAR(30),
    
    CONSTRAINT PK_Dependiente PRIMARY KEY (NombreDep, NumProf),
    CONSTRAINT FK_Dependiente_Profesor FOREIGN KEY (NumProf) REFERENCES Profesor(NumProf)
);
GO

CREATE TABLE Materia (
    ClaveMateria VARCHAR(20) PRIMARY KEY,
    NombreMat VARCHAR(100),
    Creditos INT,
    Numprof INT NOT NULL,
    
    CONSTRAINT FK_Materia_Profesor FOREIGN KEY (Numprof) REFERENCES Profesor(NumProf)
);
GO

CREATE TABLE Participa (
    NumProf INT NOT NULL,
    NumProj INT NOT NULL,
    Rol VARCHAR(50),
    
    CONSTRAINT PK_Participa PRIMARY KEY (NumProf, NumProj),
    CONSTRAINT FK_Participa_Profesor FOREIGN KEY (NumProf) REFERENCES Profesor(NumProf),
    CONSTRAINT FK_Participa_Proyecto FOREIGN KEY (NumProj) REFERENCES Proyecto(NumProy)
);
GO


CREATE TABLE Cursa (
    Matricula INT NOT NULL,
    ClaveMat VARCHAR(20) NOT NULL,
    FechaInscrip DATE,
    Calif DECIMAL(5,2),
    
    CONSTRAINT PK_Cursa PRIMARY KEY (Matricula, ClaveMat),
    CONSTRAINT FK_Cursa_Alumno FOREIGN KEY (Matricula) REFERENCES Alumno(Matricula),
    CONSTRAINT FK_Cursa_Materia FOREIGN KEY (ClaveMat) REFERENCES Materia(ClaveMateria)
);
GO
