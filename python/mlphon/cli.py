import argparse
from sys import stderr, stdin, stdout
import os
from pkg_resources import resource_filename, resource_exists
from .utilities import parse_syllabletags, parse_phonemetags
from .phonetic_analyser import PhoneticAnalyser

def main():
    """Invoke a simple CLI analyser or generator."""
    a = argparse.ArgumentParser()
    a.add_argument(
        "-s",
        "--syllablize",
        action="store_true",
        help="Syllablize the input Malayalam string",
    )
    a.add_argument(
        "-a",
        "--analyse",
        action="store_true",
        help="Phonetically analyse the input Malayalam string",
    )
    a.add_argument(
        "-p",
        "--tophoneme",
        action="store_true",
        help="Transcribe the input Malayalam grapheme to phoneme sequence",
    )
    a.add_argument(
        "-g",
        "--tographeme",
        action="store_true",
        help="Transcribe the input phoneme sequence to Malayalam grapheme",
    )
    a.add_argument(
        "-i",
        "--input",
        metavar="INFILE",
        type=open,
        dest="infile",
        help="source of analysis data",
    )
    a.add_argument(
        "-o",
        "--output",
        metavar="OUTFILE",
        type=argparse.FileType("w+", encoding="UTF-8"),
        dest="outfile",
        help="target of generated strings",
    )
    a.add_argument(
        "-v", "--verbose", action="store_true", help="print verbosely while processing"
    )
    options = a.parse_args()
    phonetic_analyser = PhoneticAnalyser()
    if not options.infile:
        options.infile = stdin
    if not options.outfile:
        options.outfile = stdout
    if options.verbose:
        print("reading from", options.infile.name)
    for line in options.infile:
        line = line.strip()
        if not line or line == "":
            continue
        if options.syllablize:
            try:
                syllables = phonetic_analyser.split_to_syllables(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line + "\t" + "?" + "\n")
            else:
                options.outfile.write(line + "\t" + str(syllables) + "\n")
        if options.analyse:
            try:
                phonemedetails = phonetic_analyser.analyse(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line + "\t" + "?" + "\n")
            else:
                options.outfile.write(line + "\t" + str(phonemedetails) + "\n")
        if options.tophoneme:
            try:
                phonemes = phonetic_analyser.grapheme_to_phoneme(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line + "\t" + "?" + "\n")
            else:
                for result in phonemes:
                    options.outfile.write(line + "\t" + result + "\n")
        if options.tographeme:
            try:
                graphemes = phonetic_analyser.phoneme_to_grapheme(line)
            except ValueError as error_instance:
                print(error_instance)
                options.outfile.write(line + "\t" + "?" + "\n")
            else:
                for result in graphemes:
                    options.outfile.write(line + "\t" + result + "\n")
    exit(0)

if __name__ == "__main__":
    main()