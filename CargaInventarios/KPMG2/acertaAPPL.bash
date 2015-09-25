for filename in *APPLICATIONS.txt; 
    do
    	grep -v "Revisores de Texto" "$filename" | grep -i "microsoft" | awk '{ sub("\r$", ""); print }' > "$filename".txt2
        iconv -t UTF-8 -f ISO-8859-1 "$filename".txt2 | grep -i '10.2' > "$filename"

        # /Users/zemagno/.rvm/opt/coreutils/libexec/gnubin/truncate -s 1 "$filename"
    done


for filename in *USERS.txt; 
    do
    	awk '{ sub("\r$", ""); print }' "$filename" > "$filename".txt2
        iconv -t UTF-8 -f ISO-8859-1 "$filename".txt2 | grep -i '10.2' > "$filename"

        # /Users/zemagno/.rvm/opt/coreutils/libexec/gnubin/truncate -s 1 "$filename"
    done