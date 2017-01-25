class EmailController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  layout "email"


  def enviar_email
    p = Hash[:id => params[:id]]
    job = JobEnviarEmail.criar(params[:enviar_email][:template_id], p.to_yaml)
    # EnviaEmailWorker.perform_async(job.id)
    #EnviaEmailWorker.perform_in(1.hour,job.id)
    flash[:info] = "INFO: Email enfileirado para envio"
    respond_to :js
  end

  def fill_in(template, data)
      template = template || " "
      template.gsub(/\{\{(\w+)\}\}/) { data[$1.to_sym] } 
  end
  

  def montar_email (tipo, parametros)
      
  end



  def enviar
      #aqui pesquisar no tipo de template, para saber se leio CI, que valores eu monto...
      
      template = params[:acao]
      case TemplatesEmail.find_by_template(template).tipo
        when "CI"
          ci = Ci.find(params[:id])
          parametros = {}
          ci.attribute_names.each do |attr| 
              idx = "ci_#{attr}".downcase.to_sym
              parametros[idx] = ci.send(attr) 
              parametros[idx] = parametros[idx].partition('&')[0] if parametros[idx].respond_to?(:partition)
              # parametros["ci_#{attr}".downcase.to_sym] = ci.send(attr)  
          end
          parametros[:ci_site] =ci.site.nome
          parametros[:email_impactados] = Rails.cache.read("impactados-#{ci.id}-email")
          parametros[:ci_customensal] =  ActionController::Base.helpers.number_to_currency(ci.CustoMensal)
          parametros[:ci_nice_status] = ci.nice_status
          ci.atributos.keys.each do |k|
              # 5o atributo é o apelido
              parametros["ci_#{ci.atributos[k][5]}".downcase.to_sym] = ci.send("_#{ci.atributos[k][5]}") unless ci.atributos[k][5].blank?
          end

       #parametros = { ci_chave: ci.chave, ci_owner: ci.Owner, ci_notificacao: ci.notificacao, ci_descricao: ci.descricao, ci_site: ci.site.nome, email_impactados: Rails.cache.read("impactados-#{ci.id}-email") , ci_ccdebito: ci.CCDebito, ci_projetodebito: ci.ProjetoDebito, ci_cccredito: ci.CCCredito, ci_projetocredito: ci.ProjetoCredito}
          


       end
       puts "*********************************************************************************************************"
       puts "Parametros #{parametros}"       
       puts "*********************************************************************************************************"
       @resposta = Hash.new
       [:to,:cc,:body,:subject,:bcc].each do |f|
          @resposta[f] = fill_in(Parametro.get(:tipo => template,:subtipo => f.to_s),parametros)
        end
        
        puts "*********************************************************************************************************"
        puts "Resposta #{@resposta}"       
        puts "*********************************************************************************************************"
  end
end

