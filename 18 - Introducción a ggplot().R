library(ggplot2)
library(palmerpenguins)


# Creación de gráficos en ggplot2: -------------------------------------
  
# Paso 1: Inicializar el gráfico
# utilizar la función ggplot() para especificar el conjunto de datos.

# Paso 2: Agregar una capa geométrica
# Utilizar funciones como geom_point() para representar los datos como puntos, 
# líneas o barras.

# Paso 3: Mapear estéticas a variables
# Utilizar la función aes() para asignar variables a propiedades visuales como el
# color, el tamaño y la forma.

# diagrama que muestra la relacion entre las tres especies de pinguinos:
ggplot(data = penguins) + 
  geom_point(mapping = aes(x= flipper_length_mm , y= body_mass_g))

# si no especificamos los detalles de las demas variables, el resultado sera un
# grafico vacio:
ggplot(data = penguins) 

# para obtener mas intormacion de la funcion geom_point():
?geom_point
