class TelLogin < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "login"
	self.primary_key =  "IdtLogin"
	attr_accessible

    #alias_attribute :first_name, :XORFNAME
end
