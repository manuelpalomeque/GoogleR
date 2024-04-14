#El cuarteto de Anscombe demuestra que los resúmenes estadísticos pueden ser 
# engañosos y que las visualizaciones son esenciales para comprender 
# completamente los datos

# Instalar los datos del cuarteto de Anscombee:
install.packages("Tmisc")

# Cargar los datos:
library(Tmisc)
data("quartet")
View(quartet)


#Datos estadisticos posibles: media, correlacion y desvio estandar
# cargar el paquete dplyr:
library(dplyr)

#  Calculo de Media(mean), la desviacion estandar (sd) y correlacion (cor):
quartet %>%
  group_by(set) %>%
    summarize(mean(x), sd(x),mean(y), sd(y), cor(x,y))

# Las visualizaciones de datos son cruciales para descubrir patrones y tendencias 
# ocultas en los datos
#cargar paquete ggplot2, para poder hacer graficos_:
library(ggplot2)

ggplot(quartet,aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)


#  El paquete datasauRus proporciona una forma única de visualizar datos de 
# Anscombe en diferentes formas, como dinosaurios y estrellas.
# Instalar el paquete datasauRus crea diagramas con los datros anscombee de diferente forma:
install.packages('datasauRus')
library(datasauRus)

ggplot(datasaurus_dozen,aes(x=x,y=y, colour=dataset))+ geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset,ncol=3)
 
# Explorar los datos de múltiples maneras ayuda a revelar su historia y a 
# identificar posibles sesgos