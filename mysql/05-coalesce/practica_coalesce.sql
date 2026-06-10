use curso_sql;

create table clientes(
	cliente_id int,
    nombre varchar(50),
    ciudad varchar(50),
    segmento varchar(20)
);

insert into clientes values
	(1, 'Ana López', 'Santiago', 'Premium'),
    (2, 'Luis Vera', 'Valparaíso', 'Regular'),
    (3, 'María Castro', 'Concepción', 'Premium'),
    (4, 'Pedro Díaz', 'Santiago', 'Regular'),
    (5, 'Sofía Ruiz', 'Temuco', 'Regular'),
    (6, 'Carlos Mora', 'Santiago', 'Premium');
    
#Tabla 2: Pedidos

create table pedidos(
	pedido_id int,
    cliente_id int,
    fecha varchar(10),
    total int
);

insert into pedidos values 
	(101, 1, '2024-01-10', 875),
    (102, 2, '2024-01-15', 400),
    (103, 3, '2024-02-03', 610),
    (104, 1, '2024-02-20', 350),
    (105, 6, '2024-03-05', 1200),
    (106, 3, '2024-03-12', 90);
    
#Tabla 3: Detalle de Pedidos

create table detalle_pedidos(
	detalle_id int,
    pedido_id int,
    producto varchar(50),
    categoria varchar(30),
    precio int,
    cantidad int
);

insert into detalle_pedidos values
	(1, 101, 'Laptop', 'Tecnología', 850, 1),
    (2, 101, 'Mouse', 'Tecnología', 25, 1),
    (3, 102, 'Monitor', 'Tecnología', 400, 1), 
    (4, 103, 'Silla', 'Muebles', 200, 2),
    (5, 103, 'Lámpara', 'Muebles', 80, 1),
    (6, 103, 'Teclado', 'Tecnología', 60, 2),
    (7, 104, 'Escritorio', 'Muebles', 350, 1),
    (8, 105, 'Laptop', 'Tecnología', 850, 1),
    (9, 105, 'Monitor', 'Tecnología', 400, 1),
    (10, 106, 'Mouse', 'Tecnología', 25, 2),
    (11, 106, 'Lámpara', 'Muebles', 80, 1);
    
select * from clientes;
select * from pedidos;
select * from detalle_pedidos;

#se usa mayoritariamente con left join
select
	c.nombre,
    coalesce(sum(p.total), 0) as total_gastado,
    count(p.pedido_id) as numpedidos
from clientes c
left join pedidos p 
	on c.cliente_id = p.cliente_id
group by c.nombre
order by total_gastado desc;

#Caso 1 - Reemplazar null con texto descriptivo

select 
	c.nombre,
    coalesce(dp.producto, 'Sin compras') as ultimo_producto
from clientes c 
left join pedidos p 
	on c.cliente_id = p.cliente_id
left join detalle_pedidos dp
	on p.pedido_id = dp.pedido_id
group by c.nombre;

#Ejercicio 1: Coalesce Básico

#Lista todos los clientes con su total gastado. Si no han comprado nada, muestra 0 en vez de NULL.

select
	c.nombre, 
	coalesce(sum(p.total), 0) as total_gastado
from clientes c 
left join pedidos p 
	on c.cliente_id = p.cliente_id
group by nombre
order by total_gastado desc;

/*Ejercicio 2 — COALESCE con texto
Muestra todos los clientes con su segmento y el estado de compra: si tiene pedidos muestra 'Activo', si no tiene muestra 'Inactivo'.
*/
select
	c.nombre,
    c.segmento,
    coalesce(sum(p.total), 'Inactivo') as Estado
from clientes c 
left join pedidos p 
	on c.cliente_id = p.cliente_id
group by c.nombre, c.segmento;

