#! /bin/bash

#########################################################################
#
# Script caseConverter.sh: Permite convertir el texto seleccionado a
# minúsculas o mayúsculas.
#
# La resolución utiliza un comando bash que permite convertir las variables
# a minúsculas o mayúsculas.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################

#Le damos la opción de selección al usuario de manera de convertir el texto a minúsculas o mayúsculas

#Guardamos el texto original en la variable: ORIG
TEXT=$(cat ./texto/$1)

# Invertimos minúsculas o mayúsculas y viceversa el contenido de la variable ORIG, el cual guardamos en CONV.
CONV="${TEXT~~}"

# Imprimimos el texto actual:
echo "Texto Original ->"
echo -e "\n$TEXT"
echo -e "\n    ------------------------------------------------------------------------------------------    \n"

#Imprimimos el texto convertido:
echo "Texto convertido: Se invierten las minúsculas a mayúsculas y viceversa ->"
echo -e "\n$CONV"
exit 1


