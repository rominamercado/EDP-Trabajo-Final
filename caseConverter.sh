#! /bin/bash

#Le damos la opcion de seleccion al usuario de manera de convertir el texto a minusculas o mayusculas
PS3='Elija una opción (1 ó 2): '
echo "Desea convertir el texto a:"
select opcion in "Mayúsculas" "Minúsculas"
do
	#Independientemente de la opción seleccionada: eliminamos los acentos con iconv -f UTF-8 -t ASCII//TRANSLIT, luego convertimos el texto a minúsculas o mayúsculas de acuerdo a la opción seleccionada, lo guardamos en el archivo conver.txt y a continunación, lo imprimimos.
        [ $REPLY == 1 ] && cat ./texto.txt | iconv -f UTF-8 -t ASCII//TRANSLIT | tr [:lower:] [:upper:] > conver.txt && cat conver.txt && exit 1
        [ $REPLY == 2 ] && cat ./texto.txt | iconv -f UTF-8 -t ASCII//TRANSLIT | tr [:upper:] [:lower:] > conver.txt && cat conver.txt && exit 1
done


