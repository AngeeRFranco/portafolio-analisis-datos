drop table if exists detalle_pedidos;
drop table if exists pedidos;
drop table if exists clientes;
drop table if exists categorias;

#Tabla 1: Clientes

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

#Ejercicios 1 a 3

/*Inner join
Muestra el nombre del cliente, la fecha y el total de cada pedido. Ordena por fecha.
*/

select 
	c.nombre,
    p.fecha,
    p.total
from clientes c
inner join pedidos p
	on c.cliente_id = p.cliente_id
order by p.fecha;


/*Ejercicio 2
LEFT JOIN + clientes sin pedidos 
Lista todos los clientes con su total de pedidos. Si un cliente no ha pedido nada, muestra 0 en vez de NULL. Ordena por total descendente.
*/

select 
	c.nombre,
    c.segmento,
    coalesce(sum(p.total), 0) as total_gastado,
    count(p.pedido_id) as num_pedido
from clientes c
left join pedidos p
	on c.cliente_id = p.cliente_id
group by c.nombre, c.segmento
order by total_gastado desc;

/*Ejercicio 3 — JOIN con filtro WHERE
¿Qué productos compraron los clientes Premium? Muestra nombre del cliente, producto y precio. Sin repetidos de producto por cliente.
*/
	select 
		c.nombre,
		dp.producto,
		dp.precio
	from clientes c 
	inner join pedidos p
		on c.cliente_id = p.cliente_id
	inner join detalle_pedidos dp
		on p.pedido_id = dp.pedido_id
	where c.segmento = 'Premium'
	order by c.nombre, dp.precio desc;

/*Ejercicio 4 — JOIN + GROUP BY + HAVING
¿Qué categorías de productos generaron más de $500 en ingresos totales? Muestra categoría, ingresos totales y cantidad de ítems vendidos.
*/

select 
	dp.categoria,
    sum(dp.precio * dp.cantidad) as ingreso_total,
    sum(dp.cantidad) as items_vendidos
from detalle_pedidos dp
group by dp.categoria
having sum(dp.precio * dp.cantidad) > 500
order by ingreso_total desc;


    