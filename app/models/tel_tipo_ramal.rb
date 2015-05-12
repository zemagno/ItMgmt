class TelTipoRamal < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "TelTipoRamal"
	set_primary_key "IdtTipoRamal"

    #alias_attribute :first_name, :XORFNAME
end
