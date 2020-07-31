CREATE TABLE cliente(
id SERIAL,
rut_cliente VARCHAR (15),
nombre_cliente VARCHAR(50),
direccion_cliente VARCHAR(100),
PRIMARY KEY (id)
);

CREATE TABLE categoria(
id SERIAL,
nombre_categoria VARCHAR(50),
descripcion_categoria VARCHAR(50),
PRIMARY KEY (id)
);


CREATE TABLE producto(
id SERIAL,
nombre_producto VARCHAR(50),
descripcion_producto VARCHAR(50),
valor_unitario_producto INT,
PRIMARY KEY (id),
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE factura(
numero_factura SERIAL,
fecha DATE,
sub_total INT,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
PRIMARY KEY (numero_factura)
);

CREATE TABLE factura_listado(
id SERIAL,
numero_factura INT,
FOREIGN KEY (numero_factura) REFERENCES factura(numero_factura),
id_producto INT,
FOREIGN KEY (id_producto) REFERENCES producto(id),
cantidad INT,
valor_unitario_producto INT,
total INT,
PRIMARY KEY (id)
);


INSERT INTO cliente(rut_cliente,nombre_cliente,direccion_cliente)
VALUES('11.111.111-1','Juan Mendoza','Porvenir 0382');

INSERT INTO cliente(rut_cliente,nombre_cliente,direccion_cliente)
VALUES('22.222.222-2','Rosa Rojas','Rio Baker 185');

INSERT INTO cliente(rut_cliente,nombre_cliente,direccion_cliente)
VALUES('11.123.123-3','Marcelo Salas','Francia 198');

INSERT INTO cliente(rut_cliente,nombre_cliente,direccion_cliente)
VALUES('22.123.123-4','Ivan Zamorano','Madrid 0411');

INSERT INTO cliente(rut_cliente,nombre_cliente,direccion_cliente)
VALUES('22.355.355-5','Lidia Morales','Bio Bio 123');


INSERT INTO categoria(nombre_categoria,descripcion_categoria)
VALUES('Lacteos','productos basados en leche');

INSERT INTO categoria(nombre_categoria,descripcion_categoria)
VALUES('Cecinas','productos basados en carne');

INSERT INTO categoria(nombre_categoria,descripcion_categoria)
VALUES('Gaseosas','productos altos en azucar');

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Queso Colun','Queso laminado','1000',1);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Salame San Jorge','Laminas','1500',2);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Coca-cola','Bebida cafeina','2000',3);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Queso La vaquita','Del sur','1000',1);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Jamon Colonial','Laminado','3000',2);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Kem Piña','Bebida amarilla','1000',3);

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Queso Ranco','De la union','2000',1); 

INSERT INTO producto(nombre_producto,descripcion_producto,valor_unitario_producto,id_categoria)
VALUES('Jamon sandwich','en sachet','1500',2); 



INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-07','0',1);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-08','0',1);

INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-09','0',2);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-10','0',2);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-11','0',2);

INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-12','0',3);

INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-13','0',4);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-14','0',4);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-15','0',4);
INSERT INTO factura (fecha,sub_total,id_cliente)
VALUES ('2020-07-16','0',4);



INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (1,2,1,(SELECT valor_unitario_producto FROM producto WHERE id = 1), (SELECT valor_unitario_producto * 1 FROM producto WHERE id = 1));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (1,2,2,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 2 FROM producto WHERE id = 2));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (2,2,3,(SELECT valor_unitario_producto FROM producto WHERE id = 1), (SELECT valor_unitario_producto * 3 FROM producto WHERE id = 1));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (2,2,4,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 4 FROM producto WHERE id = 2));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (2,2,5,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 5 FROM producto WHERE id = 3));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (3,2,6,(SELECT valor_unitario_producto FROM producto WHERE id = 1), (SELECT valor_unitario_producto * 6 FROM producto WHERE id = 1));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (3,2,7,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 7 FROM producto WHERE id = 2));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (3,2,8,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 8 FROM producto WHERE id = 3));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (4,2,3,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 3 FROM producto WHERE id = 2));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (4,2,5,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 5 FROM producto WHERE id = 3));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (5,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 1), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 1));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (5,2,7,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 7 FROM producto WHERE id = 2));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (5,2,6,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 6 FROM producto WHERE id = 3));



INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (6,2,4,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 4 FROM producto WHERE id = 3));


INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (7,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 1), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 1));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (7,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 2), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 2));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (8,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (8,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (8,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));

INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (9,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (9,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (9,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));
INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (9,2,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));


INSERT INTO factura_listado (numero_factura, id_producto,cantidad,valor_unitario_producto, total)
VALUES (10,6,10,(SELECT valor_unitario_producto FROM producto WHERE id = 3), (SELECT valor_unitario_producto * 10 FROM producto WHERE id = 3));


UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 1); 
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 2);
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 3);
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 4); 
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 5); 
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 6); 
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 7);
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 8);
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 9);
UPDATE factura SET sub_total = (SELECT SUM(total) FROM factura_listado WHERE numero_factura= 10);




SELECT nombre_cliente FROM cliente c LEFT JOIN factura f ON f.id_cliente = c.id WHERE f.sub_total > 100;

SELECT c.* FROM cliente c LEFT JOIN factura f ON f.id_cliente = c.id ORDER BY f.sub_total DESC LIMIT 1;

SELECT COUNT(*) FROM cliente c 
LEFT JOIN factura f ON f.id_cliente = c.id
LEFT JOIN factura_listado l ON f.numero_factura = l.numero_factura
WHERE l.id_producto = 6



