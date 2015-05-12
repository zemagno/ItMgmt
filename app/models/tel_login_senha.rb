class TelLoginSenha < TelefoniaDb
	#establish_connection "telefonia"
	set_table_name "TelLoginSenha"
	set_primary_key "IdtLogin"
	belongs_to :Login, :foreign_key => "IdtLogin", :class_name => "TelLogin"

    #alias_attribute :first_name, :XORFNAME
end
