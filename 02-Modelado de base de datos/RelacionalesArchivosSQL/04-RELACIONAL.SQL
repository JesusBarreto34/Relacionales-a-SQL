
CREATE TABLE CLIENTE (
    IdCliente INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    
   
    CONSTRAINT PK_Cliente PRIMARY KEY (IdCliente)
);
GO


CREATE TABLE PRODUCTO (
    IdProducto INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT PK_Producto PRIMARY KEY (IdProducto)
);
GO


CREATE TABLE VENTA (
    IdVenta INT IDENTITY(1,1) NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    Detalle VARCHAR(255) NULL,
    IdCliente INT NOT NULL,
    
  
    CONSTRAINT PK_Venta PRIMARY KEY (IdVenta),
    
    
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (IdCliente) 
        REFERENCES CLIENTE(IdCliente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
GO


CREATE TABLE CONTIENE (
    IdVenta INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    PrecioProducto DECIMAL(10,2) NOT NULL,
    
   
    CONSTRAINT PK_Contiene PRIMARY KEY (IdVenta, IdProducto),
    
   
    CONSTRAINT FK_Contiene_Venta FOREIGN KEY (IdVenta) 
        REFERENCES VENTA(IdVenta)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
    CONSTRAINT FK_Contiene_Producto FOREIGN KEY (IdProducto) 
        REFERENCES PRODUCTO(IdProducto)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
GO
