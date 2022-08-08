#!/bin/bash

#########################################################################
#
# Script palindromeDetection: Permite imprimir las palabras palíndromos de un
# archivo txt. El programa ignora mayúsculas/minúsculas y acentos. 
# 
# Un palíndromo es una palabra que es igual si se lee de izquierda a 
# derecha que de derecha a izquierda.
#    Ejemplos: Neuquén, radar, reconocer
#
# Los usuarios deberán ingresar valores:
#   1. Opción: 1 -Párrafo  / 2 -Oración
#   2. Número: para indicar el número de párrafo u oración a imprimir
#
# La resolución utiliza diferentes comandos de bash para obtener lo
# solicitado. El resultado se imprime en pantalla.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################

# El programa acumula las palabras palíndromos recorre el archivo, es por eso que necesitamos eliminar el archivo palíndromo.txt al incio. De esta manera, nos aseguramos que el archivo contenga el resultado de la corrida vigente.
# Para evitar el mesaje de error en la primera corrida en la que el archivo palíndromo.txt todavía no existe redireccionamos el error de inexistencia al fichero error.

rm palíndromo.txt 2>error.log

# iconv -f UTF-8 -t ASCII//TRANSLIT: permite eliminar acentos y caracteres especiales
cat ./texto/$1 | iconv -f UTF-8 -t ASCII//TRANSLIT > texsa.txt
# tr -d '.,;?¡!¿': Eliminamos caracteres especiales
# tr '[:upper:]' '[:lower:]': convertimos a minúsculas el texto
# tr ' ' '\n': se agrega un salto de línea en cada espacio (dejando una palabra por línea)
texto=$(cat texsa.txt | tr -d '.,;?¡!¿' | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | sed '/^$/d')

# Recorremos el archivo txt con la sentencia FOR
for i in $texto
do
        # Verificamos que la longitud de la palabra sea mayor a 1.
	if [[ ${#i} -eq 1 ]]
        then
                continue
        else
		#En cada recorrido del FOR guardamos en la variable PAL_INV la palabra invertida de cada línea
		PAL_INV=$(echo $i | rev)
		# Si la palabra es palíndromo, la imprimimos en pantalla
		if [ "$i" == "$PAL_INV" ]; then echo "$i" >> palíndromo.txt; fi
        fi
done

if [[ ! -s "./palíndromo.txt" ]]
then
	echo -e "\nNo hay palíndromos en $1"
else
	echo -e "\nEn $1 se encontraron los siguientes palíndromos: \n"
	cat palíndromo.txt
fi
exit 1

