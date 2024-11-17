#import "template.typ": *

#show: project.with(
  title: "Práctica 4: Recurrencias",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Noviembre 17, 2024",
)

= Instrucciones
+ Regístrese en uno de los grupos del paralelo PRÁCTICO.
+ Junto a sus compañeros de grupo encuentre la representación asintótica del
  tiempo de ejecución dado por las siguientes recurrencias mediante uno de los
  métodos estudiados en clase. Es importante que su respuesta incluya el nombre
  del método, los pasos que se han seguido y que se justifique la selección del
  método.  En el caso de aplicar el método maestro es muy importante que los
  pasos incluyan los valores de a, b, f(n) y epsilon.
+ Prepare un archivo PDF que incluya los nombres de los integrantes del grupo,
  el paralelo y lo solicitado. 
+ Un integrante del grupo deberá subir a la plataforma la respuesta del trabajo
  grupal. 


#pagebreak()

= Resolución
== Ejercicio A
Se optó por emplear el *teorema de sustitución* debido a que el *teorema
maestro* no se podía emplear: ($sqrt(n)$ en lugar de $n/b$  con $b$ constante).

#figure(
  align(center,
  image("assets/ej-a.jpg", width: 100%)), caption: "Resolución Ejercicio A")

#pagebreak()

== Ejercicio B
Se elegió emplear emplear el *teorema maestro* por su brevedad y dado que la
recurrencia se ajusta adecuadamente al formato del teorema. Para este ejercicio
se cumple el *Caso 1*.

#figure(
  align(center,
  image("assets/ej-b.jpg", width: 100%)), caption: "Resolución Ejercicio B")

#pagebreak()

== Ejercicio C
Para este ejercicio se optó por emplear el *teorema de sustitución*. A pesar de
que inicialmente parece intuitivo aplicar el *teorema maestro*, el último
término: $theta (n^2 log n)$ introduce un factor logarítmico que complica la
aplicación directa del *teorema maestro*.

#figure(
  align(center,
  image("assets/ej-c.jpg", width: 88%)), caption: "Resolución Ejercicio C")

#pagebreak()

== Ejercicio D
Se elegió emplear emplear el *teorema maestro* por su brevedad y dado que la
recurrencia se ajusta adecuadamente al formato del teorema. Para este ejercicio
se cumple el *Caso 2*.

#figure(
  align(center,
  image("assets/ej-d.jpg", width: 100%)), caption: "Resolución Ejercicio D")

#pagebreak()

== Ejercicio E
Se elegió emplear emplear el *teorema maestro* por su brevedad y dado que la
recurrencia se ajusta adecuadamente al formato del teorema. Para este ejercicio
se cumple el *Caso 3*.

#figure(
  align(center,
  image("assets/ej-e.jpg", width: 92%)), caption: "Resolución Ejercicio E")

#pagebreak()

= Conclusiones
Al momento de la realización y finalización de esta práctica, la totalidad del
trabajo ha sido realizado únicamente por mi persona, *Juan Antonio González*,
matrícula: `201908068`. Me auto-registré en el _grupo 4_ en *Aula Virtual* el
día del anuncio del registro. Me consta que, hasta el momento, soy el único
integrante de este grupo.
