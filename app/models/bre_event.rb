class BreEvent
    def self.register(oque,_obj)
      puts "register. Chamar go #{_obj.class.name}"
      case _obj.class.name
        when "Ci"
          puts "BreEvent:Ci..."
          Bre.instance.go(oque,:ci,_obj.tipoci.tipo,_obj)
        when "Alerta"
          Bre.instance.go(oque,:alerta,"nada",_obj)
        when "Funcionario"
          Bre.instance.go(oque,:funcionario,"",_obj)
        when "String"
          Bre.instance.go(oque,:generic,"",_obj)
      end
    end
end