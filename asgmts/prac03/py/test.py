import unittest
import time
import random
from typing import List

from main import stoogesort2


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

   #def test_sort_performance(self):
   #    for size in [10, 100, 1000, 2000]:
   #        self.measure_exec_time(size)


if __name__ == "__main__":
    unittest.main()
