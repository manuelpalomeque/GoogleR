# Cargar librerias:
library(ggplot2)
library(palmerpenguins)

# Visualizacion Basica:
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm ,y= body_mass_g ))


# GRAFICOS DE DISPERSION/PUNTOS: -------------------------------------------
#demostrar tendencias d enuestros datos, con geom_smooth:
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x= flipper_length_mm ,y= body_mass_g ))

#demostrar tendencias d enuestros datos, con geom_smooth, segun especie:
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x= flipper_length_mm ,y= body_mass_g, 
                            linetype= species, color= species))

#combinar diagrama de dispercion con diagrama de linea suave:
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x= flipper_length_mm ,y= body_mass_g ), color="yellow")+
  geom_point(mapping = aes(x= flipper_length_mm ,y= body_mass_g, color=species ))

# geom_jitter, crea un diagrama de dispercion y agregua ruido
ggplot(data = penguins)+
  geom_jitter(mapping = aes(x= flipper_length_mm ,y= body_mass_g ))

#GRAFICOS DE BARRAS: -----------------------------------------------------
ggplot(data = diamonds)+ 
  geom_bar(mapping = aes(x= cut))

# agregar color:
ggplot(data = diamonds)+ 
  geom_bar(mapping = aes(x= cut, fill=cut))

# grafico de barras apiladas:
ggplot(data = diamonds)+ 
  geom_bar(mapping = aes(x= cut, fill=clarity))
