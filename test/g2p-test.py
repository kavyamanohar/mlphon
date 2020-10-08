import csv
import unittest
import sys
import os
from mlphon import PhoneticAnalyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class AnalyserTests(unittest.TestCase):

    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, 'data_g2p.tsv'))
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data_g2p = csv.reader(self.csvfile, dialect)
        self.mlphon = PhoneticAnalyser()

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        for row in self.data_g2p:
            with self.subTest():
                anals = self.mlphon.grapheme_to_phoneme(row[0])
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
