import csv
import unittest
import sys
import os
from mlphon import Syllablizer


CURR_DIR = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))


class AnalyserGeneratorTests(unittest.TestCase):

    def setUp(self):
        self.csvfile = open(os.path.join(CURR_DIR, 'syllable-test.tsv'))
        dialect = csv.Sniffer().sniff(self.csvfile.read(1024))
        # rewind
        self.csvfile.seek(0)
        self.data = csv.reader(self.csvfile, dialect)
        self.syllablizer = Syllablizer()

    def tearDown(self):
        self.csvfile.close()

    def test_analyse(self):
        for row in self.data:
            with self.subTest():
                anals = self.syllablizer.syllablize(row[0])
                match = False
                self.assertTrue(len(anals) != 0,
                                'Syllablize failed for ' + row[0])
                print(row[0], '\t-->\t', anals)
                for index in range(len(anals)):
                    if row[1] == anals[index][0]:
                        match = True
                        break
                self.assertEqual(match, True, 'Syllablize for ' + row[1])

if __name__ == '__main__':
    unittest.main()
