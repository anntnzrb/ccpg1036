#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Práctica 1: Tiempo de ejecución de Insertion-Sort",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Octubre 18, 2024",
)

#show: codly-init.with()
#codly(
  languages: (
    python: (name: "python", icon: "\u{1F40D} ", color: rgb("#CA452B")),
  ), number-format: none, zebra-fill: none
)

= Instrucciones

+ Capture una pantalla donde se indiquen las características del computador
  (procesador, memoria, entre otros) que usted utilizará para la realización de
  las prácticas de este curso. 

+ Implemente en *Python* el algoritmo *Insertion-Sort* que aparece en el texto guía
  o modifique uno obtenido de Internet citando la fuente en formato _IEEE_. 

+ Ejecute la implementación del algoritmo para un conjunto de `10, 100, 1000,
  10000, 100000` datos enteros y registre los tiempos de ejecución en cada caso.

+ Si las características de su dispositivo lo permiten realice ejecuciones
  adicionales con una mayor cantidad de datos y registre los correspondientes
  tiempos de ejecución. [*NO APLICA*]

+ Escriba en forma de conclusiones qué aspectos deben ser tomados en cuenta por
  un grupo de personas que tienen por objetivo encontrar el tiempo promedio de
  ejecución del algoritmo para las cantidades de datos del punto 3.

#figure(
  align(center,
  image("assets/hw_info.png", width: 100%)), caption: [Características de la computadora empleada])

#pagebreak()

= Resolución
== Implementación de Algoritmo Insertion-Sort
El siguiente algoritmo de *Insertion Sort* fue adaptado en base al algoritmo proporcionado en el texto guía de la materia: _Introduction to Algorithms_ @cormen2022-algo.

Esta versión sigue los mismos pasos que la versión original, sin embargo introduce algunos ajustes personales, por ejemplo:

+ *Mutación de parámetros*: Se copia el arreglo en vez de modificarlo, es una
  buena práctica preferir crear un nuevo arreglo en vez de modificar uno
  existente.

+ *Caso base*: En casos triviales, como cuando arreglo tiene una longitud menor
  a 2 (o tiene 1 elemento, o ninguno) entonces se retorna el mismo arreglo. Esto
  provoca una salida temprana.

#figure(
  ```python
def insertionSort(arr: List[int]) -> List[int]:
    arrLen: int = len(arr)

    # if arr length is zero or contains only 1 elem, it is sorted already
    if arrLen < 2:
        return arr

    # cp arr to avoid mutation
    sortedArr: List[int] = arr[:]

    for idx in range(1, arrLen):  # iterate arr starting from 2nd elem
        elem: int = sortedArr[idx]  # store current element
        prev_idx: int = idx - 1

        # shift next elem to right if greater than current elem
        while prev_idx >= 0 and elem < sortedArr[prev_idx]:
            sortedArr[prev_idx + 1] = sortedArr[prev_idx]
            prev_idx -= 1
        sortedArr[prev_idx + 1] = elem

    return sortedArr
  ```,
  caption: "Algoritmo Insertion Sort basado en " + cite(<cormen2022-algo>))

#pagebreak()

== Ejecución y Tests

#figure(
  align(center,
  image("assets/results.png", width: 100%)), caption: [Resultados de ejecución del algoritmo])

#set table(
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else {
    it
  }
}

#figure(
  align(center,
    table(
      columns: 3,
      [], [Cantidad de Datos], [Tiempo de Ejecución (segundos)],
    
      [Caso 1], [10], [0.000],
      [Caso 2], [100], [0.000],
      [Caso 3], [1000], [0.014],
      [Caso 4], [10000], [1.229],
      [Caso 5], [100000], [125.322],
    )), caption: "Resumen de tiempos de ejecución según cantidad de datos")
    
#figure(
  ```python
class TestInsertionSort(unittest.TestCase):
    def test_sort_basic(self):
        self.assertEqual(insertionSort([12, 11, 13, 5, 6]), [5, 6, 11, 12, 13])

    def test_sort_empty(self):
        self.assertEqual(insertionSort([]), [])

    def test_sort_single_element(self):
        self.assertEqual(insertionSort([1]), [1])

    def test_sort_already_sorted(self):
        self.assertEqual(insertionSort([1, 2, 3, 4, 5]), [1, 2, 3, 4, 5])

    def test_sort_reverse_order(self):
        self.assertEqual(insertionSort([5, 4, 3, 2, 1]), [1, 2, 3, 4, 5])

    def test_sort_duplicates(self):
        self.assertEqual(insertionSort([4, 4, 4, 4]), [4, 4, 4, 4])

class TestInsertionSortPerformance(unittest.TestCase):
    def gen_random_intlist(self, size: int) -> List[int]:
        return [random.randint(0, size) for _ in range(size)]

    def measure_execution_time(self, size: int) -> None:
        randomList = self.gen_random_intlist(size)

        timeStart = time.time()
        insertionSort(randomList)
        timeEnd = time.time()
        execTime = timeEnd - timeStart
        print()
        print(f"Sorting {size} elements took {execTime:.3f} seconds.")

    def test_sort_performance(self):
        for size in [10, 100, 1000, 10000, 100000]:
            self.measure_execution_time(size)
  ```,
  caption: "Testing de algoritmo Insertion-Sort")

#pagebreak()

= Conclusiones
Este algoritmo implementado tiene un tiempo de complejidad cuadrático $O(n^2)$,
resultando en que, a medida que el número de datos aumente, el tiempo de
ejecución también lo hará.
Para los números más pequeños, como `10` y `100` elementos, el tiempo de
ejecución es muy rápido, sin embargo con un arreglo de elementos grande, como lo
son `100.000` o más datos, el tiempo de ejecución aumenta drásticamente.

El hardware empleado es considerado un buen equipo, que rinde mejor en
comparación a equipos de uso personal promedio. Para obtener un tiempo promedio
representativo, se recomienda realizar varias pruebas de ejecución en entornos
similares para cada uno de los datos de entrada.

Por último, también vale mencionar que la naturaleza de los datos también es un
factor importante. Puede ser que el arreglo de elementos esté muy desordenado,
parcialmente ordenado y casi ordenado totalmente. Dependiendo de cualquiera de
los escenarios descritos anteriormente, el tiempo de ejecución se puede ver
drásticamente afectado.

#pagebreak()

= Anexos

== Repositorio Online

La totalidad del código desarrollado se encuentra disponible en el siguiente
#link("https://github.com/anntnzrb/ccpg1036")[repositorio de GitHub], en su carpeta respectiva.

#pagebreak()

#bibliography("bib.bib", style: "ieee")