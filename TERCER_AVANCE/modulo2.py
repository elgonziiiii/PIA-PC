
from shodan import Shodan

# funcion para obtener informacion de una IP

def obtenerInfo(api_key, ip):

    # Conectarse a la API de Shodan usando nuestra API Key
    api = Shodan(api_key)
    
#Manejo de errores

    try:
	#Diccionario donde se aguardara las claves como (org, os,ports,country los cuales son claves que se pueden ver en la documentacion de shodan)
        info_ip = api.host(ip)
        
        # Imprimira la informacion sobre la IP 
        result = (
            f'Informacion de la IP {ip}:')
            f'Organizacion: {info_ip.get("org", "No disponible")}\n'
            f'sistema operativo: {info_ip.get("os", "No disponible")}\n'
            f'puertos abiertos: {info_ip.get("ports", "No disponible")}\n'
            f'ubicacion: {info_ip.get("country_name", "No disponible")}, {info_ip.get("city", "No disponible")}\n'
	)
	    return result
    
    except Exception as e:
        return f'Ocurrrio un error al querer obtener informacion: {e}'
