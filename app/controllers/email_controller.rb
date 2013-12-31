class EmailController < ApplicationController
  include ActionView::Helpers::NumberHelper
    layout "email"
  def enviar
    case params[:acao]
    when "cobrancacontratos" 
      contrato = Contrato.find(params[:id])
      @nome_fornecedor = contrato.fornecedor.nome
      valor = number_to_currency(contrato.valormensal, :unit => 'R$ ', :separator => '.', :delimiter => ',')
      # *TODO* verificar se veio algum contrato..
      @resposta = Hash.new
      @resposta[:to] =  Parametro.find_by_tipo_and_subtipo("email_cobranca","TO").valor || "destino@brq.com" 
      @resposta[:cc] =  Parametro.find_by_tipo_and_subtipo("email_cobranca","CC").valor || "" 
      @resposta[:subject] = "APROVACAO: Fatura #{contrato.fornecedor.nome} - "+valor
      #@resposta[:subject] = Parametro.find_by_tipo_and_subtipo("email_cobranca","Subject").ewal(@nome_fornecedor) 
      
      @resposta[:body] = "Bom dia,\n"
      @resposta[:body] += "Segue fatura referente a #{contrato.descricao}.\n\n"
      @resposta[:body] +="Valor    :"+valor+"\n" 
      @resposta[:body] +="CC       :#{contrato.projetoCCTI}\n"
      @resposta[:body] +="Classif. :#{contrato.classificacao}\n\n"
  when "alertaci" 
      ci = Ci.find(params[:id])
      @resposta = Hash.new   
      @resposta[:to] =  ListaEmail.acerta("#{ci.Owner},#{ci.notificacao}","@brq.com")
      @resposta[:subject] = "ALERTA: #{ci.chave}"
      @resposta[:body] = "Bom dia,\n\nChave: #{ci.chave}\n\nServico: #{ci.tipoci.tipo}\n\nDescricao: #{ci.descricao}"
    end
    
    
  end

end
#Bom dia, 
#
#segue fatura referente às ligações unidade Marechal. 
#
#Valor: R$ 4.450,14
#CC    : INFBRQOPETELECOM / C3731
#Clas.: telefone fixo
