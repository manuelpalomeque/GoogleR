# cargar un conjunto de datos que ya viene preinstalado:
data("ToothGrowth")

# ver los datos en una nueva pestaña:
View(ToothGrowth)

# Filtrar los datos:
install.packages('dplyr')
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose==0.5 )
View(filtered_tg)

# Ordenar en forma ascendente: 
arrange(filtered_tg, len) 


# filtrar y ordenar mediante una funcion anidada:
View(arrange(filter(ToothGrowth, dose==0.5),len))

# usar una canalizacion para asignar el resultado de una funcion anidada a una variable:
filtrado_ordenado <- ToothGrowth %>%
  filter(dose==0.5) %>%
  arrange(len)

View(filtrado_ordenado)

filtrado_ordenado <- ToothGrowth %>%
  filter(dose==0.5) %>%
  group_by(supp) %>% 
  summarise(mean_len = mean(len,na.rm = T),.gropu="drop")

select()
