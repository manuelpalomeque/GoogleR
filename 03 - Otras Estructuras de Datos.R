#------------------------------------------
# MARCOS DE DATOS:

# Ver un marco de datos precargado:
print(diamonds)

#Crear un marco de datos
data.frame(Nombres= c("Jonathan", "Manuel"), Apellidos = c("Palomeque", "Maciel"))

# otro ejemplo:
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))


#------------------------------------------
#  MANIPULACION DE ARCHIVOS

# Crear una carpeta nueva:
dir.create("Clases_de_R_Google")

#crear un archivo:
file.create("Prueba_archivo_nuevo.txt")
file.create("Prueba_archivo_nuevo.docx")
file.create("Prueba_archivo_nuevo.csv")

# Copiar un archivo:
file.copy("Prueba_archivo_nuevo.txt", "Home")
file.copy("Prueba_archivo_nuevo.txt", "Clases_de_R_Google")

# eliminar archivos:
unlink("Prueba_archivo_nuevo.txt")

#------------------------------------------
# MATRICES

# crear una matriz
matrix(c(3:8), nrow = 2)

matrix(c(3:8), ncol = 2)



