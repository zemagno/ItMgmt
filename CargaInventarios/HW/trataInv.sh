#!/bin/bash
touch hw.output
rm hw.output
for file in *.csv;
do
    mv "$file" "${file//[[:space:]]}"
done
clear
find . -name '*.csv' | wc -l
find . -name '*.csv' | xargs wc -l
for filename in *.csv; 
    do
         # sed -e 's/\"//g' "$filename" | sed -e 's/BRQ\\//g' | tail +3  >> hw.output
          sed -e 's/BRQ\\//g' "$filename" | tail +3  >> hw.output
    done
 
wc -l hw.output

