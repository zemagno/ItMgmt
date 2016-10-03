class TelRamal < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "TelRamal"
	self.primary_key =  "NumRamal"
     
   	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
   	belongs_to :TipoRamal, :foreign_key => "IdtTipoRamal", :class_name => "TelTipoRamal"
   	

    #alias_attribute :first_name, :XORFNAME
end
