class TelLocalidade < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "localidade"
	set_primary_key = "IdtLocalidade"
	attr_accessible
   
    #alias_attribute :first_name, :XORFNAME
end