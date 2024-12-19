#import "@preview/codly:1.0.0": *

#import "template.typ": *

#show: project.with(
  title: "Práctica 7: Emparejamiento y Preferencias",
  authors: (
    (name: "Juan Antonio González", email: "juangonz@espol.edu.ec", affiliation: "ESPOL (FIEC)"),
  ),
  date: "Diciembre 19, 2024",
)

#show: codly-init.with()
#codly(
  languages: (
    python: (name: "python", icon: "\u{1F40D} ", color: rgb("#CA452B")),
  ), number-format: none, zebra-fill: none
)

= Resolución
Para la realización de este taller (y programa) se asume la participación de
Juan Antonio (mi persona) más tres (_3_) estudiantes ficticios.
Con un total de cuatro (_4_) estudiantes

== Parámetros
#figure(
  ```python
# matriz de pref. de estudiantes
E = [
    [3, 1, 4, 2],
    [4, 3, 2, 1],
    [1, 2, 3, 4],
    [2, 4, 1, 3],
]
# matriz de pref. de supervisores
P = [
    [4, 3, 2, 1],
    [1, 2, 3, 4],
    [2, 4, 1, 3],
    [3, 1, 4, 2],
]

proyectos = [
    "[P] Algoritmos: Optimización de Rutas",
    "[P] Data: Análisis de Grandes Volúmenes de Datos",
    "[P] Ciencia: Simulación de Modelos Moleculares",
    "[P] Bosque: Predicción de Incendios Forestales",
]
estudiantes = ["Juan Antonio", "Iota", "Epsilon", "Delta"]
  ```,
  caption: "Parámetros empleados en el programa")

== Resultados
#figure(
  align(center,
  image("assets/results1.png", width: 100%)), caption: "Resultados de ejecución del programa")

#pagebreak()

== Algoritmo de Emparejamiento
A continuación se adjunta una versión simplificada del algoritmo de emparejamiento.
La versión completa (con comentarios incluidos) se encuentra en el archivo `main.py`.

#figure(
  ```python
def emparejar(
    E: List[List[int]],
    P: List[List[int]],
    proyectos: List[str],
    estudiantes: List[str]) -> Dict[str, str]:
    num_est = len(estudiantes)
    E = [[x - 1 for x in fila] for fila in E]
    ranking_P = {
        i: {est - 1: r for r, est in enumerate(fila)} for i, fila in enumerate(P)
    }

    libres = list(range(num_est))
    (proy_asign_a, est_asig_a) = ([-1] * num_est, [-1] * num_est)
    siguiente = [0] * num_est

    while libres and any(siguiente[e] < num_est for e in libres):
        est = libres[0]

        if siguiente[est] >= num_est:
            libres.pop(0)
            continue

        proy = E[est][siguiente[est]]
        siguiente[est] += 1

        if est_asig_a[proy] == -1:
            proy_asign_a[est], est_asig_a[proy], libres = proy, est, libres[1:]
        elif ranking_P[proy][est] < ranking_P[proy][est_asig_a[proy]]:
            e_anterior = est_asig_a[proy]
            proy_asign_a[est], est_asig_a[proy] = proy, est
            proy_asign_a[e_anterior] = -1
            libres.remove(est)
            libres.append(e_anterior)

    return {estudiantes[e]: proyectos[p] for e, p in enumerate(proy_asign_a)}
  ```,
  caption: "Algoritmo de emparejamiento simplificado")

#pagebreak()

= Anexos
== Repositorio Online
La totalidad del código desarrollado se encuentra disponible en el siguiente
#link("https://github.com/anntnzrb/ccpg1036")[repositorio de GitHub], en su carpeta respectiva.
