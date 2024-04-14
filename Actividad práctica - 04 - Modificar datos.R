## Paso 1: Cargar paquetes  ----------------------------------------------------

# instalar los paquetes:`tidyverse`, skimr` y `janitor` 

install.packages("tidyverse")

install.packages("skimr")
# el paquete skimr, que ofrece funciones para resumir y explorar datos de forma 
#rápida, incluyendo estadísticas descriptivas y gráficos.

install.packages("janitor")
# el paquete janitor, que proporciona herramientas para limpiar y organizar 
# datos en R, como cambiar nombres de columnas, manejar datos faltantes y otras 
# operaciones útiles de manipulación de datos.

#  cargarlos:
library(tidyverse)
library(skimr)
library(janitor)



## Paso 2: Importar datos  -----------------------------------------------------

# para importar los datos, usare la funcion`read_csv()` para importar datos de un 
# archivo .csv llamado "hotel_bookings.csv". Luego pocedi a guardarlo como un 
# marco de datos llamado `hotel_bookings`. 

hotel_bookings <- read_csv("hotel_bookings.csv",  locale = readr::locale(encoding = "latin1"))


## Paso 3: Conocer tus datos ---------------------------------------------------

# Usare funciones de resumen para conocer los datos
# La función `head()` para tener una vista previa de las columnas y varias de 
# las primeras filas de datos
head(hotel_bookings)

# hay un total de  32 columnas en el conjunto de datos


# tambien se puede usar las funciones `str()` y `glimpse()` 
# para obtener resumenes de cada columna organizados horizontalmente. 
# Para identificar el tipo de dato de cada columna, uso la funcion str()
str(hotel_bookings)

# La columna "arrival_date_month" es del tipo character


# Este conjunto de datos contiene información sobre reservas hoteleras. Cada 
# reserva es una fila en el conjunto de datos y cada columna contiene 
# información como: qué tipo de hotel se reserva, cuándo se realizó 
# la reserva y con cuánta antelación se realizó la reserva (la columna 
# 'lead_time').
 
# Para ver los diferentes nombres de columna y algunos valores de muestra con
# la funcion glimpse()
glimpse(hotel_bookings)

# También se puede usar `colnames()` para obtener los nombres de las columnas 
colnames(hotel_bookings)



# Paso 3: Manipular datos ------------------------------------------------------

# Para ordenar los datos de mayor tiempo de antelación a menor tiempo de 
# antelación, para enfocarse en las reservas que se realizaron 
# con mucha anticipación, usaré la función `arrange()`, ingresando el nombre de
# columna: 
arrange(hotel_bookings, lead_time)

# Eso se debe a que `arrange()` organiza automáticamente en orden ascendente y 
#  y hay que indicarle específicamente cuándo organizar en orden descendente:
arrange(hotel_bookings, desc(lead_time))

# el mayor tiempo de antelación para una reserva de hotel en este conjunto es de 
# 737

# Cuando solo se ejecuta `arrange()` sin guardar los datos en un nuevo marco de 
# datos, no se modifica el marco de datos existente. Esto se puede comprobar
# ejecutando de nuevo `head()` para ver si los mayores tiempos de antelación 
# están primero: 
 head(hotel_bookings)

# Si quisiera crear un nuevo marco de datos que tuviera guardados estos cambios,
# usaré el operador de asignación, <- , para almacenar los datos ordenados en un 
# marco de datos llamado 'hotel_bookings_v2':
hotel_bookings_v2 <-
   arrange(hotel_bookings, desc(lead_time))

# Ejecuté `head()`para verificar que se guarden los datos: 
head(hotel_bookings_v2)

# También averigué los tiempos máximos y mínimos de antelación sin ordenar todo 
# el conjunto de datos usando la función `arrange()`. 
# Usando las funciones max() y min():
max(hotel_bookings$lead_time)

min(hotel_bookings$lead_time)

# En este caso, es necesario especificar qué conjunto de datos y qué columna 
# usando el símbolo "$" entre los nombres. 

# Para saber el tiempo de antelación promedio de las reservas, para saber
# con cuánta anticipación se debe realizar las promociones de habitaciones de 
# hotel. Puedo usar la función `mean()` para responder esa pregunta dado que el 
# promedio de un conjunto de números es tambiÃ©n la media de ese conjunto de 
# números:
mean(hotel_bookings$lead_time)

# La función `arrange()` no modifica los valores del conjunto de datos, sino que 
# solo los reorganiza.
mean(hotel_bookings_v2$lead_time)

# el tiempo promedio de antelación es 104.0114

# Ahora es necesario saber cuál es el tiempo promedio de antelación de las 
# reservas solamente de los hoteles urbanos. Para enfocar la promoción que están
# realizando, dirigiendola a grandes ciudades. 
# El primer paso es crear un nuevo conjunto de datos que solo contenga datos 
# sobre hoteles urbanos. Usando la función `filter()` y nombrar a tu nuevo 
# marco de datos 'hotel_bookings_city':
hotel_bookings_city <- 
   filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
 
# Verificar el nuevo conjunto de datos:
head(hotel_bookings_city)

# Para saber cual es el tiempo de antelacion promedio para este conjunto de 
# hoteles:
mean(hotel_bookings_city$lead_time)

# Ahora, mi jefe quiere obtener informacion sobre los hoteles urbanos, 
# incluyendo tiempo maximo y minimo de antelacion de las reservas. 
# Tambien le interesa en que difieren a los hoteles tipo resort. 
# Para no ejecutar cada linea de codigo una y otra vez, por lo que use las 
# funciones `group_by()`y `summarize()`. Tambien se puede hacer el operador de
# canalizacion para que sea mas facil de seguir. Almacenare el nuevo conjunto 
#de datos en un marco de datos llamado 'hotel_summary':
hotel_summary <- 
   hotel_bookings %>%
   group_by(hotel) %>%
   summarise(average_lead_time=mean(lead_time),
             min_lead_time=min(lead_time),
             max_lead_time=max(lead_time))


# Compruebe el nuevo conjunto de datos usando head() nuevamente:
head(hotel_summary)
