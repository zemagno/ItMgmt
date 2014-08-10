class MailingsController < InheritedResources::Base
	
    load_and_authorize_resource


	def templates 
    	TemplatesEmail.find_all_by_tipo("MAILING")
    end

    def campanhas
    	Mailing.find(:all).map(&:tag).uniq
    end

    def confirma_enviar_email
    	@samples = Mailing.where(tag: params[:enviar_email][:mailing_tag]).first(20)
        @total = Mailing.where(tag: params[:enviar_email][:mailing_tag]).count
        @mailing_tag = params[:enviar_email][:mailing_tag]
    end

    def enviar_email
        ServiceMailing.new.enviar(params["mailing_tag"])
    end

    helper_method :campanhas

    helper_method :templates

    skip_load_and_authorize_resource :only => :index

protected

	def collection
	  @mailings ||= end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
	end
end
