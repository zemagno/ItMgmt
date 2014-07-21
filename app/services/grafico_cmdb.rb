class GraficoCmdb

	def self.TipoGraficoCI(ci,path_ci=nil)

		#colocar tipoci.tipo em todos os nodes. TODO

        if ci.dataChange and ci.dataChange.to_time >= 5.days.ago then
            parametro = { :label => "#{ci.chave}\n#{ci.dataChange}", :color => "red"}
        else 
            parametro = { :label => "#{ci.chave}\n#{ci.tipoci.tipo}"}
        end

		parametro.merge!({"URL" => path_ci}) unless path_ci.blank? 

		parametro.merge!(JSON.parse(ci.status_parametro)) unless ci.status_parametro.blank?
    
		parametro 
	end
end
