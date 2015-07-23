module RelatoriosHelper
	def genField(valor,field,i,fields) 
        case field
        when "CIs"
            res = ""
            valor.split(",").each do |c|
                res << link_to(c,"/cis/#{c}",:target => "_blank" )+ " "
            end
            puts resposta

        when "SearchCIS"
            res = link_to(valor,"/cis?search=#{valor}",:target => "_blank" )
		when "CI" , "ID"
            res = link_to valor, ci_path(valor) 
        when "Usuario" , "Login"
            res = link_to(valor,"/GestaoUsuarios?search=#{valor}",:target => "_blank" )
        when "Email"
            res = valor
            #criar um template de email...colocar em banco de dados em memoria
            res  = "<a href=\"mailto:"+ListaEmail.acerta(valor,"@brq.com")+"?subject=Atencao&body="+URI.encode(fields.join("\n"))+"\">"+valor+"</a>"
        when "Descricao" 
            res  = content_tag('pre',valor)
        else 
            res = valor
        end
        
        # 
        res = "" unless res

        res
	end

end	
#<a href="mailto:email@echoecho.com?body=Please send me a copy of your new program!">Send Email</a> 
#URI.encode(@resposta[:body])