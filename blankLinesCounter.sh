#! /bin/bash

#########################################################################
#
# Script blankLinesCounter.sh: Permite contar el número de líneas
# en blanco que posee el archivo.
#  
# La resolución utiliza el comando grep de bash para obtener el resultado 
# e imprime el resultado.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################


# El comando grep opción -c permite contar las líneas que se encuentran vacias:
echo -e "\nEl archivo de texto contiene $(grep -c '^$' ./texto/$1) líneas en blanco \n"
exit 1

