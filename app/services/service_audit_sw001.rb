class ServiceAuditSw001


# InventarioHw --> script denis
# InventarioSw ---> SSCM
# InventarioKpmgSw
# InventarioKpmgUserid

	def update (_userid,_sw,&block)
		 
		 auditHw=AuditHw.find_or_create_by_userid_and_software(userid: _userid, software: _sw) 
		 # puts auditHw.hostname
		 # auditHw.instance_eval &block  
		 yield auditSw  
		 # auditSw.score = (auditHw.inventario ? 1 : 0)*40 + (auditHw.cmdb ? 1 : 0)*20 + ( auditHw.kpmg ? 1 : 0 )*40
		 auditSw.save!
	end

	def go
		# AuditHw.update_all(:inventario => 0, :cmdb => 0, :kpmg => 0)
		# ActiveRecord::Base.logger.level = 1
		# InventarioHw.all.each do |hw|
		# 	puts hw
		# 	update(hw.userid,hw.hostname) do |inv| 
		# 		inv.inventario = true 
		# 	end
		# end
		# Ci.where(tipoci_id: 46, statusci_id: 1).each do |ci|
		# 	if ci.notificacao =~ /^[a-zA-z.]+$/
		# 		update(ci.notificacao,ci._hostname) do |inv| 
		# 			inv.cmdb = true 
		# 		end
		# 	end
		# end
		licencas = Hash.new
		LicenciamentoMsDePara.all.each { |x|  licencas[x.licencaOrig]= [x.licenca,x.catLicenca] }
		InventarioSw.all.each do |sw|
			puts sw
			
			update(sw.userid,sw.softhostname) do |inv| 
				inv.sccm = true 
			end
		end


		nil
	end

end



	# InventarioHw.all.each do |hw|
		# 	puts hw
		# 	# auditHw = AuditHw.where(userid: hw.userid, hostname: hw.hostname).first
		# 	auditHw = AuditHw.find_or_create_by_userid_and_hostname(userid: hw.userid, hostname: hw.hostname) 
		# 	auditHw.inventario = true 
		# 	auditHw.save!
			
		# end
	

				# auditHw = AuditHw.find_or_create_by_userid_and_hostname(userid: ci.notificacao, hostname: ci._hostname) 
				# auditHW.cmdb = true
				# auditHw.save!