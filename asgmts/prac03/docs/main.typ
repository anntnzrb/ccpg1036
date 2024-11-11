#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Práctica 3: Análisis empírico de Stoogesort",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Noviembre 12, 2024",
)

#show: codly-init.with()
#codly(
  languages: (
    python: (name: "python", icon: "\u{1F40D} ", color: rgb("#CA452B")),
  ), number-format: none, zebra-fill: none
)

= Instrucciones
+ Escriba el algoritmo Stoogesort en Python y realice los ajustes necesarios
  que le permitan medir los tiempos de ejecución y cargar los datos desde un
  archivo de entrada. Su código debe incluir como comentarios: la referencia de
  dónde tomó el código, su nombre completo, paralelo y fecha de realización de la
  práctica.

+ Realice al menos ejecuciones con tres cantidades de datos lo suficientemente
  grandes que su dispositivo le permita y capture los resultados obtenidos (tabla
  que muestre cantidad de datos y tiempo de ejecución; así como capturas de las
  pantallas de ejecución).  Coloque los resultados obtenidos en un documento PDF
  con su nombre.

+ Prepare un archivo ZIP que incluya el documento PDF, su código Python y los
  archivos con los datos que fueron utilizados para las pruebas (.dat)

+ Tipee sus conclusiones como respuesta a la tarea en la caja de texto o como
  comentario.

#figure(
  align(center,
  image("assets/hw_info.png", width: 100%)), caption: [Características de la computadora empleada])

#pagebreak()

= Resolución
== Implementación de Algoritmo Stoogesort
El siguiente algoritmo de *Stoogesort* fue adaptado en base al algoritmo proporcionado en el texto guía de la materia: _Introduction to Algorithms_ @cormen2022-algo.

#figure(
  ```python
def stoogesort(arr: List[int], i: int, j: int) -> None:
    # quit; already sorted
    if i >= j:
        return None

    # swap
    if arr[i] > arr[j]:
        arr[i], arr[j] = arr[j], arr[i]

    # div. and recursive call self
    slice_len: int = j - i + 1
    if slice_len > 2:
        third: int = slice_len // 3
        stoogesort(arr, i, j - third)
        stoogesort(arr, i + third, j)
        stoogesort(arr, i, j - third)
  ```,
  caption: "Algoritmo Stoogesort basado en " + cite(<cormen2022-algo>))

#figure(
  ```python
def stoogesort2(arr: List[int]) -> None:
    stoogesort(arr, 0, len(arr) - 1)
  ```,
  caption: "Algoritmo Stoogesort auxiliar para todo el arreglo")

#pagebreak()

== Ejecución y Tests

#figure(
  align(center,
  image("assets/results1.png", width: 100%)), caption: "Resultados de ejecución del algoritmo #1")

#figure(
  align(center,
  image("assets/results2.png", width: 100%)), caption: "Resultados de ejecución del algoritmo #2")

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
      [Caso 2], [100], [0.020],
      [Caso 3], [1000], [5.242],
      [Caso 4], [2000], [48.777],
      [Caso 5], [5000], [2556.804],
    )), caption: "Resumen de tiempos de ejecución según cantidad de datos")
    
#figure(
  ```python
class TestStoochSort(unittest.TestCase):
    def test_sort_basic(self):
        arr = [12, 11, 13, 5, 6]
        expected = [5, 6, 11, 12, 13]
        stoogesort2(arr)
        self.assertEqual(arr, expected)

    def test_sort_empty(self):
        arr = []
        expected = []
        stoogesort2(arr)
        self.assertEqual(arr, expected)

    def test_sort_single_element(self):
        arr = [1]
        expected = [1]
        stoogesort2(arr)
        self.assertEqual(arr, expected)

    def test_sort_already_sorted(self):
        arr = [1, 2, 3, 4, 5]
        expected = [1, 2, 3, 4, 5]
        stoogesort2(arr)
        self.assertEqual(arr, expected)

    def test_sort_reverse_order(self):
        arr = [5, 4, 3, 2, 1]
        expected = [1, 2, 3, 4, 5]
        stoogesort2(arr)
        self.assertEqual(arr, expected)

    def test_sort_duplicates(self):
        arr = [4, 4, 4, 4]
        expected = [4, 4, 4, 4]
        stoogesort2(arr)
        self.assertEqual(arr, expected)
  ```,
  caption: "Testing de algoritmo Stoogesort #1")

#figure(
  ```python
class TestStoochSortPerformance(unittest.TestCase):
    def gen_random_intlist(self, size: int) -> List[int]:
        return [random.randint(0, size) for _ in range(size)]

    def measure_exec_time(self, size: int) -> None:
        random_list = self.gen_random_intlist(size)

        time_start = time.time()
        stoogesort2(random_list)
        time_end = time.time()

        time_exec = time_end - time_start
        print(f"Ordenar {size} elementos (stoogesort) tomó {time_exec:.3f} segundos.")

    def test_sort_performance(self):
        for size in [10, 100, 1000, 2000, 5000]:
            self.measure_exec_time(size)
  ```,
  caption: "Testing de algoritmo Stoogesort #2")

#pagebreak()

= Conclusiones
El algoritmo *Stoogesort* es considerado un algoritmo muy ineficiente para
conjuntos de datos grandes. Este algoritmo tiene un tiempo de complejidad de
tiempo $O(n^2.71)$ y se recomienda que no sea empleado en ambientes de
producción debido a su ineficiencia. A pesar de ser un algoritmo que en
términos prácticos funciona, su ineficiencia no lo permite ser elegido antes
que otras alternativas más eficientes como *Merge-Sort* y *Quick-Sort*. En
consecuencia a esto, el algoritmo *Stoogesort* reserva su existencia para
propósitos teóricos y de demostración. Como características, este algoritmo
cuenta con una implementación sencilla que permite el estudio de funciones
recursivas para algoritmos de ordenamiento.

En comparación a la práctica anterior, donde se trató el algoritmo
*Insertion-Sort*, se logró notar que, testando el algoritmo Stoogesort, la
máquina empezaba a demorarse considerablemente más con valores grandes del
tamaño del arreglo. Debido a esto, para esta prueba solo se pudo llegar a
probar hasta el valor `7000` como tamaño del arreglo, proceso que llegó a tomar
`42` minutos.

Con el objetivo de obtener un tiempo promedio representativo, se recomienda
realizar varias pruebas de ejecución en entornos similares para cada uno de los
datos de entrada. Para la realización de este trabajo, no se trabajó con
archivos externos. Se generaron arreglos de distintos tamaños con números
totalmente aleatorios, esto gracias a la función `gen_random_intlist`.

#figure(
  ```python
def gen_random_intlist(self, size: int) -> List[int]:
    return [random.randint(0, size) for _ in range(size)]
  ```,
  caption: "Función para generar un arreglo de números aleatorios de tamaño especificado")

#pagebreak()

= Anexos
== Repositorio Online
La totalidad del código desarrollado se encuentra disponible en el siguiente
#link("https://github.com/anntnzrb/ccpg1036")[repositorio de GitHub], en su carpeta respectiva.

#pagebreak()

#bibliography("bib.bib", style: "ieee")
