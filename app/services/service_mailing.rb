class ServiceMailing
# ServiceMailing --> carrega o resultado de uma consulta (cadrelatorios) e carrega no JobEnviarEmails.



	 # TODO isso é um erro
	 # Eu pego o TO, CC, FROM, do mailing, coloca num hash, passo para o EnviarEmailWorker, 
	 # que le o mailing novamente para pegar o body
	 # É mais limpo, eu so passar o ID no p.

	

	def enviar_por_tag(_tag)
		@total_enviado = 0
		mailing = Mailing.where(tag: _tag)
		mailing.each do |m|
			p = Hash[ :id => m.id, :to => m.to, :cc => m.cc, :subject => m.subject, :from => m.from, :body => m.body ] #body nao é passado no CiMailer.enviar. É acessado via objeto dentro do template
			job = JobEnviarEmail.criar(m.templates_email_id, p.to_yaml)
			@total_enviado = @total_enviado + 1
		end
		Event.register("email","mailing - #{_tag}","resumo","Enfileirados #{mailing.count} emails para envio.")
	end


	# usado para producao_workers
	def go(nome_relatorio)
		enviar_por_relatorio("nome='#{nome_relatorio}'")
		@total_enviado = @total_enviado || "Indefinido"
		["Ok","Total de Emails enviados: #{@total_enviado}"]
	end

	def enviar_por_relatorio(filtro)
		sql = Cadrelatorio.where(filtro).map(&:consulta).uniq[0]
		real_enviar_por_sql(sql)
	end


private
	def real_enviar_por_sql(sql)
		@total_enviado = 0
		mysql_res = ActiveRecord::Base.connection.execute("SET SESSION group_concat_max_len = 10000;")
		mysql_res = ActiveRecord::Base.connection.execute(sql)
		mailing = []
		mysql_res.each{ |res| mailing << res }
		fields= Hash[mysql_res.fields.map.with_index.to_a]
		tag = fields["tag"]
		template_email_id = fields["template_mail_id"]
		from = fields["from"]
		to = fields["to"]
		cc = fields["cc"]

		
		subject = fields["subject"]
		body = fields["body"]
		mailing.each do |m|
			p = Hash[ :to => m[to], :cc => m[cc], :subject => m[subject], :from => m[from], :body => m[body] ] #body nao é passado no CiMailer.enviar. É acessado via objeto dentro do template
			job = JobEnviarEmail.criar(m[template_email_id], p.to_yaml)
			@total_enviado = @total_enviado + 1
		end
		Event.register("email","mailing - #{tag}","resumo","Enfileirados #{mailing.count} emails para envio.")


	end
end

# eu poderia pegar o resultado de uma consulta, e carregar para um array de mailing
# so que o EnviaEmailWorker vai pegar o ID e ir no CI..
# eu tenho que inserir o resultado do sql dinamico no mailing, com um tag especifico e dai chamar o enviar(tag_especifico)


# @results = []
# ActiveRecord::Base.connection.select_all(
#   ActiveRecord::Base.send(:sanitize_sql_array, 
#    ["... your SQL query goes here and ?, ?, ? are replaced...;", a, b, c])
# ).each do |record|
#   # instead of an array of hashes, you could put in a custom object with attributes
#   @results << {id: record["col_a_name"], :to: record["col_b_name"], ...}
# end