use cloud_semana_1;


#Ejercicios

create table ventas (
	id int, 
    producto varchar (100), 
    categoria varchar(100),
    precio float,
    cantidad int,
    ciudad varchar(100),
    vendedor varchar(50));
    
insert into ventas values(1, 'Laptop', 'Tecnología', 850, 2, 'Santiago', 'Ana');
insert into ventas values(2, 'Mouse', 'Tecnología', 25, 10, 'Valparaíso', 'Luis');
insert into ventas values(3, 'Silla', 'Muebles', 200, 5, 'Santiago', 'Ana');
insert into ventas values(4, 'Teclado', 'Tecnología', 60, 8, 'Concepción', 'Maria');
insert into ventas values(5, 'Escritorio', 'Muebles', 350, 3, 'Santiago', 'Luis');
insert into ventas values(6, 'Monitor', 'Tecnología', 400, 4, 'Valparaiso', 'Maria');
insert into ventas values(7, 'Lampara', 'Muebres', 80, 6, 'Concepcion', 'Ana');
insert into ventas values(8, 'Auriculares', 'Tecnología', 120, 7, 'Santiago', 'Luis');
insert into ventas values(9, 'Escritorio', 'Muebles', 350, 2, 'Valparaiso', 'Ana');
insert into ventas values(10, 'Laptop', 'Tecnología', 850, 1, 'Concepcion', 'Luis');

select * from ventas;

/*Ejercicio 1 GROUP BY
¿Cuántas ventas hizo cada vendedor? Muestra vendedor y total de ventas, ordenado de mayor a menor.
*/

select vendedor, 
	count(*) as total_ventas
from ventas
group by vendedor
order by total_ventas desc;

/*Ejercicio 2 — SUM + GROUP BY 
¿Cuánto ingresó cada categoría en total? 
El ingreso de cada venta es precio × cantidad. Muestra categoría, 
ingreso total y número de productos distintos vendidos.
*/

select categoria, 
	sum(precio * cantidad) as ingreso_total,
	count(*) as num_ventas
from ventas
group by categoria
order by ingreso_total desc;

/*Ejercicio 3 — HAVING 
¿Qué ciudades tienen un ingreso total mayor a $1500? 
Muestra ciudad, ingreso total y número de ventas. Ordena por ingreso total descendente.
*/

select ciudad,
	sum(precio * cantidad) as ingreso_total,
    count(*) as num_ventas
from ventas
group by ciudad
having sum(precio * cantidad) > 1500
order by ingreso_total desc;

UPDATE ventas SET ciudad = 'Valparaíso' WHERE ciudad = 'Valparaiso';

select * from clientes;
select * from pedidos;

select
	c.nombre,
    c.ciudad, 
    p.pedido_id,
    p.producto,
    p.monto
from clientes c
inner join pedidos p
 on c.cliente_id = p.cliente_id;
 
 # Ejercicio Cuanto gastó cada cliente en total

select
	c.nombre,
    count(p.pedido_id) as num_pedidos,
    sum(p.monto) as total_gastado
from clientes c
inner join pedidos p
	on c.cliente_id = p.cliente_id
group by c.nombre
order by total_gastado desc;

#left join

select 
	c.nombre,
    c.ciudad,
    p.pedido_id,
    p.producto,
    p.monto
from clientes c
left join pedidos p
	on c.cliente_id = p.cliente_id;
    

#Que clientes nunca han comprado nada

select c.nombre, c.ciudad
from clientes c
left join pedidos p
	on c.cliente_id = p.cliente_id
where p.pedido_id is null;

#Right join

select 
	c.nombre,
    p.pedido_id,
    p.producto,
    p.monto
from clientes c
right join pedidos p
	on c.cliente_id = p.cliente_id;
    
#ejercicios

drop table if exists clientes;
drop table if exists pedidos;

create table clientes(
	cliente_id int,
    nombre varchar(50),
    ciudad varchar (50));
    
insert into clientes values
	(1, 'Ana López', 'Santiago'),
    (2, 'Luis Vera', 'Valparaíso'),
    (3, 'María Castro', 'Concepción'),
    (4, 'Pedro Díaz', 'Santiago'),
    (5, 'Sofía Ruiz', 'Temuco');
    
create table pedidos(
	pedido_id int,
    cliente_id int,
    producto varchar(50),
    monto int);
    
insert into pedidos values
	(101, 1, 'Laptop', 850),
    (102, 1, 'Mouse', 25),
    (103, 2, 'Monitor', 400),
    (104, 3, 'Teclado', 60),
    (105, 6, 'Silla', 200);
    
select * from clientes;
select * from pedidos;
    
#Ejercico 1 - Inner join
#Muestra el nombre del cliente, su ciudad y el producto que compró. Solo los clientes que tienen al menos un pedido.

select 
	c.nombre,
    c.ciudad,
    p.producto
from clientes c
inner join pedidos p
	on c.cliente_id = p.cliente_id;
    
#Ejercicio 2: Left join + is null
#¿Qué clientes nunca han realizado un pedido? Muestra solo su nombre y ciudad.

select
	c.nombre,
    c.ciudad
from clientes c
left join pedidos p
	on c.cliente_id = p.cliente_id
where p.pedido_id is null;

#Ejercicio 3: JOIN + GROUP BY + HAVING
#¿Qué clientes han gastado más de $100 en total? Muestra nombre, número de pedidos y total gastado, ordenado de mayor a menor.

select 
	c.nombre,
    count(p.pedido_id) as num_pedidos,
    sum(p.monto) as total_gastado
from clientes c
inner join pedidos p
	on c.cliente_id = p.cliente_id
group by c.nombre
having sum(p.monto) > 100
order by total_gastado desc;

 