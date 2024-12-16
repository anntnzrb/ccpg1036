#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Práctica 6: Fuerza Bruta",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Diciembre 19, 2024",
)

#show: codly-init.with()
#codly(
  languages: (
    python: (name: "python", icon: "\u{1F40D} ", color: rgb("#CA452B")),
    pseudo: (name: "pseudo-código", icon: "✍️ ", color: rgb("#CA452B")),
  ), number-format: none, zebra-fill: none
)

= Instrucciones
+ Escribir un algoritmo en pseudocódigo que solucione el problema de
  verificación de anagramas
+ Verificar que el algoritmo sea general y correcto
+ Implementar la solución en Python

= Resolución
== Implementación en Pseudocódigo
#figure(
  ```pseudo
verifAnagramas(str1, str2):
  cont_str1 = map()
  cont_str2 = map()
  
  for i = 0 to len(str1) - 1:
    c = str1[i]
    if c in cont_str1 then:
      cont_str1[c] = cont_str1[c] + 1
    else:
      cont_str1[c] = 1

  for i = 0 to len(str2) - 1:
    c = str2[i]
    if c in cont_str2 then:
      cont_str2[c] = cont_str2[c] + 1
    else:
      cont_str2[c] = 1
  
  if cont_str1 == cont_str2 then:
    return True
  else:
    return False
  ```,
  caption: "Algoritmo de vertifiación de anagramas (Pseudocódigo)")

#pagebreak()

=== Pruebas de Escritorio

==== Prueba 1
#figure(
  align(center,
    table(
      columns: 4,
      [Iteración `i`], [Acción], [Estado de `cont_str1`], [Estado de `cont_str2`],

      [0], [ - `'l'` en `str1` y `str2` ], [ {'l': 1} ], [ {'l': 1} ],
      [1], [ - `'i'` en `str1` y `str2` ], [ {'l': 1, 'i': 1} ], [ {'l': 1, 'i': 1} ],
      [2], [ - `'s'` en `str1` y `str2` ], [ {'l': 1, 'i': 1, 's': 1} ], [ {'l': 1, 'i': 1, 's': 1} ],
      [3], [ - `'t'` en `str1` y `str2` ], [ {'l': 1, 'i': 1, 's': 1, 't': 1} ], [ {'l': 1, 'i': 1, 's': 1, 't': 1} ],
      [4], [ - `'e'` en `str1` y `str2` ], [ {'l': 1, 'i': 1, 's': 1, 't': 1, 'e': 1} ], [ {'l': 1, 'i': 1, 's': 1, 't': 1, 'e': 1} ],
      [5], [ - `'n'` en `str1` y `str2` ], [ {'l': 1, 'i': 1, 's': 1, 't': 1, 'e': 1, 'n': 1} ], [ {'l': 1, 'i': 1, 's': 1, 't': 1, 'e': 1, 'n': 1} ],
      [6], [ - Retornar `True` ], [ ], [ ],
    )
  ),
  caption: "Prueba de escritorio #1 para: " + `verifAnagramas('listen', 'silent')`)

==== Prueba 2
#figure(
  align(center,
    table(
      columns: 4,
      [Iteración `i`], [Acción], [Estado de `cont_str1`], [Estado de `cont_str2`],

      [0], [ - `'f'` en `str1` ], [ {'f': 1} ], [ {} ],
      [1], [ - `'u'` en `str1` ], [ {'f': 1, 'u': 1} ], [ {} ],
      [2], [ - `'e'` en `str1` ], [ {'f': 1, 'u': 1, 'e': 1} ], [ {} ],
      [3], [ - `'r'` en `str1` ], [ {'f': 1, 'u': 1, 'e': 1, 'r': 1} ], [ {} ],
      [4], [ - `'z'` en `str1` ], [ {'f': 1, 'u': 1, 'e': 1, 'r': 1, 'z': 1} ], [ {} ],
      [5], [ - `'a'` en `str1` ], [ {'f': 1, 'u': 1, 'e': 1, 'r': 1, 'z': 1, 'a': 1} ], [ {} ],
      [6], [ - `'b'` en `str2` ], [ {'f': 1, 'u': 1, 'e': 1, 'r': 1, 'z': 1, 'a': 1} ], [ {'b': 1} ],
      [7], [ - `'r'` en `str2` ], [ {'f': 1, 'u': 1, 'e': 1, 'r': 1, 'z': 1, 'a': 1} ], [ {'b': 1, 'r': 1} ],
      [8], [ - Retornar `True` ], [ ], [ ],
    )
  ),
  caption: "Prueba de escritorio #2 para: " + `verifAnagramas('fuerza', 'br')`)

#pagebreak()

== Implementación en Python
#figure(
  ```python
def verifAnagramas(str1: str, str2: str) -> bool:
    cont_str1 = {}
    cont_str2 = {}
    
    for c in str1:
        if c in cont_str1:
            cont_str1[c] += 1
        else:
            cont_str1[c] = 1
    
    for c in str2:
        if c in cont_str2:
            cont_str2[c] += 1
        else:
            cont_str2[c] = 1
    
    return cont_str1 == cont_str2
  ```,
  caption: "Algoritmo de vertifiación de anagramas (Python)")

#pagebreak()

=== Ejecución y Tests

#figure(
  align(center,
  image("assets/results1.png", width: 100%)), caption: "Resultados de ejecución del algoritmo")

#figure(
  ```python
class TestVerifAnagramas(unittest.TestCase):
    def test_1(self):
        self.assertTrue(verifAnagramas("conversadora", "conservadora"))
        self.assertTrue(verifAnagramas("listen", "silent"))
        self.assertTrue(verifAnagramas("abc", "bca"))

    def test_2(self):
        self.assertFalse(verifAnagramas("hola", "adios"))
        self.assertFalse(verifAnagramas("abc", "abcd"))
        self.assertFalse(verifAnagramas("python", "typhons"))

    def test_3(self):
        self.assertTrue(verifAnagramas("", ""))
        self.assertFalse(verifAnagramas("a", ""))
        self.assertFalse(verifAnagramas("", "b"))

    def test_4(self):
        self.assertTrue(verifAnagramas("aabbcc", "abcabc"))
        self.assertTrue(verifAnagramas("112233", "321321"))
        self.assertFalse(verifAnagramas("aabbcc", "aabbc"))

    def test_5(self):
        self.assertTrue(verifAnagramas("12345", "54321"))
        self.assertFalse(verifAnagramas("12345", "123456"))
        self.assertFalse(verifAnagramas("12345", "543210"))

    def test_6(self):
        self.assertTrue(verifAnagramas("fuerza bruta", "bruta fuerza"))
        self.assertFalse(verifAnagramas("fuerza bruta", "bruta fuerz"))
  ```,
  caption: "Testing de algoritmo de vertifiación de anagramas")

#pagebreak()

= Anexos
== Repositorio Online
La totalidad del código desarrollado se encuentra disponible en el siguiente
#link("https://github.com/anntnzrb/ccpg1036")[repositorio de GitHub], en su carpeta respectiva.
