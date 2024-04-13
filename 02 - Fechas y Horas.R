# Instalar paquetes tidverse y lubridate:
install.packages("tidyverse")

# cargo el paquete tidyverse:
library(tidyverse)

#cargo el paquete lubridate:
library(lubridate)

# Tipos de Fechas:
# 1 - una fecha:
today()  #  "2024-02-11"

# 2- Una hora de un dia:
hora_actual <- format(Sys.time(), "%H:%M:%S")
print(hora_actual)  # "12:22:59"

# 3- yba fecha  y hora:
now() # "2024-02-11 12:17:52 -03"


# Convertir en fecha a partir de una cadena:
# "Y" de year, "M" de month y "D" de day, puedo ordenarlos como desee que sea
# la salida. R siempre devuelve en el formato YYYY-MM-DD
ymd("2024-02-11")
dmy("11-02-2024")
mdy("January 20th, 2021")

# Crear componentes de fecha y hora a partir de una cadena:

ymd_hms("2024-02-11 01:41:03")
mdy_hm("01/20/2024 12:46")

# Cambiar entre objetos existentes de fecha-hora 
# la funci??n as_date() para convertir una fecha-hora en una fecha.
now()
as_date(now())

