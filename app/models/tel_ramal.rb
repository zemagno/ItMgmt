class TelRamal < TelefoniaDb
	self.table_name =  "TelRamal"
	self.primary_key =  "NumRamal"
     
   	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
   	belongs_to :TipoRamal, :foreign_key => "IdtTipoRamal", :class_name => "TelTipoRamal"
    attr_accessible    	
end
