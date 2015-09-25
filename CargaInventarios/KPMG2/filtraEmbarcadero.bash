


grep -i "borland"  APPL.txt  | grep -v "Freeware" | grep -v Runtime | cut -d ";" -f 2 | sort -u  > embarcadero.txt1
grep -i "embarcadero"  APPL.txt  | grep -v "Freeware" | grep -v Runtime | cut -d ";" -f 2 | sort -u  >> embarcadero.txt1
sort -u embarcadero.txt1 > embarcadero.txt12
    


sed 's/^/Embarcadero,/' embarcadero.txt12 > embarcadero.txt13