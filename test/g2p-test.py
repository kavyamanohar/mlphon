import csv
import unittest
import sys
import os
from mlphon import PhoneticAnalyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))


class G2PTests(unittest.TestCase):
    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, "data_g2p.tsv"))
        self.data_g2p = csv.reader(self.csvfile, delimiter="\t")
        self.mlphon = PhoneticAnalyser()

    def tearDown(self):
        self.csvfile.close()

    def test_g2p(self):
        for row in self.data_g2p:
            with self.subTest():
                result_g2p = self.mlphon.grapheme_to_phoneme(row[0])
                match = False
                self.assertTrue(len(result_g2p) != 0, "Analysis failed for " + row[0])
                print(row[0], "\t-->\t", result_g2p)
                for index in range(len(result_g2p)):
                    if row[1] == str(result_g2p):
                        match = True
                        break
                self.assertEqual(match, True, "Analysis for " + row[0])


if __name__ == "__main__":
    unittest.main()