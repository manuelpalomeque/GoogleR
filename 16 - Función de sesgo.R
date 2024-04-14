# Función de sesgo

install.packages("SimDesign")

library(SimDesign)

# EJEMPLO CON DATOS DE CLIMA:
#Usaremos la funcion "Bias" para comparar las temperaturas pronosticadas
# con las temperaturas reales:

# tomaremos una pequeña muestra de la temperatura real:
actual_temperatura <- c(68.3, 70, 72.4, 71, 67, 70)
temperatura_predecida <- c(67.9, 69, 71.5, 70, 67, 69)

# La función bias en R cuantifica el sesgo comparando el resultado real con el 
# previsto. Aplicamos la funcion bias:
sesgo <- bias(actual_temperatura, temperatura_predecida)

# Se busca que el resultado sea lo mas cercano a 0. Un resultado cercano a cero 
#indica un modelo no sesgado. Un resultado alto sugiere un posible sesgo en 
#los datos. El sesgo negativo indica que el resultado previsto es mayor que el 
# real, lo que puede sugerir un exceso de existencias.

# EJEMPLO CON VENTAS DE JUGUETERIA:
ventas_actuales <- c(150, 203, 137, 247, 116, 287)
ventas_prediccion <- c(200, 300, 150, 250, 150, 300)

# calculamos el sesgo:
sesgo2 <- bias(ventas_actuales, ventas_prediccion)
