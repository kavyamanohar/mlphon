import csv
import unittest
import sys
import os
from mlphon import PhoneticAnalyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))


class P2GTests(unittest.TestCase):
    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, "data_p2g.tsv"))
        self.data_p2g = csv.reader(self.csvfile, delimiter="\t")
        self.mlphon = PhoneticAnalyser()

    def tearDown(self):
        self.csvfile.close()

    def test_p2g(self):
        print(self.data_p2g)
        for row in self.data_p2g:
            with self.subTest():
                result_p2g = self.mlphon.phoneme_to_grapheme(row[0])
                match = False
                self.assertTrue(len(result_p2g) != 0, "Analysis failed for " + row[0])
                print(row[0], "\t-->\t", result_p2g)
                for index in range(len(result_p2g)):
                    if row[1] == str(result_p2g):
                        match = True
                        break
                self.assertEqual(match, True, "Analysis for " + row[0])


if __name__ == "__main__":
    unittest.main()