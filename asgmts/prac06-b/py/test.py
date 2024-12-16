import unittest

from main import verifAnagramas


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


if __name__ == "__main__":
    unittest.main()
