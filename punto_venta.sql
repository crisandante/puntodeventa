-- DROP USER ‘usuario_prueba’@‘localhost’;
-- CREATE DATABASE puntoventa;

USE puntoventa;
-- creamos la tabla producto
CREATE TABLE producto(id_producto INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
codigo_barra VARCHAR(20), nombre_producto TEXT, descripcion TEXT, imagen_producto LONGBLOB, nombre_imagen TEXT);
-- creamos la tabla costos
CREATE TABLE costos(id_producto INTEGER NOT NULL, costo_a FLOAT8, costo_u FLOAT8, costo_v FLOAT8);

-- creamos la tabla stock
CREATE TABLE stock(id_producto INTEGER NOT NULL, piezas_adquiridas INTEGER NOT NULL, piezas_vendidas INTEGER NOT NULL);
-- creamos la tabla venta
CREATE TABLE venta(id_venta INTEGER NOT NULL PRIMARY KEY, fecha DATE, hora TIME, monto_total FLOAT8);

CREATE TABLE lista_venta(id_lista INTEGER NOT NULL PRIMARY KEY, id_venta INTEGER NOT NULL, id_producto INTEGER NOT NULL, costo_v FLOAT8 NOT NULL);

-- iniciamos las dependencias
ALTER TABLE costos ADD FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE stock ADD FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE lista_venta ADD FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE lista_venta ADD FOREIGN KEY (id_venta) REFERENCES venta(id_venta) ON DELETE CASCADE ON UPDATE CASCADE;
-- CREATE USER 'puntoventa'@'%' IDENTIFIED BY 'puntoventa';
-- GRANT ALL PRIVILEGES ON  puntoventa.* TO 'puntoventa'@'%';
-- FLUSH PRIVILEGES;
INSERT INTO producto (id_producto, codigo_barra, nombre_producto, descripcion, imagen_producto, nombre_imagen) values(NULL, '75412356', 'cocacola 600ml', 'cocacola de 600ml bote no retornable', NULL, NULL);
INSERT INTO producto (id_producto, codigo_barra, nombre_producto, descripcion, imagen_producto, nombre_imagen) values(NULL, '75412857', 'sabritas', 'papas sabritas clasicas 120gr', NULL, NULL);
INSERT INTO costos (id_producto, costo_a, costo_u, costo_v) values(1, 11, 12, 12.50),(2, 9, 10, 10.50);
INSERT INTO stock (id_producto, piezas_adquiridas, piezas_vendidas) values(1, 45, 0),(2, 20, 0);