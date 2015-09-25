# cat *_USERS.txt >> USERS.txt
# cut -d ";" -f 1,2 USERS.txt | grep -v citrix | grep -v shdw | grep -v "\"\"" | grep -v "adm"| grep -v "\"user\"" | grep -v "\"brq\"" | sort -u > UsersFinal.csv 


rm USERS.txt
for filename in *KPMG_USERS.txt; 
    do
      	head -1 "$filename" >> USERS.txt
    done

cut -d ";" -f 1,2 USERS.txt | grep -v citrix | grep -v shdw | grep -v "\"\"" | grep -v "adm"| grep -v "\"user\"" | grep -v "\"brq\"" | sort -u > UsersFinal.csv 
    
