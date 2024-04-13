# Paso 1: Cargar paquetes ------------------------------------

install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
# Proporciona herramientas eficientes para la manipulación y visualización de datos en R

library(skimr)
# Util para explorar y comprender conjuntos de datos de manera rápida. Ofrece 
# funciones para resumir y visualizar rápidamente datos

library(janitor)
# Proporciona funciones para limpiar y preparar datos



# Paso 2: Importar datos ----------------------------------

# Cargar del archivo CSV "hotel_bookings.csv" en un dataframe llamado bookings_df
bookings_df <- read_csv("hotel_bookings.csv")

# Cargar del archivo CSV "hotel_bookings.csv" en un dataframe llamado bookings_df
# Usando la función read_csv() con la especificación de la codificación 'latin1'
bookings_df <- read_csv("hotel_bookings.csv", locale = readr::locale(encoding = "latin1"))


# Paso 3: Conocer tus datos --------------------------------

# Muestra las primeras filas del dataframe 'bookings_df', proporcionando una vista previa de los datos.
head(bookings_df)

# Proporciona una descripción estructural del dataframe 'bookings_df', mostrando la estructura de 
# las variables y sus tipos de datos.
str(bookings_df)

# Ofrece una visión más detallada del dataframe 'bookings_df', mostrando una vista compacta 
# de su estructura y los primeros valores de cada columna.
glimpse(bookings_df)

# Muestra los nombres de las columnas del dataframe 'bookings_df'.
colnames(bookings_df)

# Genera un resumen estadístico del dataframe 'bookings_df', excluyendo los 
# gráficos asociados. Proporciona información útil como conteos, estadísticas 
# descriptivas y más.
skim_without_charts(bookings_df)



# Paso 4: Limpiar los datos ----------------------------------

# Interesan principalmente las siguientes variables: 'hotel', 'is_canceled' y 
# 'lead_time'. 
# Crear un nuevo marco de datos solo con esas columnas y llámarlo 
# `trimmed_df` 

trimmed_df <- bookings_df %>% 
  select(hotel , is_canceled, lead_time)

View(trimmed_df)

# Renombrar columnas para que sean mas intuitivas:
# renombrar la variable 'hotel' como 'hotel_type' 

trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename( hotel_type = hotel)

# combinar el mes y el año de llegada en una columna usando la función unite():

example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

View(example_df)


## Paso 5: Otra manera de hacer las cosas ----------------------------

# Tambien se puede usar la función `mutate()` para hacer cambios en las columnas. 
# Para rear una nueva columna que sume todos los adultos, niños 
# y bebés en una reserva para averiguar la cantidad total de personas: 

example_df <- bookings_df %>%
  mutate(guests = adultos + `bebs`+ `nios`)

head(example_df)


# Calcular el número total de reservas canceladas y el tiempo promedio de 
# antelación de las reservas. 
# Hacer una columna llamada 'number_canceled' para representar el número total de 
# reservas canceladas. Luego, crear una columna llamada 'average_lead_time' para 
# representar el tiempo promedio de antelación de las reservas. 
# Usar la función `summarize()` 

example_df <- bookings_df %>% summarise(numero_cancelados = sum(is_canceled),
                                        promedio_lead_time = mean(lead_time))
  
head(example_df)
  