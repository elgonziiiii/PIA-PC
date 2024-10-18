import string
import random

def generar_contrasena(longitud):

    #manejo de errores en caso de que el usuario introduzca un valor igual o menor a cero
    try:
        if longitud <= 0:
            raise ValueError("La longitud debe ser un número positivo.")
        
        caracteres = string.ascii_letters + string.digits + string.punctuation
        return ''.join(random.choice(caracteres) for _ in range(longitud))
    
    except Exception as e:
        return f"Volver a seleccionar opcion 1 Ocurrió un error: {e}"
