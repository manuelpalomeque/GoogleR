# PAQUETES QUE AYUDAN CON LA LIMPIEZA DE DATOS

# Instalar los paquetes
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")

# Cargar los  paquetes:

# La librería here facilita la gestión de rutas de archivos en proyectos de R, 
# ayudando a escribir rutas de archivos de forma más flexible y portátil.
library(here)

#  La librería skimr proporciona funciones para obtener resúmenes estadísticos 
# rápidos y descriptivos de conjuntos de datos en R.
library(skimr)

# La librería janitor es útil para realizar operaciones de limpieza de datos en R
library(janitor)

# La librería dplyr es una de las librerías más utilizadas en R para manipulación 
# y transformación de datos, permitiendo realizar operaciones como filtrado, 
# selección, agregación y mutación de datos de forma eficiente y con una sintaxis clara.
library(dplyr)



# trabajar con paquetes de datos de Palmer Penguins como ejemplo:
install.packages("palmerpenguins")
library("palmerpenguins")

# Funciones utiles para trabajar con los datos:

# para ver un resumen completo del conjunto de datos:
skim_without_charts(penguins)

# para tener una idea rapida del conjunto de datos, muestra columnas y registros:
glimpse(penguins)

# ver los nombres de las columnas y las primeras filas:
head(penguins)

# Para ver ciertas columnas, especificar que columnas queremos ver:
# este es un ejemplo apra ver solo la columna species:
penguins %>% 
  select(species)
# este es un ejemplo para ver todas las columnas, exepto species:
penguins %>% 
  select(-species)

# Cambiar el nombre de las columnas:
penguins %>% 
  rename( islas_nuevo = island, especies = species)

# cambiar los nombres de las columnas para que sean mas coherentes. Por ejemplo
# poner todos los nombres de las columnas en mayusculas:
rename_with(penguins, toupper)
rename_with(penguins, tolower)

# Verifica que los nombres de las columnas sean exclusivos y coherentes;
clean_names(penguins)
