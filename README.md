## 📊 GROUP BY y HAVING en MySQL

**Semana 5 · Ruta Analista de Datos · Mayo 2025**

---

### 🧠 ¿Qué aprendí?

`GROUP BY` agrupa filas que tienen el mismo valor en una columna,
permitiendo aplicar funciones de agregación a cada grupo.
`HAVING` filtra esos grupos después de agruparlos — a diferencia
de `WHERE` que filtra antes.

**Regla clave:**
- `WHERE` → filtra filas (antes de agrupar)
- `HAVING` → filtra grupos (después de agrupar)

---

### 💼 ¿Para qué sirve en el mundo real?

- Calcular ventas totales por categoría de producto
- Encontrar los vendedores con más transacciones
- Identificar clientes que superan cierto nivel de compras
- Generar reportes de resumen para dashboards ejecutivos

---

### 📂 Ejercicios en este archivo

| # | Consulta | Concepto |
|---|----------|----------|
| 1 | Ventas totales por categoría | SUM + GROUP BY |
| 2 | Categorías con más de $1,000 en ventas | HAVING |
| 3 | Ticket promedio por vendedor | AVG + ORDER BY |
| 4 | Top 3 productos más vendidos | COUNT + LIMIT |

---

### 💡 Lo que descubrí practicando

- Me costo aprender que siempre va coma antes de funciones de agregacion
- Me di cuenta que el paréntesis después de una función de agregación no debe tener espacio entre ambos
- Entendí que where no puede usar funciones de agregación 
- Aprendí que después de cada funcion de agregación, si se va a usar otra, debe ir una coma
- Con prueba y error comprendí que hay sensibilidad a las tildes lo que puede cambiar los resultados


---

### 🛠️ Tecnologías usadas

MySQL workbench
