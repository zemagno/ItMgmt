class ServiceMailing

	def enviar(_tag)
		mailing = Mailing.find_all_by_tag(_tag)
		mailing.each do |m|
			p = Hash[ :id => m.id, :to => m.to, :cc => m.cc, :subject => m.subject, :from => m.from ] #body nao é passado no CiMailer.enviar. É acessado via objeto dentro do template
			job = JobEnviarEmail.criar(m.templates_email_id, p.to_yaml)
			EnviaEmailWorker.perform_async(job.id)
		end
	end
end

