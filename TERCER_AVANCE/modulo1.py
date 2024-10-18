
# Generador de Contraseñas 
#Genera una contraseña con la longitud deseada, que el usuario guste introducir 

import string
import random

def generar_contrasena(longitud):

    caracteres = string.ascii_letters + string.digits + string.punctuation
    return ''.join(random.choice(caracteres) for _ in range(longitud))
