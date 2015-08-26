class ServiceAuditHwSw


	def update (_userid,_host,&block)
		 
		 auditHw=AuditHw.find_or_create_by_userid_and_hostname(userid: _userid, hostname: _host) 
		 # puts auditHw.hostname
		 # auditHw.instance_eval &block  
		 yield auditHw  
		 auditHw.score = (auditHw.inventario ? 1 : 0)*40 + (auditHw.cmdb ? 1 : 0)*20 + ( auditHw.kpmg ? 1 : 0 )*40
		 auditHw.save!
	end

	def go
		AuditHw.update_all(:inventario => 0, :cmdb => 0, :kpmg => 0)
		ActiveRecord::Base.logger.level = 1
		InventarioHw.all.each do |hw|
			puts hw
			update(hw.userid,hw.hostname) do |inv| 
				inv.inventario = true 
			end
		end
		Ci.where(tipoci_id: 46, statusci_id: 1).each do |ci|
			if ci.notificacao =~ /^[a-zA-z.]+$/
				update(ci.notificacao,ci._hostname) do |inv| 
					inv.cmdb = true 
				end
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