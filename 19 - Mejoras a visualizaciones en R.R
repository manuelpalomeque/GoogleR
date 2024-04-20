# Cargar librerias:
library(palmerpenguins)
library(ggplot2)

# ver datos:
View(penguins)

#Visualizacion Basica
ggplot(data = penguins) +
  geom_point(mapping = aes(x= sex , y= body_mass_g))


ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g))

# cOMO CAMBIAR LA ESTETICA DE LOS ELEMENTOS VISUALES:  
# 1- agregar color:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g),color= "purple")

# 2- agregar colores, para diferenciar por especies:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color= species))

# 3- cambiar las formas de los puntos, para diferenciar por especies:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, shape= species))

# 4- cambiar las formas y colores de los puntos, para diferenciar por especies:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, shape= species, color=species))

# 5- cambiar las formas,  colores de los puntos y modificar el tamaño, para diferenciar por especies:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, shape= species, color=species, size= species))

# 6- estetica alpha (escala de grises)hace que los puntos se vean mas o menos transparentes:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, alpha=species))

# 7- estetica alpha (con color) hace que los puntos se vean mas o menos transparentes:
ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, alpha=species, color=species))
