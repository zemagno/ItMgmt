class TelRamal < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "TelRamal"
	set_primary_key "NumRamal"
     
   	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
   	belongs_to :TipoRamal, :foreign_key => "IdtTipoRamal", :class_name => "TelTipoRamal"
   	

    #alias_attribute :first_name, :XORFNAME
end
