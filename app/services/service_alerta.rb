class ServiceAlerta

def go(nome_alerta)

	status = "OK"
	detalhe = "Sem alertas [#{nome_alerta}]- Email nao enviado"

	resultado = "#{nome_alerta};"
  	Cadrelatorio.where("dashboard like \"%#{nome_alerta}%\"").each do |c|
		begin
            sql_res = ActiveRecord::Base.connection.execute(c.consulta)
            resultado << "#{c.descricao} ==> #{sql_res.count} ;" if (sql_res.count>0)
        rescue
			resultado << "#{c.descricao} ==> Consulta com Erro;"
	  	end
	end
    if @resultado != ""
    	
	    params = Hash[JSON.parse Parametro.get(:tipo => "Alerta", :subtipo => nome_alerta)]

	    params = params.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
	    params[:body] = resultado

	    job = JobEnviarEmail.criar(params[:template_email_id], params.to_yaml)
	    EnviaEmailWorker.perform_async(job.id)
		detalhe = "Alerta [#{nome_alerta}] - Email enviado para #{params[:to]}"
	end
	[status,detalhe]
end

end


# [
# ["to","magno,zemagno@gmail.com"],
# ["from","noc"],
# ["subject","Producao - Infra - Setor Financeiro"],
# ["template_email_id",45]
# ]