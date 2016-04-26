module SchedulersHelper
	def SchedulerGenField(valor)
	    params = valor.split("_") 
        case params[0]
        when "Mailing"
            res = link_to(valor,"/relatorio/#{params[1]}",:target => "_blank" )
        when "Dashboard"
            res = link_to(valor,"/painel_producao/#{params[1]}",:target => "_blank" )
        else 
            res = valor
        end
        
        # 
        res = "" unless res

        res
	end


end
