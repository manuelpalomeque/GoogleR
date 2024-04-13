# LOGICOS:

# And (&): 
x <- 10
x >  3 & x > 12
x >  3 & x < 12
  
# Or (|):
y <- 7
y < 8 | y > 16

# Not (!):
z <- 2
!z


# Ejemplo de trabajo con Operadores Logicos:

install.packages("airqualityES")
library(airqualityES)
print(airquality)

#and ejemplo:
airquality$Solar.R > 150 & airquality$Wind>10

#or ejemplo:
airquality$Solar.R > 150 | airquality$Wind>10
