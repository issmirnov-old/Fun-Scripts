#!/bin/bash
# Wrapper script for md5deep and md5sum
# Used to verify file copy for backup purposes.
# Author: Vania Smirnov

### Functions ###
usage()
{
cat << EOF
usage: $0 options

This script can check the validity of files in a folder,
or generate a new md5sum file. Should be run from inside
the target folder.

OPTIONS:
   -h      Show this message
   -c      Check existing m5sum files
   -g      Generate new md5sum files
   -f      Target folder
   -v      Verbose
EOF
}


### Flags ###
GENERATE=false
CHECK=false
VERBOSE=false
OUTPUT_FILENAME="md5sum.txt"
CHECK_FILENAME="md5sum_results.txt"
TARGET_FOLDER="."

### Start Script ###
while getopts "vhcgf:" OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         c)
             CHECK=true
             ;;
         g)
             GENERATE=true
             ;;
         v)
             VERBOSE=true
             ;;
         f)
             TARGET_FOLDER=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

# check if no flags passed in
if ! $CHECK && ! $GENERATE
then
     usage
     exit 1
fi


# debug
if $VERBOSE
then
    echo "verbosity enabled."
fi

# flags passed. do stuff
if $CHECK
then
    echo "Checking md5sums from $TARGET_FOLDER/$OUTPUT_FILENAME "
    md5sum -c $TARGET_FOLDER/$OUTPUT_FILENAME > $TARGET_FOLDER/$CHECK_FILENAME
    grep -v "OK" $TARGET_FOLDER/$CHECK_FILENAME
    echo "Done."
    exit 0
fi


if $GENERATE
then
    if ! type md5deep > /dev/null; then
        echo "md5deep not installed, try native installer or http://md5deep.sourceforge.net/"
        exit 1
    fi

    echo "Generating recursive md5sum with $TARGET_FOLDER as root."
    if [ -e $TARGET_FOLDER/$OUTPUT_FILENAME ]
    then
        read -p "Output file $TARGET_FOLDER/$OUTPUT_FILENAME exists, overwrite? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            # do dangerous stuff
            md5deep -r -e -l $TARGET_FOLDER > $TARGET_FOLDER/$OUTPUT_FILENAME
            egrep -v "./$OUTPUT_FILENAME|./$0|./$CHECK_FILENAME" $TARGET_FOLDER/$OUTPUT_FILENAME > /tmp/grep1456
            cp /tmp/grep1456 $TARGET_FOLDER/$OUTPUT_FILENAME
            echo "Done."
            exit 0
        else
            exit 1
        fi
    fi
    
    md5deep -r -e -l $TARGET_FOLDER > $TARGET_FOLDER/$OUTPUT_FILENAME
    egrep -v "./$OUTPUT_FILENAME|./$0|./$CHECK_FILENAME" $TARGET_FOLDER/$OUTPUT_FILENAME > /tmp/grep1456
    cp /tmp/grep1456 $TARGET_FOLDER/$OUTPUT_FILENAME
    echo "Done."
    
    exit
fi



