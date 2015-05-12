class TelTipoAparelhoTelefonia < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "TelTipoAparelhoTelefonia"
	set_primary_key "IdtTipoAparelhoTelefonia"

    #alias_attribute :first_name, :XORFNAME
end