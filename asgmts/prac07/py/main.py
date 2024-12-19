from typing import List, Dict


def emparejar(
    E: List[List[int]], P: List[List[int]], proyectos: List[str], estudiantes: List[str]
) -> Dict[str, str]:
    num_est = len(estudiantes)

    # ajuste los índices de las pref. de est. restando 1
    # esto se hace porque se indexa desde 0
    E = [[x - 1 for x in fila] for fila in E]

    # dict. con el ranking de est. para cada proy.
    ranking_P = {
        i: {est - 1: r for r, est in enumerate(fila)} for i, fila in enumerate(P)
    }

    # est. sin asignar
    libres = list(range(num_est))

    # lista de asignación proyecto -> estudiante
    # lista de asignación estudiante -> proyecto
    # inicialización en -1 para ambas listas
    # (-1 = sin asignar)
    (proy_asign_a, est_asig_a) = ([-1] * num_est, [-1] * num_est)

    # lista de siguiente pref. a revisar para cada est.
    siguiente = [0] * num_est

    # loopea mientras haya est. sin asignar y con pref. por revisar
    while libres and any(siguiente[e] < num_est for e in libres):
        est = libres[0]  # usa el primer est. libre

        # si ya revisó todas sus pref., siguiente
        if siguiente[est] >= num_est:
            libres.pop(0)  # libera el est. y lo remueve de libres
            continue

        # otener siguiente proy. preferido del est.
        proy = E[est][siguiente[est]]
        siguiente[est] += 1

        # si el proy. NO tiene asignado est.
        if est_asig_a[proy] == -1:
            # asigna el proy. al est. y lo remueve de libres
            proy_asign_a[est], est_asig_a[proy], libres = proy, est, libres[1:]

        # si es que el proy. prefiere al est. actual sobre el que ya tiene
        elif ranking_P[proy][est] < ranking_P[proy][est_asig_a[proy]]:
            # almacena el est. que pierde el proy.
            e_anterior = est_asig_a[proy]
            # reasigna el proy. al nuevo est.
            proy_asign_a[est], est_asig_a[proy] = proy, est
            # libera al est. anterior
            proy_asign_a[e_anterior] = -1
            # actualiza las listas de est. libres
            libres.remove(est)
            libres.append(e_anterior)

    # ret. dict. con las asignaciones finales
    return {estudiantes[e]: proyectos[p] for e, p in enumerate(proy_asign_a)}


def main():
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

    resultado = emparejar(E, P, proyectos, estudiantes)

    print("Estudiante -> Proyecto\n")
    for est, proj in resultado.items():
        print(f"{est} -> {proj}")


if __name__ == "__main__":
    main()
