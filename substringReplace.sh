#!/bin/bash

#########################################################################
#
# Script substringReplace.sh: Permite reemplazar subcadenas dentro de 
# un archivo txt. Considera diferencias entre minúsculas y mayúsculas, 
# pero ignore acentos. 
#
# Los usuarios deberán ingresar dos cadenas:
#   1. Cadena1: La cadena que deberá ser reemplazada
#   2. Cadena2: La cadena que la reemplazará
#
# La Cadena1 debe reemplazarse por la cadena2 en todas las apariciones
# que se registren dentro del archivo.
# 
# La resolución utiliza los comando iconv -f para eliminar los acentos
# y caracteres especiales del texto, luego se realiza el reemplazo con
# el comando de bash sed. Los resultados se guardan en replaced.txt 
# pemaneciendo el texto original intacto.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################

# Solicitamos que ingresen la cadena que desean reemplazar y la que será reemplazada. Se guardarán en VAR y REE respectivamente.
echo -e "Se muestra el contenido original del archivo $1 -> \n"
cat ./texto/$1
echo -e " ---------------------------------------------------------\n"
read -p "Ingrese la cadena a reemplazar en $1: " VAR
read -p "Ingrese la cadena que la reemplazará a ($VAR) en $1: " REE

#Eliminamos los acentos y caracteres especiales con iconv -f UTF-8 -t ASCII//TRANSLIT
cat ./texto/$1 | iconv -f UTF-8 -t ASCII//TRANSLIT > replaced.txt
VAR=$(echo -n "$VAR" | iconv -f UTF-8 -t ASCII//TRANSLIT) 

# Reemplazamos cada aparición de $VAR en $REE, la opción sed -i te permite sobreescribir el archivo. La opción g, permite reemplazar todas las apariciones de $VAR en el texto original replaced.txt
sed -i 's/'"$VAR"'/'"$REE"'/g' replaced.txt 

echo -e "\n -------------------------------------------------------\n"
echo -e "\nArchivo reemplazado ($VAR por $REE) -> \n"
cat ./replaced.txt
i
exit 1

