class TelAparelhoTelefonia < TelefoniaDb
	#establish_connection "telefonia"
	self.table_name =  "TelAparelhoTelefonia"
	self.primary_key = "IdtMac"
 	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
    belongs_to :TipoAparelho, :foreign_key => "IdtTipoAparelhoTelefonia", :class_name => "TelTipoAparelhoTelefonia"
    
end