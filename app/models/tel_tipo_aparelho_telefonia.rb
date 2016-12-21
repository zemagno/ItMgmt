class TelTipoAparelhoTelefonia < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "TelTipoAparelhoTelefonia"
	self.primary_key =  "IdtTipoAparelhoTelefonia"

    #alias_attribute :first_name, :XORFNAME
end