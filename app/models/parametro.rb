class Parametro < ActiveRecord::Base
  
   def ewal(parametro)
     eval(valor)
   end


  # TODO isso dá para virar metaprograming
   def self.criar_parametros_email(_tipo)
      "TO CC SUBJECT BODY".split.each do |_subtipo| 
        Parametro.create(tipo: _tipo, subtipo: _subtipo)
      end   
   		# Parametro.create(tipo: _tipo, subtipo: "TO")
   		# Parametro.create(tipo: _tipo, subtipo: "CC")
      # Parametro.create(tipo: _tipo, subtipo: "SUBJECT")
   		# Parametro.create(tipo: _tipo, subtipo: "BODY")
   end

   def self.apagar_parametros(_tipo)
   		Parametro.destroy_all(tipo: _tipo)
   end

   def self.renomear_tipo_parametro(_old,_new)
     if ! _old.blank? and (_old != _new) then
        puts "PARAMETRO:  #{_old} ---> #{_new}"
     end
   end
end
