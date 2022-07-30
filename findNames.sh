#! /bin/bash

#Imprimimos el contenido del archivo txt con CAT, eliminamos las comas, los puntos e indicamos un salto de lìnea con cada espacio
#El texto ahora contiene en cada lìnea una palabra, nos quedamos con las palabras que comienzan con mayùsculas mediante el comando grep
#Luego para evitar imprimir letras y los pronombres filtramos las palabras que posean una longitud mayor a 2 con awk.
#Ordenamos las palabras con sort y filtramos los duplicados con uniq
cat ./texto.txt | tr ',' ' ' | tr '.' ' ' | tr ' ' '\n' | grep '^[A-Z]' | awk 'length > 2' | sort | uniq > nombres.txt

echo "A continuaciòn se muestra el listado de nombres"
echo "Nombres"

cat nombres.txt


exit 1

