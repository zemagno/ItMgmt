class GraficoCmdb

  def self.TipoGraficoCI(ci,path_ci=nil)

    #colocar nice_tipoci em todos os nodes. TODO


    if ci.dataChange and ci.dataChange.to_time >= 7.days.ago then
      parametro = { :label => "#{ci.chave}\n#{ci.dataChange}", :color => "red", :fillcolor => "yellow"}
    else
      parametro = { :label => "#{ci.chave}\n#{ci.nice_tipoci}"}
    end

    begin
      parametro.merge!({"URL" => path_ci}) unless path_ci.blank?

      parametro.merge!(JSON.parse(ci.status_parametro)) unless ci.status_parametro.blank?
    rescue
    	Rails.logger.error("[ERROR] GraficoCmdb.TipoGraficoCI")
    end

    parametro
  end
end
