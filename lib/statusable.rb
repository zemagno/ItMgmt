module Statusable
	def status
		Statusci.cached_find(statusci_id).status
	end
	def status_icon
		Statusci.cached_find(statusci_id).icon 
	end

	def status_parametro
		Statusci.cached_find(statusci_id).parametro
	end 
end