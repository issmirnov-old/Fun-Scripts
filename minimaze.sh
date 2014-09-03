#!/bin/bash
## Author - Ivan Smirnov
## This script creates "Ze Mini Maze", with 1,111 folders in it. It has 4 sub-levels,
## and each sublevel contains the folders 0-9. In essence, one is required to know a
## 4-digit PIN to sucessfully reach the last folder with your files.
##functions
          function createfolder {
              mkdir 0
              mkdir 1
              mkdir 2
              mkdir 3
              mkdir 4
              mkdir 5
              mkdir 6
              mkdir 7
              mkdir 8
              mkdir 9

          }
          function renamefolders {
              cp -r 0 1
              cp -r 0 2
              cp -r 0 3
              cp -r 0 4
              cp -r 0 5
              cp -r 0 6
              cp -r 0 7
              cp -r 0 8
              cp -r 0 9

          }

## script

	mkdir Ze.Mini.Maze
	cd Ze.Mini.Maze
	mkdir 0
	cd 0
	mkdir 0
	cd 0
	mkdir 0
	cd 0
#      Maze/0/0/0/0
# level 4
	createfolder
	cd ..
	echo Created level 4
#level3
	renamefolders
	cd ..
	echo Created level 3
#level2
	renamefolders
	cd ..
	echo Created level 2
#level1
	renamefolders
	cd ..
	echo Created level 1





          echo The Mini-Maze was created.
          echo Enjoy! Author: Ivan Smirnov
