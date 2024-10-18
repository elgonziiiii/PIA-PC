import string
import random

def generar_contrasena(longitud):
    try:
        if longitud <= 0:
            raise ValueError("La longitud debe ser un número positivo.")
        
        caracteres = string.ascii_letters + string.digits + string.punctuation
        return ''.join(random.choice(caracteres) for _ in range(longitud))
    
    except Exception as e:
        return f"Ocurrió un error: {e}"
