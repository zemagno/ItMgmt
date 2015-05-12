class TelLocalidade < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "localidade"
	set_primary_key "IdtLocalidade"
   
    #alias_attribute :first_name, :XORFNAME
end