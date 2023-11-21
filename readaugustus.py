#!/usr/bin/env python3

from module import AugustusResultFile
from argparse import ArgumentParser

argparse = ArgumentParser()
argparse.add_argument("-i", "--infile", help="Path to input gff3 file", required=True)

args = argparse.parse_args()

inf = args.infile

if __name__=="__main__":
    resultfile=AugustusResultFile(inf)
    print(">putative_transcript")
    print(resultfile.find_protein())
