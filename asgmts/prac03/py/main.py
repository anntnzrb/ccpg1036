"""
Práctica 3: Análisis empírico de Stoogesort

Implementación del algoritmo Stoogesort en Python.

Autor: Juan Antonio González
Paralelo: 2
Fecha de realización: 24/11/07

Referencias:
[1] T. H. Cormen y C. E. Leiserson, Introduction to Algorithms, fourth edition. London, England: MIT Press, 2022, p. 202.
"""

from typing import List


def stoogesort(arr: List[int], i: int, j: int) -> None:
    """
    Ordena un subarreglo ascendentemente utilizando el algoritmo Stoogesort [1].
    """
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


def stoogesort2(arr: List[int]) -> None:
    """
    Ordena completamente una lista ascendentemente usando Stoogesort.
    """
    stoogesort(arr, 0, len(arr) - 1)
