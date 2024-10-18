
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

        print(f'Informacion de la IP {ip}:')
        print(f'Organizacion: {info_ip.get("org", "No disponible")}')
        print(f'sistema operativo: {info_ip.get("os", "No disponible")}')
        print(f'puertos abiertos: {info_ip.get("ports", "No disponible")}')
        print(f'ubicacion: {info_ip.get("country_name", "No disponible")}, {info_ip.get("city", "No disponible")}')

    
    except Exception as e:
        print(f'Ocurrrio un error al querer obtener informacion: {e}')



if __name__ == '__main__':

    # Datos que ingresara el usuario

    api_key = input("Introduce tu API Key de Shodan: ")
    ip = input("Introduce la IP que deseas consultar: ")

    obtenerInfo(api_key, ip)
    

