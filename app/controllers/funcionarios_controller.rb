class FuncionariosController < InheritedResources::Base
	load_and_authorize_resource

def index
        
	@funcionarios = Funcionario.paginate(:page => params[:page])

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @notes }
    # end
end

end
