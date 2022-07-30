#!/bin/bash

# Limpiamos puntos y comas, convertimos el texto a minusculas, indicamos saltos de linea en cada palabra, filtramos las que posean una longitud mayor a 3, las ordenamos. Filtramos las que se repiten y ordenamos nuevamente el listado de manera descendente, por ultimo nos quedamos con las ultimas 10.
cat ./texto.txt | tr ',' ' ' | tr '.' ' ' | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -r | head -n 10 > listadof.txt

echo "A continuaciòn se muestra el listado ordenado de manera ascendete por frecuencia de las palabras en el $1"
echo " Frecuencia Palabra"

cat listadof.txt


exit 1

