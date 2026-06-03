\## 🔗 JOINs en MySQL — Unir tablas



\*\*Semana 7–8 · Ruta Analista de Datos · 2025\*\*



\---



\### 🧠 ¿Qué aprendí?



Los `JOIN` permiten combinar filas de dos o más tablas

basándose en una columna relacionada entre ellas.

En el mundo real los datos están distribuidos en múltiples

tablas y los JOINs son la herramienta para unirlos.



\*\*Los tipos que practiqué:\*\*



| Tipo | ¿Qué devuelve? | Cuándo usarlo |

|------|---------------|---------------|

| `INNER JOIN` | Solo coincidencias en ambas tablas | Cuando solo quieres registros relacionados |

| `LEFT JOIN` | Todos de la izq. + coincidencias der. | Cuando necesitas TODOS aunque no tengan relación |

| `RIGHT JOIN` | Todos de la der. + coincidencias izq. | Igual que LEFT pero al revés (menos común) |



\---



\### 💼 ¿Para qué sirve en el mundo real?



\- Ver qué clientes han hecho pedidos (y cuáles no)

\- Cruzar tabla de empleados con tabla de ventas

\- Combinar productos con sus categorías para reportes

\- Unir datos de diferentes fuentes en un solo análisis



\---



\### 📂 Ejercicios en este archivo



| # | Consulta | Tipo de JOIN |

|---|----------|-------------|

| 1 | Clientes con sus pedidos | INNER JOIN |

| 2 | Todos los clientes, tengan o no pedidos | LEFT JOIN |

| 3 | Productos sin ventas registradas | LEFT JOIN + NULL |

| 4 | Reporte de ventas por vendedor y región | INNER JOIN múltiple |

| 5 | Clientes con más de 3 pedidos | JOIN + GROUP BY + HAVING |



\---



\### 💡 Lo que descubrí practicando



\-Inner Join sirve para ver datos de varias tablas al mismo tiempo

\-Right Join no se usa muy frecuentemente

\-se pueden abreviar los nombres d las tablas a una sola letra 

\-se debe poner un punto(.) antes de la columna que se desea mostrar

\-se puede combinar con todo lo aprendido





\---



\### 🛠️ Tecnologías usadas



!\[MySQL](https://img.shields.io/badge/MySQL-8.0-blue)

