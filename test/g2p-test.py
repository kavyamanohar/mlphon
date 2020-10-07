import csv
import unittest
import sys
import os
from mlphon import Phonetic_analyser

CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))

class AnalyserGeneratorTests(unittest.TestCase):

    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, 'data.tsv'))
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data = csv.reader(self.csvfile, dialect)
        self.g2p = Phonetic_analyser()

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        for row in self.data:
            with self.subTest():
                anals = self.g2p.analyse(row[0])
                match = False
                self.assertTrue(len(anals) != 0,
                                'Analysis failed for ' + row[0])
                print(row[0], '\t-->\t', anals)
                for index in range(len(anals)):
                    if row[1] == anals[index][0]:
                        match = True
                        break
                self.assertEqual(match, True, 'Analysis for ' + row[0])

    def test_generate(self):
        for row in self.data:
            with self.subTest():
                match = False
                gens = self.g2p.generate(row[1])
                self.assertTrue(
                    len(gens) != 0, 'Generate failed for ' + row[1])
                print(row[1], '\t-->\t', gens)
                for index in range(len(gens)):
                    if row[0] == gens[index][0]:
                        match = True
                        break
                self.assertEqual(match, True, 'Generate for ' + row[1])

if __name__ == '__main__':
    unittest.main()
