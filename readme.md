# Comprimir y respaldar subdirectorios en Linux

Este script de Bash comprime subdirectorios dentro de un directorio principal y los respalda en un servidor remoto utilizando el protocolo SSH.

## Configuración

Antes de usar el script, se deben configurar las variables en el archivo `env.sh`.

- `USER`: el nombre de usuario del servidor remoto.
- `REMOTE_HOST`: la dirección IP o el nombre de dominio del servidor remoto.
- `REMOTE_PATH`: la ruta del directorio remoto donde se guardarán los archivos comprimidos.
- `DIR_PATH`: la ruta del directorio local que contiene los subdirectorios a comprimir
- `OUTPUT_DIR`: la ruta del directorio local donde se guardarán los archivos comprimidos.

## Uso

1. Clona este repositorio con `git clone https://github.com/TU_USUARIO/TU_REPOSITORIO.git`.
2. Abre una terminal y navega a la carpeta donde se encuentra el repositorio.
3. Ejecuta el comando `chmod +x backup.sh` para hacer el script ejecutable.
4. Ejecuta el script con el comando `./backup.sh`.

## Notas

- El script comprime cada subdirectorio dentro del directorio especificado en `DIR_PATH`.
- El archivo comprimido para cada subdirectorio tiene el nombre del subdirectorio con la extensión `.tar.gz`.
- El script utiliza el comando `scp` para copiar los archivos comprimidos al servidor remoto.
- Después de copiar los archivos, el script los elimina del directorio local especificado en `OUTPUT_DIR`.
