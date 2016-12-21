class TelLoginSenha < InstantDb
	#establish_connection "telefonia"
	self.table_name =  "lcr_password"
	# belongs_to :Login, :foreign_key => "IdtLogin", :class_name => "TelLogin"

    #alias_attribute :first_name, :XORFNAME
end
