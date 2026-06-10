\## 🔄 COALESCE en MySQL — Manejo de valores NULL



\*\*Semana 8 · Ruta Analista de Datos · 2026\*\*



\---



\### 🧠 ¿Qué aprendí?



`COALESCE` devuelve el primer valor que no sea `NULL`

de una lista de argumentos. Es la herramienta principal

para manejar datos faltantes en análisis reales.



\*\*Sintaxis:\*\*

```sql

COALESCE(valor1, valor2, valor\_por\_defecto)

```



\*\*Casos de uso principales:\*\*

\- Reemplazar NULL por un valor legible ("Sin datos", 0, "N/A")

\- Combinar con LEFT JOIN para clientes/productos sin relación

\- Limpiar datos antes de calcular totales o promedios



\---



\### 💼 ¿Para qué sirve en el mundo real?



\- Reportes con datos incompletos — reemplazar NULL por 0

\- Clientes sin pedidos en análisis de ventas

\- Productos sin categoría asignada

\- Cualquier dataset con campos opcionales o vacíos



\---



\### 📂 Ejercicios en este archivo



| # | Consulta | Concepto |

|---|----------|----------|

| 1 | Reemplazar teléfonos NULL por "Sin registro" | COALESCE básico |

| 2 | Clientes sin pedidos muestran 0 en total | COALESCE + LEFT JOIN |

| 3 | Calcular promedio ignorando NULL vs con 0 | NULL vs COALESCE |

| 4 | Reporte de ventas con datos limpios | COALESCE + GROUP BY |

| 5 | Múltiples columnas de respaldo | COALESCE con 3+ valores |



\---



\### 💡 Lo que descubrí practicando



\-Solo SUM, AVG, MAX y MIN pueden devolver NULL cuando no hay datos.

\-Se usa principalmente left join

\-También se puede mostrar texto en lugar de números

\-Es una buena practica para trabajar con los datos



\---



\### 🛠️ Tecnologías usadas



!\[MySQL](https://img.shields.io/badge/MySQL-8.0-blue)

