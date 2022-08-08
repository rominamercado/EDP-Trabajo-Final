#! /bin/bash


#########################################################################
#
# Script findNames.sh: Indentifica detro del archivo txt seleccionado
# los nombres propios. Se considera nombre propio en el archivo a cualquier
# palabra que comience con una letra mayúscula independientemente de no
# sea realmente un nombre propio: 
#  Formato: Nnnnnnnnn - ejemplos: Mateo, Estonoesunnombre, Ana
#
# Consideraremos todas las palabras que posean una longitud mayor a 2, 
# para evitar imprimir letras y artículos. Consideramos las de longitud 3
# porque varios nombres tienen esa longitud: BEN, ANA, EMA, etc.
#
# La resolución utiliza comandos tr, grep, awk, sort y uniq para filtrar
# las palabras que comienzan con una mayúscula. El resultado se guarda
# en el archivo nombres.txt, el cual se imprime para mostrar el resultado.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################


# 1. Imprimimos el contenido del archivo txt con CAT
# 2. tr -d '.,;?¡!¿' : eliminamos caracteres especiales
# 3. tr ' ' '\n': reemplazamos los espacios por un salto de línea (para obtener una palabra por línea)
# 4. grep '^[A-Z]': Filtramos las palabras que comienzan con mayúsculas
# 5. awk 'length > 2': Filtramos las palabras cuya longitud es mayor a 2
# 6. sort: Ordenamos las palabras de menor a mayor
# 7. uniq: Eliminamos las palabras que se repiten
cat ./texto/$1 | tr -d '.,;?¡!¿' | tr ' ' '\n' | grep '^[A-Z]' | awk 'length > 2' | sort | uniq > nombres.txt

echo -e "\nA continuación se muestra el listado de nombres propios encontrados en $1: \n"
cat nombres.txt
exit 1

