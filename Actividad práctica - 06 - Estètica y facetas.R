## Paso 0: Instalar tidyverse --------------------------------------------------
# para poder usar la funcion read_csv(), es necesario intalar este paquete 
# previamente
install.packages("tidyverse")

#  cargarlos:
library(tidyverse)


## Paso 1: Importar los datos -------------------------------------------------
# Cargar el archivo  "hotel_bookings.csv"
hotel_bookings <- read_csv("hotel_bookings.csv",  locale = readr::locale(encoding = "latin1"))


## Paso 2: Refrescar la memoria------------------------------------------------
# Obtener una vista previa de los datos, junto con los nombres de las columnas:
head(hotel_bookings)

colnames(hotel_bookings)

## Paso 3: Instalar y cargar el paquete 'ggplot2' ------------------------------
# cargar el paquete ggplot2, para poder usar la funcion ggplot()
library('ggplot2')


## Paso 4: Hacer un grafico de barras ------------------------------------------
# Usare `geom_bar` para hacer un grafico de barras, con la columna 'distribution_channel'
# en el eje x y 'count' en el eje y:
ggplot(data = hotel_bookings)+
  geom_bar(mapping = aes(x = distribution_channel))

# Segun el grafico resultante,  el tipo de distribucion que tiene el numero mas 
# alto  de reservas es el de Agencias de viajes/Operadores de viajes (TA/TO)

## Paso 5: Adentrarse mas en los graficos de barras-----------------------------
#  Para saber si el numero de reservas para cada tipo de distribucion es 
# diferente dependiendo de si se realiza un deposito o de a que mercado representan
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

# este nuevo grafico incluye datos de la columna 'deposit_type'

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=market_segment))

# Este ultimo grafico de barras es similar al grafico anterior, salvo que los 
# datos de 'market_segment' se registran en las secciones con codigo de color de 
# cada barra. 


## Paso 6: Facetas a granel ----------------------------------------------------
# Ahora tengo que crear graficos separados para cada tipo de deposito y segmento
# de mercado para ayudarlo a comprender las diferencias con mayor claridad
# Para lo cual usare la funcion `facet_`, que puede hacerlo con mucha rapidez
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# Este bloque de codigo crea tres graficos de barra correspondientes a los tipos
# de deposito 'no_deposit', non_refund' y 'refundable'. 
# Es dificil leer las etiquetas del eje x , por lo que agregue un codigo al 
# final que rota el texto 45 grados para hacerlo mas facil de leer. 
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# El siguiente codigo crea un grafico de barras similar al bloque anterior, pero
# ahora las etiquetas del eje x con los diferentes canales de distribucion 
# quedan mas claras.

# Uso la sintaxis anterior para crear un grafico diferente para cada segmento 
# de mercado:
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# La funcion `facet_grid` hace algo similar. La principal diferencia es que 
# `facet_grid` incluye graficos aunque esten vacios
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# Ahora coloco todo esto en un grafico para explorar las diferencias por tipo de 
# deposito y segmento de mercado
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))