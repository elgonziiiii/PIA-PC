import requests

API_KEY = '5898a9654424864f1ffb3635fa985232386867b66acf4a71c5376c3eb617ae59d605a8de292562e7'

def analizar_ip_abuse(ip_address):
    
    url = f'https://api.abuseipdb.com/api/v2/check'  # URL de la API

    params = {
        'ipAddress': ip_address,     # Parámetros de la solicitud
        'maxAgeInDays': 90       
    }

    headers = {
        'Accept': 'application/json',
        'Key': API_KEY
    }


    response = requests.get(url, headers=headers, params=params) # Se hace la solicitud

    if response.status_code == 200:  # Verifica si hay respuesta
    
        data = response.json()  # Procesa la respuesta
        result = (
           "Información sobre la IP:\n"
           f"Dirección IP: {data['data']['ipAddress']}\n"
           f"País: {data['data']['countryCode']}\n"
           f"Reportes: {data['data']['totalReports']}\n"
           f"Última actividad maliciosa: {data['data']['lastReportedAt']}\n"
           f"Score de abuso: {data['data']['abuseConfidenceScore']}\n"
        )
        return result
    else:
       return f"Error en la solicitud: {response.status_code}\n{response.text}"
