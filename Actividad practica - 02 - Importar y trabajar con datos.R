## Paso 1: Cargar paquetes

install.packages("tidyverse")

library(tidyverse)

## Paso 2: Importar datos
# ubicar el archivo en la siguiente ruta: 'C:/Users/Admin/Documents
bookings_df <- read_csv("hotel_bookings.csv")

## Paso 3: Inspeccionar y limpiar datos
# previsualizacion de datos

# head(bookings_df): Esta función muestra las primeras filas (por defecto, las primeras 6 filas) 
# del dataframe llamado bookings_df. Es útil para obtener una vista previa 
# rápida de los datos en el dataframe.
head(bookings_df)

# str(bookings_df): Esta función proporciona una estructura resumida del dataframe bookings_df, 
# mostrando la estructura de las variables (columnas) en el dataframe y sus tipos de datos.
str(bookings_df)

# colnames(bookings_df): Esta función devuelve los nombres de las columnas del 
# dataframe bookings_df, es decir, muestra los nombres de todas las variables en el dataframe.
colnames(bookings_df)

# new_df <- select(bookings_df, adr, adults): Esta línea crea un nuevo dataframe 
# llamado new_df que contiene solo las columnas adr y adults del dataframe bookings_df.
# La función select() se utiliza para seleccionar columnas específicas de un dataframe.
new_df <- select(bookings_df, `adr`, adults)

# mutate(new_df, total = adr / adults): Esta línea crea una nueva columna llamada total en 
# el dataframe new_df, que calcula el resultado de dividir la columna adr 
# (precio por habitación por día) por la columna adults (número de adultos en la reserva). 
# La función mutate() se utiliza para agregar nuevas columnas o transformar columnas existentes
# en un dataframe.
mutate(new_df, total = `adr` / adults)
