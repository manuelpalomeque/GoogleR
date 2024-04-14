## Paso 1: Usar `paquetes R`

# instalar el paquete tidyverse:
install.packages("tidyverse")

# Cargar la libreria:
library(tidyverse)


# -----------------------------------
# Paso 2: Ver datos

# FUNCIONES PARA OBTENER UNA VISTA PREVIA DE LOS DATOS:

# obtener una vista previa de los datos es la función `head()`, que 
# muestra las columnas y las primeras filas de datos

head(diamonds)

#  funciones `str()` y `glimpse()` devolverán resúmenes de cada columna de 
# sus datos organizados horizontalmente. 

str(diamonds)
glimpse(diamonds)

# la función `colnames()`. Devuelve una lista de nombres de columnas de su 
# conjunto de datos.

colnames(diamonds)


# -----------------------------------
## Paso 3: Limpieza de datos

#cambiar el nombre de las columnas o variables de sus datos. Hay una función 
# para eso: `rename()

rename(diamonds, carat_new = carat)

# cambiar el nombre de más de una variable en el mismo código
rename(diamonds, carat_new = carat, cut_new = cut)

#  summarize() para generar un amplio rango de estadísticas 
# resumidas para los datos. Por ejemplo, saber cuál es la media de 
# "quilates" en este conjunto de datos:

summarise(diamonds, mean_carat = mean(carat))

# -----------------------------------
## Paso 4: Visualizar datos 

#  Uno de los paquetes de visualización más utilizados es el paquete 
# `ggplot2`.

ggplot(data = diamonds, aes(x = carat, y = price)) + geom_area(color = "Violet", aes(color =carat))
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point(color = "Green", aes(color =price))

#Diferentes tipos de graficos:
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_col()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_bin_2d()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_bin2d()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_boxplot()

# separar algunos de los componentes con facet_wrap():

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point() + facet_wrap(~cut)


