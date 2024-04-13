# SQL-resume

# Librerías
import IPython.display as display
from IPython.core.display import Markdown

# Definir celdas de código y markdown para el notebook

# ## Categorías principales de funciones SQL

# ### Funciones de agregación

display.markdown("""Las funciones de agregación calculan valores resumidos a partir de conjuntos de datos.""")

# Ejemplo: Calcular la suma de salarios
código_sql = """SELECT SUM(salario) AS total_sueldos
                FROM empleados;"""

display.code(código_sql)

# Ejemplo: Calcular el promedio de edades
código_sql = """SELECT AVG(edad) AS edad_promedio
                FROM usuarios;"""

display.code(código_sql)

# ### Funciones de cadena

display.markdown("""Las funciones de cadena manipulan cadenas de texto.""")

# Ejemplo: Convertir nombres a mayúsculas
código_sql = """SELECT UPPER(nombre) AS nombre_mayusculas
                FROM clientes;"""

display.code(código_sql)

# Ejemplo: Extraer parte de una descripción
código_sql = """SELECT SUBSTRING(descripcion, 1, 20) AS descripcion_corta
                FROM productos;"""

display.code(código_sql)

# ### Funciones de fecha y hora

display.markdown("""Estas funciones trabajan con valores de fecha y hora.""")

# Ejemplo: Extraer la fecha de un valor de fecha/hora
código_sql = """SELECT DATE(fecha_hora) AS fecha_sola
                FROM eventos;"""

display.code(código_sql)

# Ejemplo: Calcular la diferencia entre dos fechas
código_sql = """SELECT DATEDIFF(fecha_fin, fecha_inicio) AS dias_transcurridos
                FROM tareas;"""

display.code(código_sql)

# ### Funciones de comparación

display.markdown("""Comparan valores y devuelven valores booleanos (TRUE o FALSE).""")

# Ejemplo: Comparar si dos valores son iguales
código_sql = """SELECT * FROM usuarios WHERE edad = 30;"""

display.code(código_sql)

# Ejemplo: Comparar si un valor es mayor que otro
código_sql = """SELECT * FROM productos WHERE precio > 100;"""

display.code(código_sql)

# ### Funciones lógicas

display.markdown("""Realizan operaciones lógicas sobre valores booleanos.""")

# Ejemplo: Comprobar si se cumplen dos condiciones
código_sql = """SELECT * FROM clientes WHERE edad > 18 AND ciudad = 'Nueva York';"""

display.code(código_sql)

# Ejemplo: Comprobar si se cumple al menos una de dos condiciones
código_sql = """SELECT * FROM productos WHERE categoria = 'Electrónica' OR precio < 50;"""

display.code(código_sql)

# ### Funciones de conversión

display.markdown("""Convierten valores de un tipo de datos a otro.""")

# Ejemplo: Convertir un valor a VARCHAR
código_sql = """SELECT CAST(cantidad AS VARCHAR) AS cantidad_texto
                FROM inventario;"""

display.code(código_sql)

# Ejemplo: Convertir un valor a un tipo de datos específico en una base de datos específica
código_sql = """SELECT CONVERT(fecha_columna, DATETIME) AS fecha_convertida
                FROM ventas;"""

display.code(código_sql)

# ### Funciones de sistema

display.markdown("""Proporcionan información sobre el sistema o la base de datos.""")

# Ejemplo: Obtener el nombre del usuario actual
código_sql = """SELECT USER();"""

display.code(código_sql)

# Ejemplo: Obtener la fecha actual
código_sql = """SELECT CURRENT_DATE();"""

display.code(código_sql)
