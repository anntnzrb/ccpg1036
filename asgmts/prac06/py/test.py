import unittest

from main import busqSecTxt


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


if __name__ == "__main__":
    unittest.main()
