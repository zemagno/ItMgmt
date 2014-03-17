class Parametro < ActiveRecord::Base
  
   def ewal(parametro)
     eval(valor)
   end


  # TODO isso da para virar metaprograming
   def self.criar_parametros_email(_tipo)
   		Parametro.create(tipo: _tipo, subtipo: "TO")
   		Parametro.create(tipo: _tipo, subtipo: "CC")
     	Parametro.create(tipo: _tipo, subtipo: "SUBJECT")
   		Parametro.create(tipo: _tipo, subtipo: "BODY")
   end
   def self.apagar_parametros(_tipo)
   		Parametro.destroy_all(tipo: _tipo)
   end
end
