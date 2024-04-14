library(tidyverse)


installed.packages("palmerpenguins")
library(palmerpenguins)

# Funcion Arrange:
# elegir mediante que variable queremos ordenar los datos:
penguins %>% arrange(bill_length_mm)
# por defecto ordena d emanera ascendente, pero si queremos de manera
# descendente, hay que agregar un signo menos antes. Por ejemplo:
penguins %>% arrange(-bill_length_mm)

# IMPORTANTE, para guardar los cambios realizados, hay que guardarlos en un 
# data frma:
penguins2 <- penguins %>% arrange(-bill_length_mm)
View(penguins2)

# funcion Group By
# en general va acompañada de otra funcion
# mean  nos da el promedio:
penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill_length_mm = mean(bill_length_mm))

# Para conocer el maximo:
penguins %>% group_by(island) %>% drop_na() %>% summarise(max_bill_length_mm = max(bill_length_mm))

penguins %>% group_by(species, island) %>% drop_na() %>% summarise(
  valor_maximo_bill_length_mm = max(bill_length_mm),valor_medio_bill_length_mm = mean(bill_length_mm))

# Funcion FILTER
# Para filtrar resultados
penguins %>%  filter(species == "Adelie")
