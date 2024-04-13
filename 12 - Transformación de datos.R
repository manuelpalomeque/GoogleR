library(tidyverse)

# Creación de datos para la practica

id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)


# Función Separate(): 
# Divide la columna 'name' en 'Nombre' y 'Apellido' usando el espacio como separador
empleados <- separate(employee, name, into = c("Nombre", "Apellido"), sep = " ")

# Muestra el dataframe 'empleados' en una ventana de visualización
View(empleados)

# Función Unite(): 
# Une las columnas 'Nombre' y 'Apellido' en una nueva columna 'Name', separados por un espacio
unite(empleados, "Name", Nombre, Apellido, sep = " ")


# Función Mutate(): 
# Crea nuevas variables en el dataframe 'penguins' basadas en transformaciones de columnas existentes
# Para crear nuevas variables
library(palmerpenguins)
View(penguins)

penguins %>%
  mutate(body_mass_Kg = body_mass_g/100, flipper_length_m = flipper_length_mm/1000)
