#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Taller: Métrica de Similitud ",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Diciembre 20, 2024",
)

= Instrucciones
+ Definición de métrica de similitud dada por un valor entre 0 y 1 donde 0
  indica que no hay nada de similitud y 1 existe total similitud. 
+ Un ejemplo de aplicación de su métrica utilice el ordenamiento de uno de los
  integrantes del grupo y el ordenamiento modelo
+ Conclusiones sobre que tan buena consideran los integrantes del grupo que es
  su métrica de similitud.

= Definición
Se define una métrica de similitud que asigna un valor entre `0` y `1`:
- `0` indica que no hay similitud entre dos ordenamientos.
- `1` indica que existe una similitud total entre los dos ordenamientos.

La métrica se calcula de la siguiente manera:

  $M S O (A, B) = 1 - (d(A,B))/(d_max)$

Términos:
- `A` y `B` son dos ordenamientos a comparar
- `d(A, B)`  es la distancia de _Kendall Tau_ entre  `A`  y  `B`, esta cuenta
  el número de pares de elementos que están en diferente orden en ambos
  ordenamientos
- $d_max$ es la distancia máxima posible, para `n` elementos es  $n(n-1)/2$

La distancia de _Kendall Tau_ es una medida para comparar ordenamientos. Esta
medida cuenta las discordancias entre dos secuencias. Primero se normaliza
dividiendo por la distancia máxima posible, se tiene escala de `0` a `1`.
Después se resta el valor de `1`, se invierte la escala para que `1` represente
la máxima similitud.

#pagebreak()

= Comentarios
Este trabajado fue realizado única y exclusivamente por mi persona, sin embargo
no lo pude finalizar a tiempo. Por lo que envio hasta donde pude llegar, solo
hasta proporcionar una definición. El ejemplo, análisis y comentarios en
detalle no fueron realizados.

Me auto-asigné al grupo \#1, pero este ya tenía integrantes, como mencioné
antes, por falta de tiempo no me gestioné correctamente, por lo que hice este
pequeño avance por mi parte.
