require 'csv'
class ServiceCargaKpmg

def go
    total_atualizacoes = [0,0,0,0,0]
	path = "/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/KPMG"

	files_users = Dir[path+"/*_USERS.txt"]
	files_sw = Dir[path+"/*_APPLICATIONS.txt"]

    InventarioKpmgSw.delete_all
	
    filtro_excluir_microsoft = Regexp.union(/Update\ for/,/ MUI /,/Compatibility Pack/,/Viewer/,/Redistributable/,/Runtime/,/Components/,/Prerequisites /,/Verification SDK/,/Common Files/,/viewer/,/Language Pack/,/Hotfix/,/Update\ for/,/Windows\ Phone/,/Driver/,/Service\ Pack/,/Pacote\ de\ Idiomas/,/^Windows Live/,/^WinRT Intellisense/,/^Windows SDK/,/^ Windows Mobile/,/Windows Internet Explorer/,/^Windows Azure/,/^WCF Data Services/ ,/^Universal CRT/,/^Recursos do Shell/,/Photo Gallery/,/^Microsoft .NET Framework /  )
    filtro_incluir_microsoft = Regexp.union(
                                # /^Microsoft Office Access/,
                                # /^Microsoft Office Excel/,
                                # /^Microsoft Office Groove/,
                                # /^Microsoft Office PowerPoint/,
                                # /^Microsoft Office Professional/,
                                # /^Microsoft Office Visio/,
                                # /^Microsoft Office Word/,
                                # /^Microsoft Access/,
                                # /^Microsoft Excel/,
                                # /^Microsoft Groove/,
                                # /^Microsoft PowerPoint/,
                                # /^Microsoft Professional/,
                                # /^Microsoft Visio/,
                                /^(Microsoft OneNote)/,
                                /^(Microsoft Office\s?(Professional|Premium|Standard){1}\s?.+\s*[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*Project\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*PowerPoint\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*Access\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*Excel\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*Visio\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft (Office)?\s*Word\s*(Professional|Premium|Standard)?\s*(MUI)?\s*(.*)[\d]{0,4})\s*$/,
                                /^(Microsoft OneNote)/,
                                /^(Microsoft SQL Server [\d]{4} [R2])*$/,
                                /^(Microsoft Visual C++*$)/,
                                /^(Microsoft SQL Server [\d]{0,4}\s?).*/,
                                /^(SQL Server [\d]{0,4}\s?).*/,
                                /^(Microsoft Visual Studio [\d]{0,4}\s*(Professional|Enterprise|Premium|Ultimate){1}\s?).*/,
                                /^(Microsoft Visual Studio (Professional|Enterprise|Premium|Ultimate){1}\s*[\d]{4}\s?).*/,
                                /^(Microsoft Visual Studio Team Foundation Server [\d]{0,4}\s?).*/)
                                # /^(Visual Studio*$)/)


	files_sw.each do |f|
		dados = CSV.read(f, headers: false, :col_sep => ";" , :quote_char => '"')
        dados.each do |d|
            # begin	
                # sw = d[1]?
                # sw.gsub!(/( \(.*\))/,"")
                if ! d[1].match(filtro_incluir_microsoft).nil?  and d[1].match(filtro_excluir_microsoft).nil?
                   # sw = d[1]
                   sw = d[1].match(filtro_incluir_microsoft).captures.compact[0]
                   
                   sw.gsub!(/( \(.*\))/,"")
                   # sw.gsub!(/MUI /,"")
                   i = InventarioKpmgSw.find_or_create_by_ip_and_sw(d[0], sw) 
                   i.data =d[2]
                   i.versao1 = d[3]
                   i.versao2 = d[4]
                   i.fabricante = d[5] 
                   i.save!
                   total_atualizacoes[0] = total_atualizacoes[0]+1
                else 
                   total_atualizacoes[1] = total_atualizacoes[1]+1
                end
            # rescue
                # total_atualizacoes[2] = total_atualizacoes[2]+1
            # end

        end
    	
    end

    InventarioKpmgUserid.delete_all
    
    files_users.each do |f|
		puts f
    	dados = CSV.read(f, headers: false, :col_sep => ";" , :quote_char => '"')	
    	dados.each do |d|
            userid = d[1] unless d[1].nil?
            userid = d[2] unless d[2].nil?
            userid = d[3] unless d[3].nil?
            userid = d[4] unless d[4].nil?
            userid.gsub!(/BRQ(\.COM)?\\/i,"")
            if userid.match(/shdw?/).nil? and ! userid.nil? and ! userid.blank?
                invKPMGUserid = InventarioKpmgUserid.find_or_create_by_ip_and_userid(:ip => d[0], :userid => userid)
                invKPMGUserid.contador = invKPMGUserid.contador+1
                invKPMGUserid.save!
            end 
            # begin   
            #     i = InventarioKpmgUserid.new(ip: d[0], sw: d[1], data: d[2], versao1: d[3], versao2: d[4], fabricante: d[5])
            #     i.save!
            #     total_atualizacoes[0] = total_atualizacoes[0]+1
            # rescue
            #     total_atualizacoes[1] = total_atualizacoes[1]+1
            # end

        end
    end
 
    total_atualizacoes
end

end

