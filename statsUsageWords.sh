#!/bin/bash

#########################################################################
#
# Script statsUsageWords.sh: calcula los indicadores estadísticos de uso 
# de palabras considerando las que poseen una longitud de al menos 
# 4(cuatro) letras, devolviendo como resultado un listado (Top Ten) 
# de palabras ordenadas desde la que tiene más apariciones a la 
# que tiene menos). 
#  
# La resolución utiliza los comdandos tr, awk, sort, uniq y head de bash
# para obtener el resultado y lo guarda en un archivo llamado
# resultado.txt
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################



# Por medio de PIPES (|):
#  1. tr -d '.,?¡!¿;': Eliminamos caracteres especiales. 
#  2. tr '[:upper:]' '[:lower:]': Convertimos el texto a minúsculas
#  3. tr ' ' '\n': Agregamos un salto de línea en cada espacio (' '), dejando de esta manera una palabra por línea
#  4. awk 'length > 3': Filtramos las palabras que posean una longitud mayor a 3
#  5. sort: Ordenamos las palabras
#  6. uniq -c: Filtramos las que se repiten dejando las palabras unicas, la opción -c nos muestra el numero de ocurrencias de la palabra en el archivo.
#  7. sort -r: Ordenamos nuevamente el listado de manera descendente
#  8. head -n 10: Nos quedamos con las primeras 10, por defecto head -n muestras las primeras 10.

cat ./texto/$1 | tr -d '.,?¡!¿;'| tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -r | head -n 10 > resultado.txt

echo "A continuación, se muestra el listado ordenado de manera descendete de acuerdo al número de ocurrencias de las palabras en el texto"
echo " Frecuencia Palabra"

cat resultado.txt


exit 1

