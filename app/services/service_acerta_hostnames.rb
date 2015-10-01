class ServiceAcertaHostnames

	
	def evento(_chave,_hostname_antigo,_hostname_novo)
		Event.register("Acerta Estacao","Hostname","detalhe","Novo hostname de #{_chave}. De:#{_hostname_antigo} Para:#{_hostname_novo}")
	end



	ActiveRecord::Base.logger.level = 1
	def go
		total_atualizacoes = [0,0,0,0,0]
		estacoes = InventarioSw.all
		estacoes.each do |estacao|
			hostname = estacao.hostname
			hostname =~ /^(NB|NT|DT|nb)(RJ|MA|KE|DF|PP)?(\d{4,6}E?)$/
			serial = $3
			hostname_ci = ""
			status = 99
			# puts "#{hostname} #{serial}"
			if ! serial.nil?
			   ci = Ci.where(chave: serial).first
			   if ! ci.nil? 
			   	   hostname_ci = ci._hostname
			   	   hostname_ci =~ /^(NB|NT|DT|nb)(RJ|MA|KE|DF|PP)?(\d{4,6}E?)$/
			   	   serial_ci = $3
			   	   if serial_ci == serial 
			   	   	   if hostname_ci == hostname 
			   	   	   	  # puts "Nao preciso alterar nada: tudo ok [#{hostname}]:[#{serial}] | [#{hostname_ci}]:[#{serial_ci}]"
			   	   	   	  total_atualizacoes[0] = total_atualizacoes[0] + 1
			   	   	   	  status = 0
			   	   	   	else
					      # puts "Hostname eh diferente. Vou atualizar hostname [#{hostname}]:[#{serial}] | [#{hostname_ci}]:[#{serial_ci}]"
					      total_atualizacoes[1] = total_atualizacoes[1] + 1
					      ci._hostname = hostname
					      ci.save!
					      evento(ci.chave,hostname_ci,hostname)
					      status = 1
				   		end
				   else
						#puts "ops..serial nao eh o mesmo [#{hostname}]:[#{serial}] | [#{hostname_ci}]:[#{serial_ci}]"
						total_atualizacoes[2] = total_atualizacoes[2] + 1
						ci._hostname = hostname
					    ci.save!
  					    evento(ci.chave,hostname_ci,hostname)
					    status = 2

				   end
				else
					#puts "Hostname/serial nao achado. [#{hostname}]:[#{serial}]"
					total_atualizacoes[3] = total_atualizacoes[3] + 1
					status = 3
					
				end
			else
				# puts "serial nao achado. Nao deve ser estacao [#{hostname}]:[#{serial}]"
				total_atualizacoes[4] = total_atualizacoes[4] + 1
				status = 4
			    
			end
			# estacao.status = status
			# estacao.save!
		end
		total_atualizacoes
	end


end

# [460, 73, 125, 86, 0] 
# [584, 0, 74, 86, 0] 
# [658, 0, 0, 86, 0] 

# [729, 70, 75, 103, 0] 
# [873, 0, 1, 103, 0]
# [872, 5, 173, 139, 0]
# [872, 1, 177, 139, 85]
#  [1045, 2, 4, 139, 84] 
