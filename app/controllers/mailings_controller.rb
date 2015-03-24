class MailingsController < InheritedResources::Base
	
    load_and_authorize_resource


	def templates 
    	TemplatesEmail.find_all_by_tipo("MAILING")
    end

    def campanhas
    	Mailing.campanhas
    end

    def campanhas_sql
        Cadrelatorio.where("categoria='MAILING'").map(&:descricao).uniq
    end

    def confirma_enviar_email
    	@samples = Mailing.where(tag: params[:enviar_email][:mailing_tag]).first(20)
        @total = Mailing.where(tag: params[:enviar_email][:mailing_tag]).count
        @erros = Mailing.erros(tag: params[:enviar_email][:mailing_tag])
        @mailing_tag = params[:enviar_email][:mailing_tag]
    end

    def confirma_enviar_email_sql
        puts "mailing:controller confirma_enviar_email_sql"
        @mailing_sql = params[:enviar_email_sql][:mailing_sql]

    end

    def enviar_email
        ServiceMailing.new.enviar(params["mailing_tag"])
    end

    def enviar_email_sql
        sql = Cadrelatorio.where("descricao='#{params["mailing_sql"]}'").map(&:consulta).uniq
        puts sql[0]
        puts sql[0].class
        ServiceMailing.new.enviar_por_sql(sql[0])
       # ServiceMailing.new.enviar(params["mailing_sql"])
    end


    helper_method :campanhas

    helper_method :campanhas_sql

    helper_method :templates

    skip_load_and_authorize_resource :only => :index

protected

	def collection
	  @mailings ||= end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
	end
end
