class TelRamalLogin < TelefoniaDb
	
	set_table_name "TelRamalLogin"
	set_primary_key "IdtLogin"

	belongs_to :Localidade, :foreign_key => "IdtLocalidade", :class_name => "TelLocalidade"
 	belongs_to :Ramal, :foreign_key => "NumRamal", :class_name => "TelRamal"
 	belongs_to :LoginCobranca, :foreign_key => "IdtLogin", :class_name => "TelLogin"
 	
    
    # t = TelRamalLogin.where(:IdtLogin => 'magno') 
    # campos: IdtLogin: IdtLocalidade: "VA", NumRamal: 219831,
    # TelRamalLogin.Ramal
    # TelRamalLogin.LoginCobranca.IdtLoginCobranca

end