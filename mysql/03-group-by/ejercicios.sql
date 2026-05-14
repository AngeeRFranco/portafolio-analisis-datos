use cloud_semana_1;

show tables;

insert into ventas values(1, 'Laptop', 'Tecnología', 850, 2, 'Santiago');
insert into ventas values(2, 'Mouse', 'Tecnología', 25, 10, 'Valparaíso');
insert into ventas values(3, 'Silla', 'MUebles', 200, 5, 'Santiago');
insert into ventas values(4, 'Teclado', 'Tecnología', 60, 8, 'Concepción');
insert into ventas values(5, 'Escritorio', 'Muebles', 350, 3, 'Santiago');

select * from ventas;

select producto, precio from ventas;

select producto, precio * cantidad AS total_venta from ventas;

insert into empleados values(1, 'Andrea López', 'Ventas', 1200, 300, 3);
insert into empleados values(2, 'Carlos Ruiz', 'Tecnología', 2000, 500, 5);
insert into empleados values(3, 'Diana Meza', 'Marketing', 1500, 200, 2);
insert into empleados values(4, 'Feipe Torres', 'Tecnología', 2200, 600, 7);
insert into empleados values(5, 'Gabriela Soto', 'Ventas', 1100, 250, 1);

select * from empleados;

select nombre, departamento from empleados;

select nombre, departamento AS area from empleados;

select nombre, departamento, sueldo_base + bono AS sueldo_total from empleados;

select 
 nombre, 
 sueldo_base + bono AS sueldo_total,
 (sueldo_base + bono) * 12 AS sueldo_anual 
 from empleados 
 order by sueldo_anual desc;
 
 select 
 nombre, sueldo_base + bono AS sueldo_total from empleados
 order by sueldo_total asc;
 
 select 
 nombre, 
 (sueldo_base + bono) * 12 AS sueldo_anual,
 (sueldo_base + (bono * 1.10)) * 12 AS sueldo_anual_bono_extra
 from empleados
 order by sueldo_anual_bono_extra desc;
 
 create table peliculas (
 id int (11),
 titulo varchar (100),
 genero varchar (100),
 año int (5),
 calificacion float (10),
 ingresos_millones int (11)
 )
 
select * from peliculas;

insert into peliculas values (
5,
'Avatar',
'Acción',
2009, 
7.9,
2923
);

insert into peliculas values(
6, 
'Joker',
'Drama',
2019,
8.4,
1074
);

insert into peliculas values(
7,
'Dune',
'Ciencia Ficción',
2021,
8.0,
401
);
 
 select titulo, calificacion from peliculas;
 select * from peliculas;
 select titulo, genero, calificacion from peliculas;
 
 select titulo,
 ingresos_millones / 1000 AS ingresos_billones
 from peliculas;
 
 select titulo, calificacion, año from peliculas
  where genero = 'Drama';
  
  select titulo, calificacion, genero 
  from peliculas
  where calificacion > 8.5;
  
  select titulo, calificacion, genero
  from peliculas
  where genero = 'Drama'
  AND calificacion > 8;
  
  select titulo AS pelicula,
  calificacion AS nota_imdb,
  ingresos_millones AS recaudacion_usd
  from peliculas
  where calificacion >=8.0;
  
  select titulo, calificacion * 10 AS nota_sobre_100,
  ingresos_millones / 1000 AS ingresos_billones
  from peliculas;
  
  select titulo, genero, año from peliculas;
  
  select titulo, genero,
  ingresos_millones AS recaudacion 
  from peliculas
  where ingresos_millones >1000;
  
  select titulo, 
  calificacion * 10 AS nota_pct,
  ingresos_millones / 1000.0 AS billones
  from peliculas
  where genero = 'Ciencia Ficción';
  
  select titulo, calificacion, genero
  from peliculas
  order by calificacion desc;
  
  select titulo, año 
  from peliculas 
  order by titulo asc;
  
  select titulo, genero, calificacion
  from peliculas
  order by genero asc, calificacion desc;
 
 select titulo, calificacion
 from peliculas 
 order by calificacion desc
 limit 3;
 
 select titulo, ingresos_millones as ingresos
 from peliculas 
 order by ingresos_millones asc
 limit 1;
 
 select genero from peliculas;
 
 select distinct genero
 from peliculas;
 
 select distinct genero
 from peliculas
 order by genero asc;
 
 select distinct genero
 from peliculas
 where calificacion > 8 
 order by genero;
 
 select titulo, genero, calificacion
 from peliculas
 where genero != 'Accion'
 order by calificacion desc
 limit 3;
 
 select distinct genero
 from peliculas
 order by genero;
 
 describe peliculas;
 
 select titulo, ingresos_millones as ingresos
 from peliculas
 order by ingresos_millones desc
 limit 5;
 
 select titulo, genero, calificacion
 from peliculas
 where genero = 'Drama'
 order by calificacion asc
 limit 1;
 
