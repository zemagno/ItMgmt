module RelatoriosHelper
	def genField(valor,field,i,fields) 
        case field
		when "CI" 
            res = link_to valor, ci_path(valor) 
        when "Email"
            res = valor
            #criar um template de email...colocar em banco de dados em memoria
            res  = "<a href=\"mailto:"+acerta_lista_email(valor,"@brq.com")+"?subject=Atencao&body="+URI.encode(fields.join("\n"))+"\">"+valor+"</a>"
            puts fields.join("\n")

        else 
            res = valor
        end
        # colocar tempplate de email
        # contrato
        # 
        res = "" unless res

        res
	end

end	
#<a href="mailto:email@echoecho.com?body=Please send me a copy of your new program!">Send Email</a> 
#URI.encode(@resposta[:body])