class TemplatesEmailsController < InheritedResources::Base

	load_and_authorize_resource

def new
	@templates_email = TemplatesEmail.new
	@templates_email.tipo_envio = 1
    @html_email = ""
end


def edit
    @templates_email = TemplatesEmail.find(params[:id])
    begin
		@html_email = SqlTemplate.find_by_path!("ci_mailer/#{@templates_email.template}").body
    rescue
    	@html_email = ""
    end
end

 def create
 	@templates_email = TemplatesEmail.new(params[:templates_email])
    puts "_________________________________________________________________________________________________________"
    puts params[:html_email]
    puts "_________________________________________________________________________________________________________"
    
    respond_to do |format|
      if @templates_email.save
      	SqlTemplate.create_or_update(params[:templates_email][:template],params[:html_email])
        format.html { redirect_to(@templates_email, :notice => 'Email foi criado com sucesso !') }
        format.xml  { render :xml => @templates_email, :status => :created, :location => @templates_email }
      else
        carrega_agregadas
        format.html { render :action => "new" }
        format.xml  { render :xml => @templates_email.errors, :status => :unprocessable_entity }
      end
    end
 end

 def update
    @templates_email = TemplatesEmail.find(params[:id])
    puts "_________________________________________________________________________________________________________"
    puts params[:html_email]
    puts "_________________________________________________________________________________________________________"

    respond_to do |format|
      if @templates_email.update_attributes(params[:templates_email])
      	SqlTemplate.create_or_update(params[:templates_email][:template],params[:html_email])
      	# atualizar html body...criando todos parametros..
        format.html { redirect_to @templates_email, notice: I18n.t("msg.templates_email.updated")  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @templates_email.errors, status: :unprocessable_entity }
      end
    end
  end

end
