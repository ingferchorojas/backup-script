#!/bin/bash

# Cargar variables de configuración desde el archivo config.sh
source env.sh

# Directorio que contiene los subdirectorios a comprimir
DIR_PATH="/home/fernando/Imágenes"

# Recorre todos los subdirectorios en el directorio principal
for subdirectory in "$DIR_PATH"/* ; do
  # Verifica que el subdirectorio es un directorio válido
  if [ -d "$subdirectory" ]; then
    # Obtiene el nombre del subdirectorio sin la ruta completa
    dirname=$(basename "$subdirectory")

    # Nombre del archivo de salida para el subdirectorio actual
    OUTPUT_FILENAME="$dirname.tar.gz"

    # Ruta completa del archivo de salida
    OUTPUT_PATH="$OUTPUT_DIR/$OUTPUT_FILENAME"

    # Comprime el subdirectorio actual en un archivo .tar.gz
    tar -czf "$OUTPUT_PATH" -C "$DIR_PATH" "$dirname"

    # Copia el archivo comprimido al servidor remoto utilizando scp
    scp "$OUTPUT_PATH" "$USER@$REMOTE_HOST:$REMOTE_PATH"

    # Elimina el archivo de salida después de copiarlo
    rm "$OUTPUT_PATH"
  fi
done
