#!/bin/bash
touch sccm.output
rm sccm.output
for file in *.csv;
do
    mv "$file" "${file//[[:space:]]}"
done
clear
find . -name '*.csv' | wc -l
find . -name '*.csv' | xargs wc -l
for filename in *.csv; 
    do
        tail +5 "$filename" >> sccm.output
    done

grep -i 'microsoft' sccm.output | cut -d , -f 8,11 > sccm2.output   

wc -l sccm2.output

