import unittest
import time
import random
from typing import List

from .main import insertionSort


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
        execution_time = timeEnd - timeStart
        print()
        print(f"Sorting {size} elements took {execution_time:.3f} seconds.")

    def test_sort_performance(self):
        for size in [10, 100, 1000, 10000, 100000]:
            self.measure_execution_time(size)


if __name__ == "__main__":
    unittest.main()
