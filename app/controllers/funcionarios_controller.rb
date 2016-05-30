class FuncionariosController < InheritedResources::Base
  load_and_authorize_resource

  def load_custom_attributes

    funcionario = Funcionario.find(params[:id])
    @attrs = []
    funcionario.attribute_names.each do |attr|
      @attrs << [attr,"#{$1}".underscore.humanize,funcionario.attributes[attr]] if attr =~ /^custom(\w+)$/
    end
    puts @attrs
  end

  def index

    @funcionarios = Funcionario.paginate(:page => params[:page])

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @notes }
    # end


  end

  def edit
  	load_custom_attributes
  	
  end

  def show
  	load_custom_attributes
    # funcionario = Funcionario.find(params[:id])
    # @attr = []
    # funcionario.attribute_names.each do |attr|
    #   @attr << [attr,"#{$1} ?".underscore.humanize,funcionario.attributes[attr]] if attr =~ /^custom(\w+)$/
    # end
    # puts @attr
  end

  def equipe
    f = Funcionario.find_by_Login(params[:id])
    @gestores = f.gestores
    @equipe = f.funcionarios
    @logins = f.funcionarios.map{ |x| x[0]}.join(",")

  end

end
