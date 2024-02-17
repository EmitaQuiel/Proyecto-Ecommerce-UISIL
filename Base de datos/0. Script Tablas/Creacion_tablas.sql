DROP SCHEMA IF EXISTS bd_poko_palace;
CREATE SCHEMA bd_poko_palace;
use bd_poko_palace;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del cliente',
    nombre VARCHAR(50) COMMENT 'Nombre del cliente',
    apellido VARCHAR(50) COMMENT 'Apellido del cliente',
    direccion VARCHAR(255) COMMENT 'Dirección del cliente',
    correo_electronico VARCHAR(100) COMMENT 'Correo electrónico del cliente',
    numero_telefono VARCHAR(20) COMMENT 'Número de teléfono del cliente'
);

CREATE TABLE categorias_productos (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la categoría',
    nombre_categoria VARCHAR(50) COMMENT 'Nombre de la categoría'
);

CREATE TABLE descuentos (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la promoción',
    nombre_promocion VARCHAR(255) COMMENT 'Nombre de la promoción',
    tipo_descuento VARCHAR(50) COMMENT 'Tipo de descuento (porcentaje, cantidad fija, etc.)',
    codigo_promocional VARCHAR(20) COMMENT 'Código promocional',
    fecha_inicio DATE COMMENT 'Fecha de inicio de la promoción',
    fecha_finalizacion DATE COMMENT 'Fecha de finalización de la promoción'
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del producto',
    nombre VARCHAR(255) COMMENT 'Nombre del producto',
    descripcion TEXT COMMENT 'Descripción detallada del producto',
    precio DECIMAL(10, 2) COMMENT 'Precio del producto',
    stock INT COMMENT 'Cantidad disponible en inventario',
    id_categoria INT COMMENT 'Identificador de la categoría del producto',
    imagen VARCHAR(255) COMMENT 'Ruta de la imagen del producto',
    FOREIGN KEY (id_categoria) REFERENCES categorias_productos(id_categoria)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del pedido',
    id_cliente INT COMMENT 'Identificador del cliente asociado al pedido',
    fecha_hora_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del pedido',
    estado_pedido VARCHAR(50) COMMENT 'Estado actual del pedido',
    total_pedido DECIMAL(10, 2) COMMENT 'Total del pedido',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
);

CREATE TABLE detalles_pedido (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del detalle de pedido',
    id_pedido INT COMMENT 'Identificador del pedido asociado al detalle',
    id_producto INT COMMENT 'Identificador del producto asociado al detalle',
    cantidad INT COMMENT 'Cantidad de productos en el detalle',
    precio_unitario DECIMAL(10, 2) COMMENT 'Precio unitario del producto',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) 
);

CREATE TABLE transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la transacción',
    tipo_transaccion VARCHAR(50) COMMENT 'Tipo de transacción (venta, devolución, etc.)',
    id_cliente INT COMMENT 'Identificador del cliente asociado a la transacción',
    monto DECIMAL(10, 2) COMMENT 'Monto de la transacción',
    fecha_hora_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la transacción',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
);

CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del envío',
    id_pedido INT COMMENT 'Identificador del pedido asociado al envío',
    metodo_envio VARCHAR(50) COMMENT 'Método de envío',
    direccion_envio VARCHAR(255) COMMENT 'Dirección de envío',
    estado_envio VARCHAR(50) COMMENT 'Estado del envío (en tránsito, entregado, etc.)',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) 
);
