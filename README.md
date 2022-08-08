# EDP-Trabajo-Final
##Trabajo Final de Entorno de Programación - TUIA - FCEIA 2022

El trabajo consiste en desarrollar una aplicación ejecutable en un contenedor que permita procesar textos.
La aplicación presenta un menú de opciones de filtrados (aplicaciones creadas a partir de bash scripts) de un texto dado.

-------------------------------------------------------------------------------------------------------------------
## ¿Cómo ejecutar el contenedor?

Dirijase a una terminal de bash y ejecute los siguientes comandos:

1. $ git clone https://github.com/rominamercado/EDP-Trabajo-Final.git
2. $ cd EDP-Trabajo-Final
3. $ docker build --tag menuopc .
4. $ docker run -it -v $(pwd)/texto:/texto/ menuopc

Los archivos de texto que deseen procesarse con la aplicación deben ubicarse dentro en la carpeta texto.

-------------------------------------------------------------------------------------------------------------------
## Selección del archivo de texto a analizar

Una vez ejecutado el contenedor, visualizarán en pantalla un saludo de bienvenida y un mensaje que los guiará a la selección del archivo con el que a continuación correrá el programa.

El programa desplegará el listado de archivos de texto disponibles, de manera que puedan seleccionar uno. Deberán tipear el nombre y la extensión del archivo que se desee analizar. Ejemplo: file.txt

*Resultado de la terminal:*

A continuación posee el listado de archivos de textos disponibles para su procesamiento 
-  file.txt
-  textfile.txt
Ingrese el nombre y extensión del archivo que desea procesar (ejemplo archivo.txt):

El programa verificará que exista el archivo de texto y que el mismo no se encuentre vacío, de no existir o estar vacío se le solicitará que ingrese otro archivo.

-----------------------------------------------------------------------------------------------------------------
## Menú de Opciones de la aplicación

Supongamos que han seleccionado el archivo **file.txt**, luego el menú de opciones de la aplicación lo visualizarán como se muestra a continuación. Deberan ingresar una opción de 0 a 9 de acuerdo a la función que deseen ejecutar.

*Resultado de la terminal:*

- Ingrese el nombre y extensión del archivo que desea procesar (ejemplo archivo.txt): **file.txt**

- Archivo seleccionado para su procesamiento: **file.txt** 
 
  - 0. Obtenga los indicadores estadísticos de longitud de palabras del archivo **file.txt**
  - 1. Obtenga los indicadores estadísticos de uso de palabras del archivo **file.txt**
  - 2. Identifique los nombres propios (Nnnn) del archivo **file.txt**
  - 3. Obtenga los indicadores estadísticos de longitud de oraciones del archivo **file.txt**
  - 4. Obtenga el número de líneas en blanco del archivo **file.txt**
  - 5. Convierta a minúsculas o mayúsculas el contenido del archivo **file.txt**
  - 6. Reemplace subcadenas en el archivo **file.txt**
  - 7. Seleccione e imprima un párrafo u oración del archivo **file.txt**
  - 8. Imprima las palabras palíndromos que se encuentran en el archivo **file.txt**
  - 9. Salir 

- Seleccione una opción de 0 a 9:

A modo de ejemplo seleccionaremos la opción 7 - Imprima la primera oración en el archivo **file.txt** para el cuál a continuación mostraremos el contenido del primer párrafo.

> Pero el rey, inmóvil, montado en Crinblanca, contemplaba la agonía de Minas Tirith, como si la angustia o el terror lo hubieran paralizado. Parecía encogido, acobardado de pronto por la edad. Hasta Merry se sentía abrumado por el peso insoportable del horror y la duda. El corazón le latía lentamente. El tiempo parecía haberse detenido en la incertidumbre. ¡Habían llegado demasiado tarde! ¡Demasiado tarde era peor que nunca! Acaso Théoden estuviera apunto de ceder, de dejar caer la vieja cabeza, dar media vuelta, y huir furtivamente a esconderse en las colinas.

*Resultado de la terminal:*
 - Opción Seleccionada 7: Seleccione e imprima oraciones o párrafos.
 - Desea imprimir una Oración o un Párrafo
   - 1. Párrafo
   - 2. oración
   - 3. Salir
 - Elija una opción: 2
 - Ingrese el número de oración que desee imprimir: 1

La oración número 1 del archivo file.txt es:
> Pero el rey, inmóvil, montado en Crinblanca, contemplaba la agonía de Minas Tirith, como si la angustia o el terror lo hubieran paralizado.


# Descripción de opciones de la aplicación

### 0. Indicadores Estadísticos de longitud de palabras: Stats Words
```
Calcula los indicadores estadísticos de longitud de palabras. 
- 1. Palabra más corta
- 2. Palabra más larga 
- 3. Longitud promedio de palabra
Considera las palabras de longitud mayor a 2.
```
### 1. Indicadores Estadísticos de uso de palabras: Stats Usage Words
```
Permite listar las 10 palabras más usadas, considerando las que posean 4 o más carateres.
```
### 2. Identificador de nombres propios: Find Names
```
Permite listar los nombres propios, considerando todas las palabras del tipo Nnnnnnnnn que posean 2 o más carateres, aunque no sea un nombre propio realmente.

```
### 3. Indicadores Estadísticos de longitud de oraciones: Stat Sentences
```
Calcula los indicadores estadísticos de longitud de oraciones.
- 1. Oración más corta
- 2. Oración más larga
- 3. Longitud promedio de oración
```
### 4. Contador de líneas en blanco: Blank Lines Counter
```
Permite contar el número de líneas vacías hay en el archivo. Una línea con sólo espacios en blanco no se considera línea vacía.
```
### 5. Convierta a minúsculas o mayúsculas el texto: Case Converter
```
Invierte mayúsculas y minúsculas en todo el texto. Se muestra en pantalla el texto original y luego el texto invertido.

```
### 6. Reemplace subcadenas en el archivo: Substring Replace
```
Permite reenplazar subcadenas en el archivo de texto, considerando diferencias entre minúsculas y mayúsculas, ignorando acentos. 
Solicita:
- Cadena a reemplazar.
- Cadena de reemplazo.
Se imprime el contenido del archivo original y del reemplazado.
```
### 7. Seleccione e imprima un párrafo u oración: Block Selection
```
Permite seleccionar una oración y/o párrafo del archivo de texto en base a un número de entrada.Un párrafo se distingue de otro con un punto y aparte. Las oraciones vía un punto seguido.

Solicita:
- Tipo de bloque: 1 para párrafos / 2 para oraciones.
- Número de párrafo u oración.
```
### 8. Imprima las palabras palíndromos: Palindrome Detection
```
Permite listar las palabras palíndromos, ignorando mayúsculas, minúsculas y acentos.
```
### 9. Salir
```
Permite salir de la aplicación.
```

