# cargar el conjunto de datos que ya viene preinstalado, llamado
# diamons

library(tidyverse)

data("diamonds")

View(diamonds)

# crear un tibble, a partir de datos ya esxistenes:

as_tibble(diamonds)