select * from peliculas;

select titulo, año
from peliculas 
order by año asc;

select titulo, ingresos_millones as ingresos
from peliculas 
where genero = 'Ciencia Ficcion'
order by ingresos_millones desc
limit 1;

select distinct año/10*10 as decada
 from peliculas
 order by decada asc;

 select titulo, genero, calificacion
 from peliculas
 where genero = 'Drama'
 and calificacion > 8.0;
 
 select titulo, año, calificacion
 from peliculas
 where genero = 'Ciencia Ficción'
 and calificacion > 8.0
 and año > 2010;
 
 select titulo, genero, ingresos_millones as ingresos
 from peliculas
 where genero = 'Drama'
 or ingresos_millones > 1000;
 
 select titulo, genero, calificacion
 from peliculas
 where  genero != 'Acción';
 
 select titulo, año
 from peliculas
 where not (año >= 2000 and año <=2009)
 order by año;
 
 select titulo, genero, calificacion
 from peliculas
 where (genero = 'Drama' or genero = 'Acción')
 and calificacion > 7.8
 order by calificacion desc;
 
 select titulo, genero, calificacion
 from peliculas
 where genero in ('Drama', 'Ciencia Ficción')
 order by calificacion desc;
 
 select titulo, genero
 from peliculas
 where genero not in ('Drama', 'Acción');
 
 select titulo, año, calificacion
 from peliculas
 where año between 2009 and 2015
 order by año;
 
 select titulo, calificacion, ingresos_millones as ingresos
 from peliculas
 where genero = 'Ciencia Ficción' and ingresos_millones > 700
 order by ingresos_millones desc;
 
 select titulo, genero, año
 from peliculas
 where genero in ('Drama', 'Ciencia Ficción')
 and año > 2005
 order by año desc;
 
 select titulo, genero, calificacion, ingresos_millones as ingresos
 from peliculas
 where (genero = 'Drama' or ingresos_millones > 2000) 
 and calificacion >= 8.0
 order by calificacion desc;
 
 select genero,
	count(*) as total_peliculas
 from peliculas 
 group by genero
 order by total_peliculas desc;
 
 select genero,
	sum(ingresos_millones) as ingresos_totales,
    count(*) as num_peliculas
    from peliculas 
    group by genero
    order by ingresos_totales desc;
    
    select genero,
		round(avg(calificacion), 2) as nota_promedio,
		count(*) as peliculas
    from peliculas 
    group by genero
    order by nota_promedio desc;
    
    select genero,
		max(calificacion) as mejor_nota,
        min(calificacion) as peor_nota,
        max(ingresos_millones) as mayor_taquilla
	from peliculas 
    group by genero;
    
    select genero,
		count(*) as peliculas,
        round(avg(calificacion), 1) as nota_prom,
        max(calificacion) as nota_maxima,
        sum(ingresos_millones) as ingresos_total
	from peliculas
    group by genero
    order by ingresos_total desc;
        
 