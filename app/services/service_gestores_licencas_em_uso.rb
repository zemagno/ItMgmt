class ServiceGestoresLicencasEmUso
	def go
		status = "ok"
		detalhe = ""
		params = JSON.parse Parametro.get({:tipo => "Licencas", :subtipo => "ParametrosCobranca"})
		params = params.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

		totalEnviado = 0

		gestores = Gestores.all.reject{ |s| params[:naoEnviar].include? s } unless params[:naoEnviar].nil?

		gestores.each do |g|
			p = Hash[:gestor => g] 
			job = JobEnviarEmail.criar(params[:template_email_id], p.to_yaml)
            # EnviaEmailWorker.perform_async(job.id)
            puts "Enviar email para #{g} - template #{params[:template_email_id]} - #{p}"
            totalEnviado = totalEnviado + 1
		end

		detalhe << "Enfilerados para enviar #{totalEnviado}"
		[status,detalhe]

	end

	def test
		status = "ok"
		detalhe = ""
		total = 0
		gestores = gestores || Funcionario.where(DtaDemissao: nil).map{|f| f.NomEmailGestorProfissional.downcase}.uniq
		totalEnviado = 0
		totalGestores =  0
		
		# gestores.reject! { |s| params[:naoEnviar].include? s } unless params[:naoEnviar].nil?

		gestores.each do |g|
			f = GestaoLicenciamento.new(g)
			l = f.niceSoftwareEmUsoEquipeGestor
			totalGestores = totalGestores + 1
			total = total + l[2].last[2].to_i
		end

		 

        detalhe << "Total a ser cobrado #{total} de #{totalGestores} gestores"
		[status,detalhe]
	end



end