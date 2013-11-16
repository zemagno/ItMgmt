class TelLogin < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "login"
	set_primary_key "IdtLogin"

    #alias_attribute :first_name, :XORFNAME
end
