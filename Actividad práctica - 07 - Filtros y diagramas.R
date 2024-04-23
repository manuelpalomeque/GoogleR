## Escenario

# Como analista de datos junior en una empresa de reservas hoteleras, se te 
# pide que crees datos limpios de reservas de hoteles, crees visualizaciones 
# con `ggplot2` para comprender mejor los datos y presentes diferentes facetas 
# de los datos mediante la visualización. Ahora, vas a utilizar el trabajo que 
# realizaste anteriormente para aplicar filtros a tus visualizaciones de datos 
# en `ggplot2`. 

## Paso 1: Importar los datos -------------------------------------------------
install.packages('tidyverse')

library('tidyverse')

hotel_bookings <- read_csv("hotel_bookings.csv",  locale = readr::locale(encoding = "latin1"))

## Paso 2: Refrescar la memoria ------------------------------------------------
#  obtener una muestra de los datos y, tener una vista previa los nombres de 
# todas las columnas:

head(hotel_bookings)
colnames(hotel_bookings)

## Paso 3: cargar el paquete 'ggplot2'------------------------------------------
library('ggplot2')

## Paso 4: Hacer muchos gráficos diferentes -----------------------------------

# cambio el nombre de la columna "ni\u0096os" por niños:
hotel_bookings_1 <- hotel_bookings %>%
  rename(niños = "ni\u0096os")

view(hotel_bookings_1)

# diagrama de dispersion para explorar la relacion entre el tiempo de antelacion 
# de las reservas y los huepedes que viajaban con niños:
ggplot(data = hotel_bookings_1) +
  geom_point(mapping = aes(x = lead_time, y = niños))

# este diagrama muestra que muchos de estos huespedes no tienen hijos. 

# Ahora, tu interesada quiere realizar una promocion para familias dirigida a 
# segmentos clave del mercado. Ella quiere saber quÃ© segmentos del mercado 
# generan el mayor numero de reservas y donde se realizan estas reservas 
# (hoteles de ciudad o hoteles tipo resort). 

# Primero, hay que crear un grafico de barras que muestre cada tipo de hotel y 
# segmento del mercado. Usas diferentes colores para representar cada segmento 
# del mercado: 
ggplot(data = hotel_bookings_1) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))
  
# DespuÃ©s de crear este grÃ¡fico de barras, te das cuenta de que es dificil 
# comparar el tamaÃ±o de los segmentos de mercado en la parte superior de las 
# barras. Lo que buscas es que tu interesada pueda comparar con claridad cada 
# segmento.   

# Decides usar la funcion facet_wrap() para crear un grafico diferente para cada
# segmento del mercado:
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

#Ahora tienes un grafico de barras separado para cada segmento de mercado. 
# Tu interesada tiene una idea mas clara del tamaño de cada segmento de mercado,
# asi como tambien los datos correspondientes a cada tipo de hotel.

## Paso 5: Filtrar -------------------------------------------------------------
# Para poder filtrar es necesario tener cargado e instalado el paquete `tidyverse`
# previamente

# tu interesada decide enviar la promocion a familias que realizan reservas de 
# hoteles urbanos en linea. El segmento en linea es el de crecimiento mas 
# acelerado, y las familias tienden a gastar mas en hoteles urbanos que otros
# tipos de huespedes. 
# Tu interesada te pide si puedes crear un grafico que muestre la relacion 
# entre el tiempo de antelacion de la reserva y los huespedes que viajan con 
# niños para las reservas en linea de los hoteles urbanos. Esto le dara una 
# mejor idea del mejor momento para realizar la promocion. 
# Lo analizas y te das cuenta de que tienes todas las herramientas que necesitas 
# para cumplir con su pedido. Lo divides en estos dos pasos: 

# 1) filtrar tus datos
# 2) graficar tus datos filtrados. 

# Usare la funcion `filter()` para crear un conjunto de datos que solo incluya 
#los datos que necesito:
onlineta_city_hotels <- filter(hotel_bookings_1, 
                               (hotel=="City Hotel" &
                                  hotel_bookings$market_segment=="Online TA"))

# El caracter '&' se usa para demostrar que quiero que dos condiciones 
# diferentes sean verdaderas. Ademas, el caracter '$' se usa para especificar 
# a que columna del marco de datos 'hotel_bookings_1' hago referencia (por ejemplo
# 'market_segment')

View(onlineta_city_hotels)

# existe otra manera de hacerlo. Se puede usar el operador de canalizacion (%>%) 
# para hacerlo en pasos: 
onlineta_city_hotels_v2 <- hotel_bookings_1 %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")

# el simbolo %>% se usa para indicar los pasos logicos de este codigo
View(onlineta_city_hotels_v2)

## Paso 6: Usar tu nuevo marco de datos ----------------------------------------

ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = niños))
