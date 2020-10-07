import os
from sys import stderr, stdin, stdout
import regex
import argparse
#from flask import Flask, jsonify, render_template, request

def parse_syllabletags(sequence):
    sylBoundary_parser = regex.compile( r"<BoS>(.+?)<EoS>")
    syllables = sylBoundary_parser.findall(sequence)
    return syllables

def parse_phonemetags(sequence):
    phoneme_parser = regex.compile( r"((?P<phonemes>([^<])+)(?P<tags>(<[^>]+>)+))+" )
    tag_parser =  regex.compile(r"<([a-z_]+)>+?")
    syllables = parse_syllabletags(sequence)
    phonemedetails =[]
    for sindex in range(len(syllables)):
        match = phoneme_parser.match(syllables[sindex])
        phonemes = match.captures("phonemes")
        tags = match.captures("tags")
        phonemetags = []
        for pindex in range(len(phonemes)):
            tagsequence = tag_parser.findall(tags[pindex])
            phonemetags.append({'ipa': phonemes[pindex], 'tags': tagsequence})
        phonemedetails.append({'phonemes': phonemetags})
    return phonemedetails

def getPhonemelist(sequence):
    phonemetaglist = parse_phonemetags(sequence)
    phonemes =''
    for sylindex in range(len(phonemetaglist)):
        for phonemeindex in range(len(phonemetaglist[sylindex]['phonemes'])):
            if len(phonemes) !=0:
                phonemes+=' '
            phonemes+=(str(phonemetaglist[sylindex]['phonemes'][phonemeindex]['ipa']))
    return(phonemes)


def main():
    exit(0)

    

if __name__ == "__main__":
    main()
