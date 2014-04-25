class EmailController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  layout "email"


  def enviar_email
    logger.debug "EmailController#enviar_email"
    p = Hash[:id => params[:id], :to => "zecarlosmagno@gmail.com"]
    job = JobEnviarEmail.criar(params[:enviar_email][:template_id], p.to_yaml)
    EnviaEmailWorker.perform_async(job.id)
    #EnviaEmailWorker.perform_in(1.hour,job.id)
    flash[:info] = "INFO: Email enfileirado para #{p[:to]}"
    respond_to :js
  end

  def fill_in(template, data)
      puts template
      puts data
      template = template || " "
      template.gsub(/\{\{(\w+)\}\}/) { data[$1.to_sym] } 
  end
  

  def montar_email (tipo, parametros)
      
  end



  def enviar
      #aqui pesquisar no tipo de template, para saber se leio CI, Contratos, que valores eu monto...
      
      template = params[:acao]
      case TemplatesEmail.find_by_template(template).tipo
        when "CONTRATOS" 
          contrato = Contrato.find(params[:id])
          valor = number_to_currency(contrato.valormensal, :unit => 'R$ ', :separator => '.', :delimiter => ',')  
          parametros = { contrato_descricao: contrato.descricao, contrato_projetoCCTI: contrato.projetoCCTI, contrato_classificacao: contrato.classificacao, contrato_valor: valor, contrato_fornecedor_nome: contrato.fornecedor.nome}
        when "CI"
          ci = Ci.find(params[:id])
          parametros = { ci_chave: ci.chave, ci_owner: ci.Owner, ci_notificacao: ci.notificacao, ci_descricao: ci.descricao, ci_site: ci.site.nome, email_impactados: Rails.cache.read("impactados-#{ci.id}-email") }

       end
       @resposta = Hash.new
       [:to,:cc,:body,:subject].each do |f|
          @resposta[f] = fill_in(Parametro.find_by_tipo_and_subtipo(template,f.to_s).valor,parametros)
        end
        puts "*********************************************************************************************************"
        puts "Resposta #{@resposta}"       
        puts "*********************************************************************************************************"
  end
end


  # def enviar
  #   case params[:acao]
  #   when "cobrancacontratos"
  #       tipo = params[:acao]
  #       contrato = Contrato.find(params[:id])
  #       valor = number_to_currency(contrato.valormensal, :unit => 'R$ ', :separator => '.', :delimiter => ',')  
  #       parametros = { contrato_descricao: contrato.descricao, contrato_projetoCCTI: contrato.projetoCCTI, contrato_classificacao: contrato.classificacao, contrato_valor: valor, contrato_fornecedor_nome: contrato.fornecedor.nome}
  #       montar_email(tipo,parametros)       

  #   when "alertaci"
  #       tipo = params[:acao]
  #       ci = Ci.find(params[:id])
  #       parametros = { ci_chave: ci.chave, ci_owner: ci.Owner, ci_notificacao: ci.notificacao, ci_descricao: ci.descricao }
  #       montar_email("servidor_sem_espaco",parametros)
  #   when "alertadci" 
  #       ci = Ci.find(params[:id])
  #       @resposta = Hash.new   
  #       @resposta[:to] =  ListaEmail.acerta("#{ci.Owner},#{ci.notificacao}","@brq.com")
  #       @resposta[:subject] = "ALERTA: #{ci.chave}"
  #       @resposta[:body] = "Bom dia,\n\nChave: #{ci.chave}\n\nServico: #{ci.tipoci.tipo}\n\nDescricao: #{ci.descricao}"
  #   when "incidente" 
  #       task = Task.find(params[:id])
  #       @resposta = Hash.new   
  #       @resposta[:to] = ListaEmail.acerta("#{task.solicitante}","@brq.com")
  #       @resposta[:cc] = ListaEmail.acerta("#{task.ci.notificacao}","@brq.com") unless task.ci.blank?
  #       @resposta[:subject] = "[dc] ALERTA: #{task.ci.chave} - #{task.ci.descricao} " unless task.ci.blank?
  #       @resposta[:body] = "Bom dia,\n\nNotificacao importante. \n\nTipo de Alerta: #{task.tipotask}\n\nDescricao: #{task.description}"
  #       @resposta[:body] += "\n\nElemento: #{task.ci.chave} - #{task.ci.descricao} " unless task.ci.blank?
  #       @resposta[:body] += "\n\nCriticidade: #{task.criticidade.name} "
  #   end  
  #   # colocar o montar_email aqui... nao precisa ser um def a mais
    
  # end



# when "cobrancacontratos" 
    #   contrato = Contrato.find(params[:id])
    #   @nome_fornecedor = contrato.fornecedor.nome
    #   valor = number_to_currency(contrato.valormensal, :unit => 'R$ ', :separator => '.', :delimiter => ',')
    #   # *TODO* verificar se veio algum contrato..
      
    #   parametros = { contrato_descricao: contrato.descricao, contrato_projetoCCTI: contrato.projetoCCTI, contrato_classificacao: contrato.classificacao, contrato_valor: valor, contrato_fornecedor_nome: contrato.fornecedor.nome}
    
    #   # TODO tentar pegar o basico do atributos qq coisa do activerecord

    #   @resposta = Hash.new
    #   @resposta[:to] =  Parametro.find_by_tipo_and_subtipo("cobrancacontratos","TO").valor || "destino@brq.com" 
    #   @resposta[:cc] =  Parametro.find_by_tipo_and_subtipo("cobrancacontratos","CC").valor || "" 
    
    #   @resposta[:body] = fill_in(Parametro.find_by_tipo_and_subtipo("cobrancacontratos","BODY").valor,parametros)
    #   @resposta[:subject] = fill_in(Parametro.find_by_tipo_and_subtipo("cobrancacontratos","SUBJECT").valor,parametros)
    
    #   # @resposta[:subject] = "APROVACAO: Fatura #{contrato.fornecedor.nome} - "+valor
    #   # @resposta[:body] = "Bom dia,\n"
    #   # @resposta[:body] += "Segue fatura referente a #{contrato.descricao}.\n\n"
    #   # @resposta[:body] +="Valor    :"+valor+"\n" 
    #   # @resposta[:body] +="CC       :#{contrato.projetoCCTI}\n"
    #   # @resposta[:body] +="Classif. :#{contrato.classificacao}\n\n"