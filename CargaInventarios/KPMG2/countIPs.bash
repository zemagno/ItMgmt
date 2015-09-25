b=0
a=`grep -E "10\.2\.(10|11|12|13|14|15)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "MAL : 10.2.10.1 a 10.2.15.254   : $a" > Report.txt
a=`grep -E "10\.22\.(26|27|28|29|30|31)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "DF  : 10.22.26.1 a 10.22.31.254 : $a" >> Report.txt
a=`grep -E "10\.2\.(42|43|44|45|46|47)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Alp : 10.2.42.1 a 10.2.47.254   : $a" >> Report.txt
a=`grep -E "10\.2\.(50|51|52|53|54|55)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Can : 10.2.50.1 a 10.2.55.254   : $a" >> Report.txt
a=`grep -E "10\.2\.(66|67|68|69|70|71)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "BV  : 10.2.66.1 a 10.2.71.254   : $a" >> Report.txt
a=`grep -E "10\.2\.(74|75|76|77|78|79)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Pan : 10.2.74.1 a 10.2.79.254   : $a" >> Report.txt
a=`grep -E "10\.2\.(90|91|92|93|94|95)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Rec : 10.2.90.1 a 10.2.95.254   : $a" >> Report.txt
a=`grep -E "10\.2\.(98|99|100|101|102|103)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Teo : 10.2.98.1 a 10.2.103.254  : $a" >> Report.txt
a=`grep -E "10\.2\.(2|3|4|5|6|7)\." USERS_2.txt | wc -l`
b=$((b+a))
echo "Teo : 10.2.98.1 a 10.2.103.254  : $a" >> Report.txt
echo "Total de IPs rede estacao       : $b" >> Report.txt
a=`grep -E "10\.2\.(0|8||9|1|17|40|41)\." USERS_2.txt | wc -l`
echo "Total de IPs rede Server        : $a" >> Report.txt
b=$((b+a))
echo "Total de IPs                    : $b" >> Report.txt

more Report.txt

