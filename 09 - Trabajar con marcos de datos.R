install.packages("tidyverse")

library(ggplot2)

data("diamonds")

View(diamonds)

# Para solo ver las primeras 6 filas (vista previa):
head(diamonds)

# Ver la estructura del data frame
str(diamonds)
colnames(diamonds)

# Hacer cambios en el data frame:

# 1) cargar la biblioteca Tidyverse
library(tidyverse)

# 2) con la funcion mutate() se puede modificar el data frame, en este ejemplo 
# agregamos una columna nueva llamada "carat_2", cuyos registros seran igual a 
# los de la columna carat multiplicados por 100:
mutate(diamonds, carat_2=carat*100)
View(diamonds)
