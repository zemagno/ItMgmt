class TelRamalLogin < TelefoniaDb
	
	self.table_name =  "TelRamalLogin"
	self.primary_key =  "IdtLogin"

	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
 	belongs_to :Ramal, :foreign_key => "NumRamal", :class_name => "TelRamal"
 	belongs_to :LoginCobranca, :foreign_key => "IdtLogin", :class_name => "TelLogin"
 	attr_accessible
    
end