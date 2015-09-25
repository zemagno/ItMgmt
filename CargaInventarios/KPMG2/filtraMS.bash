
#rm MS_APPL.txt

cat *_APPLICATIONS.txt >> APPL.txt


rm MS_Office.txt
rm MS_Project.txt
rm MS_Visio.txt
rm MS_VS.txt
rm MS_SQL.txt

grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Office\s?(Professional|Premium|Standard){1}\s?.+\s*[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Project\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Project.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*PowerPoint\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Access\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Excel\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Visio\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Visio.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Word\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt

grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft SQL Server [\d]{4} [R2])*$" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt

grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual C++*$)" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft SQL Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(SQL Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio [\d]{0,4}\s*(Professional|Enterprise|Premium|Ultimate){1}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio (Professional|Enterprise|Premium|Ultimate){1}\s*[\d]{4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio Team Foundation Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt

#sort MS_APPL.txt | uniq -u > MS_APPL2.txt
 
sort -u MS_Office.txt > MS_Office_2.txt
sort -u MS_Project.txt > MS_Project_2.txt
sort -u MS_Visio.txt > MS_Visio_2.txt
sort -u MS_VS.txt > MS_VS_2.txt
sort -u MS_SQL.txt > MS_SQL_2.txt

#  awk '!a[$0]++' input.txt


# grep -i citrix MS_APPL.txt
# grep -E "(Microsoft OneNote)" APPL.txt | cut -d ";" -f 1,2 >> MS_APPL.txt
