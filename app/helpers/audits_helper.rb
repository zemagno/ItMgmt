module AuditsHelper

	def formatAudit(audit) 
        case audit.auditable_type
		when "Ci" 
            res = link_to audit.auditable_id, ci_path(audit.auditable_id) 
        end
        #when "Relacionamento"
        #end 
        
        # 
        res = "" unless res

        res
	end

end
