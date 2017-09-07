module RelatoriosHelper
	def genField(valor,field,i,fields)
        res = ""
        case field
        when "CIs"
            res = ""
            valor.split(",").each do |c|
                res << link_to(c,"/cis/#{c}",:target => "_blank" )+ " "
            end
            

        when "SearchCIS"
            res = valor.blank? ? "" : link_to(valor,"/cis?search=#{valor}",:target => "_blank" )
		when "CI" , "ID", "Chave", "Ativo"
            res = link_to valor, ci_path(valor) 
        when "Usuario" , "Login", "Gestor"
            res = (valor.blank? or ! Features.has?("gestaousuario")) ? valor : link_to(valor,"/GestaoUsuarios?search=#{valor}",:target => "_blank" ) 
        when "Identity", "Identidade"
            res = (valor.blank? or ! Features.has?("gestaousuario")) ? valor : link_to(valor,"/identities/#{valor}",:target => "_blank" )
        when "ramal","Ramal"
            res = ramal_to_sip(valor)
        when "Email"
            res = valor
            #criar um template de email...colocar em banco de dados em memoria
            res  = "<a href=\"mailto:"+ListaEmail.acerta({listaEmails:valor,sufixo:CONFIG["mail"]["domain"]})+"?subject=Atencao&body="+URI.encode(fields.join("\n"))+"\">"+valor+"</a>"
        # when "Descricao" 
        #     res  = content_tag('pre',valor)
        else 
            res = valor
        end
        
        # 
        if res 
            res = res.strip
        else
            res = "" 
        end
        res
	end

    def genBoxAlerta(painel,tipoPainel)
        res="box-normal"
        case painel
        when "0" 
            res="box-normal"
        when "1" 
            res << " box-alerta"
        when "2"
            res << " box-alerta-critico"
        end
        res << " box-size-#{tipoPainel[1]}"
        res

    end

end	
#<a href="mailto:email@echoecho.com?body=Please send me a copy of your new program!">Send Email</a> 
#URI.encode(@resposta[:body])