class BreEvent
    def self.register(oque,_obj,*params)
      puts "register. Chamar go #{_obj.class.name}"
      case _obj.class.name
        when "Ci"
          puts "BreEvent:Ci..."
          puts "parametros #{params}"
          # quando criar ci   servidor_virtual
          # quando oque  :ci  _obj.tipoci.....
          Bre.instance.go(oque,:ci,_obj.tipoci.tipo,_obj,*params)
        when "Alerta"
          Bre.instance.go(oque,:alerta,"nada",_obj)
        when "Funcionario"
          Bre.instance.go(oque,:funcionario,"",_obj)
        when "String"
          Bre.instance.go(oque,:generic,"",_obj)
      end
    end
end