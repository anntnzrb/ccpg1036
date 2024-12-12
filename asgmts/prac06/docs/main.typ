#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Práctica 6: Fuerza Bruta",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Diciembre 13, 2024",
)

#show: codly-init.with()
#codly(
  languages: (
    python: (name: "python", icon: "\u{1F40D} ", color: rgb("#CA452B")),
    pseudo: (name: "pseudo-código", icon: "✍️ ", color: rgb("#CA452B")),
  ), number-format: none, zebra-fill: none
)

= Instrucciones
+ Escribir un algoritmo en pseudocódigo que solucione el problema de la
  búsqueda secuencial de texto
+ Verificar que el algoritmo sea general y correcto
+ Implementar la solución en Python

= Resolución
== Implementación en Pseudocódigo
#figure(
  ```pseudo
busqSecTxt(txt, sub_txt):
  n = longitud(txt)
  m = longitud(sub_txt)

  for i = 0 to (n - m + 1) {
    is_match = true

    for j = 0 to (m) {
      if txt[i + j] != sub_txt[j] {
        is_match = false
        break
      }
    }

    if is_match { return i }
  }

  return -1
  ```,
  caption: "Algoritmo de búsqueda secuencial de texto (Pseudocódigo)")

#pagebreak()

=== Pruebas de Escritorio
==== Prueba 1
#figure(
  align(center,
    table(
      columns: 4,
      [Iteración `i`], [Comparación], [`is_match`], [Acción],

      [0], [ - `'a' != 'r'` (F) ], [ - Falso ], [ - Continuar ],
      [1], [ - `'l' != 'r'` (F) ], [ - Falso ], [ - Continuar ],
      [2], [ - `'g' != 'r'` (F) ], [ - Falso ], [ - Continuar ],
      [3], [ - `'o' != 'r'` (F) ], [ - Falso ], [ - Continuar ],
      [4], [
        - `'r' == 'r'` (V)
        - `'i' == 'i'` (V)
        - `'t' == 't'` (V)
        - `'m' == 'm'` (V)
        - `'o' == 'o'` (V)
      ], [ - Verdadero ], [ - Retornar `i = 4` ],
    )
  ), 
  caption: "Prueba de escritorio #1 para: " + `busqSecTxt('algoritmos','ritmo')`)

==== Prueba 2

#figure(
  align(center,
    table(
      columns: 4,
      [Iteración `i`], [Comparación], [`is_match`], [Acción],

      [0], [ - `'h' != 'p'` (F) ], [ - Falso ], [ - Continuar ],
      [1], [ - `'o' != 'p'` (F) ], [ - Falso ], [ - Continuar ],
      [2], [ - `'l' != 'p'` (F) ], [ - Falso ], [ - Continuar ],
      [3], [ - `'a' != 'p'` (F) ], [ - Falso ], [ - Continuar ],
      [4], [ ], [], [ - Retornar `-1` ],
    )
  ), 
  caption: "Prueba de escritorio #2 para: " + `busqSecTxt('hola','python')`)

==== Prueba 3

#figure(
  align(center,
    table(
      columns: 4,
      [Iteración `i`], [Comparación], [`is_match`], [Acción],

      [0], [
        - `'a' == 'a'` (V)
        - `'b' == 'b'` (V)
        - `'c' == 'c'` (V)
      ], [ - Verdadero ], [ - Retornar `i = 0` ],

    )
  ), 
  caption: "Prueba de escritorio #3 para: " + `busqSecTxt('abcabc', 'abc')`)

#pagebreak()

== Implementación en Python
#figure(
  ```python
def busqSecTxt(txt: str, sub_txt: str) -> int:
    n: int = len(txt)
    m: int = len(sub_txt)

    for i in range(n - m + 1):
        is_match: bool = True
        for j in range(m):
            if txt[i + j] != sub_txt[j]:
                is_match = False
                break
        if is_match:
            return i

    return -1
  ```,
  caption: "Algoritmo de búsqueda secuencial de texto (Python)")

#pagebreak()

=== Ejecución y Tests

#figure(
  align(center,
  image("assets/results1.png", width: 100%)), caption: "Resultados de ejecución del algoritmo")

#figure(
  ```python
class TestBruteForceAlgo(unittest.TestCase):
    def test_1(self):
        self.assertEqual(busqSecTxt("Hola mundo", "mundo"), 5)
        self.assertEqual(busqSecTxt("algoritmos", "ritmo"), 4)
        self.assertEqual(busqSecTxt("CCPG1346 fuerza bruta", "fuerza"), 9)

    def test_2(self):
        self.assertEqual(busqSecTxt("Hola mundo", "Python"), -1)
        self.assertEqual(busqSecTxt("algoritmos", "estructura"), -1)

    def test_3(self):
        self.assertEqual(busqSecTxt("Hola mundo", ""), 0)

    def test_4(self):
        self.assertEqual(busqSecTxt("", "mundo"), -1)
        self.assertEqual(busqSecTxt("", ""), 0)

    def test_5(self):
        self.assertEqual(busqSecTxt("fuerza bruta", "fuerza bruta"), 0)

    def test_6(self):
        self.assertEqual(busqSecTxt("abc", "abcdef"), -1)
  ```,
  caption: "Testing de algoritmo de búsqueda secuencial de texto")

#pagebreak()

= Anexos
== Repositorio Online
La totalidad del código desarrollado se encuentra disponible en el siguiente
#link("https://github.com/anntnzrb/ccpg1036")[repositorio de GitHub], en su carpeta respectiva.
