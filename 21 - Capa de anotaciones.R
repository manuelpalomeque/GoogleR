library('ggplot2')
library('palmerpenguins')

# Titulo:
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color=species))+
  labs(title="Pinguinos de palmer: Peso vs Altura")

# Subtitulos:
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color=species))+
  labs(title="Pinguinos de palmer: peso vs altura", 
       subtitle = "Muestra de 3 especies de pinguinos distintas")

# Leyendas:
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color=species))+
  labs(title="Pinguinos de palmer: peso vs altura", 
       subtitle = "Muestra de 3 especies de pinguinos distintas",
       caption = "Datos recolectados por el dr Perez")

# Etiquetas:
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color=species))+
  labs(title="Pinguinos de palmer: peso vs altura", 
       subtitle = "Muestra de 3 especies de pinguinos distintas",
       caption = "Datos recolectados por el dr Perez")+
  annotate("text", x= 220, y=3500, label= "Gentoos son mas largos", color="purple",
           fontface="bold", size=4.5, angle=25)

# guardar diagrama en una variable:
p <- ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color=species))+
  labs(title="Pinguinos de palmer: peso vs altura", 
       subtitle = "Muestra de 3 especies de pinguinos distintas",
       caption = "Datos recolectados por el dr Perez")

#a la variable puedo sumarle caracteristicas:
p + annotate("text", x= 220, y=3500, label= "los Gentoos son largos")


