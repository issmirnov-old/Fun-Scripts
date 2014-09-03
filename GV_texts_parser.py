#!/usr/bin/python
###########################
# Author: Vania Smirnov
###########################
#      USAGE
# 1. Download Google Voice data (https://www.google.com/takeout/)
# 2. put all HTML files of interest into a folder (I separated mine by people)
# 3. put this script into the same folder
# 4. run the script: python3 texts_parser.py
# 
# It will automatically loop through all your html files and output to YYYY-MM-DD.txt
#
# 5. (optional) Go to http://www.wordle.net/create and make a word cloud!

# Enjoy. Feedback appreciated (ivan.smirnov@berkeley.edu)





import sys
import re
import glob
import os
import datetime



def main():
    # generate output file name
    now = datetime.datetime.now()
    filename = now.strftime("%Y-%m-%d") + ".txt"

    # open output file
    out_file = open(filename, "wt")

    # iterate through all HTML files
    for f in glob.glob("*.html"):
        print("Processing: " , f)
        generator(f,out_file)
    out_file.close()


def generator(f,out_file):
    # open file
    f = open(f,'r')
    lines = f.readlines()
    
    for line in lines:
        # pull out text contents
        x = re.findall(r'<q>(.*?)</q>',line,re.DOTALL)
        
        if x != []: # found something
            x = x[0].replace("&#39;","'")
            out_file.write(x + "\n")
    return


if __name__ == '__main__':
    main()
