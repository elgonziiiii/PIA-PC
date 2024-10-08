#!/bin/bash

# Nombre del archivo de reporte
REPORTE="reporte_rendimiento_red_$(date +%Y-%m-%d).log"

# Función para analizar el rendimiento de la red
analizar_rendimiento_red() {
    echo "Inicio del análisis de rendimiento de la red..." > "$REPORTE"

    # Medir latencia
    echo "Medir latencia a Google..."
    LATENCIA=$(ping -c 4 google.com | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
    echo "Latencia promedio: $LATENCIA ms"
    echo "Latencia promedio: $LATENCIA ms" >> "$REPORTE"

    # Medir velocidad de descarga
    echo "Midiendo velocidad de descarga..."
    VELOCIDAD_DESCARGA=$(curl -s -w "%{speed_download}" -o /dev/null http://ipv4.download.thinkbroadband.com/100MB.zip)
    VELOCIDAD_DESCARGA_MB=$(echo "$VELOCIDAD_DESCARGA / 1024 / 1024" | bc)
    echo "Velocidad de descarga: $VELOCIDAD_DESCARGA_MB MB/s"
    echo "Velocidad de descarga: $VELOCIDAD_DESCARGA_MB MB/s" >> "$REPORTE"

    # Medir velocidad de carga
    echo "Midiendo velocidad de carga..."
    dd if=/dev/zero of=testfile bs=1M count=10 2>/dev/null
    VELOCIDAD_CARGA=$(curl -s -w "%{speed_upload}" -o /dev/null --upload-file testfile http://ipv4.upload.thinkbroadband.com/)
    VELOCIDAD_CARGA_MB=$(echo "$VELOCIDAD_CARGA / 1024 / 1024" | bc)
    echo "Velocidad de carga: $VELOCIDAD_CARGA_MB MB/s"
    echo "Velocidad de carga: $VELOCIDAD_CARGA_MB MB/s" >> "$REPORTE"
    rm testfile  # Eliminar el archivo de prueba

    echo "Análisis de rendimiento de la red completado." >> "$REPORTE"
    echo "Resultados guardados en $REPORTE"
}

# Ejecutar la función

