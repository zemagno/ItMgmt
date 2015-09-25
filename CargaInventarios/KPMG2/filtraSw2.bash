rm APPL.txt
for filename in *_APPLICATIONS.txt; 
   do
     sort "$filename"  >> APPL.txt
     echo "fim" >> APPL.txt
   done

rm *.txt1
rm *.txt12
rm *.txt13

grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Office\s?(Professional|Premium|Standard){1}\s?.+\s*[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Project\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Project.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*PowerPoint\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Access\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Excel\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Visio\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Visio.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft (Office)?\s*Word\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$" APPL.txt | cut -d ";" -f 1 >> MS_Office.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft SQL Server [\d]{4} [R2])*$" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual C++*$)" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft SQL Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(SQL Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_SQL.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio [\d]{0,4}\s*(Professional|Enterprise|Premium|Ultimate){1}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio (Professional|Enterprise|Premium|Ultimate){1}\s*[\d]{4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt1
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3};\"(Microsoft Visual Studio Team Foundation Server [\d]{0,4}\s?).*" APPL.txt | cut -d ";" -f 1 >> MS_VS.txt1

grep -i metaframe APPL.txt | cut -d ";" -f 1 >> Metaframe.txt1
grep "Crystal Reports" APPL.txt | grep -v "Visual Studio" | grep -v "Runtime" | grep -v runtime | grep -v IBM | cut -d ";" -f 1 >> CrystalReport.txt1
grep "IBM Rational" APPL.txt | cut -d ";" -f 1 >> IBMRational.txt1
grep "Oracle WebLogic" APPL.txt | cut -d ";" -f 1 >> OracleWebLogic.txt1
grep "Quest SQL"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> QuestSQL.txt1 
grep "Oracle Fusion Middleware"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> OracleFusion.txt1
grep "Toad for Oracle"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> OracleToad.txt1
grep -i "micro focus"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> MicroFocus.txt1
grep -i "sybase powerdesigner"  APPL.txt  | grep -v "Freeware" | grep -v Viewer | cut -d ";" -f 1 >> SybasePowerDesigner.txt1
grep -i "sybase powerbuilder"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> SybasePowerBuilder.txt1
grep "Borland Delphi"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> BorlandDelphi.txt1
grep -i "borland caliberrm"  APPL.txt  | grep -v "Freeware" | cut -d ";" -f 1 >> BorlandCaliberRM.txt1
grep "IBM WebSphere Application Server" APPL.txt | grep -v "Plug" | grep -v " Client " | grep -v "Network" | cut -d ";" -f 1 >> IBM_WebSphereAppServer.txt1
grep "IBM WebSphere Portal" APPL.txt | cut -d ";" -f 1 >> IBM_WebSpherePortal.txt1
grep "IBM WebSphere Studio Application Developer" APPL.txt  | cut -d ";" -f 1 >> IBM_WebSphereStudio.txt1

for filename in *.txt1; 
    do
      	sort -u "$filename" > "$filename"2
    done


sed 's/^/Microsoft Office,/' MS_Office.txt12 > MS_Office.txt13
sed 's/^/Microsoft Project,/' MS_Project.txt12 > MS_Project.txt13
sed 's/^/Microsoft Visio,/' MS_Visio.txt12 > MS_Visio.txt13
#sed 's/^/Microsoft SQL Server,/' MS_SQL.txt12 > MS_SQL.txt13
sed 's/^/Microsoft Visual Studio,/' MS_VS.txt12 > MS_VS.txt13
sed 's/^/MetaFrame,/' Metaframe.txt12 > MetaFrame.txt13
sed 's/^/Crystal Report,/' CrystalReport.txt12 > CrystalReport.txt13
sed 's/^/IBM Rational,/' IBMRational.txt12 > IBMRational.txt13
sed 's/^/Oracle WebLogic,/' OracleWebLogic.txt12 > OracleWebLogic.txt13
sed 's/^/Quest SQL,/' QuestSQL.txt12 > QuestSQL.txt13
sed 's/^/Oracle Toad,/' OracleToad.txt12 > OracleToad.txt13
sed 's/^/Oracle Fusion,/' OracleFusion.txt12 > OracleFusion.txt13
sed 's/^/MicroFocus Cobol,/' MicroFocus.txt12 > MicroFocus.txt13
sed 's/^/Sybase PowerBuilder,/' SybasePowerBuilder.txt12 > SybasePowerBuilder.txt13
sed 's/^/Sybase PowerDesigner,/' SybasePowerDesigner.txt12 > SybasePowerDesigner.txt13
sed 's/^/Borland Delphi,/' BorlandDelphi.txt12 > BorlandDelphi.txt13
sed 's/^/Borland CaliberRM,/' BorlandCaliberRM.txt12 > BorlandCaliberRM.txt13
sed 's/^/IBM WebSphere App Server,/' IBM_WebSphereAppServer.txt12 > IBM_WebSphereAppServer.txt13
sed 's/^/IBM WebSphere Portal,/' IBM_WebSpherePortal.txt12 > IBM_WebSpherePortal.txt13
sed 's/^/IBM WebSphere Studio,/' IBM_WebSphereStudio.txt12 > IBM_WebSphereStudio.txt13



cat *.txt13 > InventarioSwFinal.csv
