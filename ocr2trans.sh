#!/bin/sh

# Random variable
OCR=`mktemp`

# Prompt user to select screenshot
gnome-screenshot -a -f $OCR.png

# Exit if no screenshot taken
if [ ! -f $OCR.png ]; then
    exit
fi

# OCR on the screenshot image
# https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage.html
tesseract --dpi 180 -l jpn+eng $OCR.png $OCR

# Is there text found
TXT=$(cat $OCR.txt)
CHKTXT=(${TXT[@]})

if [ -z $CHKTXT ]; then
    zenity --info --text="No text found"
else
    # Found OCR text
    ORIG=$(cat $OCR.txt | sed -z '$ s/\n$//')
    # Translate
    # https://github.com/soimort/translate-shell/blob/develop/README.md
    TRANS=$(trans -show-original n -no-warn --brief $ORIG)
    # Display
    zenity --list --title="Translation" --column="Text" "${ORIG}" "${TRANS}"
fi

exit

