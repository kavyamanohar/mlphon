import csv
import unittest
import sys
import os
from mlphon import PhoneticAnalyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class AnalyserTests(unittest.TestCase):

    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, 'data_p2g.tsv'))
        # Correct the csv read file using tab delimiter
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data_p2g = csv.reader(self.csvfile, dialect)
        self.mlphon = PhoneticAnalyser()

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        for row in self.data_p2g:
            with self.subTest():
                anals = self.mlphon.phoneme_to_grapheme(row[0])
                match = False
                self.assertTrue(len(anals) != 0,
                                'Analysis failed for ' + row[0])
                print(row[0], '\t-->\t', anals)
                for index in range(len(anals)):
                    if row[1] == str(anals):
                        match = True
                        break
                self.assertEqual(match, True, 'Analysis for ' + row[0])

if __name__ == '__main__':
    unittest.main()
