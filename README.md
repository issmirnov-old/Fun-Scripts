
# Fun Scripts
***

This is a collection of random code snippets I've used over the years. Feel free to use any parts in your own projects.


## MiniMaze

My very first bash script. At the time I was interested in hiding my games from my younger brother, so I invented what I thought an unbeatable system. This script creates a 4 level nested folder structure, so one needs to know a 4 digit pin to find the files hidden. Naturally, a simple `find -type f .` or `du *` or even `tree .` are enough to find what is hidden, but this was a decent attempt for a little seventh grader. 

## Integrity

I struggled with some data corruption due to bit rot and other factors, an decided I would attack the problem by creating a helper script to recursively md5sum all of my files, and periodically check them with a cron job. I considered ZFS and BTRfs, but they did not satisfy my needs.

I don't use this script anymore, as I have a multi tier backup system with various integrity checkers, but this is still a useful script to some.

## Google Voice Text Parser

This was a fun little exercise when I was just starting out with python. I had been using Google Voive for many years, and was curious which words were most common in my various conversations with different friends.

Usage:

 1. Download Google Voice data (https://www.google.com/takeout/)
 2. put all HTML files of interest into a folder (I separated mine by people)
 3. put this script into the same folder
 4. run the script: python3 texts_parser.py  
 It will automatically loop through all your html files and output to YYYY-MM-DD.txt
 5. (optional) Go to http://www.wordle.net/create and make a word cloud!


#### License

I don't care what you do with these scripts. I hope they are of use to you, but I hold no claim to them. 

#### Contributors

Ivan Smirnov (http://ivansmirnov.name)