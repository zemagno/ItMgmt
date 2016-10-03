class TelLogin < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "login"
	self.primary_key =  "IdtLogin"

    #alias_attribute :first_name, :XORFNAME
end
