import csv
import unittest
import sys
import os
from mlphon import PhoneticAnalyser


CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

# കല	['ക', 'ല']
# പാൽ	['പാൽ']

class AnalyserGeneratorTests(unittest.TestCase):
    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, "data_syllable.tsv"))
        self.datasyl = csv.reader(self.csvfile, delimiter="\t")
        self.mlphon = PhoneticAnalyser()

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        for row in self.datasyl:
            with self.subTest():
                anals = self.mlphon.split_to_syllables(row[0])
                match = False
                self.assertTrue(len(anals) != 0, "Syllablize failed for " + row[0])
                print(row[0], "\t-->\t", anals)
                if row[1] == str(anals):
                    match = True
                self.assertEqual(match, True, "Syllablize for " + row[1])


if __name__ == "__main__":
    unittest.main()
