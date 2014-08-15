class ServiceMailing

	def enviar(_tag)
		mailing = Mailing.find_all_by_tag(_tag)
		mailing.each do |m|
			p = Hash[ :id => m.id, :to => m.to, :cc => m.cc, :subject => m.subject, :from => m.from ] #body nao é passado no CiMailer.enviar. É acessado via objeto dentro do template
			job = JobEnviarEmail.criar(m.templates_email_id, p.to_yaml)
			EnviaEmailWorker.perform_async(job.id)
		end
		Event.register("email","mailing - #{_tag}","resumo","Enfileirados #{mailing.count} emails para envio.")
	end
end

# eu poderia pegar o resultado de uma consulta, e carregar para um array de mailing
# so que o EnviaEmailWorker vai pegar o ID e ir no CI..


# @results = []
# ActiveRecord::Base.connection.select_all(
#   ActiveRecord::Base.send(:sanitize_sql_array, 
#    ["... your SQL query goes here and ?, ?, ? are replaced...;", a, b, c])
# ).each do |record|
#   # instead of an array of hashes, you could put in a custom object with attributes
#   @results << {id: record["col_a_name"], :to: record["col_b_name"], ...}
# end