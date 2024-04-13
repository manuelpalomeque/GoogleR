# -----------------------------------------------------------
# Paso 1: Cargar paquetes

# Instalar el paquete requerido; `tidyverse`. 

install.packages("tidyverse")

# Una vez que el  paquete está instalado, procedemos a cargarlo con la funciónn 
# `library()` :

library(tidyverse)

# -----------------------------------------------------------
# Paso 2: Crear un marco de datos

#  Existen diversas maneras de hacerlo; una de las más comunes es crear vectores de datos
# individuales y, luego, combinarlos en un marco de datos usando 
# la función `data.frame()`.
# Esto funciona de la siguiente manera. Primero, crea un vector de nombres:

names <- c("Jonathan", "Manuel", "Gabriel", "matias")
secondName <- c("Maciel", "Palomeque", "Perez", "Cerquetti")

# Luego, crear un vector de edades agregando cuatro edades separadas por comas. 

age <- c(30,35,28,20)
city <- c("Córdoba", "Villa Carlos Paz", "Villa Dolores", "Rio Cuarto ")

#Con estos dos vectores, se puede crear un nuevo marco de datos llamado `people`:
 
people <- data.frame(names, secondName, age, city) 
View(people)


# -----------------------------------------------------------
## Paso 3: Inspeccionar el marco de datos

# Una función común que se puede usar para previsualizar los datos es la función
# `head()`, que muestra las columnas y las primeras filas de datos.
head(people)

# Ademá de `head()`, existen otras funciones para resumir o 
# previsualizar los datos. Por ejemplo, las funciones `str()` y `glimpse()` 
# ofrecen resúmenes de cada columna en tus datos organizados horizontalmente. 
str(people)

glimpse(people)

# También se puede usar `colnames()` para obtener una lista de los nombres de las 
# columnas en el conjunto de datos. 
colnames(people)

# una vez ya creado el marco, se puede trabajar con él usando todas las 
# herramientas en `R`. Por ejemplo, usar mutate()` si quisiera crear 
# una nueva variable que capte la edad de cada persona en 20 años. 

mutate(people, age_in_20= age + 20)
 

# -----------------------------------------------------------
## Paso 4: Inténtalo 


# Primero, crear un vector de cinco frutas diferentes. 

frutas <- c("Frutilla", "Banana", "Naranja", "Manzana", "Uvas")

# Ahora, crear un nuevo vector con un número que represente una 
# clasificación personal de cada fruta. Dalndole un 1 a la fruta que más me gusta y
# un 5 a la fruta que menos me  gusta. 
# Las calificaciones deben tener el mismo orden que las frutas que están arriba. 
# Entonces, si mi fruta favorita es la última en la lista de arriba, la calificación `1` 
# debe estar en la última posición en la lista que aparece debajo. Una vez que
# ingreses tus clasificaciones, ejecuta el bloque de código.

clasificacion <- c(2, 4, 3,5, 1)

# Por último, combinar los dos vectores en un marco de datos. Llamado 
# `fruit_ranks`. 
fruit_ranks <- data.frame(frutas, clasificacion)
View(fruit_ranks)
