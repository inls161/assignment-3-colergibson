#!/bin/bash

# Declare file name as a variable
read -p 'Which markdown file is being formated? ' in_file

# Verifying that the user entered a valid file name
while [ ! -e $in_file.md ]
do
    echo "$in_file.md does not exist."
    read -p 'Enter a valid file name: ' in_file
done

# Declare format as a variable
read -p 'Which format would you like to output? ' file_format

# Verifying that the user entered a valid format
until [ $file_format == 'html' ] || [ $file_format == 'docx' ] || [ $file_format == 'odt' ] || [ $file_format == 'pdf' ]
do
    echo "This script does not convert to $file_format."
    echo "Please use 'html', 'docx', 'odt', or 'pdf'."
    read -p 'Please enter a valid format: ' file_format
done

if [ $file_format == 'html' ] # Convert markdown to HTML
then
    pandoc -S $in_file.md -o $in_file.html
    echo "Converted $in_file to HTML."
fi
    
if [ $file_format == 'docx' ] # Convert markdown to DOCX
then
    pandoc -S $in_file.md -o $in_file.docx
    echo "Converted $in_file to DOCX."
fi

if [ $file_format == 'odt' ] # Convert markdown to ODT
then
    pandoc -S $in_file.md -o $in_file.odt
    echo "Converted $in_file to ODT."
fi 

if [ $file_format == 'pdf' ] # Convert markdown to PDF
then
    pandoc -S --toc $in_file.md -o $in_file.pdf
    echo "Converted $in_file to PDF."
fi