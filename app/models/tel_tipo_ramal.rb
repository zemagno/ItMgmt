class TelTipoRamal < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "TelTipoRamal"
	self.primary_key =  "IdtTipoRamal"

    #alias_attribute :first_name, :XORFNAME
end
