install.packages("ggplot2")
install.packages("palmerpenguins")

library(palmerpenguins)
library(ggplot2)
# El paquete ggplot2 permite usar código R para especificar el conjunto de 
# datos, la figura geométrica y la estética del diagrama.

data("penguins")
View(penguins)
# El conjunto de datos de pingüinos contiene mediciones de tamaño de tres 
# especies de pingüinos (Adelie, Chinstrap y Gentoo) que viven en el 
# archipiélago Palmer en la Antártida. Las columnas incluyen información como 
# masa corporal, longitud de las aletas y longitud del pico.


# Crear un diagrama en ggplot2--------------------------------------------------
# un grafico de correlacion con grafico de dispercion:
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Puedes escribir la misma sección de código que aparece arriba usando una sintaxis diferente con el argumento de mapeo dentro de la llamada de ggplot(): 
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()

