-- ------------------------------------------------------
-- TUTORIAL DE COMO HACER UN CARRITO DE COMPRAS USANDO
-- EL MODELO VISTA CONTROLADOR
--
-- Creando la base de datos
--

CREATE DATABASE IF NOT EXISTS carrito;
USE carrito;

--
-- Creando la tabla control
--
CREATE TABLE Control
(
	parametro varchar(20) NOT NULL,
	Valor number(4) not null,
	CONSTRAINT XPKparametro PRIMARY KEY (parametro)
 );


---insert ----
insert into control(parametro,valor) values('producto',11);
insert into control(parametro,valor) values('venta',1);

--
-- Creando la tabla usuarios
--

CREATE TABLE usuarios(
  codigo number(11) NOT NULL,
  nombre varchar(40) NOT NULL,
  apellido varchar(40) NOT NULL,
  usuario varchar(40) NOT NULL,
  clave varchar(40) NOT NULL,
  PRIMARY KEY  (codigo)
);

---- insert-----
insert into usuarios(codigo,nombre,apellido,usuario,clave) values (1,'Jose','Gonzales','jgonzales','12345');
insert into usuarios(codigo,nombre,apellido,usuario,clave) values (2,'Ricardo','Miranda','rmiranda','12345');
insert into usuarios(codigo,nombre,apellido,usuario,clave) values (3,'Gustavo','Coronel','gcoronel','12345');
insert into usuarios(codigo,nombre,apellido,usuario,clave) values (4,'Claudia','Silva','csilva','12345');


--
-- Creando la tabla producto
--

CREATE TABLE producto (
  idProducto number(11) NOT NULL,
  nombre varchar2(100) NOT NULL,
  precio number(18,2) NOT NULL,
  stock number(11) NOT NULL,
  PRIMARY KEY  (idProducto)
);


-- insertar datos de producto----

insert into producto(idProducto,nombre,precio,stock) values(1,'MONITORES',150,50);
insert into producto(idProducto,nombre,precio,stock) values(2,'TECLADOS',30,20);
insert into producto(idProducto,nombre,precio,stock) values(3,'LECTORAS DVD',60,30);
insert into producto(idProducto,nombre,precio,stock) values(4,'MOUSE',25,50);
insert into producto(idProducto,nombre,precio,stock) values(5,'MEMORIAS DIM',120,40);
insert into producto(idProducto,nombre,precio,stock) values(6,'MEMORIAS USB',30,20);
insert into producto(idProducto,nombre,precio,stock) values(7,'IMPRESORAS',250,10);
insert into producto(idProducto,nombre,precio,stock) values(8,'AUDIFONOS',20,10);
insert into producto(idProducto,nombre,precio,stock) values(9,'MICROFONOS',25,10);
insert into producto(idProducto,nombre,precio,stock) values(10,'PARLANTES',20,10);

--
-- Creando la tabla venta
--

CREATE TABLE venta (
  idVenta number(11) NOT NULL,
  cliente varchar2(100) NOT NULL,
  fecha date NOT NULL,
  PRIMARY KEY  (idVenta)
);

--
-- Creando la tabla detalleventa
--

CREATE TABLE detalleventa (
  idVenta number(11) NOT NULL,
  idProducto number(11) NOT NULL,
  cantidad number(18,2) NOT NULL,
  descuento number(18,2) NOT NULL,
  CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (idProducto) REFERENCES producto (idProducto),
  CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (idVenta) REFERENCES venta (idVenta)
) ;




---------procedimientos almacenado------

create or replace procedure sp_venta
(p_idventa IN NUMBER,
 p_nom IN VARCHAR2 )
 is
begin
insert into venta values(p_idventa,p_nom,sysdate);
end sp_venta;

----prueba--
begin
sp_venta(10,'Fanny Lily');
end;




create or replace procedure sp_detalleventa
 ( p_idVenta IN number,
 p_idProducto IN number,
 p_cantidad IN number ,
 p_descuento IN number 
) 
is
 BEGIN 
 INSERT INTO detalleventa(idVenta,idProducto,cantidad,descuento)
 VALUES (p_idVenta, p_idProducto,p_cantidad,p_descuento);
 END sp_detalleventa;

---prueba----

begin
sp_detalleventa(10,1,1,0);
end;

select * from detalleventa

--- select ver ventas----

SELECT
    v.idVenta AS CodigoVenta,
    v.cliente AS Cliente, 
    v.fecha AS Fecha,
    d.idProducto AS CodigoProducto, 
    p.nombre AS Nombre,
    p.precio AS Precio, 
    d.cantidad AS Cantidad,
    d.descuento AS Descuento,
    p.precio*d.cantidad AS Parcial,
    ((p.precio*d.cantidad)-d.descuento) AS SubTotal,
    (SELECT  SUM((dT.cantidad * pT.precio)-dT.descuento) AS TotalPagar
    FROM         
        DetalleVenta AS dT INNER JOIN
        Producto AS pT ON dT.iProducto = pT.codigoProducto
    WHERE
        dT.isVenta=v.idVenta) AS TotalPagar
    FROM 
    Venta AS v INNER JOIN  DetalleVenta AS d ON v.idVenta = d.idVenta
    INNER JOIN Producto AS p 
    ON d.idProducto = p.idProducto
    ORDER BY
    idVenta, Nombre;

-- select----


select VENTA.IDVENTA as CODIGOVENTA,
	 VENTA.CLIENTE as CLIENTE,
	 VENTA.FECHA as FECHA,
	 PRODUCTO.PRECIO as PRECIO,
	 DETALLEVENTA.CANTIDAD as CANTIDAD 
 from	 DETALLEVENTA as DETALLEVENTA,PRODUCTO as PRODUCTO, VENTA as VENTA 
 where VENTA.IDVENTA=DETALLEVENTA.IDVENTA
  and PRODUCTO.IDPRODUCTO=DETALLEVENTA.IDPRODUCTO
  group by VENTA.IDVENTA;

commit;

