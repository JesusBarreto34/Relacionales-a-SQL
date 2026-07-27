
CREATE TABLE Oficina (
    oficina_id INT IDENTITY(1,1) PRIMARY KEY,
    ciudad VARCHAR(30) NOT NULL,
    region VARCHAR(20) NOT NULL,
    objetivo DECIMAL(10,2) NOT NULL,
    ventas DECIMAL(10,2) NOT NULL,
    representante_id INT NOT NULL
);


CREATE TABLE Representante (
    representante_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15),
    fecha_contrato DATE NOT NULL,
    edad INT NOT NULL,
    puesto VARCHAR(15) NOT NULL,
    cuota DECIMAL(10,2) NOT NULL,
    ventas DECIMAL(10,2) NOT NULL,
    representante_id_jefe INT NULL,
    oficina_id INT NULL,
    
    CONSTRAINT FK_Representante_Jefe 
        FOREIGN KEY (representante_id_jefe) REFERENCES Representante(representante_id),
    CONSTRAINT FK_Representante_Oficina 
        FOREIGN KEY (oficina_id) REFERENCES Oficina(oficina_id)
);

ALTER TABLE Oficina
ADD CONSTRAINT FK_Oficina_Representante 
FOREIGN KEY (representante_id) REFERENCES Representante(representante_id);

CREATE TABLE Cliente (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    empresa VARCHAR(30) NOT NULL,
    limite_credito DECIMAL(10,2) NOT NULL,
    representante_id INT NOT NULL,

    CONSTRAINT FK_Cliente_Representante 
        FOREIGN KEY (representante_id) REFERENCES Representante(representante_id)
);

CREATE TABLE Producto (
    producto_id CHAR(5) NOT NULL,
    fab_id CHAR(3) NOT NULL,
    descripcion VARCHAR(90) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,

    CONSTRAINT PK_Producto PRIMARY KEY (producto_id, fab_id)
);

CREATE TABLE Pedido (
    pedido_id INT IDENTITY(1,1) PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    cliente_id INT NOT NULL,
    representante_id INT NOT NULL,

    CONSTRAINT FK_Pedido_Cliente 
        FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    CONSTRAINT FK_Pedido_Representante 
        FOREIGN KEY (representante_id) REFERENCES Representante(representante_id)
);

CREATE TABLE detalle_pedido (
    pedido_id INT NOT NULL,
    producto_id CHAR(5) NOT NULL,
    fab_id CHAR(3) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    
    CONSTRAINT PK_Detalle_Pedido PRIMARY KEY (pedido_id, producto_id, fab_id),

   
    CONSTRAINT FK_Detalle_Pedido_Pedido 
        FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    CONSTRAINT FK_Detalle_Pedido_Producto 
        FOREIGN KEY (producto_id, fab_id) REFERENCES Producto(producto_id, fab_id)
);
