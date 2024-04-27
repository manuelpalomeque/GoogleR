# En esta actividad agregare anotaciones a una visualizacion de datos con ggplot2. 
# Tambien guardare imagenes de visualizaciones de ggplot2 para poder agregarlas 
# directamente en presentaciones.

## Escenario -------------------------------------------------------------------
# Como analista de datos en una empresa de reservas hoteleras, has estado creando
# visualizaciones en `R` con el paquete `ggplot2` para compartir conclusiones 
# sobre los datos con los interesados. Despues de crear una serie de visualizaciones 
# usando estetica y filtros de `ggplot()` y `ggplot2`, tu interesado te pide que
# agregues anotaciones a tus visualizaciones para ayudar a explicar tus resultados 
# en una presentacion. Afortunadamente, `ggplot2` tiene funciones de anotacion 
# integradas.  

## Paso 1: Importar los datos --------------------------------------------------
install.packages('tidyverse')

library('tidyverse')

reservas_hotel <- read_csv("hotel_bookings.csv", locale = readr::locale(encoding = "latin1"))

## Paso 2: Refrescar la memoria ------------------------------------------------
# obtener una muestra de los datos y tener una vista previa los nombres 
# de todas las columnas:

head(reservas_hotel)

colnames(reservas_hotel)

## Paso 3: Instalar y cargar los paquetes 'ggplot2'-----------------------------
library('ggplot2')


## Paso 4: Realizar anotaciones en tu grafico ----------------------------------

# Tu interesado te menciona que les gustaría que compartieras la visualización 
# desglosando el tipo de pago por ciudad, ya que esto ayudará a determinar cómo 
# la empresa dirigirá las promociones en el futuro. Te piden que crees una 
# versión limpia y etiquetada, y que la guardes como un archivo .png para que 
# ellos puedan incluirla en una presentación

# Graficos de barras de city_hotel y resort_hotel. En el eje x esta market_segment
# y en el eje Y esta count:
ggplot(data = reservas_hotel) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

# En esta visualizacion, no queda claro de donde provienen los datos, cual es la
# conclusion clave o ni siquiera que muestran los datos. Para explicar todo eso,
# puedes aprovechar las anotaciones en `ggplot2`

# Agregare un titulo (Segmentos de mercado) y diferenciare los graficos por color
# para darle una mayor claridad a la visualizacion de los datos a los interesados:
ggplot(data = reservas_hotel) +
  geom_bar(mapping = aes(x = market_segment, fill= hotel)) +
  facet_wrap(~hotel) +
  labs(title="Segmentos de Mercados")

# Quierro agregar la informacion de sobre cual periodo son los datos, para lo cual
# averiguare de cuando son los datos y los guardaré en variables:

# Año mas antiguo:
fecha_minima <- min(reservas_hotel$arrival_date_year)
# Año mas actual:
fecha_maxima <- max(reservas_hotel$arrival_date_year)

# Ahora, agrego un subtitulo usando `subtitle=` en la funcion `labs()`. 
# Luego, usare la funcion `paste0()` para usar mis variables recien creadas en 
# mis etiquetas. 
# Esto es muy util, ya que si los datos se actualizan y se agregan datos mas 
# recientes, no tendre que modificar el codigo, porque las variables son dinamicas:
ggplot(data = reservas_hotel) +
  geom_bar(mapping = aes(x = market_segment, fill= hotel)) +
  facet_wrap(~hotel) +
  labs(title="Comparacion de Segmentos de Mercados por tipo de hotel para reservas",
       subtitle =  paste0("Datos desde el ", fecha_minima, " al ", fecha_maxima))

# Voy a modificar el `subtitle` (subtitulo) para que se transforme en una `caption` 
# (leyenda), que aparecera en la esquina inferior derecha.
ggplot(data = reservas_hotel) +
  geom_bar(mapping = aes(x = market_segment, fill= hotel)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparacion de Segmentos de Mercados por tipo de hotel para reservas",
       caption=paste0("Datos desde el ", fecha_minima, " al ", fecha_maxima))

# Limpiare las etiquetas del eje x e y para asegurarme de que sean claras. Para 
# hacerlo, agregare la funcion `labs()` y usare `x=` e `y=`
ggplot(data = reservas_hotel) +
  geom_bar(mapping = aes(x = market_segment, fill= hotel)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparacion de Segmentos de Mercados por tipo de hotel para reservas",
       caption=paste0("Datos desde el ", fecha_minima, " al ", fecha_maxima),
       x="Segmentos de Mercados",
       y="Cantidad de Reservas")

## Paso 5: Guardar tu grafico---------------------------------------------------

# usare la funcion `ggsave()` para guardar el imagen como un 7x7 
ggsave('grafico1.png')

# Se puede especificar la altura y el ancho del .png en el comando `ggsave()`.
ggsave('grafico2.png',
       width= 7,
       height= 7)
